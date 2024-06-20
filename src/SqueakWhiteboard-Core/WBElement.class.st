"
The WBElement is an object that can be created within the canvas
"
Class {
	#name : #WBElement,
	#superclass : #Object,
	#instVars : [
		'dragOffset',
		'canvas',
		'popUp',
		'resizeFrame',
		'textBorderOffset',
		'textField',
		'lastMouseClick',
		'doubleClickMaxDelta',
		'supportsText',
		'morph'
	],
	#classInstVars : [
		'globalColor'
	],
	#category : #'SqueakWhiteboard-Core',
	#'squeak_changestamp' : 'is 5/17/2024 15:58'
}

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'is 6/18/2024 22:28'
}
WBElement class >> defaultSize [

	^ 100@100
]

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'si 6/20/2024 23:14'
}
WBElement class >> newWithCanvas: aCanvas [

	^ self basicNew 
		canvas: aCanvas;
		initialize
]

{
	#category : #popUp,
	#'squeak_changestamp' : 'is 6/18/2024 00:25'
}
WBElement class >> sizeOfPopUpForStandardElement [

	^ 20
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'si 6/17/2024 13:39'
}
WBElement >> activateTextbox: evt [
	
	self canvas deactivateTextbox.
	self canvas deactivateElement.
	self textField enabled: true;
		mouseDown: evt.
	self canvas activeTextbox: self
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
	#'squeak_changestamp' : 'is 6/18/2024 17:59'
}
WBElement >> addResizeFrame [

	self resizeFrame: (WBResizeFrame newWithParent: self).
	
	

	
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
	#'squeak_changestamp' : 'is 6/18/2024 17:32'
}
WBElement >> buttonFunctionalityForColor [

	^ [:aButton |self morph color: aButton color]
]

{
	#category : #'button functionalities',
	#'squeak_changestamp' : 'si 6/17/2024 11:29'
}
WBElement >> buttonFunctionalityForColorPalette [

	^ [:aButton | self popUp makePopUpAt: aButton topCenter - (0 @ (self class sizeOfPopUpForStandardElement / 2)) with: self makeColorButtons columns: 3]
]

{
	#category : #'button functionalities',
	#'squeak_changestamp' : 'is 6/18/2024 19:57'
}
WBElement >> buttonFunctionalityForCopy [

	^ [:aButton | self canvas deactivateElement. 
		self canvas spawnACopiedElement: self veryDeepCopy At: aButton currentEvent cursorPoint.]
]

{
	#category : #'button functionalities',
	#'squeak_changestamp' : 'is 6/18/2024 19:52'
}
WBElement >> buttonFunctionalityForDelete [

	^ [:aButton | self delete ]
]

{
	#category : #'button creation',
	#'squeak_changestamp' : 'is 6/18/2024 00:14'
}
WBElement >> buttonsForPopUpBar [

	^ OrderedCollection new
		add: (WBButton new
			block: self buttonFunctionalityForDelete;
			backgroundColor: Color red);
		add: (WBButton new
			block: self buttonFunctionalityForCopy;
			backgroundColor: Color lightBlue muchDarker);
		add: (WBButton new
			block: self buttonFunctionalityForColorPalette;
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
	#'squeak_changestamp' : 'is 6/18/2024 00:15'
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
	#'squeak_changestamp' : 'is 6/18/2024 21:41'
}
WBElement >> delete [

	self morph delete.
	(self canvas elements includes: self) ifTrue: [self canvas elements remove: self].
	"self delete"
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
	#'squeak_changestamp' : 'is 6/18/2024 17:32'
}
WBElement >> dragMove: mouseEvent [
	|newPosition |

 	newPosition := self canvas clampElementToCanvas: self morph at: mouseEvent cursorPoint + self dragOffset.
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
	#'squeak_changestamp' : 'is 6/18/2024 17:32'
}
WBElement >> dragStart: anEvent [

	(self morph)
		addDropShadow;
		comeToFront.
	self dragOffset: self position - anEvent cursorPoint.
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
	#'squeak_changestamp' : 'is 6/18/2024 17:32'
}
WBElement >> extent: anExtent [
	
	self morph extent: anExtent.
	textField ifNotNil: [textField extent: anExtent - self textBorderOffset].
	self setPopupPosition
	
	

]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'is 6/18/2024 00:06'
}
WBElement >> handlesMouseDown: anEvent [

	supportsText ifTrue: [ ^ (self textField enabled) not ] ifFalse: [ ^true ]
	
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'is 6/18/2024 00:07'
}
WBElement >> handlesMouseOver: anEvent [

	^ true
]

