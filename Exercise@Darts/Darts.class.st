Class {
	#name : #Darts,
	#superclass : #Object,
	#category : #'Exercise@Darts'
}

{ #category : #'as yet unclassified' }
Darts >> scoreX: anInteger y: anInteger2 [ 
	| distance |
	distance := ((anInteger**2) + (anInteger2**2)) sqrt.
	distance <= 1 ifTrue: [ ^10 ].
	distance <= 5 ifTrue: [ ^5 ].
	distance <= 10 ifTrue: [ ^1 ].
	^0
]
