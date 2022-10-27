Class {
	#name : #Etl,
	#superclass : #Object,
	#category : #'Exercise@Etl'
}

{ #category : #'as yet unclassified' }
Etl >> transformData: aCollection [
	| data |
	data := Dictionary new.
	aCollection keysAndValuesDo: [ :key :letters |
		letters do: [ :letter |
			data at: (letter asLowercase) put: key asInteger
		]
	].
	^data
]
