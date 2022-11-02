Class {
	#name : #Diamond,
	#superclass : #Object,
	#category : #'Exercise@Diamond'
}

{ #category : #'as yet unclassified' }
Diamond >> rowsLetter: letter [
	| char cols counter result |
	char := letter first.
	cols := (char asInteger - $A asInteger)*2+1.
	counter := 0.
	result := OrderedCollection new.
	($A to: char) do: [ :c |
		result add: (String streamContents: [ :stream |
			| spaces |
			spaces := (cols // 2) - counter.
			spaces timesRepeat: [ stream nextPut: Character space ].
			stream nextPut: c.
			(counter*2)-1 timesRepeat: [ stream nextPut: Character space ].
			c ~= $A ifTrue: [ stream nextPut: c ].
			spaces timesRepeat: [ stream nextPut: Character space ]
		]).
		counter := counter+1.
	].
	result := result, result allButLast reversed.
	^result asArray.
]
