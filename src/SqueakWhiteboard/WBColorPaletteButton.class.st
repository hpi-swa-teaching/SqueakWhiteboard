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
	#'squeak_changestamp' : 'is 5/19/2024 18:04'
}
WBColorPaletteButton class >> newWithDefaultValues [

	WBDeleteButton basicNew initializeWithDefaultValues
]

{
	#category : #clicking,
	#'squeak_changestamp' : 'si 5/23/2024 23:46'
}
WBColorPaletteButton >> clickFunctionality: anEvent [

	self makeColorPalette
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'ACL 5/23/2024 15:44'
}
WBColorPaletteButton >> initializeWithDefaultValues [

	super initialize.
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'ACL 5/23/2024 16:29'
}
WBColorPaletteButton >> makeColorButtonAt: aPosition Color: aColor [ 
	
	self addMorph: 
	(WBColorButton new
		setDefaultValues;
		position: aPosition;
		backgroundColor: aColor;
		clickedColor: aColor darker;
		yourself).
]

{
	#category : #createButtons,
	#'squeak_changestamp' : 'si 5/23/2024 23:43'
}
WBColorPaletteButton >> makeColorButtons [

	^OrderedCollection new
		add: (WBColorButton new
			color: Color yellow;
			backgroundColor: Color yellow;
			clickedColor: Color yellow);
		add: (WBColorButton new
			color: Color orange;
			backgroundColor: Color orange;
			clickedColor: Color orange);
		add: (WBColorButton new
			color: Color red;
			backgroundColor: Color red;
			clickedColor: Color red);
		add: (WBColorButton new
			color: Color magenta;
			backgroundColor: Color magenta;
			clickedColor: Color magenta);
		add: (WBColorButton new
			color: Color blue;
			backgroundColor: Color blue;
			clickedColor: Color blue);
		add: (WBColorButton new
			color: Color cyan;
			backgroundColor: Color cyan;
			clickedColor: Color cyan);
		add: (WBColorButton new
			color: Color green;
			backgroundColor: Color green;
			clickedColor: Color green);
		add: (WBColorButton new
			color: Color gray;
			backgroundColor: Color gray;
			clickedColor: Color gray);
		add: (WBColorButton new
			color: Color black;
			backgroundColor: Color black;
			clickedColor: Color black);
		yourself.
]

{
	#category : #createButtons,
	#'squeak_changestamp' : 'si 5/23/2024 23:46'
}
WBColorPaletteButton >> makeColorPalette [
	
	| colorPalette |
	
	colorPalette := WBElementPopUp new.
	self addMorph: colorPalette.
	colorPalette 
		setDefaultValues;
		position: self bottomCenter;
		comeToFront;
		addButtons: self makeColorButtons
		yourself.
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'si 5/23/2024 21:28'
}
WBColorPaletteButton >> setDefaultValues [

	super setDefaultValues.
	self
		backgroundColor: Color black;
		clickedColor: Color gray darker.
]
