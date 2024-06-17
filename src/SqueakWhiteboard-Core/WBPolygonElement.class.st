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
		'handler',
		'textBorderOffset',
		'lastMouseClick',
		'doubleClickMaxDelta',
		'textField'
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
	#'squeak_changestamp' : 'si 6/17/2024 11:31'
}
WBPolygonElement >> buttonFunctionalityForColor [

	^ [:aButton |self color: aButton color]
]

{
	#category : #buttonFunctionalities,
	#'squeak_changestamp' : 'si 6/17/2024 11:29'
}
WBPolygonElement >> buttonFunctionalityForColorPalette [

	^ [:aButton | self popUp makePopUpAt: (aButton topCenter - 5) with: self makeColorButtons columns: 3]
]

{
	#category : #buttonFunctionalities,
	#'squeak_changestamp' : 'si 6/17/2024 11:32'
}
WBPolygonElement >> buttonFunctionalityForCopy [

	^ [:aButton | self canvas deactivateElement. 
		self canvas spawnACopiedElement: self copy At: aButton currentEvent cursorPoint.]
]

{
	#category : #buttonFunctionalities,
	#'squeak_changestamp' : 'si 6/17/2024 11:32'
}
WBPolygonElement >> buttonFunctionalityForDelete [

	^ [:aButton |self delete]
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
	#category : #'event handeling',
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
	#category : #'event handeling',
	#'squeak_changestamp' : 'is 6/14/2024 16:23'
}
WBPolygonElement >> doubleClickMaxDelta [

	^ doubleClickMaxDelta ifNil: [doubleClickMaxDelta := 200]
]

{
	#category : #'event handeling',
	#'squeak_changestamp' : 'is 6/14/2024 16:23'
}
WBPolygonElement >> doubleClickMaxDelta: aDelta [

	doubleClickMaxDelta := aDelta
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
	#category : #'event handeling',
	#'squeak_changestamp' : 'si 6/3/2024 12:24'
}
WBPolygonElement >> handlesMouseDown: anEvent [

    ^ true.
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'is 6/14/2024 18:06'
}
WBPolygonElement >> initialize [

	self handler: (WBElementHandler new element: self).
	super initialize
]

{
	#category : #'event handeling',
	#'squeak_changestamp' : 'is 6/14/2024 16:22'
}
WBPolygonElement >> lastMouseClick [

	^ lastMouseClick
]

{
	#category : #'event handeling',
	#'squeak_changestamp' : 'is 6/14/2024 16:23'
}
WBPolygonElement >> lastMouseClick: evt [

	lastMouseClick := evt
]

{
	#category : #'event handeling',
	#'squeak_changestamp' : 'is 6/14/2024 16:58'
}
WBPolygonElement >> mouseDown: anEvent [
	
	(self canvas elementToSpawn) isNil
		ifTrue:
			[self canvas 
				deactivateElement.
			self dragStart: anEvent;
				addResizeFrame.
			self handler showPopUp.
			self canvas activeElement: self]
		ifFalse:
			[self canvas dropElement: anEvent].
	self handler detectDoubleClick: anEvent.
	self lastMouseClick: anEvent
]

{
	#category : #'event handeling',
	#'squeak_changestamp' : 'si 6/14/2024 11:44'
}
WBPolygonElement >> mouseMove: anEvent [

	self dragMove: anEvent
]

{
	#category : #'event handeling',
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

{
	#category : #appearance,
	#'squeak_changestamp' : 'is 6/14/2024 16:19'
}
WBPolygonElement >> textBorderOffset [

	^ textBorderOffset ifNil: [ textBorderOffset := 10]
]

{
	#category : #appearance,
	#'squeak_changestamp' : 'is 6/14/2024 16:19'
}
WBPolygonElement >> textBorderOffset: anOffset [

	textBorderOffset := anOffset
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'is 6/14/2024 17:49'
}
WBPolygonElement >> textField [

	^ textField
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'is 6/14/2024 17:49'
}
WBPolygonElement >> textField: aTextField [

	textField := aTextField
]
