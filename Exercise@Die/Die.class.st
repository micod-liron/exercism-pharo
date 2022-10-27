Class {
	#name : #Die,
	#superclass : #Object,
	#instVars : [
		'faces',
		'rand'
	],
	#category : #'Exercise@Die'
}

{ #category : #'as yet unclassified' }
Die class >> withFaces: anInteger [ 
	^self new
		faces: anInteger;
		yourself
]

{ #category : #accessing }
Die >> faces [
	^ faces
]

{ #category : #accessing }
Die >> faces: anObject [
	faces := anObject
]

{ #category : #initialization }
Die >> initialize [
	faces := 6.
	rand := Random new
]

{ #category : #'as yet unclassified' }
Die >> roll [

	^ rand nextIntegerBetween: 1 and: faces
]
