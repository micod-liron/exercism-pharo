Class {
	#name : #Luhn,
	#superclass : #Object,
	#category : #'Exercise@Luhn'
}

{ #category : #'as yet unclassified' }
Luhn >> validValue: aString [ 
	| filtered digits |
	(aString allSatisfy: [ :c | c isDigit or: [ c = Character space ]]) ifFalse: [^false].
	filtered := aString select: #isDigit.
	filtered = '0' ifTrue: [^false].
	digits := filtered reversed asOrderedCollection collect: #digitValue.
	^((digits withIndexCollect: [ :d :i |
		i odd
			ifTrue: [ d ]
			ifFalse: [ d*2 < 10 ifTrue: [d*2] ifFalse: [d*2-9] ]
	]) sum % 10) = 0
]
