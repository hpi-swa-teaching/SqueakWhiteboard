"
This class represents a concrete Line.
The end points of the Line are WBEdgeOfLine
"
Class {
	#name : #WBLine,
	#superclass : #WBPolygonElement,
	#instVars : [
		'state',
		'arrowHead',
		'hitbox'
	],
	#category : #'SqueakWhiteboard-Core',
	#'squeak_changestamp' : 'is 6/23/2024 02:19'
}

{
	#category : #'event handeling',
	#'squeak_changestamp' : 'si 7/11/2024 15:10'
}
WBLine >> activateElement: anEvent [

	(self canvas elementToSpawn) isNil ifTrue:
	[self canvas 
		deactivateElement;
		deactivateTextbox.
	self dragStart: anEvent.
	(self edges at: 2) showPopUp.
	self canvas activeElement: (self edges at: 2)]
]

{
	#category : #'linemorph functionalities',
	#'squeak_changestamp' : 'si 7/10/2024 13:45'
}
WBLine >> addDropShadow [
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
	#'squeak_changestamp' : 'si 6/25/2024 13:41'
}
WBLine >> arrowHead [

	^ arrowHead
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'si 6/25/2024 14:09'
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
	#category : #arrow,
	#'squeak_changestamp' : 'ACL 7/10/2024 11:59'
}
WBLine >> checkForArrowHead [

	self arrowHead
		ifFalse: [self arrowHead: (WBArrowhead new isVisible: false).
			self addMorph: self arrowHead.
			self updateArrowHead]
		ifTrue: [self arrowHead: (WBArrowhead new isVisible: true).
			self addMorph: self arrowHead.
			self updateArrowHead]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'nicloeser 7/10/2024 12:00'
}
WBLine >> color: aColor [

	self borderColor: aColor.
	(self arrowHead class = WBArrowhead) ifTrue:
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
	#category : #drag,
	#'squeak_changestamp' : 'si 7/7/2024 18:18'
}
WBLine >> dragEnd: anEvent [

	self edges do: [:d | d dragEnd: anEvent]
]

{
	#category : #drag,
	#'squeak_changestamp' : 'si 7/11/2024 15:07'
}
WBLine >> dragStart: anEvent [

	self edges do: [:d | d dragStart: anEvent].
	self dragOffset: self position - anEvent cursorPoint
]

{
	#category : #arrow,
	#'squeak_changestamp' : 'si 6/20/2024 23:03'
}
WBLine >> hideArrowHead [

	self arrowHead isVisible: false
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'si 7/5/2024 12:12'
}
WBLine >> hitbox [

	^ hitbox
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'si 7/5/2024 12:13'
}
WBLine >> hitbox: aMorph [

	hitbox := aMorph
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'si 7/5/2024 12:16'
}
WBLine >> initialize [

	super initialize.
	self morph setVertices: { 1@1 . 1@1 }.
	self state: 0
]

{
	#category : #'event handeling',
	#'squeak_changestamp' : 'si 7/11/2024 15:04'
}
WBLine >> mouseDown: anEvent [

	anEvent redButtonPressed ifTrue: 
		[self state = 2 ifTrue: [self handleRedButtonClick: anEvent].
		self state = 3 ifTrue:[self spawnCopiedLine: anEvent]]
]

{
	#category : #'event handeling',
	#'squeak_changestamp' : 'si 7/7/2024 18:14'
}
WBLine >> mouseMove: anEvent [

	self state = 2 ifTrue: 
		[super mouseMove: anEvent.
		self edges do: [:d | d mouseMove: anEvent]]
]

{
	#category : #'event handeling',
	#'squeak_changestamp' : 'si 7/10/2024 17:22'
}
WBLine >> mouseUp: anEvent [

	(self canvas elementToSpawn) isNil
		ifTrue: [self dragEnd: anEvent]
		ifFalse: [self spawnEdgeOfLineAt: anEvent]
]

{
	#category : #layout,
	#'squeak_changestamp' : 'si 7/11/2024 15:20'
}
WBLine >> setCreatedLayout [

	self 
		borderWidth: 2;
		color: Color black;
		checkForArrowHead.
]

{
	#category : #arrow,
	#'squeak_changestamp' : 'si 6/20/2024 23:03'
}
WBLine >> showArrowHead [

	self arrowHead isVisible: true
]

{
	#category : #'line building',
	#'squeak_changestamp' : 'nicloeser 7/10/2024 11:21'
}
WBLine >> spawnAttachmentsForCopy [
	
	self edges: OrderedCollection new.
	self edges add: ((WBEdgeOfLine newWithCanvas: self canvas)
				canvas: self canvas;
				center: (self morph vertices at: 2);
				line: self;
				yourself);
				add: ((WBEdgeOfLine newWithCanvas: self canvas)
				canvas: self canvas;
				center: (self morph vertices at: 1);
				line: self;
				yourself).
	self canvas addElement: (self edges at: 1);
		addElement: (self edges at: 2).
	self updateEdges
	
	

	
]

{
	#category : #'line building',
	#'squeak_changestamp' : 'si 7/11/2024 15:00'
}
WBLine >> spawnCopiedLine: anEvent [

	(self canvas elementToSpawn) isNil ifFalse:
		[self canvas dropElement: anEvent.
		self spawnAttachmentsForCopy.
		self state: 2.
		self dragStart: anEvent.
		self edges do: [:d | d mouseDown: anEvent].]
]

{
	#category : #'line building',
	#'squeak_changestamp' : 'si 7/11/2024 15:17'
}
WBLine >> spawnEdgeOfLineAt: anEvent [

	(self state = 0) 
		ifTrue: [self spawnFirstEdgeAt: anEvent cursorPoint]
		ifFalse: [self spawnSecondEdgeAt: anEvent]
]

{
	#category : #'line building',
	#'squeak_changestamp' : 'si 7/11/2024 15:15'
}
WBLine >> spawnFirstEdgeAt: aPoint [

	self edges add: 
		((WBEdgeOfLine newWithCanvas: self canvas)
			center: aPoint;
			line: self;
			yourself).
	self state: 1
]

{
	#category : #'line building',
	#'squeak_changestamp' : 'si 7/11/2024 15:19'
}
WBLine >> spawnHitbox [

	self hitbox: WBLineHitbox new.
	self hitbox goBehind.
	self hitbox line: self.
	self addMorph: self hitbox
]

{
	#category : #'line building',
	#'squeak_changestamp' : 'si 7/11/2024 15:25'
}
WBLine >> spawnSecondEdgeAt: anEvent [

	self edges add: 
		((WBEdgeOfLine newWithCanvas: self canvas)
			center: anEvent cursorPoint;
			line: self;
			yourself).
	self setCreatedLayout.
	self canvas dropElement: anEvent.
	self edges do: [:e | self canvas addMorph: e morph].
	self spawnHitbox.
	self updateEdges.
	self state: 2
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
	#category : #'line building',
	#'squeak_changestamp' : 'si 7/5/2024 12:26'
}
WBLine >> updateEdges [
	
	self setVertices: { (self edges at: 2) center . (self edges at: 1) center }.
	self hitbox setVertices: { (self edges at: 2) center . (self edges at: 1) center . (self edges at: 2) center}.
	self updateArrowHead
	
]
