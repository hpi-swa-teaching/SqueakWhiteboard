"
The WBDeleteButton is a button that deletes the element that it is attached to
"
Class {
	#name : #WBColorPaletteButton,
	#superclass : #WBPopUpButton,
	#category : #SqueakWhiteboard,
	#'squeak_changestamp' : '<historical>'
}

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'ACL 5/24/2024 11:31'
}
WBColorPaletteButton class >> newWithDefaultValues [

	WBDeleteButton basicNew initializeWithDefaultValues
]

{
	#category : #clicking,
	#'squeak_changestamp' : 'ACL 5/24/2024 11:48'
}
WBColorPaletteButton >> clickFunctionality: anEvent [

	self makeColorPalette.
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'ACL 5/24/2024 11:32'
}
WBColorPaletteButton >> initializeWithDefaultValues [

	super initialize.
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'ACL 5/24/2024 15:59'
}
WBColorPaletteButton >> makeColorButtonWithColor: aColor [ 
	
	^(WBColorButton new
		color: aColor;
		canvas: self canvas;
		backgroundColor: aColor;
		clickedColor: aColor darker;
		yourself)
]

{
	#category : #createButtons,
	#'squeak_changestamp' : 'ACL 5/24/2024 11:22'
}
WBColorPaletteButton >> makeColorButtons [

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
	#category : #createButtons,
	#'squeak_changestamp' : 'si 5/27/2024 22:25'
}
WBColorPaletteButton >> makeColorPalette [
	
	self addMorph:
		(WBElementPopUp new
			numberOfColumns: 3;
			setDefaultValues;
			position: self bottomCenter;
			comeToFront;
			addButtons: self makeColorButtons;
			yourself).
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'ACL 5/24/2024 13:49'
}
WBColorPaletteButton >> removeElementPopUp [

	self submorphs do: [:m | m delete].
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'ACL 5/24/2024 11:48'
}
WBColorPaletteButton >> setDefaultValues [

	super setDefaultValues.
	self backgroundColor: Color black;
		clickedColor: Color black.
]
