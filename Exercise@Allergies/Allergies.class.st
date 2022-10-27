Class {
	#name : #Allergies,
	#superclass : #Object,
	#instVars : [
		'alergens'
	],
	#category : #'Exercise@Allergies'
}

{ #category : #'as yet unclassified' }
Allergies >> allergicToItem: aString forScore: anInteger [ 
	| pos |
	pos := alergens at: aString ifAbsent: [ ^false ].
	^(anInteger bitAt: pos) == 1
]

{ #category : #'as yet unclassified' }
Allergies >> allergyListForScore: anInteger [ 
	| allergies |
	allergies := OrderedCollection new.
	alergens keysAndValuesDo: [ :key :value |
		(self allergicToItem: key forScore: anInteger) ifTrue: [ allergies add: key ]
	].
	^allergies asArray
]

{ #category : #initialization }
Allergies >> initialize [
	alergens := OrderedDictionary newFrom: {
		'eggs' -> 1.
		'peanuts' -> 2.
		'shellfish' -> 3.
		'strawberries' -> 4.
		'tomatoes' -> 5.
		'chocolate' -> 6.
		'pollen' -> 7.
		'cats' -> 8
	}
]
