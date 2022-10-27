Class {
	#name : #ArmstrongNumbers,
	#superclass : #Object,
	#category : #'Exercise@ArmstrongNumbers'
}

{ #category : #testing }
ArmstrongNumbers >> isArmstrongNumber: anInteger [ 
	| num sum |
	num := anInteger numberOfDigits.
	sum := 0.
	1 to: num do: [ :i |
		| digit |
		digit := anInteger digitAt: i base: 10.
		sum := sum + (digit**num).
	].
	^sum == anInteger
]
