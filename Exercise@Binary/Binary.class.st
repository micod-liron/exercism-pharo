Class {
	#name : #Binary,
	#superclass : #Object,
	#category : #'Exercise@Binary'
}

{ #category : #'as yet unclassified' }
Binary >> decimalFromBinary: aString [ 
	| p sum |
	p := 1.
	sum := 0.
	aString size to: 1 by: -1 do: [ :i |
		| digit |
		digit := (aString at: i) digitValue.
		(#(0 1) includes: digit) ifFalse: [ ^nil ].
		sum := sum + (digit * p).
		p := p*2
	].
	^sum
]
