"
This class represents an object that can be created within the canvas.
It implements the different behavior of different kinds of elements.
It has the aMorph instance variable, to which the actual, visible updates get passed to.
All other classes working with the WBElement class cannot differentiate between the WBElement object and the actual morph
"
Class {
	#name : #WBElement,
	#superclass : #Object,
	#instVars : [
		'dragOffset',
		'canvas',
		'popUp',
		'resizeFrame',
		'textField',
		'lastMouseClick',
		'supportsText',
		'morph',
		'resizable'
	],
	#classInstVars : [
		'globalColor'
	],
	#category : #'SqueakWhiteboard-Core',
	#'squeak_changestamp' : 'is 6/23/2024 02:15'
}

{
	#category : #layout,
	#'squeak_changestamp' : 'is 6/18/2024 22:28'
}
WBElement class >> defaultSize [

	^ 100@100
]

{
	#category : #layout,
	#'squeak_changestamp' : 'si 7/10/2024 13:36'
}
WBElement class >> defaultTextBorderOffset [

	^ 10
]

{
	#category : #text,
	#'squeak_changestamp' : 'si 7/10/2024 16:13'
}
WBElement class >> doubleClickMaxDelta [

	^ 200 
]

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'JK 6/30/2024 15:58'
}
WBElement class >> newWithCanvas: aCanvas [

	^ self basicNew 
		canvas: aCanvas;
		initialize
]

{
	#category : #popUp,
	#'squeak_changestamp' : 'si 7/10/2024 12:10'
}
WBElement class >> sizeOfPopUpForStandardElement [

	^ 30
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'si 7/10/2024 17:09'
}
WBElement >> activateTextbox: anEvent [
	
	self canvas 
		deactivateTextbox;
		deactivateElement;
		activeTextbox: self.
	self textField 
		enabled: true;
		mouseDown: anEvent
]

{
	#category : #'morph functionalities',
	#'squeak_changestamp' : 'is 6/18/2024 17:32'
}
WBElement >> addDropShadow [

	self morph addDropShadow
]

{
	#category : #'morph functionalities',
	#'squeak_changestamp' : 'is 6/18/2024 18:03'
}
WBElement >> addMorph: aMorph [

	self morph addMorph: aMorph
]

{
	#category : #'morph functionalities',
	#'squeak_changestamp' : 'is 6/18/2024 18:04'
}
WBElement >> addMorphCentered: aMorph [

	self morph addMorphCentered: aMorph
]

{
	#category : #'morph functionalities',
	#'squeak_changestamp' : 'is 6/19/2024 16:23'
}
WBElement >> addOwnMorphTo: aMorph [

	aMorph addMorph: self morph
]

{
	#category : #resize,
	#'squeak_changestamp' : 'ACL 7/10/2024 11:55'
}
WBElement >> addResizeFrame [
	
	self resizable ifTrue: [
		self resizeFrame: (WBResizeFrame newWithParent: self)]
	
	

	
]

{
	#category : #'morph functionalities',
	#'squeak_changestamp' : 'is 6/18/2024 17:32'
}
WBElement >> borderColor: aColor [
	
	self morph borderColor: aColor
]

{
	#category : #'morph functionalities',
	#'squeak_changestamp' : 'is 6/18/2024 17:32'
}
WBElement >> borderWidth: aWidth [

	self morph borderWidth: aWidth
]

{
	#category : #'morph functionalities',
	#'squeak_changestamp' : 'is 6/18/2024 22:47'
}
WBElement >> bottom [

	^ self morph bottom
]

{
	#category : #'morph functionalities',
	#'squeak_changestamp' : 'is 6/18/2024 18:00'
}
WBElement >> bounds [

	^ self morph bounds
]

{
	#category : #'morph functionalities',
	#'squeak_changestamp' : 'is 6/18/2024 18:00'
}
WBElement >> bounds: someBounds [

	self morph bounds: someBounds
]

{
	#category : #'button functionalities',
	#'squeak_changestamp' : 'si 7/10/2024 16:58'
}
WBElement >> buttonFunctionalityForBorderColor [

	^ [:aButton | self morph borderColor: aButton color]
]

