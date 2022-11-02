Class {
	#name : #RomanNumerals,
	#superclass : #Object,
	#category : #'Exercise@RomanNumerals'
}

{ #category : #'as yet unclassified' }
RomanNumerals >> romanNumber: anInteger [ 
	| rest roman |
	rest := anInteger.
	roman := String new writeStream.
	[ rest >= 1000 ] whileTrue: [ roman nextPutAll: 'M'. rest := rest - 1000 ].
	rest >= 900 ifTrue: [ roman nextPutAll: 'CM'. rest := rest - 900 ].
	rest >= 800 ifTrue: [ roman nextPutAll: 'DCCC'. rest := rest - 800 ].
	rest >= 700 ifTrue: [ roman nextPutAll: 'DCC'. rest := rest - 700 ].
	rest >= 600 ifTrue: [ roman nextPutAll: 'DC'. rest := rest - 600 ].
	rest >= 500 ifTrue: [ roman nextPutAll: 'D'. rest := rest - 500 ].
	rest >= 400 ifTrue: [ roman nextPutAll: 'CD'. rest := rest - 400 ].
	[ rest >= 100 ] whileTrue: [ roman nextPutAll: 'C'. rest := rest - 100 ].
	rest >= 90 ifTrue: [ roman nextPutAll: 'XC'. rest := rest - 90 ].
	rest >= 80 ifTrue: [ roman nextPutAll: 'LXXX'. rest := rest - 80 ].
	rest >= 70 ifTrue: [ roman nextPutAll: 'LXX'. rest := rest - 70 ].
	rest >= 60 ifTrue: [ roman nextPutAll: 'LX'. rest := rest - 60 ].
	rest >= 50 ifTrue: [ roman nextPutAll: 'L'. rest := rest - 50 ].
	rest >= 40 ifTrue: [ roman nextPutAll: 'XL'. rest := rest - 40 ].
	[ rest >= 10 ] whileTrue: [ roman nextPutAll: 'X'. rest := rest - 10 ].
	rest >= 9 ifTrue: [ roman nextPutAll: 'IX'. rest := rest - 9 ].
	rest >= 8 ifTrue: [ roman nextPutAll: 'VIII'. rest := rest - 8 ].
	rest >= 7 ifTrue: [ roman nextPutAll: 'VII'. rest := rest - 7 ].
	rest >= 6 ifTrue: [ roman nextPutAll: 'VI'. rest := rest - 6 ].
	rest >= 5 ifTrue: [ roman nextPutAll: 'V'. rest := rest - 5 ].
	rest >= 4 ifTrue: [ roman nextPutAll: 'IV'. rest := rest - 4 ].
	[ rest >= 1 ] whileTrue: [ roman nextPutAll: 'I'. rest := rest - 1 ].
	^roman contents
]
