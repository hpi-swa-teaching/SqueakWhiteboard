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
	#category : #defaults,
	#'squeak_changestamp' : 'ACL 7/12/2024 12:05'
}
WBLine class >> defaultBorderWidth [

	^ 2
]

{
	#category : #'event handeling',
	#'squeak_changestamp' : 'ACL 7/12/2024 12:05'
}
WBLine >> activateElement: anEvent [

	(self canvas elementToSpawn) isNil ifTrue:
	[self canvas 
		deactivateElement;
		deactivateTextbox.
	self dragStart: anEvent.
	(self edges second) showPopUp.
	self canvas activeElement: (self edges second)]
]

{
	#category : #'linemorph functionalities',
	#'squeak_changestamp' : 'si 7/11/2024 20:34'
}
WBLine >> addDropShadow [
"overwrites Method because the line should not have a dropShadow."
]

{
	#category : #geometry,
	#'squeak_changestamp' : 'si 7/11/2024 19:12'
}
WBLine >> angleForPoints [
	| lengthX lengthY length sin |
	
	lengthX := (self edges second) x - (self edges first) x.
	lengthY :=(self edges second) y - (self edges first) y.
	length := (lengthX squared + lengthY  squared) safeSquareRoot.
	sin := lengthY / length.
	^ sin arcSin * (36 / 2 * (Float pi))
	
	
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
	#'squeak_changestamp' : 'ACL 7/11/2024 16:40'
}
WBLine >> color: aColor [

	self borderColor: aColor.
	(self arrowHead class = WBArrowhead) ifTrue:
		[self arrowHead 
		color: aColor;
		borderColor: aColor].
	self edges isEmpty ifFalse: [self edges do: [:e | e color: aColor]]
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
	#'squeak_changestamp' : 'si 7/11/2024 18:39'
}
WBLine >> mouseEnter: anEvent [

	self edges do: [:d | d morph color: self morph borderColor]
]

{
	#category : #'event handeling',
	#'squeak_changestamp' : 'si 7/11/2024 18:39'
}
WBLine >> mouseLeave: anEvent [

	self edges do: [:d | d morph color: Color transparent]
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
	#'squeak_changestamp' : 'ACL 7/12/2024 12:05'
}
WBLine >> setCreatedLayout [

	self 
		borderWidth: self class defaultBorderWidth;
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
	#'squeak_changestamp' : 'ACL 7/11/2024 16:37'
}
WBLine >> spawnAttachmentsForCopy [
	
	self edges: OrderedCollection new.
	self edges add: ((WBEdgeOfLine newWithCanvas: self canvas)
				canvas: self canvas;
				center: self morph vertices second;
				line: self;
				yourself);
				add: ((WBEdgeOfLine newWithCanvas: self canvas)
				canvas: self canvas;
				center: self morph vertices first;
				line: self;
				yourself).
	self canvas addElement: self edges first;
		addElement: self edges second.
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
	#'squeak_changestamp' : 'ACL 7/11/2024 16:34'
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
				checkForArrowHead.
			self canvas 
				addElement: self edges first;
				addElement: self edges second;
				dropElement: aMouseEvent.
			self hitbox: WBLineHitbox new.
			self hitbox goBehind.
			self hitbox line: self.
			self addMorph: self hitbox.
			self updateEdges.
			self state: 2]
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
	#'squeak_changestamp' : 'ACL 7/11/2024 16:35'
}
WBLine >> switchDirection [
	| aPosition | 
	
	aPosition := self edges first center.
	self edges first center: self edges second center.
	self edges second center: aPosition.
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
	#'squeak_changestamp' : 'ACL 7/11/2024 16:35'
}
WBLine >> updateArrowHead [

	((self edges first) x > (self edges second) x) 
		ifFalse:[self arrowHead rotationDegrees: (-1 * self angleForPoints)] 
		ifTrue:[self arrowHead rotationDegrees: (180 + self angleForPoints)].
	self arrowHead center: (self edges second) center
]

{
	#category : #'line building',
	#'squeak_changestamp' : 'si 7/11/2024 18:13'
}
WBLine >> updateEdges [
	
	self setVertices: { (self edges second) center . (self edges first) center }.
	self hitbox setVertices: { (self edges second) center . (self edges first) center }.
	self updateArrowHead
	
]
