Class {
	#name : #WBElementHandler,
	#superclass : #Object,
	#instVars : [
		'element'
	],
	#category : #'SqueakWhiteboard-Core'
}

{
	#category : #text,
	#'squeak_changestamp' : 'is 6/14/2024 17:56'
}
WBElementHandler >> activateTextbox: evt [
	
	self element canvas deactivateTextbox.
	self element textField enabled: true;
		mouseDown: evt.
	self element deactivateElement.
	self element canvas activeTextbox: self
]

{
	#category : #text,
	#'squeak_changestamp' : 'is 6/14/2024 18:18'
}
WBElementHandler >> addTextfieldWithSize: anExtent [
	| textField |
	
	textField := WBPluggableTextMorphPlus new.
	textField extent: anExtent - ((self element textBorderOffset * 2) @ (self element textBorderOffset * 2)).
	textField textMorph centered. 
	self element addMorphCentered: textField.
	self element textField: textField
]

{
	#category : #'button functionalities',
	#'squeak_changestamp' : 'si 6/14/2024 14:47'
}
WBElementHandler >> buttonFunctionallityForColor [

	^ [:aButton | self element color: aButton color]
]

{
	#category : #'button functionalities',
	#'squeak_changestamp' : 'si 6/14/2024 14:49'
}
WBElementHandler >> buttonFunctionallityForColorPalette [

	^ [:aButton | self element popUp makePopUpAt: aButton topCenter - (0 @ (self element class sizeOfPopUpForStandardElement / 2)) with: self makeColorButtons columns: 3]
]

{
	#category : #'button functionalities',
	#'squeak_changestamp' : 'si 6/14/2024 14:48'
}
WBElementHandler >> buttonFunctionallityForCopy [

	^ [:aButton | self element canvas deactivateElement. 
		self element canvas spawnACopiedElement: self element copy At: aButton currentEvent cursorPoint.]
]

{
	#category : #'button functionalities',
	#'squeak_changestamp' : 'si 6/14/2024 14:48'
}
WBElementHandler >> buttonFunctionallityForDelete [

	^ [:aButton |self element delete]
]

{
	#category : #'create buttons',
	#'squeak_changestamp' : 'si 6/14/2024 14:39'
}
WBElementHandler >> buttonsForPopUpBar [

	^ OrderedCollection new
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
	#category : #text,
	#'squeak_changestamp' : 'is 6/14/2024 17:24'
}
WBElementHandler >> deactivateTextbox [

	self element currentHand releaseKeyboardFocus.
	self element textField enabled: false
]

{
	#category : #text,
	#'squeak_changestamp' : 'is 6/14/2024 18:24'
}
WBElementHandler >> detectDoubleClick: evt [
	| delta |
	
	self element supportsText ifFalse: [^ false].
	self element lastMouseClick ifNotNil: [delta := evt timeStamp - self element lastMouseClick timeStamp].
	(delta isNumber and: [delta < self element doubleClickMaxDelta])
		ifTrue: [ self activateTextbox: evt ]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'is 6/14/2024 15:44'
}
WBElementHandler >> element [

	^ element
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'si 6/14/2024 14:27'
}
WBElementHandler >> element: anObject [

	element := anObject
]

{
	#category : #'create buttons',
	#'squeak_changestamp' : 'si 6/14/2024 14:39'
}
WBElementHandler >> makeColorButtonWithColor: aColor [ 
	
	^ (WBButton new
		color: aColor;
		backgroundColor: aColor;
		clickedColor: aColor darker;
		block: self buttonFunctionallityForColor;
		yourself)
]

{
	#category : #'create buttons',
	#'squeak_changestamp' : 'si 6/14/2024 14:39'
}
WBElementHandler >> makeColorButtons [

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
	#'squeak_changestamp' : 'si 6/14/2024 14:30'
}
WBElementHandler >> makePopUpAt: aPoint with: aCollection columns: aNumber [

	self element popUp: (WBPopUp new
		setDefaultValues;
		sizeOfPopUp: self element class sizeOfPopUpForStandardElement;
		numberOfColumns: aNumber;
		addButtons: aCollection;
		yourself).
	self element addMorph: self element popUp.
	self element popUp center: aPoint - (self element popUp bottomCenter - self element popUp center)
]

{
	#category : #popUp,
	#'squeak_changestamp' : 'si 6/14/2024 14:31'
}
WBElementHandler >> removePopup [

	self element popUp ifNotNil: 
		[self element popUp delete]
]

{
	#category : #popUp,
	#'squeak_changestamp' : 'si 6/14/2024 14:31'
}
WBElementHandler >> setPopupPosition [

	^ self element topCenter - (0 @ (self element class sizeOfPopUpForStandardElement / 2))
]

{
	#category : #popUp,
	#'squeak_changestamp' : 'si 6/14/2024 14:46'
}
WBElementHandler >> showPopUp [

	(self element canvas elementToSpawn) ifNil:
		[self element canvas deactivateElement.
		self makePopUpAt: self setPopupPosition with: self buttonsForPopUpBar columns: nil.] 
]
