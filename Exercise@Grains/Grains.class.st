Class {
	#name : #Grains,
	#superclass : #Object,
	#category : #'Exercise@Grains'
}

{ #category : #accessing }
Grains >> atSquare: anInteger [
	(anInteger between: 1 and: 64) ifFalse: [ self error: 'square must be between 1 and 64' ].
	anInteger = 1 ifTrue: [ ^1 ].
	^2*(self atSquare: anInteger-1).
]

{ #category : #accessing }
Grains >> total [
	^(2**64)-1
]
