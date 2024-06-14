Class {
	#name : #WBPolygonElement,
	#superclass : #PolygonMorph,
	#instVars : [
		'edges',
		'canvas',
		'dragOffset',
		'popUp',
		'resizeFrame',
		'supportsText',
		'handler'
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
	#'squeak_changestamp' : 'si 6/14/2024 14:53'
}
WBPolygonElement >> deactivateElement [

	self handler removePopup.
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
	#category : #accessing,
	#'squeak_changestamp' : 'si 6/14/2024 14:49'
}
WBPolygonElement >> handler [
	^ handler
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'si 6/14/2024 14:49'
}
WBPolygonElement >> handler: anObject [
	handler := anObject
]

{
	#category : #eventHandeling,
	#'squeak_changestamp' : 'si 6/3/2024 12:24'
}
WBPolygonElement >> handlesMouseDown: anEvent [

    ^ true.
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'si 6/14/2024 14:51'
}
WBPolygonElement >> initialize [

	self handler: (WBHandler new element: self).
	super initialize
]

{
	#category : #eventHandeling,
	#'squeak_changestamp' : 'si 6/14/2024 14:52'
}
WBPolygonElement >> mouseDown: anEvent [
	
	(self canvas elementToSpawn) ifNil:
		[self canvas 
			deactivateElement.
		self dragStart: anEvent;
			addResizeFrame.
		self handler showPopUp.
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
