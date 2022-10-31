Class {
	#name : #AtbashCipher,
	#superclass : #Object,
	#instVars : [
		'encodeLUT',
		'decodeLUT'
	],
	#category : #'Exercise@AtbashCipher'
}

{ #category : #'as yet unclassified' }
AtbashCipher >> decodePhrase: aString [ 
	^aString asLowercase
		select: [ :c |
			c isLetter or: [ c isDigit ]
		]
		thenCollect: [ :c |
			c isLetter
				ifTrue: [ decodeLUT at: c ]
				ifFalse: [ c ]
		]
]

{ #category : #'as yet unclassified' }
AtbashCipher >> encodePhrase: aString [
	| filtered |
	filtered := aString asLowercase select: [ :c | c isLetter or: [ c isDigit ] ].
	^String streamContents: [ :stream |
		| counter |
		counter := 0.
		filtered do: [ :c |
			counter = 5
				ifTrue: [
					stream nextPut: Character space.
					counter := 0
				].
			c isLetter ifTrue: [
				stream nextPut: (encodeLUT at: c).
				counter := counter+1.
			].
			c isDigit ifTrue: [
				stream nextPut: c.
				counter := counter+1.
			].
		]
	]
	
]

{ #category : #initialization }
AtbashCipher >> initialize [
	encodeLUT := Dictionary newFromKeys: Character alphabet andValues: Character alphabet reversed.
	decodeLUT := Dictionary newFromKeys: encodeLUT values andValues: encodeLUT keys
]
