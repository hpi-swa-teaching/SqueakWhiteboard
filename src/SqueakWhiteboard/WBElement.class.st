"
The WBElement is an object that can be created within the canvas
"
Class {
	#name : #WBElement,
	#superclass : #Morph,
	#instVars : [
		'dragOffset',
		'canvas',
		'popUpMenu',
		'resizeFrame'
	],
	#classInstVars : [
		'globalColor'
	],
	#category : #SqueakWhiteboard,
	#'squeak_changestamp' : 'is 5/17/2024 15:58'
}

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'is 5/28/2024 10:21'
}
WBElement class >> newWithCanvas: aCanvas [

	^ WBElement basicNew initializeWithCanvas: aCanvas
]

{
	#category : #resize,
	#'squeak_changestamp' : 'JK 5/28/2024 12:21'
}
WBElement >> addResizeFrame [
	self resizeFrame: (WBResizeFrame newWithParent: self).
	
	

	
]

{
	#category : #popUpBar,
	#'squeak_changestamp' : 'si 5/23/2024 23:49'
}
WBElement >> buttonsForPopUpBar [

	^OrderedCollection new
		add: (WBDeleteButton new
			canvas: self canvas;
			element: self);
		add: (WBColorPaletteButton new
			canvas: self canvas;
			element: self);
		add: (WBCopyButton new
			canvas: self canvas;
			element: self);
		yourself.
	
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'is 5/18/2024 16:04'
}
WBElement >> canvas [

	^ canvas
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'si 5/17/2024 12:50'
}
WBElement >> canvas: aCanvas [

	canvas := aCanvas
]

{
	#category : #mouseEvents,
	#'squeak_changestamp' : 'JK 5/28/2024 12:21'
}
WBElement >> deactivateElement [
	self removePopup.
	self removeResizeFrame.
]

{
	#category : #drag,
	#'squeak_changestamp' : 'JK 5/26/2024 23:47'
}
WBElement >> dragEnd: anEvent [
	self removeDropShadow.
]

{
	#category : #drag,
	#'squeak_changestamp' : 'JK 5/26/2024 23:47'
}
WBElement >> dragMove: mouseEvent [
	|newPosition |
	
 	newPosition := self canvas clampElementToCanvas: self at: mouseEvent cursorPoint + self dragOffset.
	self position: newPosition
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'is 5/28/2024 16:17'
}
WBElement >> dragOffset [

	^ dragOffset
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'is 5/28/2024 16:17'
}
WBElement >> dragOffset: aPoint [

	dragOffset := aPoint
]

{
	#category : #drag,
	#'squeak_changestamp' : 'JK 5/27/2024 00:01'
}
WBElement >> dragStart: anEvent [
	self
		addDropShadow;
		comeToFront;
		dragOffset: self position - anEvent cursorPoint.
]

{
	#category : #resize,
	#'squeak_changestamp' : 'JK 5/28/2024 12:20'
}
WBElement >> extent: aSize [
	super extent: aSize.
	self setPopupPosition.
	
	

]

{
	#category : #mouseEvents,
	#'squeak_changestamp' : 'JK 5/27/2024 15:56'
}
WBElement >> handleMouseOver: anEvent [

	^true
]

{
	#category : #mouseEvents,
	#'squeak_changestamp' : 'is 5/28/2024 15:20'
}
WBElement >> handlesMouseDown: anEvent [

    ^ true.
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'JK 5/26/2024 23:04'
}
WBElement >> initialize [
	super initialize.
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'is 5/28/2024 10:22'
}
WBElement >> initializeWithCanvas: aCanvas [

	super initialize.
	self canvas: aCanvas
]

{
	#category : #popUpBar,
	#'squeak_changestamp' : 'JK 5/28/2024 23:16'
}
WBElement >> makeElementPopUp [

	self popUpMenu: (WBElementPopUp new
		setDefaultValues;
		addButtons: self buttonsForPopUpBar;
		yourself).
	self addMorph: self popUpMenu.
	self setPopupPosition.
	
]

{
	#category : #mouseEvents,
	#'squeak_changestamp' : 'JK 5/28/2024 22:53'
}
WBElement >> mouseDown: mouseEvent [
	(self canvas elementToSpawn) ifNil:
		[self canvas deactivateElement.
		self dragStart: mouseEvent.
		self addResizeFrame.
		self showPopUp.
		self canvas activeElement: self.].
	(self canvas elementToSpawn) ifNotNil:
		[self canvas dropElement]
]

{
	#category : #mouseEvents,
	#'squeak_changestamp' : 'is 5/28/2024 15:21'
}
WBElement >> mouseMove: anEvent [

	self dragMove: anEvent
]

{
	#category : #mouseEvents,
	#'squeak_changestamp' : 'is 5/28/2024 15:21'
}
WBElement >> mouseUp: mouseEvent [

	self dragEnd: mouseEvent.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'si 5/23/2024 22:11'
}
WBElement >> popUpMenu [

	^popUpMenu
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'si 5/23/2024 22:26'
}
WBElement >> popUpMenu: aPopUpMenu [

	popUpMenu := aPopUpMenu.
	popUpMenu ifNotNil: 
		[self addMorphBack: popUpMenu]
]

{
	#category : #popUpBar,
	#'squeak_changestamp' : 'JK 5/27/2024 11:14'
}
WBElement >> removePopup [
	self popUpMenu ifNotNil: 
		[self popUpMenu delete]
]

{
	#category : #resize,
	#'squeak_changestamp' : 'JK 5/28/2024 12:21'
}
WBElement >> removeResizeFrame [
	(self resizeFrame) ifNotNil: [self resizeFrame delete].
	

]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JK 5/28/2024 12:16'
}
WBElement >> resizeFrame [
	^resizeFrame
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JK 5/28/2024 11:33'
}
WBElement >> resizeFrame: anObject [
	resizeFrame := anObject
]

{
	#category : #popUpBar,
	#'squeak_changestamp' : 'JK 5/28/2024 22:29'
}
WBElement >> setPopupPosition [
	self popUpMenu ifNotNil: [self popUpMenu center: self topCenter - (0@self popUpMenu height/2) - (0@10)].
]

{
	#category : #popUpBar,
	#'squeak_changestamp' : 'JK 5/26/2024 23:35'
}
WBElement >> showPopUp [
	(self canvas elementToSpawn) ifNil:
		[owner removePopUps.
		self makeElementPopUp.].
	(self canvas elementToSpawn) ifNotNil:
		[self canvas dropElement]
]
