Class {
	#name : #WBPolygonElement,
	#superclass : #PolygonMorph,
	#instVars : [
		'edges',
		'canvas',
		'dragOffset',
		'popUp',
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
	#category : #popUp,
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
	#'squeak_changestamp' : 'si 6/13/2024 16:23'
}
WBPolygonElement >> dragMove: anEvent [

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
	#category : #eventHandeling,
	#'squeak_changestamp' : 'si 6/3/2024 12:24'
}
WBPolygonElement >> handlesMouseDown: anEvent [

    ^ true.
]

{
	#category : #popUp,
	#'squeak_changestamp' : 'si 6/13/2024 13:25'
}
WBPolygonElement >> makeElementPopUp [

	self popUpMenu: (WBPopUp new
		setDefaultValues;
		sizeOfPopUp: self class sizeOfPopUpForStandardElement;
		addButtons: self buttonsForPopUpBar;
		yourself).
	self addMorph: self popUpMenu.
	self setPopupPosition.
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
	#category : #eventHandeling,
	#'squeak_changestamp' : 'si 6/3/2024 12:24'
}
WBPolygonElement >> mouseMove: anEvent [

	self moveElement: anEvent
]

{
	#category : #eventHandeling,
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
	#'squeak_changestamp' : 'si 6/13/2024 16:10'
}
WBPolygonElement >> popUp [

	^popUp
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
	#'squeak_changestamp' : 'si 6/3/2024 12:25'
}
WBPolygonElement >> removeElementPopUp [

	self popUpMenu ifNotNil: 
		[self popUpMenu delete]
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
	#'squeak_changestamp' : 'si 6/13/2024 16:09'
}
WBPolygonElement >> setPopupPosition [

	^ self topCenter - (0 @ self class sizeOfPopUpForStandardElement / 2) - (0 @ 10)
]

{
	#category : #popUp,
	#'squeak_changestamp' : 'si 6/13/2024 16:10'
}
WBPolygonElement >> showPopUp [

	(self canvas elementToSpawn) ifNil:
		[self canvas deactivateElement.
		self makePopUpAt: self setPopupPosition with: self buttonsForPopUpBar columns: nil].
	(self canvas elementToSpawn) ifNotNil:
		[self canvas dropElement]
]
