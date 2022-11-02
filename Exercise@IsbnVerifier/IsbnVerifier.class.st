Class {
	#name : #IsbnVerifier,
	#superclass : #Object,
	#category : #'Exercise@IsbnVerifier'
}

{ #category : #testing }
IsbnVerifier >> isValidIsbn: aString [ 
	| transformed |
	aString ifEmpty: [ ^false ].
	transformed := (aString reversed select: #isAlphaNumeric) asOrderedCollection.
	transformed size = 10 ifFalse: [ ^false ].
	transformed withIndexDo: [ :c :i |
		((i = 1 and: [c = $X]) or: [ c isDigit ]) ifFalse: [ ^false ]
	].
	transformed := transformed withIndexCollect: [ :c :i |
		c = $X
			ifTrue: [ 10 ]
			ifFalse: [ c digitValue * i ]
	].
	^(transformed sum % 11) = 0
]
