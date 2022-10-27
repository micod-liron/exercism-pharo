Class {
	#name : #DieHandle,
	#superclass : #Object,
	#instVars : [
		'dice'
	],
	#category : #'Exercise@Die'
}

{ #category : #arithmetic }
DieHandle >> + aDieHandle [
	| handle |
	handle := self class new.
	dice do: [ :d | handle addDie: d ].
	aDieHandle dice do: [ :d | handle addDie: d ].
	^handle
]

{ #category : #adding }
DieHandle >> addDie: aDie [ 
	dice add: aDie
]

{ #category : #accessing }
DieHandle >> dice [
	^ dice
]

{ #category : #'as yet unclassified' }
DieHandle >> diceNumber [
	^dice size
]

{ #category : #initialization }
DieHandle >> initialize [
	dice := OrderedCollection new
]

{ #category : #'as yet unclassified' }
DieHandle >> roll [
	^dice inject: 0 into: [ :sum :each |
		sum + each roll
	]
]
