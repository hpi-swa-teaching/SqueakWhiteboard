Class {
	#name : #WBToolbarForTests,
	#superclass : #WBToolbar,
	#category : #'SqueakWhiteboard-Core'
}

{
	#category : #initializeForTests,
	#'squeak_changestamp' : 'si 6/6/2024 13:56'
}
WBToolbarForTests class >> newWithCanvas: aCanvas [

	^ WBToolbarForTests basicNew initializeWithCanvas: aCanvas
]

{
	#category : #getButtonForTests,
	#'squeak_changestamp' : 'si 6/6/2024 13:41'
}
WBToolbarForTests >> getCircleButton [

	^WBToolbarButton new
			number: 2;
			yourself.
]

{
	#category : #getButtonForTests,
	#'squeak_changestamp' : 'si 6/6/2024 13:42'
}
WBToolbarForTests >> getColorsButton [

	^WBColorPaletteButton new
]

{
	#category : #getButtonForTests,
	#'squeak_changestamp' : 'si 6/6/2024 13:41'
}
WBToolbarForTests >> getLineButton [

	^WBToolbarButton new
			number: 3;
			yourself.
]

{
	#category : #getButtonForTests,
	#'squeak_changestamp' : 'si 6/6/2024 13:43'
}
WBToolbarForTests >> getNoteButton [

	^WBToolbarButton new
			number: 5;
			yourself.
]

{
	#category : #getButtonForTests,
	#'squeak_changestamp' : 'si 6/6/2024 13:41'
}
WBToolbarForTests >> getRectangleButton [

	^WBToolbarButton new
			number: 1;
			yourself.
]

{
	#category : #getButtonForTests,
	#'squeak_changestamp' : 'si 6/6/2024 13:43'
}
WBToolbarForTests >> getTextboxButton [

	^WBToolbarButton new
			number: 4;
			yourself.
]

{
	#category : #forTests,
	#'squeak_changestamp' : 'si 6/6/2024 14:04'
}
WBToolbarForTests >> initializeButtonImage: someButtons [
]
