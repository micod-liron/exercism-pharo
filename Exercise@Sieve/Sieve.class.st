Class {
	#name : #Sieve,
	#superclass : #Object,
	#category : #'Exercise@Sieve'
}

{ #category : #'as yet unclassified' }
Sieve >> primesLimit: limit [
	| flags p result |
	flags := Array new: limit withAll: true.
	flags at: 1 put: false.
	p := 2.
	p to: limit do: [ :i |
		i+i to: limit by: i do: [ :j |
			flags at: j put: false
		]
	].
	result := OrderedCollection new.
	flags withIndexDo: [ :f :i |
		f ifTrue: [ result add: i ]
	].
	^result asArray
]
