Class {
	#name : #SumOfMultiples,
	#superclass : #Object,
	#category : #'Exercise@SumOfMultiples'
}

{ #category : #'as yet unclassified' }
SumOfMultiples >> sumFactors: aCollection limit: anInteger [
	| set |
	set := Set new.
	aCollection do: [ :each |
		1 to: anInteger-1 do: [ :i |
			| multiple |
			multiple := i*each.
			multiple < anInteger ifTrue: [set add: multiple]
		]
	].
	^set inject: 0 into: [ :s :e | s+e ]
]
