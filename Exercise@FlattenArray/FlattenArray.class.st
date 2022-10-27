Class {
	#name : #FlattenArray,
	#superclass : #Object,
	#category : #'Exercise@FlattenArray'
}

{ #category : #'as yet unclassified' }
FlattenArray >> flattenArray: aCollection [ 
	| flatten result |
	result := OrderedCollection new.
	flatten := [ :collection |
		collection do: [ :each |
			each isCollection
				ifTrue: [ flatten value: each ]
				ifFalse: [ each ifNotNil: [ result add: each ] ]
		]
	].
	flatten value: aCollection.
	^result asArray
]
