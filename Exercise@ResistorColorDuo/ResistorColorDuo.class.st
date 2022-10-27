Class {
	#name : #ResistorColorDuo,
	#superclass : #Object,
	#instVars : [
		'lut'
	],
	#category : #'Exercise@ResistorColorDuo'
}

{ #category : #initialization }
ResistorColorDuo >> initialize [
	lut := Dictionary newFrom: {
		'black' -> 0.
		'brown' -> 1.
		'red' -> 2.
		'orange' -> 3.
		'yellow' -> 4.
		'green' -> 5.
		'blue' -> 6.
		'violet' -> 7.
		'grey' -> 8.
		'white' -> 9
	}
]

{ #category : #'as yet unclassified' }
ResistorColorDuo >> valueWithColors: aCollection [
	| v1 v2 |
	v1 := lut at: (aCollection at: 1).
	v2 := lut at: (aCollection at: 2).
	^(v1*10)+v2
]
