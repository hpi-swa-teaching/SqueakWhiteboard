Class {
	#name : #WBNote,
	#superclass : #WBPolygonElement,
	#instVars : [
		'sizeOfNote',
		'sizeOfCorner'
	],
	#category : #SqueakWhiteboard
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'si 5/24/2024 12:51'
}
WBNote class >> initialSizeOfCorner [

	^10
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'si 5/24/2024 12:45'
}
WBNote class >> initialSizeOfNote [

	^25
]

{
	#category : #'initialize-release',
	#'squeak_changestamp' : 'si 5/24/2024 13:00'
}
WBNote class >> initializeWithCanvas: aCanvas [

	self basicNew.
	self canvas: aCanvas
]

{
	#category : #'initialize-release',
	#'squeak_changestamp' : 'si 5/24/2024 13:03'
}
WBNote class >> newWithCanvas: aCanvas [

	^self basicNew
		canvas: aCanvas;
		initialize
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'si 5/24/2024 15:02'
}
WBNote >> color: aColor [

	self lineColor: aColor muchDarker.
	super color: aColor
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'si 5/24/2024 14:42'
}
WBNote >> createVertecies [
	
	self edges removeAll.
	self edges add: (WBEdgeOfNote new 
		center: self center - (self sizeOfNote @ self sizeOfNote);
		yourself).
	self edges add: (WBEdgeOfNote new 
		center: self center + ((self sizeOfNote - self sizeOfCorner) @ (-1* self sizeOfNote))
		yourself).
	self edges add: (WBEdgeOfNote new 
		center: self center + ( self sizeOfNote @ (-1 * (self sizeOfNote - sizeOfCorner)))
		yourself).
	self edges add: (WBEdgeOfNote new 
		center: self center + ((self sizeOfNote - sizeOfCorner) @ (-1 * (self sizeOfNote - sizeOfCorner)))
		yourself).
	self edges add: (WBEdgeOfNote new 
		center: self center + ((self sizeOfNote - sizeOfCorner) @ (-1* self sizeOfNote))
		yourself).
	self edges add: (WBEdgeOfNote new 
		center: self center + ( self sizeOfNote @ (-1 * (self sizeOfNote - self sizeOfCorner)))
		yourself).
	self edges add: (WBEdgeOfNote new 
		center: self center + (self sizeOfNote @ self sizeOfNote)
		yourself).
	self edges add: (WBEdgeOfNote new 
		center: self center - (self sizeOfNote @  (-1 * (self sizeOfNote)))
		yourself).
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'si 5/24/2024 14:59'
}
WBNote >> initialize [

	super initialize.
	self edges: OrderedCollection new.
	self sizeOfNote: self class initialSizeOfNote * 1.5.
	self sizeOfCorner: self class initialSizeOfCorner * 1.5.
	self lineColor: self color muchDarker.
	self createVertecies.
	self makeShape
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'si 5/24/2024 14:43'
}
WBNote >> makeShape [

	|arrayOfEdgePoints indexOfArray|
	
	arrayOfEdgePoints := Array new: self edges size.
	indexOfArray := 1.
	self edges do: [:m | arrayOfEdgePoints at: indexOfArray put: m center.
		indexOfArray := indexOfArray + 1.].
	self setVertices: arrayOfEdgePoints.
	"self edges do: [:m | m hide]"		
	self edges do: [:m | self addMorph: m.
		m canvas: self canvas].
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'si 5/24/2024 12:49'
}
WBNote >> sizeOfCorner [

	^sizeOfCorner
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'si 5/24/2024 12:50'
}
WBNote >> sizeOfCorner: aNumber [

	sizeOfCorner := aNumber
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'si 5/24/2024 12:45'
}
WBNote >> sizeOfNote [

	^sizeOfNote
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'si 5/24/2024 12:45'
}
WBNote >> sizeOfNote: aNumber [

	sizeOfNote := aNumber 
]
