Class {
	#name : #WBPolygonElement,
	#superclass : #PolygonMorph,
	#instVars : [
		'edges',
		'canvas',
		'dragOffset',
		'popUpMenu',
		'resizeFrame'
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
	#category : #popUpBar,
	#'squeak_changestamp' : 'si 6/3/2024 18:39'
}
WBPolygonElement >> buttonsForPopUpBar [

	^OrderedCollection new
		add: (WBDeleteButton new
			canvas: self canvas;
			element: self);
		add: (WBCopyButton new
			canvas: self canvas;
			element: self);
		add: (WBColorPaletteButton new
			canvas: self canvas;
			element: self);
		yourself.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'si 6/3/2024 12:21'
}
WBPolygonElement >> canvas [

	^canvas
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'si 6/3/2024 12:21'
}
WBPolygonElement >> canvas: aCanvas [

	canvas := aCanvas
]

{
	#category : #EventHandeling,
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
	#'squeak_changestamp' : 'si 6/3/2024 13:44'
}
WBPolygonElement >> dragMove: anEvent [
	|newPosition |
	
 	newPosition := self canvas clampElementToCanvas: self at: anEvent cursorPoint + self dragOffset.
	self position: newPosition.
	self edges do: [:m |m dragOffset: m position - anEvent cursorPoint. 
		m dragMove: anEvent]
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
	#'squeak_changestamp' : 'si 6/3/2024 19:05'
}
WBPolygonElement >> edges [

	^edges ifNil: [edges := OrderedCollection new]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'si 6/3/2024 12:22'
}
WBPolygonElement >> edges: aList [

	edges := aList
]

{
	#category : #EventHandeling,
	#'squeak_changestamp' : 'si 6/3/2024 12:24'
}
WBPolygonElement >> handlesMouseDown: anEvent [

    ^ true.
]

{
	#category : #popUpBar,
	#'squeak_changestamp' : 'si 6/8/2024 00:24'
}
WBPolygonElement >> makeElementPopUp [

	self popUpMenu: (WBElementPopUp new
		setDefaultValues;
		sizeOfPopUp: self class sizeOfPopUpForStandardElement;
		addButtons: self buttonsForPopUpBar;
		yourself).
	self addMorph: self popUpMenu.
	self setPopupPosition.
]

{
	#category : #EventHandeling,
	#'squeak_changestamp' : 'si 6/3/2024 15:47'
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
		[self canvas dropElement]
]

{
	#category : #EventHandeling,
	#'squeak_changestamp' : 'si 6/3/2024 12:24'
}
WBPolygonElement >> mouseMove: anEvent [

	self moveElement: anEvent
]

{
	#category : #EventHandeling,
	#'squeak_changestamp' : 'si 6/3/2024 12:25'
}
WBPolygonElement >> mouseUp: anEvent [
	
	self removeDropShadow.
]

{
	#category : #'drag&drop',
	#'squeak_changestamp' : 'si 6/3/2024 14:08'
}
WBPolygonElement >> moveElement: anEvent [
	|newPosition |
	
 	newPosition := self canvas clampElementToCanvas: self at: anEvent cursorPoint + self dragOffset.
	self position: newPosition.
	self edges do: [:m |m dragOffset: m position - anEvent cursorPoint. 
		m dragMove: anEvent]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'si 6/3/2024 12:22'
}
WBPolygonElement >> popUpMenu [

	^popUpMenu
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'si 6/3/2024 12:22'
}
WBPolygonElement >> popUpMenu: aPopUpMenu [

	popUpMenu := aPopUpMenu.
	popUpMenu ifNotNil: 
		[self addMorphBack: popUpMenu]
]

{
	#category : #'drag&drop',
	#'squeak_changestamp' : 'si 6/3/2024 14:06'
}
WBPolygonElement >> postDropRoutine [

	^ SubclassResponsibility
]

{
	#category : #popUpBar,
	#'squeak_changestamp' : 'si 6/3/2024 12:25'
}
WBPolygonElement >> removeElementPopUp [

	self popUpMenu ifNotNil: 
		[self popUpMenu delete]
]

{
	#category : #popUpBar,
	#'squeak_changestamp' : 'si 6/3/2024 15:55'
}
WBPolygonElement >> removePopup [

	self popUpMenu ifNotNil: 
		[self popUpMenu delete]
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
	#category : #popUpBar,
	#'squeak_changestamp' : 'si 6/3/2024 15:59'
}
WBPolygonElement >> setPopupPosition [

	self popUpMenu ifNotNil: [self popUpMenu center: self topCenter - (0@self popUpMenu height/2) - (0@10)]
]

{
	#category : #popUpBar,
	#'squeak_changestamp' : 'ACL 6/7/2024 14:52'
}
WBPolygonElement >> showPopUp [

	(self canvas elementToSpawn) ifNil:
		[self canvas removePopUps.
		self makeElementPopUp.].
	(self canvas elementToSpawn) ifNotNil:
		[self canvas dropElement]
]
