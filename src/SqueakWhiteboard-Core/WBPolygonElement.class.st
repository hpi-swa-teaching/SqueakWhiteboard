Class {
	#name : #WBPolygonElement,
	#superclass : #PolygonMorph,
	#instVars : [
		'edges',
		'canvas',
		'dragOffset',
		'popUpMenu'
	],
	#category : #'SqueakWhiteboard-Core'
}

{
	#category : #popUpBar,
	#'squeak_changestamp' : 'si 6/3/2024 12:25'
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
	#'squeak_changestamp' : 'si 6/3/2024 15:31'
}
WBPolygonElement >> deactivateElement [

	self halt.
	self removePopup.
	"self removeResizeFrame."
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
	#'squeak_changestamp' : 'si 6/3/2024 12:21'
}
WBPolygonElement >> edges [

	^edges
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
	#category : #EventHandeling,
	#'squeak_changestamp' : 'si 6/3/2024 12:24'
}
WBPolygonElement >> handlesMouseOver: anEvent [

	^true
]

{
	#category : #popUpBar,
	#'squeak_changestamp' : 'si 6/3/2024 12:25'
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
WBPolygonElement >> mouseEnter: anEvent [

	self edges do: [:m| m show]
]

{
	#category : #EventHandeling,
	#'squeak_changestamp' : 'si 6/3/2024 12:24'
}
WBPolygonElement >> mouseLeave: anEvent [

	self edges do: [:m| m hide]
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
