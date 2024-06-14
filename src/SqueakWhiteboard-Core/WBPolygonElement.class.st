Class {
	#name : #WBPolygonElement,
	#superclass : #PolygonMorph,
	#instVars : [
		'edges',
		'canvas',
		'dragOffset',
		'popUp',
		'resizeFrame',
		'supportsText'
	],
	#category : #'SqueakWhiteboard-Core'
}

{
	#category : #popUp,
	#'squeak_changestamp' : 'si 6/8/2024 00:24'
}
WBPolygonElement class >> sizeOfPopUpForStandardElement [
 
	^ 20
]

{
	#category : #buttonFunctionalities,
	#'squeak_changestamp' : 'si 6/14/2024 11:40'
}
WBPolygonElement >> buttonFunctionallityForColor [

	^ [:aButton |self color: aButton color]
]

{
	#category : #buttonFunctionalities,
	#'squeak_changestamp' : 'si 6/14/2024 11:40'
}
WBPolygonElement >> buttonFunctionallityForColorPalette [

	^ [:aButton | self popUp makePopUpAt: (aButton topCenter - 5) with: self makeColorButtons columns: 3]
]

{
	#category : #buttonFunctionalities,
	#'squeak_changestamp' : 'si 6/14/2024 11:40'
}
WBPolygonElement >> buttonFunctionallityForCopy [

	^ [:aButton | self canvas deactivateElement. 
		self canvas spawnACopiedElement: self copy At: aButton currentEvent cursorPoint.]
]

{
	#category : #buttonFunctionalities,
	#'squeak_changestamp' : 'si 6/14/2024 11:40'
}
WBPolygonElement >> buttonFunctionallityForDelete [

	^ [:aButton |self delete]
]

{
	#category : #createButtons,
	#'squeak_changestamp' : 'si 6/14/2024 11:39'
}
WBPolygonElement >> buttonsForPopUpBar [

	^OrderedCollection new
		add: (WBButton new
			block: self buttonFunctionallityForDelete;
			backgroundColor: Color red);
		add: (WBButton new
			block: self buttonFunctionallityForCopy;
			backgroundColor: Color lightBlue muchDarker);
		add: (WBButton new
			block: self buttonFunctionallityForColorPalette;
			backgroundColor: Color black);
		yourself.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'si 6/14/2024 13:24'
}
WBPolygonElement >> canvas [

	^ canvas
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'si 6/3/2024 12:21'
}
WBPolygonElement >> canvas: aCanvas [

	canvas := aCanvas
]

{
	#category : #eventHandeling,
	#'squeak_changestamp' : 'si 6/3/2024 16:00'
}
WBPolygonElement >> deactivateElement [

	self removePopup.
	self removeResizeFrame
]

{
	#category : #delete,
	#'squeak_changestamp' : 'si 6/3/2024 12:23'
}
WBPolygonElement >> delete [

	self canvas removeElement: self.
	super delete
]

{
	#category : #'drag&drop',
	#'squeak_changestamp' : 'si 6/3/2024 15:49'
}
WBPolygonElement >> dragEnd: anEvent [

	self removeDropShadow
]

{
	#category : #'drag&drop',
	#'squeak_changestamp' : 'si 6/14/2024 11:44'
}
WBPolygonElement >> dragMove: anEvent [
	|newPosition |
	
 	newPosition := self canvas clampElementToCanvas: self at: anEvent cursorPoint + self dragOffset.
	self position: newPosition.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'si 6/3/2024 12:21'
}
WBPolygonElement >> dragOffset [
	
	^ dragOffset
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'si 6/3/2024 12:21'
}
WBPolygonElement >> dragOffset: anObject [

	dragOffset := anObject
]

{
	#category : #'drag&drop',
	#'squeak_changestamp' : 'si 6/3/2024 15:49'
}
WBPolygonElement >> dragStart: anEvent [

	self
		addDropShadow;
		comeToFront;
		dragOffset: self position - anEvent cursorPoint.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'si 6/14/2024 13:24'
}
WBPolygonElement >> edges [

	^ edges ifNil: [edges := OrderedCollection new]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'si 6/3/2024 12:22'
}
WBPolygonElement >> edges: aList [

	edges := aList
]

{
	#category : #eventHandeling,
	#'squeak_changestamp' : 'si 6/3/2024 12:24'
}
WBPolygonElement >> handlesMouseDown: anEvent [

    ^ true.
]

