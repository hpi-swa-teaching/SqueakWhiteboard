Class {
	#name : #WBNote,
	#superclass : #WBPolygonElement,
	#instVars : [
		'sizeOfNote',
		'sizeOfCorner'
	],
	#category : #'SqueakWhiteboard-Core'
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'si 6/3/2024 13:36'
}
WBNote class >> initialSizeOfCorner [

	^10
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'si 6/3/2024 13:36'
}
WBNote class >> initialSizeOfNote [

	^25
]

{
	#category : #'initialize-release',
	#'squeak_changestamp' : 'si 6/3/2024 13:36'
}
WBNote class >> newWithCanvas: aCanvas [

	^self basicNew
		canvas: aCanvas;
		initialize
]

{
	#category : #resize,
	#'squeak_changestamp' : 'si 6/3/2024 15:11'
}
WBNote >> addResizeFrame [

	self resizeFrame: (WBResizeFrame newWithParent: self).
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'si 6/3/2024 12:26'
}
WBNote >> color: aColor [

	self lineColor: aColor muchDarker.
	super color: aColor
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'si 6/3/2024 14:08'
}
WBNote >> createVertecies [
	
	self edges removeAll.
	self edges add: (WBEdgeOfNote new 
		center: self center - (self sizeOfNote @ self sizeOfNote);
		canvas: self canvas;
		yourself).
	self edges add: (WBEdgeOfNote new 
		center: self center + ((self sizeOfNote - self sizeOfCorner) @ (-1* self sizeOfNote));
		canvas: self canvas;
		yourself).
	self edges add: (WBEdgeOfNote new 
		center: self center + ( self sizeOfNote @ (-1 * (self sizeOfNote - sizeOfCorner)));
		canvas: self canvas;
		yourself).
	self edges add: (WBEdgeOfNote new 
		center: self center + ((self sizeOfNote - sizeOfCorner) @ (-1 * (self sizeOfNote - sizeOfCorner)));
		canvas: self canvas;
		yourself).
	self edges add: (WBEdgeOfNote new 
		center: self center + ((self sizeOfNote - sizeOfCorner) @ (-1* self sizeOfNote));
		canvas: self canvas;
		yourself).
	self edges add: (WBEdgeOfNote new 
		center: self center + ( self sizeOfNote @ (-1 * (self sizeOfNote - self sizeOfCorner)));
		canvas: self canvas;
		yourself).
	self edges add: (WBEdgeOfNote new 
		center: self center + (self sizeOfNote @ self sizeOfNote);
		canvas: self canvas;
		yourself).
	self edges add: (WBEdgeOfNote new 
		center: self center - (self sizeOfNote @  (-1 * (self sizeOfNote)));
		canvas: self canvas;
		yourself).
]

{
	#category : #resize,
	#'squeak_changestamp' : 'si 6/3/2024 15:58'
}
WBNote >> extent: aSize [

	super extent: aSize.
	self setPopupPosition.
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'si 6/3/2024 12:27'
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
	#'squeak_changestamp' : 'si 6/3/2024 13:48'
}
WBNote >> makeShape [

	|arrayOfEdgePoints indexOfArray|
	
	arrayOfEdgePoints := Array new: self edges size.
	indexOfArray := 1.
	self edges do: [:m | arrayOfEdgePoints at: indexOfArray put: m center.
		indexOfArray := indexOfArray + 1.].
	self setVertices: arrayOfEdgePoints.
	"self edges do: [:m | m hide]"		

]

{
	#category : #resize,
	#'squeak_changestamp' : 'si 6/3/2024 15:58'
}
WBNote >> removeResizeFrame [

	(self resizeFrame) ifNotNil: [self resizeFrame delete]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'si 6/3/2024 12:26'
}
WBNote >> sizeOfCorner [

	^sizeOfCorner
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'si 6/3/2024 12:27'
}
WBNote >> sizeOfCorner: aNumber [

	sizeOfCorner := aNumber
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'si 6/3/2024 12:27'
}
WBNote >> sizeOfNote [

	^sizeOfNote
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'si 6/3/2024 12:27'
}
WBNote >> sizeOfNote: aNumber [

	sizeOfNote := aNumber 
]
