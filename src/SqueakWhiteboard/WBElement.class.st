"
The WBElement is an object that can be created within the canvas
"
Class {
	#name : #WBElement,
	#superclass : #Morph,
	#instVars : [
		'dragOffset',
		'canvas',
		'popUpMenu'
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
	#category : #accessing,
	#'squeak_changestamp' : 'is 5/18/2024 15:59'
}
WBElement >> dragOffset [
	^ dragOffset
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'is 5/18/2024 15:59'
}
WBElement >> dragOffset: anObject [
	dragOffset := anObject
]

{
	#category : #'drag&drop',
	#'squeak_changestamp' : 'is 5/19/2024 16:21'
}
WBElement >> handlesMouseDown: anEvent [
    ^ true.
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'ACL 5/24/2024 14:35'
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
	#'squeak_changestamp' : 'si 5/27/2024 11:48'
}
WBElement >> makeElementPopUp [

	self popUpMenu: (WBElementPopUp new
		setDefaultValues;
		position: self topRight;
		addButtons: self buttonsForPopUpBar;
		yourself).
	
]

{
	#category : #'drag&drop',
	#'squeak_changestamp' : 'si 5/27/2024 11:35'
}
WBElement >> mouseDown: anEvent [
	
	(self canvas elementToSpawn) ifNil:
		[self canvas deactivateElement.
		self
			addDropShadow;
			makeElementPopUp;
			comeToFront;
			dragOffset: self position - anEvent cursorPoint.
		self canvas activeElement: self.].
	(self canvas elementToSpawn) ifNotNil:
		[self canvas dropElement]
]

{
	#category : #'drag&drop',
	#'squeak_changestamp' : 'si 5/17/2024 12:21'
}
WBElement >> mouseMove: anEvent [

	self moveElement: anEvent
]

{
	#category : #'drag&drop',
	#'squeak_changestamp' : 'ACL 5/17/2024 15:12'
}
WBElement >> mouseUp: anEvent [
	
	self removeDropShadow.
]

{
	#category : #'drag&drop',
	#'squeak_changestamp' : 'is 5/18/2024 17:53'
}
WBElement >> moveElement: anEvent [
	|newPosition |
	
 	newPosition := self canvas clampElementToCanvas: self at: anEvent cursorPoint + self dragOffset.
	self position: newPosition
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
	#'squeak_changestamp' : 'si 5/23/2024 22:28'
}
WBElement >> removeElementPopUp [

	self popUpMenu ifNotNil: 
		[self popUpMenu delete]
]