{
	#category : #'button functionalities',
	#'squeak_changestamp' : 'si 7/10/2024 17:04'
}
WBElement >> buttonFunctionalityForBorderColorPalette [

	^ [:aButton | self popUp tryToMakePopUpAt: aButton topCenter - (0 @ (self class sizeOfPopUpForStandardElement / 2)) with: self makeBorderColorButtons columns: 3]
]

{
	#category : #'button functionalities',
	#'squeak_changestamp' : 'si 7/10/2024 17:00'
}
WBElement >> buttonFunctionalityForColor [

	^ [:aButton | self morph borderColor = self color ifTrue: [self morph borderColor: aButton color].
		self morph color: aButton color]
]

{
	#category : #'button functionalities',
	#'squeak_changestamp' : 'si 7/10/2024 17:04'
}
WBElement >> buttonFunctionalityForColorPalette [

	^ [:aButton | self popUp tryToMakePopUpAt: aButton topCenter - (0 @ (self class sizeOfPopUpForStandardElement / 2)) with: self makeColorButtons columns: 3]
]

{
	#category : #'button functionalities',
	#'squeak_changestamp' : 'si 7/10/2024 13:31'
}
WBElement >> buttonFunctionalityForCopy [

	^ [:aButton | self canvas deactivateElement. 
		self canvas spawnAnElement: self veryDeepCopy At: aButton currentMouseEvent]
]

{
	#category : #'button functionalities',
	#'squeak_changestamp' : 'is 6/23/2024 01:30'
}
WBElement >> buttonFunctionalityForDelete [

	^ [:aButton | self delete]
]

{
	#category : #'button functionalities',
	#'squeak_changestamp' : 'si 7/10/2024 17:01'
}
WBElement >> buttonFunctionalityForTransparentBorderColor [

	^ [:aButton | self morph borderColor: self color]
]

{
	#category : #'button functionalities',
	#'squeak_changestamp' : 'si 7/10/2024 17:01'
}
WBElement >> buttonFunctionalityForTransparentColor [

	^ [:aButton | self morph color: Color transparent]
]

{
	#category : #'button creation',
	#'squeak_changestamp' : 'si 7/10/2024 12:13'
}
WBElement >> buttonsForPopUpBar [

	^ OrderedCollection new
		add: (WBButton new
			block: self buttonFunctionalityForDelete;
			backgroundColor: Color red;
			image: (ImageMorph new image: (self canvas images resize: WBImage loadDenyButtonImage to: self imageSize)));
		add: (WBButton new
			block: self buttonFunctionalityForCopy;
			backgroundColor: Color white;
			image: (ImageMorph new image: (self canvas images resize: WBImage loadSmallDuplicateButtonImage to: self imageSize)));
		add: (WBButton new
			block: self buttonFunctionalityForColorPalette;
			backgroundColor: Color white;
			image: (ImageMorph new image: (self canvas images resize: WBImage loadSmallColorsButtonImage to: self imageSize)));
		add: (WBButton new
			block: self buttonFunctionalityForBorderColorPalette;
			backgroundColor: Color white;
			image: (ImageMorph new image: (self canvas images resize: WBImage loadSmallBordercolorButtonImage to: self imageSize)));
		yourself
	
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
	#category : #'morph functionalities',
	#'squeak_changestamp' : 'is 6/18/2024 18:12'
}
WBElement >> center [

	^ self morph center
]

{
	#category : #'morph functionalities',
	#'squeak_changestamp' : 'is 6/18/2024 17:32'
}
WBElement >> center: aPoint [

	self morph center: aPoint
]

{
	#category : #'morph functionalities',
	#'squeak_changestamp' : 'is 6/18/2024 17:46'
}
WBElement >> color [

	^ self morph color
]

{
	#category : #'morph functionalities',
	#'squeak_changestamp' : 'is 6/18/2024 17:32'
}
WBElement >> color: aColor [

	self morph color: aColor
]

{
	#category : #'morph functionalities',
	#'squeak_changestamp' : 'is 6/18/2024 18:55'
}
WBElement >> cornerRadius: aRadius [

	self morph cornerRadius: aRadius
]

{
	#category : #'morph functionalities',
	#'squeak_changestamp' : 'is 6/18/2024 18:55'
}
WBElement >> cornerStyle: aStyle [

	self morph cornerStyle: aStyle
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'si 6/21/2024 00:24'
}
WBElement >> deactivateElement [

	self removePopup.
	self removeResizeFrame
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'is 6/17/2024 01:00'
}
WBElement >> deactivateTextbox [

	self textField enabled: false
]

