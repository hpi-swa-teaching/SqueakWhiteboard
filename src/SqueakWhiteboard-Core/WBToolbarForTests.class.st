Class {
	#name : #WBToolbarForTests,
	#superclass : #WBToolbar,
	#category : #'SqueakWhiteboard-Core'
}

{
	#category : #forTests,
	#'squeak_changestamp' : 'si 6/7/2024 00:20'
}
WBToolbarForTests class >> newWithCanvas: aCanvas [

	^ WBToolbarForTests basicNew initializeWithCanvas: aCanvas
]

{
	#category : #forTests,
	#'squeak_changestamp' : 'si 6/7/2024 00:19'
}
WBToolbarForTests >> getCircleButton [

	^WBToolbarButton new
			number: 2;
			yourself.
]

{
	#category : #forTests,
	#'squeak_changestamp' : 'si 6/7/2024 00:20'
}
WBToolbarForTests >> getColorsButton [

	^WBColorPaletteButton new
]

{
	#category : #forTests,
	#'squeak_changestamp' : 'si 6/7/2024 00:19'
}
WBToolbarForTests >> getLineButton [

	^WBToolbarButton new
			number: 3;
			yourself.
]

{
	#category : #forTests,
	#'squeak_changestamp' : 'si 6/7/2024 00:19'
}
WBToolbarForTests >> getNoteButton [

	^WBToolbarButton new
			number: 5;
			yourself.
]

{
	#category : #forTests,
	#'squeak_changestamp' : 'si 6/7/2024 00:20'
}
WBToolbarForTests >> getRectangleButton [

	^WBToolbarButton new
			number: 1;
			yourself.
]

{
	#category : #forTests,
	#'squeak_changestamp' : 'si 6/7/2024 00:19'
}
WBToolbarForTests >> getTextboxButton [

	^WBToolbarButton new
			number: 4;
			yourself.
]

{
	#category : #forTests,
	#'squeak_changestamp' : 'si 6/7/2024 00:19'
}
WBToolbarForTests >> initializeButtonImage: someButtons [
]

{
	#category : #forTests,
	#'squeak_changestamp' : 'si 6/7/2024 00:23'
}
WBToolbarForTests >> placeButtons: someButtons [
	
	someButtons doWithIndex: [:aButton :anIndex| 
		aButton margin:  WBToolbar margin;
			canvas: self canvas;
			extent: self buttonSize;
			center: (self bounds origin x + self toolbarWidth/2)@(self bounds origin y + ((self buttonSize y + WBToolbar margin) * anIndex) ) - (0@self buttonSize y/2);
			backgroundColor: Color lightBlue;
			clickedColor: Color blue.
		self addMorph: aButton].
	self buttons: someButtons.
]
