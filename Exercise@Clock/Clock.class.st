Class {
	#name : #Clock,
	#superclass : #Object,
	#instVars : [
		'minutes'
	],
	#category : #'Exercise@Clock'
}

{ #category : #'as yet unclassified' }
Clock class >> hour: hours minute: minutes [
	^self new
		minutes: ((hours*60)+minutes) % 1440;
		yourself
]

{ #category : #arithmetic }
Clock >> + minute [
	minutes := (minutes+minute) % 1440
]

{ #category : #arithmetic }
Clock >> - minute [
	minutes := (minutes-minute) % 1440
]

{ #category : #comparing }
Clock >> = aClock [
	^minutes = aClock minutes
]

{ #category : #converting }
Clock >> asString [
	| hour minute stream |
	hour := minutes // 60.
	minute := minutes % 60.
	stream := String new writeStream.
	hour < 10 ifTrue: [ stream nextPut: $0 ].
	hour printOn: stream.
	stream nextPut: $:.
	minute < 10 ifTrue: [ stream nextPut: $0 ].
	minute printOn: stream.
	^stream contents
]

{ #category : #initialization }
Clock >> initialize [
	minutes := 0
]

{ #category : #accessing }
Clock >> minutes [

	^ minutes
]

{ #category : #accessing }
Clock >> minutes: anObject [

	minutes := anObject
]
