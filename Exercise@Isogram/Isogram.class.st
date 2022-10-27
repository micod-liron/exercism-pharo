Class {
	#name : #Isogram,
	#superclass : #Object,
	#category : #'Exercise@Isogram'
}

{ #category : #testing }
Isogram >> isIsogramPhrase: aString [
	| letters |
	letters := (aString select: [ :c | c isLetter ]) collect: [ :c | c lowercase ].
	^letters size = (letters asSet) size
]
