Class {
	#name : #Student,
	#superclass : #Object,
	#instVars : [
		'name',
		'grade'
	],
	#category : #'Exercise@GradeSchool'
}

{ #category : #'as yet unclassified' }
Student class >> name: aString grade: anInteger [
	^self new
		name: aString;
		grade: anInteger;
		yourself
]

{ #category : #comparing }
Student >> <= other [
	grade = other grade ifTrue: [ ^name <= other name ] ifFalse: [ ^grade <= other grade ]
]

{ #category : #accessing }
Student >> grade [

	^ grade
]

{ #category : #accessing }
Student >> grade: anObject [

	grade := anObject
]

{ #category : #accessing }
Student >> name [

	^ name
]

{ #category : #accessing }
Student >> name: anObject [

	name := anObject
]
