Class {
	#name : #MatchingBrackets,
	#superclass : #Object,
	#category : #'Exercise@MatchingBrackets'
}

{ #category : #testing }
MatchingBrackets >> isClosedPair: aPair [
	| a b |
	a := aPair first.
	b := aPair second.
	(a = $( and: [ b = $) ]) ifTrue: [ ^true ].
	(a = $[ and: [ b = $] ]) ifTrue: [ ^true ].
	(a = ${ and: [ b = $} ]) ifTrue: [ ^true ].
	^false
]

{ #category : #testing }
MatchingBrackets >> isPaired: aString [
	| stack |
	stack := Stack new.
	aString do: [ :c |
		c isOpenPunctuation ifTrue: [ stack push: c ].
		c isClosePunctuation ifTrue: [
			stack ifEmpty: [ ^false ].
			(self isClosedPair: { stack top. c })
				ifTrue: [ stack pop ]
				ifFalse: [ ^false ]
		]
	].
	^stack isEmpty
]
