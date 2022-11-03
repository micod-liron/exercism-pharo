Class {
	#name : #Team,
	#superclass : #Object,
	#instVars : [
		'name',
		'wins',
		'draws',
		'losses'
	],
	#category : #'Exercise@Tournament'
}

{ #category : #'instance creation' }
Team class >> named: aString [
	^self new
		name: aString;
		yourself
	
]

{ #category : #comparing }
Team >> <= team [
	^self points <= team points
]

{ #category : #'accessing - structure variables' }
Team >> draw [
	draws := draws+1
]

{ #category : #accessing }
Team >> draws [

	^ draws
]

{ #category : #initialization }
Team >> initialize [
	name := ''.
	wins := 0.
	draws := 0.
	losses := 0
]

{ #category : #'accessing - structure variables' }
Team >> lose [
	losses := losses+1
]

{ #category : #accessing }
Team >> losses [

	^ losses
]

{ #category : #'accessing - structure variables' }
Team >> matches [
	^wins+losses+draws
]

{ #category : #accessing }
Team >> name [

	^ name
]

{ #category : #accessing }
Team >> name: anObject [

	name := anObject
]

{ #category : #'accessing - structure variables' }
Team >> points [
	^(wins*3)+draws
]

{ #category : #'as yet unclassified' }
Team >> resultOf: result withTeam: team [
	| responses response |
	responses := { 'win' -> #(win lose). 'loss' -> #(lose win). 'draw' -> #(draw draw) } asDictionary.
	response := responses at: result.
	self perform: response first.
	team perform: response second
]

{ #category : #'as yet unclassified' }
Team >> statsString [
	^String streamContents: [ :stream |
		stream nextPutAll: name.
		30 - name size	timesRepeat: [ stream nextPut: Character space ].
		stream nextPutAll: ' |  '.
		self matches printOn: stream.
		stream nextPutAll: ' |  '.
		wins printOn: stream.
		stream nextPutAll: ' |  '.
		draws printOn: stream.
		stream nextPutAll: ' |  '.
		losses printOn: stream.
		stream nextPutAll: ' |  '.
		self points printOn: stream
	]
]

{ #category : #'accessing - structure variables' }
Team >> win [
	wins := wins+1
]

{ #category : #accessing }
Team >> wins [

	^ wins
]