{
	#category : #'morph functionalities',
	#'squeak_changestamp' : 'is 6/23/2024 01:31'
}
WBElement >> delete [

	self morph delete.
	(self canvas elements includes: self) ifTrue: [self canvas elements remove: self]
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'si 7/10/2024 17:30'
}
WBElement >> detectDoubleClick: anEvent [
	| delta |
	
	self lastMouseClick ifNotNil: [delta := anEvent timeStamp - self lastMouseClick timeStamp].
	(delta isNumber and: [delta < self class doubleClickMaxDelta])
		ifTrue: [self activateTextbox: anEvent]
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
	#'squeak_changestamp' : 'ACL 7/10/2024 11:57'
}
WBElement >> dragMove: mouseEvent [
	| newPosition |

 	newPosition := self canvas clampedPositionOfElement: self morph at: mouseEvent cursorPoint + self dragOffset.
	self morph position: newPosition
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
	#'squeak_changestamp' : 'si 7/10/2024 17:08'
}
WBElement >> dragStart: anEvent [

	self morph
		addDropShadow;
		comeToFront.
	self dragOffset: self position - anEvent cursorPoint
]

{
	#category : #'morph functionalities',
	#'squeak_changestamp' : 'is 6/18/2024 18:04'
}
WBElement >> extent [

	^ self morph extent
]

{
	#category : #'morph functionalities',
	#'squeak_changestamp' : 'si 7/10/2024 14:31'
}
WBElement >> extent: anExtent [
	
	self morph extent: anExtent.
	textField ifNotNil: [textField extent: anExtent - self class defaultTextBorderOffset].
	self popUp ifNotNil: [self setPopupPosition]
	
	

]

{
	#category : #'morph functionalities',
	#'squeak_changestamp' : 'is 6/18/2024 18:55'
}
WBElement >> height: aHeight [

	self morph height: aHeight
]

{
	#category : #layout,
	#'squeak_changestamp' : 'si 7/10/2024 11:57'
}
WBElement >> imageSize [

	^ (self class sizeOfPopUpForStandardElement @ self class sizeOfPopUpForStandardElement) * 0.75
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'si 7/10/2024 17:14'
}
WBElement >> initialize [
	
	super initialize.
	self morph: 
		self initializeElement;
		extent: self class defaultSize;
		borderWidth: 3;
		color: self canvas globalColor.
	self setupEventHandling.
	self supportsText ifTrue: [self initializeTextfield]
	
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'is 6/18/2024 00:42'
}
WBElement >> initializeElement [

	^ self subclassResponsibility
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'si 7/10/2024 17:18'
}
WBElement >> initializeTextfield [

	self textField: WBPluggableTextMorphPlus new.
	self textField
		extent: self extent - (self class defaultTextBorderOffset @ self class defaultTextBorderOffset);
		element: self.
	self textField textMorph centered.
	self morph addMorphCentered: self textField
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'is 6/23/2024 01:32'
}
WBElement >> initializeWithCanvas: aCanvas [
	
	self canvas: aCanvas.
	self initialize
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
	#'squeak_changestamp' : 'is 6/23/2024 01:29'
}
WBElement >> lastMouseClick: anEvent [

	lastMouseClick := anEvent
]

{
	#category : #'morph functionalities',
	#'squeak_changestamp' : 'is 6/18/2024 22:47'
}
WBElement >> left [

	^ self morph left
]

{
	#category : #'button creation',
	#'squeak_changestamp' : 'ACL 6/23/2024 15:52'
}
WBElement >> makeBorderColorButtonWithColor: aColor [ 
	
	^ WBButton new 
		color: aColor;
		backgroundColor: aColor;
		clickedColor: aColor darker;
		block: self buttonFunctionalityForBorderColor;
		yourself
]

{
	#category : #'button creation',
	#'squeak_changestamp' : 'si 7/5/2024 11:44'
}
WBElement >> makeBorderColorButtons [

	^ OrderedCollection new
		add: (self makeBorderColorButtonWithColor: Color black);
		add: (self makeBorderColorButtonWithColor: Color gray);
		add: (self makeTransparentBorderColorButton);
		add: (self makeBorderColorButtonWithColor: Color red);
		add: (self makeBorderColorButtonWithColor: Color orange);
		add: (self makeBorderColorButtonWithColor: Color yellow);
		add: (self makeBorderColorButtonWithColor: Color green);
		add: (self makeBorderColorButtonWithColor: Color cyan);
		add: (self makeBorderColorButtonWithColor: Color blue);
		add: (self makeBorderColorButtonWithColor: Color ocean);
		add: (self makeBorderColorButtonWithColor: Color magenta);
		add: (self makeBorderColorButtonWithColor: Color magenta muchDarker);
		yourself
]

