Class {
	#name : #Leap,
	#superclass : #Object,
	#category : #'Exercise@Leap'
}

{ #category : #'as yet unclassified' }
Leap >> leapYear: year [
	(year isDivisibleBy: 400) ifTrue: [ ^true ].
	(year isDivisibleBy: 100) ifTrue: [ ^false ].
	(year isDivisibleBy: 4) ifTrue: [ ^true ].
	^false
	
]
