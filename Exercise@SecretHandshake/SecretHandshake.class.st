Class {
	#name : #SecretHandshake,
	#superclass : #Object,
	#category : #'Exercise@SecretHandshake'
}

{ #category : #'as yet unclassified' }
SecretHandshake >> commandsNumber: anInteger [ 
	| handshake |
	handshake := OrderedCollection new.
	(anInteger bitAt: 1) = 1 ifTrue: [ handshake add: 'wink' ].
	(anInteger bitAt: 2) = 1 ifTrue: [ handshake add: 'double blink' ].
	(anInteger bitAt: 3) = 1 ifTrue: [ handshake add: 'close your eyes' ].
	(anInteger bitAt: 4) = 1 ifTrue: [ handshake add: 'jump' ].
	(anInteger bitAt: 5) = 1 ifTrue: [ ^handshake reversed asArray ].
	^handshake asArray
]
