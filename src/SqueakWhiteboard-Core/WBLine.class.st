"
This class represents a concrete Line.
The end points of the Line are WBEdgeOfLine
"
Class {
	#name : #WBLine,
	#superclass : #WBPolygonElement,
	#instVars : [
		'state',
		'arrowHead'
	],
	#category : #'SqueakWhiteboard-Core',
	#'squeak_changestamp' : 'is 6/23/2024 02:19'
}

{
	#category : #geometry,
	#'squeak_changestamp' : 'is 6/18/2024 00:03'
}
WBLine >> angleForEdgeOfLines [
	| lengthX lengthY length sin |
	
	lengthX := (self edges at: 2) position x - (self edges at: 1) position x.
	lengthY :=(self edges at: 2) position y - (self edges at: 1)  position y.
	length := (lengthX squared + lengthY  squared) safeSquareRoot.
	sin := lengthY / length.
	^ sin arcSin * (36 / 2 * (3.141592))
	
	
]

{
	#category : #geometry,
	#'squeak_changestamp' : 'is 6/18/2024 00:03'
}
WBLine >> angleForPoints [
	| lengthX lengthY length sin |
	
	lengthX := (self edges at: 2) x - (self edges at: 1) x.
	lengthY :=(self edges at: 2) y - (self edges at: 1) y.
	length := (lengthX squared + lengthY  squared) safeSquareRoot.
	sin := lengthY / length.
	^ sin arcSin * (36 / 2 * (3.141592))
	
	
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'is 6/23/2024 01:40'
}
WBLine >> arrowHead [

	^ arrowHead ifNil: 
		[arrowHead := WBArrowhead new isVisible: true. 
		self morph addMorph: self arrowHead] 
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'is 6/18/2024 21:11'
}
WBLine >> arrowHead: anArrowhead [

	arrowHead := anArrowhead
]

{
	#category : #'button creation',
	#'squeak_changestamp' : 'si 6/20/2024 23:34'
}
WBLine >> buttonsForPopUpBar [

	^ super buttonsForPopUpBar add: self buttonFunctionalityForArrowSwitch
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'is 6/18/2024 00:04'
}
WBLine >> color: aColor [

	self borderColor: aColor.
	(arrowHead class = WBArrowhead) ifTrue:
		[self arrowHead 
		color: aColor;
		borderColor: aColor].
	self edges isEmpty ifFalse:
		[self edges do: [:e | e color: aColor]]
]

{
	#category : #popUp,
	#'squeak_changestamp' : 'si 6/3/2024 18:52'
}
WBLine >> deactivateElement [

	self removePopup
]

{
	#category : #deleting,
	#'squeak_changestamp' : 'is 6/18/2024 00:04'
}
WBLine >> delete [

	self edges do: [:e | e delete].
	super delete
]

{
	#category : #arrow,
	#'squeak_changestamp' : 'si 6/20/2024 23:03'
}
WBLine >> hideArrowHead [

	self arrowHead isVisible: false
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'is 6/23/2024 01:40'
}
WBLine >> initialize [

	super initialize.
	self morph setVertices: { 1@1 . 1@1 }.
	self state: 0
]

{
	#category : #'event handeling',
	#'squeak_changestamp' : 'si 6/20/2024 23:00'
}
WBLine >> mouseDown: anEvent [
]

{
	#category : #'event handeling',
	#'squeak_changestamp' : 'is 6/18/2024 00:10'
}
WBLine >> mouseUp: anEvent [

	(self canvas elementToSpawn) isNil
		ifTrue: [self dragOffset: self position - anEvent cursorPoint]
		ifFalse: [self spawnEdgeOfLineAt: anEvent]
]

{
	#category : #arrow,
	#'squeak_changestamp' : 'si 6/20/2024 23:03'
}
WBLine >> showArrowHead [

	self arrowHead isVisible: true
]

{
	#category : #buildLine,
	#'squeak_changestamp' : 'is 6/23/2024 01:41'
}
WBLine >> spawnEdgeOfLineAt: aMouseEvent [

	(self state = 0) 
		ifTrue:
			[self edges add: ((WBEdgeOfLine newWithCanvas: self canvas)
				canvas: self canvas;
				center: aMouseEvent cursorPoint;
				line: self;
				yourself).
				self state: 1]
		ifFalse:
			[self edges add: ((WBEdgeOfLine newWithCanvas: self canvas)
			center: aMouseEvent cursorPoint;
			canvas: self canvas;
			line: self;
			yourself).
			self 
				borderWidth: 2;
				color: Color black;
				updateArrowHead.
			self canvas 
				addElement: (self edges at: 1);
				addElement: (self edges at: 2);
				dropElement: aMouseEvent.
			self updateEdges.
			self state: 2]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'is 6/18/2024 00:10'
}
WBLine >> state [

	^ state
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'si 5/19/2024 19:21'
}
WBLine >> state: aState [

	state := aState
]

{
	#category : #geometry,
	#'squeak_changestamp' : 'si 6/20/2024 23:58'
}
WBLine >> switchDirection [
	| aPosition | 
	
	aPosition := (self edges at: 1) center.
	(self edges at:1) center: (self edges at:2) center.
	(self edges at:2) center: aPosition.
	self updateEdges
]

{
	#category : #arrow,
	#'squeak_changestamp' : 'si 6/20/2024 23:39'
}
WBLine >> switchVisibilityOfArrowHead [

	self arrowHead isVisible
		ifTrue: [self arrowHead isVisible: false]
		ifFalse: [self arrowHead isVisible: true]
]

{
	#category : #arrow,
	#'squeak_changestamp' : 'is 6/23/2024 01:41'
}
WBLine >> updateArrowHead [

	((self edges at: 1) x > (self edges at: 2) x) 
		ifFalse:[self arrowHead rotationDegrees: (-1 * self angleForPoints)] 
		ifTrue:[self arrowHead rotationDegrees: (180 + self angleForPoints)].
	self arrowHead center: (self edges at: 2) center
]

{
	#category : #buildLine,
	#'squeak_changestamp' : 'is 6/18/2024 19:24'
}
WBLine >> updateEdges [
	
	self setVertices: { (self edges at: 2) center . (self edges at: 1) center }.
	self updateArrowHead
	
]
