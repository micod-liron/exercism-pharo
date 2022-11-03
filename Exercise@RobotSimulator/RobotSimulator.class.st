Class {
	#name : #RobotSimulator,
	#superclass : #Object,
	#instVars : [
		'robot'
	],
	#category : #'Exercise@RobotSimulator'
}

{ #category : #initialization }
RobotSimulator >> initialize [
	robot := Robot new.
]

{ #category : #'as yet unclassified' }
RobotSimulator >> sendInstructions: aString [ 
	aString do: [ :c | robot instruction: c ].
	^self state
]

{ #category : #'as yet unclassified' }
RobotSimulator >> startFacing: aString atPosition: aCollection [
	robot direction: aString.
	robot position: (aCollection at: 'x')@(aCollection at: 'y').
	^self state
]

{ #category : #'as yet unclassified' }
RobotSimulator >> state [
	^{'direction'->robot direction. 'position'->{ 'x'->robot position x. 'y'->robot position y } asDictionary} asDictionary
	
]
