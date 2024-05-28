Class {
	#name : #WBMenuBar,
	#superclass : #Morph,
	#instVars : [
		'dragOffset',
		'canvas',
		'menuBarHeight',
		'menuBarWidth',
		'backgroundColor'
	],
	#category : #SqueakWhiteboard
}

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'is 5/28/2024 10:30'
}
WBMenuBar class >> newWithCanvas: aCanvas [

	^ WBMenuBar basicNew initializeWithCanvas: aCanvas
]

{
	#category : #layout,
	#'squeak_changestamp' : 'is 5/28/2024 15:51'
}
WBMenuBar >> backgroundColor [

	^ backgroundColor ifNil: [backgroundColor := Color gray]
]

{
	#category : #layout,
	#'squeak_changestamp' : 'is 5/28/2024 15:48'
}
WBMenuBar >> backgroundColor: aColor [

	backgroundColor := aColor
	self updateColor
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'is 5/28/2024 15:26'
}
WBMenuBar >> canvas [ 

	^ canvas
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'is 5/28/2024 15:25'
}
WBMenuBar >> canvas: aCanvas [

	canvas := aCanvas
]

{
	#category : #moving,
	#'squeak_changestamp' : 'is 5/28/2024 18:42'
}
WBMenuBar >> dragMove: mouseEvent [
	| newPosition |

 	newPosition := mouseEvent cursorPoint + self dragOffset + (0@self menuBarHeight).
	self canvas position: newPosition
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'is 5/28/2024 15:25'
}
WBMenuBar >> dragOffset [

	^ dragOffset
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'is 5/28/2024 16:26'
}
WBMenuBar >> dragOffset: aPoint [

	dragOffset := aPoint
]

{
	#category : #moving,
	#'squeak_changestamp' : 'is 5/28/2024 16:06'
}
WBMenuBar >> dragStart: anEvent [
	
	self 
		comeToFront;
		dragOffset: self position - anEvent cursorPoint.
		
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'is 5/28/2024 15:20'
}
WBMenuBar >> handlesMouseDown: anEvent [

    ^ true.
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'is 5/28/2024 18:45'
}
WBMenuBar >> initializeWithCanvas: aCanvas [

	super initialize.
	self 
		canvas: aCanvas;
		setLayout;
		enableDrag: true;
		yourself.
		
]

{
	#category : #layout,
	#'squeak_changestamp' : 'is 5/28/2024 15:40'
}
WBMenuBar >> menuBarCanvasSizeFactor [

	^ 1@0.05
]

{
	#category : #layout,
	#'squeak_changestamp' : 'is 5/28/2024 15:38'
}
WBMenuBar >> menuBarHeight [

	^ menuBarHeight
]

{
	#category : #layout,
	#'squeak_changestamp' : 'is 5/28/2024 15:51'
}
WBMenuBar >> menuBarHeight: aHeight [

	menuBarHeight := aHeight.
	self updateDimensions
]

{
	#category : #layout,
	#'squeak_changestamp' : 'is 5/28/2024 15:38'
}
WBMenuBar >> menuBarWidth [

	^ menuBarWidth
]

{
	#category : #layout,
	#'squeak_changestamp' : 'is 5/28/2024 15:51'
}
WBMenuBar >> menuBarWidth: aWidth [

	menuBarWidth := aWidth.
	self updateDimensions
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'is 5/28/2024 18:43'
}
WBMenuBar >> mouseDown: evt [

	self dragStart: evt
	
	
		
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'is 5/28/2024 18:45'
}
WBMenuBar >> mouseMove: evt [
	
	self dragMove: evt
]

{
	#category : #layout,
	#'squeak_changestamp' : 'is 5/28/2024 15:54'
}
WBMenuBar >> setLayout [

	self 
		menuBarHeight: self canvas extent y * self menuBarCanvasSizeFactor y;
		menuBarWidth: self canvas extent x * self menuBarCanvasSizeFactor x;
		center: (canvas bounds origin x + ((canvas bounds corner x - canvas bounds origin x))/2) @ (canvas bounds origin y - self extent y/2) ;
		updateColor.
]

{
	#category : #layout,
	#'squeak_changestamp' : 'is 5/28/2024 15:53'
}
WBMenuBar >> updateColor [

	self backgroundColor ifNotNil: [self color: self backgroundColor]
]

{
	#category : #layout,
	#'squeak_changestamp' : 'is 5/28/2024 15:50'
}
WBMenuBar >> updateDimensions [

	self menuBarHeight ifNotNil: [self height:  self menuBarHeight].
	self menuBarWidth ifNotNil: [self width: self menuBarWidth]
]
