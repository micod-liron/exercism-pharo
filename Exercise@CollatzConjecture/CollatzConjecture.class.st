Class {
	#name : #CollatzConjecture,
	#superclass : #Object,
	#category : #'Exercise@CollatzConjecture'
}

{ #category : #'as yet unclassified' }
CollatzConjecture >> stepsFrom: anInteger [
	anInteger < 1 ifTrue: [ self error: 'Only positive numbers are allowed' ].
	anInteger == 1 ifTrue: [ ^0 ].
	anInteger even
		ifTrue: [ ^ 1 + (self stepsFrom: anInteger // 2) ]
		ifFalse: [ ^ 1 + (self stepsFrom: 3*anInteger+1) ]
]
