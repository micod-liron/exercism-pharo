Class {
	#name : #WordCount,
	#superclass : #Object,
	#category : #'Exercise@WordCount'
}

{ #category : #'as yet unclassified' }
WordCount >> countWordsSentence: aString [
	| filtered words bag |
	filtered := aString collect: [ :c |
		((c isAlphaNumeric) or: [c = $'])
			ifTrue: [c]
			ifFalse: [Character space]
	].
	filtered := filtered withBlanksCondensed asLowercase.
	words := filtered splitOn: Character space.
	words := words collect: [ :each |
		((each first = $') and: [each last = $'])
			ifTrue: [each onlyLetters]
			ifFalse: [each]
	].
	bag := Bag new.
	bag addAll: words.
	^bag asDictionary
]
