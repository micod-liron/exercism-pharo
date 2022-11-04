Class {
	#name : #Minesweeper,
	#superclass : #Object,
	#category : #'Exercise@Minesweeper'
}

{ #category : #'as yet unclassified' }
Minesweeper >> annotateMinefield: aCollection [
	| field rows cols neighbours |
	(aCollection isEmpty or: [aCollection first isEmpty]) ifTrue: [ ^aCollection copy ].
	rows := aCollection size.
	cols := aCollection first size.
	field := Array2D
		rows: rows
		columns: cols
		tabulate: [ :r :c |
			(aCollection at: r) at: c
		].
	neighbours := OrderedCollection new.
	-1 to: 1 do: [ :i | -1 to: 1 do: [ :j | (i@j) ~= (0@0) ifTrue: [neighbours add: i@j] ] ].
	
	field withIndicesDo: [ :each :r :c |
			each = Character space ifTrue: [
				| mines |
				mines := neighbours count: [ :n |
					(field at: r + n x at: c + n y ifInvalid: [ nil ]) = $*
				].
				mines > 0 ifTrue: [ field at: r at: c put: mines ]
			]
	].
	^(1 to: rows) collect: [ :r |
		String streamContents: [ :stream |
			1 to: cols do: [ :c |
				stream nextPutAll: (field at: r at: c) asString
			]
		]
	]
]
