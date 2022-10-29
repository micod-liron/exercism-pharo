Class {
	#name : #HighScores,
	#superclass : #Object,
	#instVars : [
		'scores'
	],
	#category : #'Exercise@HighScores'
}

{ #category : #adding }
HighScores >> addScores: aCollection [ 
	scores addAll: aCollection
]

{ #category : #initialization }
HighScores >> initialize [
	scores := OrderedCollection new.
]

{ #category : #'as yet unclassified' }
HighScores >> latestScore [
	^scores last
]

{ #category : #'as yet unclassified' }
HighScores >> personalBestScores [
	^scores max
]

{ #category : #'as yet unclassified' }
HighScores >> personalTopThreeScores [
	^((scores sorted: [ :a :b | a > b ]) first: (3 min: scores size)) asArray
]

{ #category : #accessing }
HighScores >> scores [

	^ scores asArray
]
