Class {
	#name : #GradeSchool,
	#superclass : #Object,
	#instVars : [
		'students'
	],
	#category : #'Exercise@GradeSchool'
}

{ #category : #adding }
GradeSchool >> addStudents: aCollection [
	aCollection inject: students into: [ :roster :student |
		students add: (Student name: student first grade: student second)
	]
	
]

{ #category : #'as yet unclassified' }
GradeSchool >> desiredGrade: anInteger [
	^(students select: [ :s | s grade = anInteger ] thenCollect: #name) asArray
]

{ #category : #initialization }
GradeSchool >> initialize [
	students := SortedCollection new
]

{ #category : #'as yet unclassified' }
GradeSchool >> roster [
	^(students collect: #name) asArray
	
]