{
	#category : #createButtons,
	#'squeak_changestamp' : 'si 6/14/2024 13:24'
}
WBPolygonElement >> makeColorButtonWithColor: aColor [ 
	
	^ (WBButton new
		color: aColor;
		backgroundColor: aColor;
		clickedColor: aColor darker;
		block: self buttonFunctionallityForColor;
		yourself)
]

{
	#category : #createButtons,
	#'squeak_changestamp' : 'si 6/14/2024 13:24'
}
WBPolygonElement >> makeColorButtons [

	^ OrderedCollection new
		add: (self makeColorButtonWithColor: Color yellow);
		add: (self makeColorButtonWithColor: Color orange);
		add: (self makeColorButtonWithColor: Color red);
		add: (self makeColorButtonWithColor: Color magenta);
		add: (self makeColorButtonWithColor: Color blue);
		add: (self makeColorButtonWithColor: Color cyan);
		add: (self makeColorButtonWithColor: Color green);
		add: (self makeColorButtonWithColor: Color gray);
		add: (self makeColorButtonWithColor: Color black);
		yourself.
]

{
	#category : #popUp,
	#'squeak_changestamp' : 'si 6/13/2024 16:09'
}
WBPolygonElement >> makePopUpAt: aPoint with: aCollection columns: aNumber [

	self popUp: (WBPopUp new
		setDefaultValues;
		sizeOfPopUp: self class sizeOfPopUpForStandardElement;
		numberOfColumns: aNumber;
		addButtons: aCollection;
		yourself).
	self addMorph: self popUp.
	self popUp center: aPoint - (self popUp bottomCenter - self popUp center)
]

{
	#category : #eventHandeling,
	#'squeak_changestamp' : 'is 6/12/2024 17:44'
}
WBPolygonElement >> mouseDown: anEvent [
	
	(self canvas elementToSpawn) ifNil:
		[self canvas 
			deactivateElement.
		self dragStart: anEvent;
			addResizeFrame;
			showPopUp.
		self canvas activeElement: self].
	(self canvas elementToSpawn) ifNotNil:
		[self canvas dropElement: anEvent]
]

{
	#category : #eventHandeling,
	#'squeak_changestamp' : 'si 6/14/2024 11:44'
}
WBPolygonElement >> mouseMove: anEvent [

	self dragMove: anEvent
]

{
	#category : #eventHandeling,
	#'squeak_changestamp' : 'si 6/3/2024 12:25'
}
WBPolygonElement >> mouseUp: anEvent [
	
	self removeDropShadow.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'si 6/14/2024 13:26'
}
WBPolygonElement >> popUp [

	^ popUp
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'si 6/13/2024 16:11'
}
WBPolygonElement >> popUp: aPopUpMenu [

	popUp := aPopUpMenu.
	popUp ifNotNil: 
		[self addMorphBack: popUp]
]

{
	#category : #'drag&drop',
	#'squeak_changestamp' : 'si 6/3/2024 14:06'
}
WBPolygonElement >> postDropRoutine [

	^ SubclassResponsibility
]

{
	#category : #popUp,
	#'squeak_changestamp' : 'si 6/13/2024 16:09'
}
WBPolygonElement >> removePopup [

	self popUp ifNotNil: 
		[self popUp delete]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'si 6/3/2024 15:53'
}
WBPolygonElement >> resizeFrame [

	^ resizeFrame
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'si 6/3/2024 15:53'
}
WBPolygonElement >> resizeFrame: anObject [

	resizeFrame := anObject
]

{
	#category : #popUp,
	#'squeak_changestamp' : 'si 6/14/2024 13:27'
}
WBPolygonElement >> setPopupPosition [

	^ self topCenter - (0 @ (self class sizeOfPopUpForStandardElement / 2))
]

{
	#category : #popUp,
	#'squeak_changestamp' : 'si 6/14/2024 12:42'
}
WBPolygonElement >> showPopUp [

	(self canvas elementToSpawn) ifNil:
		[self canvas deactivateElement.
		self makePopUpAt: self setPopupPosition with: self buttonsForPopUpBar columns: nil.] 
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'is 6/12/2024 21:00'
}
WBPolygonElement >> supportsText [

	^ supportsText ifNil: [supportsText := false]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'is 6/12/2024 20:59'
}
WBPolygonElement >> supportsText: aBoolean [

	^ supportsText := aBoolean
]
