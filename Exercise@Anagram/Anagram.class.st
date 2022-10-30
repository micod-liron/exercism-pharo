Class {
	#name : #Anagram,
	#superclass : #Object,
	#category : #'Exercise@Anagram'
}

{ #category : #'as yet unclassified' }
Anagram >> findAnagramsCandidates: aCollection subject: aString [ 
	^(aCollection select: [ :each |
		self isWord: each anagramOf: aString
	]) asArray
]

{ #category : #testing }
Anagram >> isWord: word anagramOf: candidate [
	^(word asLowercase asBag = candidate asLowercase asBag) &
	 (word asLowercase ~= candidate asLowercase)
]
