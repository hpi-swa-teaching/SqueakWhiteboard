"
The WBDeleteButton is a button that deletes the element that it is attached to
"
Class {
	#name : #WBColorButton,
	#superclass : #WBButton,
	#category : #SqueakWhiteboard,
	#'squeak_changestamp' : '<historical>'
}

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'is 5/19/2024 18:04'
}
WBColorButton class >> newWithDefaultValues [

	WBDeleteButton basicNew initializeWithDefaultValues
]

{
	#category : #clicking,
	#'squeak_changestamp' : 'ACL 5/22/2024 23:08'
}
WBColorButton >> clickFunctionality: anEvent [

	self makeColorPalette.
	
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'ACL 5/22/2024 16:55'
}
WBColorButton >> initializeWithDefaultValues [

	super initialize.
	self setDefaultValues.
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'ACL 5/22/2024 23:08'
}
WBColorButton >> makeColorPalette [
	| colorPalette |
	
	colorPalette := WBColorPalette new.
	self addMorph: 
	(WBColorPalette new
		setDefaultValues;
		position: self topCenter;
		yourself).
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'ACL 5/22/2024 23:13'
}
WBColorButton >> setDefaultValues [

	self backgroundColor: Color black;
		clickedColor: Color gray darker;
		extent: 15@15;
		cornerStyle: #rounded;
		cornerRadius: 20
]