{
	#category : #'button creation',
	#'squeak_changestamp' : 'is 6/23/2024 01:33'
}
WBElement >> makeColorButtonWithColor: aColor [ 
	
	^ WBButton new 
		color: aColor;
		backgroundColor: aColor;
		clickedColor: aColor darker;
		block: self buttonFunctionalityForColor;
		yourself
]

{
	#category : #'button creation',
	#'squeak_changestamp' : 'si 7/5/2024 11:42'
}
WBElement >> makeColorButtons [

	^ OrderedCollection new
		add: (self makeColorButtonWithColor: Color black);
		add: (self makeColorButtonWithColor: Color gray);
		add: (self makeTransparentColorButton);
		add: (self makeColorButtonWithColor: Color red);
		add: (self makeColorButtonWithColor: Color orange);
		add: (self makeColorButtonWithColor: Color yellow);
		add: (self makeColorButtonWithColor: Color green);
		add: (self makeColorButtonWithColor: Color cyan);
		add: (self makeColorButtonWithColor: Color blue);
		add: (self makeColorButtonWithColor: Color ocean);
		add: (self makeColorButtonWithColor: Color magenta);
		add: (self makeColorButtonWithColor: Color magenta muchDarker);
		yourself
]

{
	#category : #popUp,
	#'squeak_changestamp' : 'JK 6/25/2024 15:33'
}
WBElement >> makePopUpAt: aPoint with: aCollection columns: aNumber [

	self makePopWith: aCollection columns: aNumber.
	self popUp center: aPoint - (self popUp bottomCenter - self popUp center)
	
	
]

{
	#category : #popUp,
	#'squeak_changestamp' : 'si 7/10/2024 17:30'
}
WBElement >> makePopWith: aCollection columns: aNumber [

	self popUp: 
		(WBPopUp new
			setDefaultValues;
			sizeOfPopUp: self class sizeOfPopUpForStandardElement;
			numberOfColumns: aNumber;
			addButtons: aCollection;
			yourself).
	self morph addMorph: self popUp
	
]

{
	#category : #'button creation',
	#'squeak_changestamp' : 'si 7/5/2024 11:18'
}
WBElement >> makeTransparentBorderColorButton [
	
	^ WBButton new 
		color: Color white;
		backgroundColor: Color white;
		clickedColor: Color white muchDarker;
		block: self buttonFunctionalityForTransparentBorderColor;
		yourself
]

{
	#category : #'button creation',
	#'squeak_changestamp' : 'si 7/5/2024 11:18'
}
WBElement >> makeTransparentColorButton [
	
	^ WBButton new 
		color: Color white;
		backgroundColor: Color white;
		clickedColor: Color white muchDarker;
		block: self buttonFunctionalityForTransparentColor;
		yourself
]

{
	#category : #private,
	#'squeak_changestamp' : 'is 6/18/2024 17:32'
}
WBElement >> morph [

	^ morph
]

{
	#category : #private,
	#'squeak_changestamp' : 'is 6/18/2024 17:32'
}
WBElement >> morph: aMorph [

	morph := aMorph
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'is 6/23/2024 01:34'
}
WBElement >> mouseDown: anEvent [
	
	anEvent redButtonPressed ifTrue: 
		[(self canvas elementToSpawn) isNil 
			ifTrue:
				[self canvas 
					deactivateElement;
					deactivateTextbox.
				self dragStart: anEvent;
					addResizeFrame;
					showPopUp.
				self canvas activeElement: self]
			ifFalse:
				[self canvas dropElement: anEvent].
		self 
			detectDoubleClick: anEvent;
			lastMouseClick: anEvent]
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'is 6/23/2024 01:34'
}
WBElement >> mouseMove: anEvent [

	anEvent redButtonPressed ifTrue: [self dragMove: anEvent]
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'is 6/23/2024 01:34'
}
WBElement >> mouseUp: anEvent [

	self dragEnd: anEvent
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
	#'squeak_changestamp' : 'is 6/18/2024 17:32'
}
WBElement >> popUp: aPopUp [

	popUp := aPopUp.
	popUp ifNotNil: [self morph addMorphBack: popUp]
]

