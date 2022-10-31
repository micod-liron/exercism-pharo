Class {
	#name : #Raindrops,
	#superclass : #Object,
	#category : #'Exercise@Raindrops'
}

{ #category : #'as yet unclassified' }
Raindrops >> convertNumber: anInteger [ 
	| result |
	result := String new.
	(anInteger % 3) = 0 ifTrue: [ result := result,'Pling' ].
	(anInteger % 5) = 0 ifTrue: [ result := result,'Plang' ].
	(anInteger % 7) = 0 ifTrue: [ result := result,'Plong' ].
	^result ifEmpty: [ anInteger asString ]
]
