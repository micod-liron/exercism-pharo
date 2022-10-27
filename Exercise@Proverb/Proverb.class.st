Class {
	#name : #Proverb,
	#superclass : #Object,
	#category : #'Exercise@Proverb'
}

{ #category : #'as yet unclassified' }
Proverb >> reciteStrings: aCollection [ 
	| proverb |
	aCollection ifEmpty: [ ^#() ].
	proverb := OrderedCollection new.
	1 to: aCollection size - 1 do: [ :i |
		proverb add: ('For want of a {1} the {2} was lost.' format: {aCollection at: i. aCollection at: i+1}).
	].
	proverb add: ('And all for the want of a {1}.' format: {aCollection first}).
	^proverb asArray
]
