Class {
	#name : #Forth,
	#superclass : #Object,
	#instVars : [
		'stack',
		'ops',
		'fns'
	],
	#category : #'Exercise@Forth'
}

{ #category : #adding }
Forth >> add [
	| a b |
	stack ifEmpty: [ Error signal: 'empty stack' ].
	stack size < 2 ifTrue: [ Error signal: 'only one value on the stack' ].
	b := stack pop.
	a := stack pop.
	stack push: a+b
]

{ #category : #'special characters' }
Forth >> divide [
	| a b |
	stack ifEmpty: [ Error signal: 'empty stack' ].
	stack size < 2 ifTrue: [ Error signal: 'only one value on the stack' ].
	stack top = 0 ifTrue: [ Error signal: 'divide by zero' ].
	b := stack pop.
	a := stack pop.
	stack push: a//b
]

{ #category : #'as yet unclassified' }
Forth >> drop [
	stack ifEmpty: [ Error signal: 'empty stack' ].
	stack pop
]

{ #category : #'as yet unclassified' }
Forth >> dup [
	stack ifEmpty: [ Error signal: 'empty stack' ].
	stack push: stack top
]

{ #category : #'as yet unclassified' }
Forth >> evaluateInstructions: aCollection [
	aCollection do: [ :each |
		| tokens |
		tokens := each asLowercase splitOn: Character space.
		self processTokens: tokens.
	].
	^stack reversed asArray.
	
]

{ #category : #initialization }
Forth >> initialize [
	stack := Stack new.
	ops := {
		'+' -> [ self add ].
		'-' -> [ self subtract ].
		'*' -> [ self multiply ].
		'/' -> [ self divide ].
		'dup' -> [ self dup ].
		'drop' -> [ self drop ].
		'swap' -> [ self swap ].
		'over' -> [ self over ].
	} asDictionary.
	fns := Dictionary new
]

{ #category : #'as yet unclassified' }
Forth >> interpretToken: token [
	token isAllDigits ifTrue: [ stack push: token asInteger. ^self ].
	fns at: token ifPresent: [ :fn | fn do: [ :each | self interpretToken: each ]. ^self ].
	ops at: token ifPresent: [ :op | op value. ^self ].
	Error signal: 'undefined operation'
]

{ #category : #modes }
Forth >> multiply [
	| a b |
	stack ifEmpty: [ Error signal: 'empty stack' ].
	stack size < 2 ifTrue: [ Error signal: 'only one value on the stack' ].
	b := stack pop.
	a := stack pop.
	stack push: a*b
]

{ #category : #modes }
Forth >> over [
	| a b |
	stack ifEmpty: [ Error signal: 'empty stack' ].
	stack size < 2 ifTrue: [ Error signal: 'only one value on the stack' ].
	b := stack pop.
	a := stack top.
	stack push: b; push: a
]

{ #category : #parsing }
Forth >> parseFunction: tokens [
	| fnName instructions |
	instructions := OrderedCollection new.
	tokens readStreamDo: [ :stream |
		stream next.
		fnName := stream next.
		fnName isAllDigits ifTrue: [ Error signal: 'illegal operation' ].
		[ stream atEnd ] whileFalse: [
			| token |
			token := stream next.
			fns
				at: token
				ifPresent: [ :fn | fn inject: instructions into:[ :insts :each |
						insts add: each. insts ]
				]
				ifAbsent: [ instructions add: token ]
		]
	].
	fns at: fnName put: instructions allButLast
]

{ #category : #parsing }
Forth >> parseInstructions: tokens [
	tokens readStreamDo: [ :stream |
		[ stream atEnd ] whileFalse: [
			self interpretToken: stream next
		]
	]
]

{ #category : #'as yet unclassified' }
Forth >> processTokens: tokens [
	tokens ifEmpty: [ ^self ].
	tokens first = ':'
		ifTrue: [ self parseFunction: tokens ]
		ifFalse: [ self parseInstructions: tokens ]
]

{ #category : #'as yet unclassified' }
Forth >> subtract [
	| a b |
	stack ifEmpty: [ Error signal: 'empty stack' ].
	stack size < 2 ifTrue: [ Error signal: 'only one value on the stack' ].
	b := stack pop.
	a := stack pop.
	stack push: a-b
]

{ #category : #'as yet unclassified' }
Forth >> swap [
	| a b |
	stack ifEmpty: [ Error signal: 'empty stack' ].
	stack size < 2 ifTrue: [ Error signal: 'only one value on the stack' ].
	b := stack pop.
	a := stack pop.
	stack push: b; push: a
]
