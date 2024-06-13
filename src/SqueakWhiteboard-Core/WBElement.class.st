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
		'resizeFrame',
		'textBorderOffset',
		'textField',
		'lastMouseClick',
		'doubleClickMaxDelta',
		'supportsText'
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
	#category : #'event handling',
	#'squeak_changestamp' : 'is 6/12/2024 17:52'
}
WBElement >> activateTextbox: evt [
	
	self canvas deactivateTextbox.
	self textField enabled: true;
		mouseDown: evt.
	self deactivateElement.
	self canvas activeTextbox: self
]

{
	#category : #resize,
	#'squeak_changestamp' : 'si 6/3/2024 14:29'
}
WBElement >> addResizeFrame [

	self resizeFrame: (WBResizeFrame newWithParent: self).
	
	

	
]

{
	#category : #popUpBar,
	#'squeak_changestamp' : 'ACL 5/31/2024 10:56'
}
WBElement >> buttonsForPopUpBar [

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
	#category : #'event handling',
	#'squeak_changestamp' : 'is 6/2/2024 18:56'
}
WBElement >> deactivateElement [

	self removePopup.
	self removeResizeFrame.
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'is 6/11/2024 22:10'
}
WBElement >> deactivateTextbox [

	self currentHand releaseKeyboardFocus.
	self textField enabled: false
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
	#category : #'event handling',
	#'squeak_changestamp' : 'is 6/12/2024 16:09'
}
WBElement >> detectDoubleClick: evt [
	| delta |
	
	self lastMouseClick ifNotNil: [delta := evt timeStamp - self lastMouseClick timeStamp].
	(delta isNumber and: [delta < self doubleClickMaxDelta])
		ifTrue: [ self activateTextbox: evt ].
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'is 6/11/2024 17:58'
}
WBElement >> doubleClickMaxDelta [

	^ doubleClickMaxDelta ifNil: [doubleClickMaxDelta := 200]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'is 6/11/2024 17:57'
}
WBElement >> doubleClickMaxDelta: aDelta [

	doubleClickMaxDelta := aDelta
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
	#'squeak_changestamp' : 'is 6/12/2024 19:23'
}
WBElement >> extent: anExtent [
	
	super extent: anExtent.
	textField ifNotNil: [textField extent: anExtent - (self textBorderOffset * 2)].
	self setPopupPosition
	
	

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
	#'squeak_changestamp' : 'is 6/11/2024 17:54'
}
WBElement >> handlesMouseDown: anEvent [

	^ (self textField enabled) not
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'is 6/13/2024 12:16'
}
WBElement >> initialize [
	| textField |

	super initialize.
	self extent: self defaultSize.
	textField := WBPluggableTextMorphPlus new.
	textField extent: self defaultSize - ((self textBorderOffset * 2) @ (self textBorderOffset * 2)).
	self addMorphCentered: textField.
	textField textMorph centered. 
	self textField: textField
	
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
	#category : #accessing,
	#'squeak_changestamp' : 'is 6/11/2024 17:57'
}
WBElement >> lastMouseClick [

	^ lastMouseClick
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'is 6/11/2024 17:57'
}
WBElement >> lastMouseClick: evt [

	lastMouseClick := evt
]

{
	#category : #popUpBar,
	#'squeak_changestamp' : 'si 6/7/2024 00:46'
}
WBElement >> makeElementPopUp [

	self popUpMenu: (WBElementPopUp new
		setDefaultValues;
		sizeOfPopUp: self class sizeOfPopUpForStandardElement;
		addButtons: self buttonsForPopUpBar;
		yourself).
	self addMorph: self popUpMenu.
	self setPopupPosition.
	
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'is 6/13/2024 12:10'
}
WBElement >> mouseDown: mouseEvent [

	mouseEvent redButtonPressed ifTrue: [
		(self canvas elementToSpawn) isNil 
			ifTrue:
				[self canvas 
					deactivateElement;
					deactivateTextbox.
				self dragStart: mouseEvent;
					addResizeFrame;
					showPopUp.
				self canvas activeElement: self]
			ifFalse:
				[self canvas dropElement: mouseEvent].
		self detectDoubleClick: mouseEvent;
			lastMouseClick: mouseEvent]
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
	#category : #popUpBar,
	#'squeak_changestamp' : 'si 6/3/2024 15:58'
}
WBElement >> setPopupPosition [

	self popUpMenu ifNotNil: [self popUpMenu center: self topCenter - (0@self popUpMenu height/2) - (0@10)]
]

{
	#category : #popUpBar,
	#'squeak_changestamp' : 'is 6/12/2024 17:42'
}
WBElement >> showPopUp [

	(self canvas elementToSpawn) ifNil:
		[self canvas removePopUps.
		self makeElementPopUp.]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'is 6/12/2024 17:47'
}
WBElement >> supportsText [

	^ supportsText ifNil: [ supportsText := true ]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'is 6/12/2024 16:25'
}
WBElement >> supportsText: aBoolean [

	supportsText := aBoolean
]

{
	#category : #appearance,
	#'squeak_changestamp' : 'is 6/11/2024 17:26'
}
WBElement >> textBorderOffset [

	^ textBorderOffset ifNil: [ textBorderOffset := 10]
]

{
	#category : #appearance,
	#'squeak_changestamp' : 'is 6/11/2024 17:25'
}
WBElement >> textBorderOffset: anOffset [

	textBorderOffset := anOffset

	
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'is 6/11/2024 17:33'
}
WBElement >> textField [

	^ textField

]

{
	#category : #accessing,
	#'squeak_changestamp' : 'is 6/11/2024 17:32'
}
WBElement >> textField: aTextfield [

	textField := aTextfield
]
