Class {
	#name : #Acronym,
	#superclass : #Object,
	#category : #'Exercise@Acronym'
}

{ #category : #'as yet unclassified' }
Acronym >> abbreviatePhrase: aString [ 
	| filtered words letters |
	filtered := aString collect: [ :c |
		((c = $-) or: [c = $_])
			ifTrue: [Character space]
			ifFalse: [c]
	].
	filtered := filtered withBlanksCondensed.
	words := filtered splitOn: Character space.
	letters := words inject: '' into: [ :sum :each |
		sum,(each at: 1) asUppercase asString
	].
	^letters
]
