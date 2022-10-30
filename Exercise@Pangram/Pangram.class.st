Class {
	#name : #Pangram,
	#superclass : #Object,
	#category : #'Exercise@Pangram'
}

{ #category : #testing }
Pangram >> isPangramSentence: aString [
	^aString onlyLetters asLowercase asSet size = 26
]