{
	#category : #'morph functionalities',
	#'squeak_changestamp' : 'is 6/18/2024 18:55'
}
WBElement >> height: aHeight [

	self morph height: aHeight
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'is 6/18/2024 22:42'
}
WBElement >> initialize [
	
	super initialize.
	self morph: self initializeElement;
		extent: self class defaultSize.
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
	#'squeak_changestamp' : 'is 6/18/2024 22:24'
}
WBElement >> initializeTextfield [
	| textfield |

	textfield := WBPluggableTextMorphPlus new.
	textfield extent: self extent - (self textBorderOffset @ self textBorderOffset);
		element: self.
	textfield textMorph centered.
	self morph addMorphCentered: textfield.
	self textField: textfield
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
	#category : #'morph functionalities',
	#'squeak_changestamp' : 'is 6/18/2024 22:47'
}
WBElement >> left [

	^ self morph left
]

{
	#category : #'button creation',
	#'squeak_changestamp' : 'is 6/18/2024 00:17'
}
WBElement >> makeColorButtonWithColor: aColor [ 
	
	^ (WBButton new
		color: aColor;
		backgroundColor: aColor;
		clickedColor: aColor darker;
		block: self buttonFunctionalityForColor;
		yourself)
]

{
	#category : #'button creation',
	#'squeak_changestamp' : 'is 6/18/2024 00:18'
}
WBElement >> makeColorButtons [

	^ OrderedCollection new
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
	#'squeak_changestamp' : 'is 6/18/2024 17:38'
}
WBElement >> makePopUpAt: aPoint with: aCollection columns: aNumber [

	self popUp: (WBPopUp new
		setDefaultValues;
		sizeOfPopUp: self class sizeOfPopUpForStandardElement;
		numberOfColumns: aNumber;
		addButtons: aCollection;
		yourself).
	self morph addMorph: self popUp.
	self popUp center: aPoint - (self popUp bottomCenter - self popUp center)
	
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'is 6/18/2024 17:32'
}
WBElement >> morph [

	^ morph
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'is 6/18/2024 17:32'
}
WBElement >> morph: aMorph [

	morph := aMorph
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'is 6/18/2024 15:44'
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
	#'squeak_changestamp' : 'is 6/18/2024 17:32'
}
WBElement >> setPopupPosition [

	^ self morph topCenter - (0 @ (self class sizeOfPopUpForStandardElement / 2))
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'is 6/18/2024 21:10'
}
WBElement >> setupEventHandling [
"pass event triggers from the element itself to the methods of the WBElement"
	
	self morph on: #mouseDown send: #mouseDown: to: self.
	self morph on: #mouseUp send: #mouseUp: to: self.
	self morph on: #mouseMove send: #mouseMove: to: self
]

{
	#category : #popUp,
	#'squeak_changestamp' : 'is 6/18/2024 00:24'
}
WBElement >> showPopUp [

	(self canvas elementToSpawn) ifNil:
		[self canvas deactivateElement.
		self makePopUpAt: self setPopupPosition with: self buttonsForPopUpBar columns: nil] 
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
	#'squeak_changestamp' : 'is 6/18/2024 23:17'
}
WBElement >> supportsText: aBoolean [

	supportsText := aBoolean.
	aBoolean 
		ifTrue: [self textField ifNil: [self initializeTextfield]] 
		ifFalse: [self textField ifNotNil: 
			[self canvas deactivateTextbox.
			self textField delete.
			self textField: nil]]
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

{
	#category : #'morph functionalities',
	#'squeak_changestamp' : 'is 6/18/2024 22:47'
}
WBElement >> top [

	^ self morph top
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
