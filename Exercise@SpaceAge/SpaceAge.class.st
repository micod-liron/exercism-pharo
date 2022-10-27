Class {
	#name : #SpaceAge,
	#superclass : #Object,
	#instVars : [
		'planets'
	],
	#category : #'Exercise@SpaceAge'
}

{ #category : #'as yet unclassified' }
SpaceAge >> ageOnPlanet: aString at: anInteger [ 
	^anInteger/60/60/24/365.25/(planets at: aString)
]

{ #category : #initialization }
SpaceAge >> initialize [
	planets := {
		'Mercury' -> 0.2408467.
		'Venus' -> 0.61519726.
		'Earth' -> 1.0.
		'Mars' -> 1.8808158.
		'Jupiter' -> 11.862615.
		'Saturn' -> 29.447498.
		'Uranus' -> 84.016846.
		'Neptune' -> 164.79132
	} asDictionary
]
