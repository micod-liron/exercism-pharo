Class {
	#name : #Robot,
	#superclass : #Object,
	#instVars : [
		'position',
		'direction'
	],
	#classInstVars : [
		'directions',
		'moves'
	],
	#category : #'Exercise@RobotSimulator'
}

{ #category : #accessing }
Robot class >> directions [

	^ directions
]

{ #category : #initialization }
Robot class >> initialize [
	directions := #('north' 'east' 'south' 'west').
	moves := {
		'north' -> (0 @ 1).
		'east' -> (1 @ 0).
		'south' -> (0 @ -1).
		'west' -> (-1 @ 0)
	} asDictionary
]

{ #category : #accessing }
Robot class >> moves [

	^ moves
]

{ #category : #accessing }
Robot >> advance [
	position := position + (self class moves at: direction)
]

{ #category : #accessing }
Robot >> direction [

	^ direction
]

{ #category : #accessing }
Robot >> direction: anObject [

	direction := anObject
]

{ #category : #initialization }
Robot >> initialize [
	position := 0@0.
	direction := 'north'
]

{ #category : #'as yet unclassified' }
Robot >> instruction: aCharacter [ 
	| instrCase |
	instrCase := {
		$R -> [ self turnRight ].
		$L -> [ self turnLeft ].
		$A -> [ self advance ]
	} asDictionary.
	(instrCase at: aCharacter) value
]

{ #category : #accessing }
Robot >> position [

	^ position
]

{ #category : #accessing }
Robot >> position: anObject [

	position := anObject
]

{ #category : #'as yet unclassified' }
Robot >> turnLeft [
	| dirIndex |
	dirIndex := self class directions indexOf: direction.
	direction := self class directions at: dirIndex-1-1%4+1
]

{ #category : #'as yet unclassified' }
Robot >> turnRight [
	| dirIndex |
	dirIndex := self class directions indexOf: direction.
	direction := self class directions at: dirIndex-1+1%4+1
		
]
