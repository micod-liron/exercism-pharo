Class {
	#name : #Hamming,
	#superclass : #Object,
	#category : #'Exercise@Hamming'
}

{ #category : #'as yet unclassified' }
Hamming >> distanceStrand1: aString strand2: aString2 [
	| i |
	aString size ~= aString2 size
		ifTrue: [
			aString ifEmpty: [ Error signal: 'left strand must not be empty' ].
			aString2 ifEmpty: [ Error signal: 'right strand must not be empty' ].
			Error signal: 'left and right strands must be of equal length'
		].
	i := 0.
	^aString count: [ :each |
		i := i+1.
		each ~= (aString2 at: i).
	]
]
