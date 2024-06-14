Class {
	#name : #WBHandler,
	#superclass : #Object,
	#instVars : [
		'element'
	],
	#category : #'SqueakWhiteboard-Core'
}

{
	#category : #'button functionalities',
	#'squeak_changestamp' : 'si 6/14/2024 14:47'
}
WBHandler >> buttonFunctionallityForColor [

	^ [:aButton | self element color: aButton color]
]

{
	#category : #'button functionalities',
	#'squeak_changestamp' : 'si 6/14/2024 14:49'
}
WBHandler >> buttonFunctionallityForColorPalette [

	^ [:aButton | self element popUp makePopUpAt: aButton topCenter - (0 @ (self element class sizeOfPopUpForStandardElement / 2)) with: self makeColorButtons columns: 3]
]

{
	#category : #'button functionalities',
	#'squeak_changestamp' : 'si 6/14/2024 14:48'
}
WBHandler >> buttonFunctionallityForCopy [

	^ [:aButton | self element canvas deactivateElement. 
		self element canvas spawnACopiedElement: self element copy At: aButton currentEvent cursorPoint.]
]

{
	#category : #'button functionalities',
	#'squeak_changestamp' : 'si 6/14/2024 14:48'
}
WBHandler >> buttonFunctionallityForDelete [

	^ [:aButton |self element delete]
]

{
	#category : #'create buttons',
	#'squeak_changestamp' : 'si 6/14/2024 14:39'
}
WBHandler >> buttonsForPopUpBar [

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
	#category : #accessing,
	#'squeak_changestamp' : 'si 6/14/2024 14:27'
}
WBHandler >> element [

	^ element
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'si 6/14/2024 14:27'
}
WBHandler >> element: anObject [

	element := anObject
]

{
	#category : #'create buttons',
	#'squeak_changestamp' : 'si 6/14/2024 14:39'
}
WBHandler >> makeColorButtonWithColor: aColor [ 
	
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
WBHandler >> makeColorButtons [

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
WBHandler >> makePopUpAt: aPoint with: aCollection columns: aNumber [

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
WBHandler >> removePopup [

	self element popUp ifNotNil: 
		[self element popUp delete]
]

{
	#category : #popUp,
	#'squeak_changestamp' : 'si 6/14/2024 14:31'
}
WBHandler >> setPopupPosition [

	^ self element topCenter - (0 @ (self element class sizeOfPopUpForStandardElement / 2))
]

{
	#category : #popUp,
	#'squeak_changestamp' : 'si 6/14/2024 14:46'
}
WBHandler >> showPopUp [

	(self element canvas elementToSpawn) ifNil:
		[self element canvas deactivateElement.
		self makePopUpAt: self setPopupPosition with: self buttonsForPopUpBar columns: nil.] 
]
