Class {
	#name : #WBLine,
	#superclass : #PolygonMorph,
	#instVars : [
		'dragOffset',
		'canvas',
		'state',
		'pointFrom',
		'pointTo'
	],
	#category : #SqueakWhiteboard
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'si 5/19/2024 19:17'
}
WBLine >> canvas [

	^canvas
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'si 5/19/2024 19:17'
}
WBLine >> canvas: aCanvas [

	canvas := aCanvas
]

{
	#category : #deleting,
	#'squeak_changestamp' : 'si 5/20/2024 13:49'
}
WBLine >> delete [

	self pointFrom deleteSelf.
	self pointTo deleteSelf.
	super delete.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'si 5/19/2024 19:17'
}
WBLine >> dragOffset [
	^dragOffset
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'si 5/19/2024 19:17'
}
WBLine >> dragOffset: anObject [
	dragOffset := anObject
]

{
	#category : #'drag&drop',
	#'squeak_changestamp' : 'si 5/19/2024 19:19'
}
WBLine >> handlesMouseDown: anEvent [
 
	^true
]

{
	#category : #'drag&drop',
	#'squeak_changestamp' : 'si 5/20/2024 15:28'
}
WBLine >> handlesMouseOver: anEvent [

	^true
]

{
	#category : #'drag&drop',
	#'squeak_changestamp' : 'si 5/20/2024 15:36'
}
WBLine >> hideEdges [

	self pointFrom hide.
	self pointTo hide. 
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'si 5/19/2024 20:06'
}
WBLine >> initialize [

	super initialize.
	self 
		setVertices: { 1@1 . 1@1 };
		state: 0.
]

{
	#category : #'drag&drop',
	#'squeak_changestamp' : 'si 5/19/2024 19:30'
}
WBLine >> mouseDown: anEvent [

	(self canvas elementToSpawn) ifNil:
		[self 
			addDropShadow;
			makePopUp;
			dragOffset: self position - anEvent cursorPoint.].
	(self canvas elementToSpawn) ifNotNil:
		[self spawnEdgeOfLineAt: anEvent cursorPoint]
]

{
	#category : #'drag&drop',
	#'squeak_changestamp' : 'si 5/20/2024 16:03'
}
WBLine >> mouseEnter: anEvent [

	"(self state = 2) ifTrue: 
		[self showEdges]"
]

{
	#category : #'drag&drop',
	#'squeak_changestamp' : 'si 5/20/2024 16:03'
}
WBLine >> mouseLeave: anEvent [

	"self hideEdges"
]

{
	#category : #'drag&drop',
	#'squeak_changestamp' : 'si 5/19/2024 19:12'
}
WBLine >> mouseMove: anEvent [

	self moveElement: anEvent
]

{
	#category : #'drag&drop',
	#'squeak_changestamp' : 'si 5/19/2024 19:12'
}
WBLine >> moveElement: anEvent [
	|newPosition |
	
 	newPosition := self canvas clampElementToCanvas: self at: anEvent cursorPoint + self dragOffset.
	self position: newPosition
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'si 5/19/2024 19:26'
}
WBLine >> pointFrom [

	^pointFrom
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'si 5/19/2024 19:26'
}
WBLine >> pointFrom: aPoint [

	pointFrom := aPoint
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'si 5/19/2024 19:26'
}
WBLine >> pointTo [

	^pointTo
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'si 5/19/2024 19:27'
}
WBLine >> pointTo: aPoint [

	pointTo := aPoint
]

{
	#category : #buildArrow,
	#'squeak_changestamp' : 'si 5/20/2024 13:36'
}
WBLine >> replaceFromTo [

	self pointTo: 
	(WBEdgeOfLine new
		center: pointTo;
		canvas: self canvas;
		line: self;
		yourself).
	self pointFrom:
	(WBEdgeOfLine new
		center: pointFrom;
		canvas: self canvas;
		line: self;
		yourself).
	self canvas 
		addMorph: pointFrom;
		addMorph: pointTo.
]

{
	#category : #'drag&drop',
	#'squeak_changestamp' : 'si 5/20/2024 15:36'
}
WBLine >> showEdges [

	self pointFrom show.
	self pointTo show. 
]

{
	#category : #buildArrow,
	#'squeak_changestamp' : 'si 5/20/2024 20:29'
}
WBLine >> spawnEdgeOfLineAt: aPoint [

	(self state = 0) ifTrue:
		[self pointFrom: aPoint.
		self state: 1]
	ifFalse:
		[self pointTo: aPoint.
		self 
			setVertices: { pointFrom . pointTo };
			borderWidth: 2;
			color: Color black.
		self canvas dropElement.
		self replaceFromTo.
		self state: 2].
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'si 5/19/2024 19:21'
}
WBLine >> state [

	^state
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'si 5/19/2024 19:21'
}
WBLine >> state: aState [

	state := aState
]

{
	#category : #buildArrow,
	#'squeak_changestamp' : 'si 5/20/2024 13:35'
}
WBLine >> updateEdges [

	self setVertices: { pointFrom center . pointTo center }

	
]
