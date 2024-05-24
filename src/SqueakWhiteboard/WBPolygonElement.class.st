Class {
	#name : #WBPolygonElement,
	#superclass : #PolygonMorph,
	#instVars : [
		'edges',
		'canvas',
		'dragOffset',
		'popUpMenu'
	],
	#category : #SqueakWhiteboard
}

{
	#category : #popUpBar,
	#'squeak_changestamp' : 'si 5/24/2024 13:14'
}
WBPolygonElement >> buttonsForPopUpBar [

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
	#'squeak_changestamp' : 'si 5/24/2024 10:31'
}
WBPolygonElement >> canvas [

	^canvas
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'si 5/24/2024 10:31'
}
WBPolygonElement >> canvas: aCanvas [

	canvas := aCanvas
]

{
	#category : #delete,
	#'squeak_changestamp' : 'si 5/24/2024 14:47'
}
WBPolygonElement >> delete [

	self canvas removeElement: self.
	super delete
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'si 5/24/2024 13:11'
}
WBPolygonElement >> dragOffset [
	
	^ dragOffset
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'si 5/24/2024 13:11'
}
WBPolygonElement >> dragOffset: anObject [

	dragOffset := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'si 5/24/2024 10:39'
}
WBPolygonElement >> edges [

	^edges
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'si 5/24/2024 10:12'
}
WBPolygonElement >> edges: aList [

	edges := aList
]

{
	#category : #mouseEvents,
	#'squeak_changestamp' : 'si 5/24/2024 13:10'
}
WBPolygonElement >> handlesMouseDown: anEvent [

    ^ true.
]

{
	#category : #mouseEvents,
	#'squeak_changestamp' : 'si 5/24/2024 14:56'
}
WBPolygonElement >> handlesMouseOver: anEvent [

	^true
]

{
	#category : #popUpBar,
	#'squeak_changestamp' : 'si 5/24/2024 14:12'
}
WBPolygonElement >> makeElementPopUp [

	self popUpMenu: (WBElementPopUp new
		setDefaultValues;
		position: self topRight;
		comeToFront;
		addButtons: self buttonsForPopUpBar;
		yourself).
	
]

{
	#category : #mouseEvents,
	#'squeak_changestamp' : 'si 5/24/2024 14:08'
}
WBPolygonElement >> mouseDown: anEvent [
	
	(self canvas elementToSpawn) ifNil:
		[owner removePopUps.
		self
			addDropShadow;
			comeToFront;
			makeElementPopUp;
			dragOffset: self position - anEvent cursorPoint.].
	(self canvas elementToSpawn) ifNotNil:
		[self canvas dropElement]
]

{
	#category : #mouseEvents,
	#'squeak_changestamp' : 'si 5/24/2024 14:56'
}
WBPolygonElement >> mouseEnter: anEvent [

	self edges do: [:m| m show]
]

{
	#category : #mouseEvents,
	#'squeak_changestamp' : 'si 5/24/2024 14:57'
}
WBPolygonElement >> mouseLeave: anEvent [

	self edges do: [:m| m hide]
]

{
	#category : #mouseEvents,
	#'squeak_changestamp' : 'si 5/24/2024 13:10'
}
WBPolygonElement >> mouseMove: anEvent [

	self moveElement: anEvent
]

{
	#category : #mouseEvents,
	#'squeak_changestamp' : 'si 5/24/2024 13:11'
}
WBPolygonElement >> mouseUp: anEvent [
	
	self removeDropShadow.
]

{
	#category : #'drag&drop',
	#'squeak_changestamp' : 'si 5/24/2024 14:19'
}
WBPolygonElement >> moveElement: anEvent [
	|newPosition |
	
 	newPosition := self canvas clampElementToCanvas: self at: anEvent cursorPoint + self dragOffset.
	self position: newPosition.
	self edges do: [:m |m dragOffset: m position - anEvent cursorPoint. 
		m moveElement: anEvent]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'si 5/24/2024 14:12'
}
WBPolygonElement >> popUpMenu [

	^popUpMenu
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'si 5/24/2024 13:49'
}
WBPolygonElement >> popUpMenu: aPopUpMenu [

	popUpMenu := aPopUpMenu.
	popUpMenu ifNotNil: 
		[self addMorphBack: popUpMenu]
]

{
	#category : #popUpBar,
	#'squeak_changestamp' : 'si 5/24/2024 14:11'
}
WBPolygonElement >> removeElementPopUp [

	self popUpMenu ifNotNil: 
		[self popUpMenu delete]
]
