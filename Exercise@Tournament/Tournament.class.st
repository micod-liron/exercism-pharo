Class {
	#name : #Tournament,
	#superclass : #Object,
	#category : #'Exercise@Tournament'
}

{ #category : #'as yet unclassified' }
Tournament >> createTable: teams [
	| table |
	table := OrderedCollection new.
	table add: 'Team                           | MP |  W |  D |  L |  P'.
	table addAll: (teams collect: #statsString).
	^table asArray
]

{ #category : #'as yet unclassified' }
Tournament >> processTeams: aCollection [
	| events teams |
	teams := Dictionary new.
	events := aCollection collect: [ :line | line splitOn: $; ].
	events do: [ :each |
		| firstName secondName teamA teamB result |
		firstName := each first.
		secondName := each second.
		result := each third.
		teamA := teams at: firstName ifAbsentPut: [ Team named: firstName ].
		teamB := teams at: secondName ifAbsentPut: [ Team named: secondName ].
		teamA resultOf: result withTeam: teamB
	].
	^teams
]

{ #category : #'as yet unclassified' }
Tournament >> tallyRows: aCollection [ 
	| teams |
	teams := Dictionary new.
	teams := (self processTeams: aCollection) values
		asOrderedCollection sort: [:a :b |
			a points ~= b points
				ifTrue: [ a points > b points ]
				ifFalse: [ a name < b name ]
		].
	^self createTable: teams
	
]
