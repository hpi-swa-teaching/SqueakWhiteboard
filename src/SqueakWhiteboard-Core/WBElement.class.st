"
The WBElement is an object that can be created within the canvas
"
Class {
	#name : #WBElement,
	#superclass : #Morph,
	#instVars : [
		'dragOffset',
		'canvas',
		'popUp',
		'resizeFrame'
	],
	#classInstVars : [
		'globalColor'
	],
	#category : #'SqueakWhiteboard-Core',
	#'squeak_changestamp' : 'is 5/17/2024 15:58'
}

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'JK 6/3/2024 20:58'
}
WBElement class >> newWithCanvas: aCanvas [

	^ self new initializeWithCanvas: aCanvas
]

{
	#category : #popUp,
	#'squeak_changestamp' : 'si 6/7/2024 00:46'
}
WBElement class >> sizeOfPopUpForStandardElement [

	^20
]

{
	#category : #resize,
	#'squeak_changestamp' : 'si 6/3/2024 14:29'
}
WBElement >> addResizeFrame [

	self resizeFrame: (WBResizeFrame newWithParent: self).
	
	

	
]

{
	#category : #buttonFunctionallities,
	#'squeak_changestamp' : 'si 6/13/2024 11:03'
}
WBElement >> buttonFunctionallityForColor [

	^ [:aButton |self color: aButton color]
]

{
	#category : #buttonFunctionallities,
	#'squeak_changestamp' : 'si 6/14/2024 12:09'
}
WBElement >> buttonFunctionallityForColorPalette [

	^ [:aButton | self popUp makePopUpAt: aButton topCenter - (0 @ (self class sizeOfPopUpForStandardElement / 2)) with: self makeColorButtons columns: 3]
]

{
	#category : #buttonFunctionallities,
	#'squeak_changestamp' : 'si 6/13/2024 11:03'
}
WBElement >> buttonFunctionallityForCopy [

	^ [:aButton | self canvas deactivateElement. 
		self canvas spawnACopiedElement: self copy At: aButton currentEvent cursorPoint.]
]

{
	#category : #buttonFunctionallities,
	#'squeak_changestamp' : 'si 6/13/2024 11:04'
}
WBElement >> buttonFunctionallityForDelete [

	^ [:aButton |self delete]
]

{
	#category : #createButtons,
	#'squeak_changestamp' : 'si 6/13/2024 11:13'
}
WBElement >> buttonsForPopUpBar [

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
	#'squeak_changestamp' : 'is 5/18/2024 16:04'
}
WBElement >> canvas [

	^ canvas
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'si 6/13/2024 15:31'
}
WBElement >> canvas: aCanvas [

	canvas := aCanvas
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'is 6/2/2024 18:56'
}
WBElement >> deactivateElement [

	self removePopup.
	self removeResizeFrame.
]

{
	#category : #appearance,
	#'squeak_changestamp' : 'is 5/29/2024 01:42'
}
WBElement >> defaultSize [

	^ 100@100
]

{
	#category : #delete,
	#'squeak_changestamp' : 'si 6/3/2024 14:15'
}
WBElement >> delete [

	self canvas removeElement: self.	
	super delete
]

{
	#category : #drag,
	#'squeak_changestamp' : 'si 6/3/2024 15:49'
}
WBElement >> dragEnd: anEvent [

	self removeDropShadow
]

{
	#category : #drag,
	#'squeak_changestamp' : 'is 6/1/2024 19:34'
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
	#'squeak_changestamp' : 'is 6/1/2024 19:32'
}
WBElement >> dragStart: anEvent [

	self
		addDropShadow;
		comeToFront;
		dragOffset: self position - anEvent cursorPoint.
]

{
	#category : #resize,
	#'squeak_changestamp' : 'JK 6/3/2024 19:14'
}
WBElement >> extent: aSize [
	
	super extent: aSize.
	self setPopupPosition.
	
	

]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'is 5/29/2024 01:02'
}
WBElement >> handleMouseOver: anEvent [

	^ true
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'is 6/4/2024 20:51'
}
WBElement >> handlesMouseDown: anEvent [

	^ true.
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'is 6/3/2024 20:33'
}
WBElement >> initialize [

	super initialize.
	self extent: self defaultSize
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'JK 6/3/2024 14:11'
}
WBElement >> initializeWithCanvas: aCanvas [
	
	self canvas: aCanvas.
	self initialize.
]

{
	#category : #createButtons,
	#'squeak_changestamp' : 'si 6/13/2024 11:09'
}
WBElement >> makeColorButtonWithColor: aColor [ 
	
	^(WBButton new
		color: aColor;
		backgroundColor: aColor;
		clickedColor: aColor darker;
		block: self buttonFunctionallityForColor;
		yourself)
]

{
	#category : #createButtons,
	#'squeak_changestamp' : 'si 6/13/2024 11:07'
}
WBElement >> makeColorButtons [

	^OrderedCollection new
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
	#'squeak_changestamp' : 'si 6/13/2024 13:43'
}
WBElement >> makePopUpAt: aPoint with: aCollection columns: aNumber [

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
	#category : #'event handling',
	#'squeak_changestamp' : 'is 6/4/2024 13:01'
}
WBElement >> mouseDown: mouseEvent [

	mouseEvent redButtonPressed ifTrue: [
	(self canvas elementToSpawn) ifNil:
		[self canvas deactivateElement.
		self dragStart: mouseEvent;
			addResizeFrame;
			showPopUp.
		self canvas activeElement: self].
	(self canvas elementToSpawn) ifNotNil:
		[self canvas dropElement]]
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'is 6/1/2024 19:33'
}
WBElement >> mouseMove: anEvent [

	anEvent redButtonPressed ifTrue: [ self dragMove: anEvent]
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'is 5/28/2024 15:21'
}
WBElement >> mouseUp: mouseEvent [

	self dragEnd: mouseEvent.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'si 6/13/2024 13:36'
}
WBElement >> popUp [

	^ popUp
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'si 6/13/2024 13:38'
}
WBElement >> popUp: aPopUp [

	popUp := aPopUp.
	popUp ifNotNil: 
		[self addMorphBack: popUp]
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
	#category : #popUp,
	#'squeak_changestamp' : 'si 6/13/2024 13:39'
}
WBElement >> removePopup [

	self popUp ifNotNil: 
		[self popUp delete]
]

{
	#category : #resize,
	#'squeak_changestamp' : 'si 6/3/2024 15:57'
}
WBElement >> removeResizeFrame [

	(self resizeFrame) ifNotNil: [self resizeFrame delete]
	

]

{
	#category : #accessing,
	#'squeak_changestamp' : 'si 6/3/2024 15:53'
}
WBElement >> resizeFrame [

	^ resizeFrame
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'si 6/3/2024 15:53'
}
WBElement >> resizeFrame: anObject [

	resizeFrame := anObject
]

{
	#category : #popUp,
	#'squeak_changestamp' : 'si 6/14/2024 12:08'
}
WBElement >> setPopupPosition [

	^ self topCenter - (0 @ (self class sizeOfPopUpForStandardElement / 2))
]

{
	#category : #popUp,
	#'squeak_changestamp' : 'si 6/13/2024 13:44'
}
WBElement >> showPopUp [

	(self canvas elementToSpawn) ifNil:
		[self canvas deactivateElement.
		self makePopUpAt: self setPopupPosition with: self buttonsForPopUpBar columns: nil].
	(self canvas elementToSpawn) ifNotNil:
		[self canvas dropElement]
]
