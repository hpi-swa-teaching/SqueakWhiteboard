Class {
	#name : #WBLine,
	#superclass : #WBPolygonElement,
	#instVars : [
		'state',
		'arrowHead'
	],
	#category : #'SqueakWhiteboard-Core'
}

{
	#category : #geometry,
	#'squeak_changestamp' : 'si 6/3/2024 19:16'
}
WBLine >> angleForEdgeOfLines [
	|lengthX lengthY length sin|
	
	lengthX := (self edges at: 2) position x - (self edges at: 1) position x.
	lengthY :=(self edges at: 2) position y - (self edges at: 1)  position y.
	length := (lengthX squared + lengthY  squared) safeSquareRoot.
	sin := lengthY / length.
	^sin arcSin * (36 / 2 * (3.141592))
	
	
]

{
	#category : #geometry,
	#'squeak_changestamp' : 'si 6/3/2024 20:00'
}
WBLine >> angleForPoints [
	|lengthX lengthY length sin|
	
	lengthX := (self edges at: 2) x - (self edges at: 1) x.
	lengthY :=(self edges at: 2) y - (self edges at: 1) y.
	length := (lengthX squared + lengthY  squared) safeSquareRoot.
	sin := lengthY / length.
	^sin arcSin * (36 / 2 * (3.141592))
	
	
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'si 6/3/2024 19:38'
}
WBLine >> arrowHead [

	^arrowHead ifNil: [self arrowHead: WBArrowhead new]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'si 6/3/2024 19:38'
}
WBLine >> arrowHead: aMorph [

	arrowHead := aMorph.
	self addMorph: aMorph
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'si 6/3/2024 19:50'
}
WBLine >> color: aColor [

	self borderColor: aColor.
	(arrowHead class = WBArrowhead) ifTrue:[
	self arrowHead 
		color: aColor;
		borderColor: aColor
	].
	self edges isEmpty ifFalse:
		[self edges do: [:e | e color: aColor]]
]

{
	#category : #popUpBar,
	#'squeak_changestamp' : 'si 6/3/2024 18:52'
}
WBLine >> deactivateElement [

	self removePopup
]

{
	#category : #deleting,
	#'squeak_changestamp' : 'si 6/3/2024 19:46'
}
WBLine >> delete [

	self edges do: [:e | e delete].
	super delete.
]

{
	#category : #'drag&drop',
	#'squeak_changestamp' : 'JK 5/28/2024 14:37'
}
WBLine >> dragMove: anEvent [
	|newPosition |
	
 	newPosition := self canvas clampElementToCanvas: self at: anEvent cursorPoint + self dragOffset.
	self position: newPosition
]

{
	#category : #eventHandeling,
	#'squeak_changestamp' : 'si 5/19/2024 19:19'
}
WBLine >> handlesMouseDown: anEvent [
 
	^true
]

{
	#category : #eventHandeling,
	#'squeak_changestamp' : 'si 5/20/2024 15:28'
}
WBLine >> handlesMouseOver: anEvent [

	^true
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
	#category : #eventHandeling,
	#'squeak_changestamp' : 'si 5/27/2024 21:38'
}
WBLine >> mouseDown: anEvent [

"	(self canvas elementToSpawn) ifNil:
		[self 
			dragOffset: self position - anEvent cursorPoint.].
	(self canvas elementToSpawn) ifNotNil:
		[self spawnEdgeOfLineAt: anEvent cursorPoint]"
]

{
	#category : #eventHandeling,
	#'squeak_changestamp' : 'si 5/19/2024 19:12'
}
WBLine >> mouseMove: anEvent [

	self moveElement: anEvent
]

{
	#category : #eventHandeling,
	#'squeak_changestamp' : 'si 5/27/2024 21:38'
}
WBLine >> mouseUp: anEvent [

	(self canvas elementToSpawn) ifNil:
		[self 
			dragOffset: self position - anEvent cursorPoint.].
	(self canvas elementToSpawn) ifNotNil:
		[self spawnEdgeOfLineAt: anEvent cursorPoint]
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
	#category : #buildLine,
	#'squeak_changestamp' : 'si 6/3/2024 19:52'
}
WBLine >> spawnEdgeOfLineAt: aPoint [

	(self state = 0) ifTrue:
		[self edges add: (WBEdgeOfLine new
		center: aPoint;
		canvas: self canvas;
		line: self;
		yourself).
		self state: 1]
	ifFalse:
		[self edges add: (WBEdgeOfLine new
		center: aPoint;
		canvas: self canvas;
		line: self;
		yourself).
		self 
			borderWidth: 2;
			color: Color black;
			updateArrowHead.
		self canvas 
			addMorph: (self edges at: 1);
			addMorph: (self edges at: 2);
			addElement: (self edges at: 1);
			addElement: (self edges at: 2);
			dropElement.
		self updateEdges.
		self state: 2.].
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
	#category : #arrow,
	#'squeak_changestamp' : 'nicloeser 6/4/2024 09:28'
}
WBLine >> updateArrowHead [

	((self edges at: 1) x > (self edges at: 2) x) ifFalse:[
		self arrowHead rotationDegrees: (-1 * self angleForPoints).
		] 
	ifTrue:[
		self arrowHead rotationDegrees: (180 + self angleForPoints).
	].
	self arrowHead center: (self edges at: 2) center.
]

{
	#category : #buildLine,
	#'squeak_changestamp' : 'si 6/3/2024 20:03'
}
WBLine >> updateEdges [

	self setVertices: { (self edges at: 2) center . (self edges at: 1) center }.
	self updateArrowHead
	
]
