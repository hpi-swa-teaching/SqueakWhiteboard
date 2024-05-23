"
The WBDeleteButton is a button that deletes the element that it is attached to
"
Class {
	#name : #WBColorPaletteButton,
	#superclass : #WBButton,
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
	#'squeak_changestamp' : 'ACL 5/22/2024 23:08'
}
WBColorPaletteButton >> clickFunctionality: anEvent [

	self makeColorPalette.
	
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'ACL 5/23/2024 17:00'
}
WBColorPaletteButton >> getOwner [
	
	^self owner.
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
	#category : #initialization,
	#'squeak_changestamp' : 'ACL 5/23/2024 16:25'
}
WBColorPaletteButton >> makeColorPalette [
	| colorPalette |
	
	colorPalette := WBColorPalette new.
	self addMorph: colorPalette.
	colorPalette 
		setDefaultValues;
		position: self bottomCenter;
		comeToFront;
		yourself.
	self
		makeColorButtonAt: colorPalette topLeft + (3@3) Color: Color yellow;
		makeColorButtonAt: colorPalette topLeft + (23@3) Color: Color orange;
		makeColorButtonAt: colorPalette topLeft + (43@3) Color: Color red;
		makeColorButtonAt: colorPalette topLeft + (3@23) Color: Color magenta;
		makeColorButtonAt: colorPalette topLeft + (23@23) Color: Color blue;
		makeColorButtonAt: colorPalette topLeft + (43@23) Color: Color cyan;
		makeColorButtonAt: colorPalette topLeft + (3@43) Color: Color green;
		makeColorButtonAt: colorPalette topLeft + (23@43) Color: Color gray;
		makeColorButtonAt: colorPalette topLeft + (43@43) Color: Color black.
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'ACL 5/23/2024 16:10'
}
WBColorPaletteButton >> setDefaultValues [

	self
		backgroundColor: Color black;
		clickedColor: Color gray darker;
		extent: 15@15;
		cornerStyle: #rounded;
		cornerRadius: 20.
]
