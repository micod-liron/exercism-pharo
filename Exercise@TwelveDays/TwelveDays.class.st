Class {
	#name : #TwelveDays,
	#superclass : #Object,
	#category : #'Exercise@TwelveDays'
}

{ #category : #'as yet unclassified' }
TwelveDays >> days [
	^#('first' 'second' 'third' 'fourth' 'fifth' 'sixth' 'seventh' 'eighth' 'ninth' 'tenth' 'eleventh' 'twelfth')
]

{ #category : #'as yet unclassified' }
TwelveDays >> getVerse: index [
	| stream |
	stream := String new writeStream.
	stream
		nextPutAll: 'On the ';
		nextPutAll: (self days at: index);
		nextPutAll: ' day of Christmas my true love gave to me: '.
	index to: 2 by: -1 do: [ :i |
		stream
			nextPutAll: (self verses at: i);
			nextPutAll: ', '.
	].
	index > 1 ifTrue: [ stream nextPutAll: 'and ' ].
	stream
		nextPutAll: self verses first;
		nextPut: $..
	^stream contents
]

{ #category : #'as yet unclassified' }
TwelveDays >> reciteStartVerse: start endVerse: end [
	| lyrics |
	lyrics := OrderedCollection new.
	start to: end do: [ :i |
		lyrics add: (self getVerse: i)
	].
	^lyrics asArray
	
]

{ #category : #'as yet unclassified' }
TwelveDays >> verses [
	^ #( 'a Partridge in a Pear Tree' 'two Turtle Doves' 'three French Hens' 'four Calling Birds' 'five Gold Rings' 'six Geese-a-Laying' 'seven Swans-a-Swimming' 'eight Maids-a-Milking' 'nine Ladies Dancing' 'ten Lords-a-Leaping' 'eleven Pipers Piping' 'twelve Drummers Drumming' )
]