{
	#category : #'morph functionalities',
	#'squeak_changestamp' : 'is 6/18/2024 17:32'
}
WBElement >> position [

	^ self morph position
]

{
	#category : #'morph functionalities',
	#'squeak_changestamp' : 'is 6/18/2024 17:32'
}
WBElement >> position: aPosition [

	self morph position:  aPosition
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'si 7/10/2024 17:30'
}
WBElement >> postDropRoutine: anEvent [

	self supportsText ifTrue: [self activateTextbox: anEvent]
]

{
	#category : #'morph functionalities',
	#'squeak_changestamp' : 'is 6/18/2024 17:35'
}
WBElement >> removeDropShadow [

	self morph removeDropShadow
]

{
	#category : #popUp,
	#'squeak_changestamp' : 'is 6/18/2024 00:24'
}
WBElement >> removePopup [

	self popUp ifNotNil: [self popUp delete]
]

{
	#category : #resize,
	#'squeak_changestamp' : 'is 6/23/2024 01:34'
}
WBElement >> removeResizeFrame [

	self resizeFrame ifNotNil: [self resizeFrame delete]
	

]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'is 6/23/2024 01:37'
}
WBElement >> resetTextfield [

	self canvas deactivateTextbox.
	self textField delete.
	self textField: nil
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JK 6/30/2024 15:47'
}
WBElement >> resizable [

	^ resizable ifNil: [resizable := true]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JK 6/30/2024 15:46'
}
WBElement >> resizable: anObject [

	resizable := anObject
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
	#'squeak_changestamp' : 'is 6/18/2024 00:24'
}
WBElement >> resizeFrame: aFrame [

	resizeFrame := aFrame
]

{
	#category : #'morph functionalities',
	#'squeak_changestamp' : 'is 6/18/2024 22:47'
}
WBElement >> right [

	^ self morph right
]

{
	#category : #popUp,
	#'squeak_changestamp' : 'nicloeser 7/10/2024 11:22'
}
WBElement >> setPopupPosition [

	self popUp center: self topCenter - (0 @ 10) - (0 @ (self popUp height/2))
	
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'si 7/7/2024 17:51'
}
WBElement >> setupEventHandling [
"pass event triggers from the element itself to the methods of the WBElement"
	
	self morph on: #mouseDown send: #mouseDown: to: self.
	self morph on: #mouseUp send: #mouseUp: to: self.
	self morph on: #mouseMove send: #mouseMove: to: self.
]

{
	#category : #popUp,
	#'squeak_changestamp' : 'JK 6/25/2024 15:53'
}
WBElement >> showPopUp [

	self canvas elementToSpawn ifNil:
		[self canvas deactivateElement.
		self makePopWith: self buttonsForPopUpBar columns: nil.
		self setPopupPosition] 
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'is 6/23/2024 01:35'
}
WBElement >> supportsText [

	^ supportsText ifNil: [supportsText := true]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'is 6/23/2024 01:37'
}
WBElement >> supportsText: aBoolean [

	supportsText := aBoolean.
	aBoolean 
		ifTrue: [self textField ifNil: [self initializeTextfield]] 
		ifFalse: [self textField ifNotNil: [self resetTextfield]]
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

{
	#category : #'morph functionalities',
	#'squeak_changestamp' : 'is 6/18/2024 22:47'
}
WBElement >> top [

	^ self morph top
]

{
	#category : #'morph functionalities',
	#'squeak_changestamp' : 'JK 6/25/2024 15:39'
}
WBElement >> topCenter [

	^ self morph topCenter
]

{
	#category : #'morph functionalities',
	#'squeak_changestamp' : 'is 6/18/2024 18:55'
}
WBElement >> width: aWidth [

	self morph width: aWidth
]

{
	#category : #'morph functionalities',
	#'squeak_changestamp' : 'is 6/18/2024 18:56'
}
WBElement >> x [

	^ self morph x
]

{
	#category : #'morph functionalities',
	#'squeak_changestamp' : 'is 6/18/2024 18:56'
}
WBElement >> y [

	^ self morph y
]
