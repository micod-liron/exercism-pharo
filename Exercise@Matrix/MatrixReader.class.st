Class {
	#name : #MatrixReader,
	#superclass : #Object,
	#category : #'Exercise@Matrix'
}

{ #category : #'as yet unclassified' }
MatrixReader >> input: aString atColumn: anInteger [
	| matrix column rows |
	matrix := self parseMatrix: aString.
	rows := matrix size.
	column := Array new: rows.
	1 to: rows do: [ :i | column at: i put: ((matrix at: i) at: anInteger) ].
	^column
]

{ #category : #'as yet unclassified' }
MatrixReader >> input: aString atRow: anInteger [ 
	^((self parseMatrix: aString) at: anInteger) asArray
]

{ #category : #parsing }
MatrixReader >> parseMatrix: aString [
	| matrix |
	matrix := (aString splitOn: Character cr) collect: [ :line |
		(line splitOn: Character space) collect: #asInteger
	].
	^matrix
]
