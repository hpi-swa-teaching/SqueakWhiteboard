"
The WBToolbar is a menu from which different functionalities can be invoked
"
Class {
	#name : #WBToolbar,
	#superclass : #Morph,
	#instVars : [
		'canvas',
		'toolbarHeight',
		'toolbarWidth',
		'buttons'
	],
	#category : #SqueakWhiteboard,
	#'squeak_changestamp' : 'is 5/18/2024 17:12'
}

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'is 5/18/2024 18:33'
}
WBToolbar class >> newWithCanvas: aCanvas [

	^ WBToolbar basicNew initializeWithCanvas: aCanvas
]

{
	#category : #layout,
	#'squeak_changestamp' : 'is 5/19/2024 00:56'
}
WBToolbar >> backgroundColor [

	^ Color gray
]

{
	#category : #layout,
	#'squeak_changestamp' : 'is 5/18/2024 19:44'
}
WBToolbar >> backgroundColor: aColor [

	^ Color gray
]

{
	#category : #layout,
	#'squeak_changestamp' : 'is 5/19/2024 14:03'
}
WBToolbar >> buttonSize [

	^ (toolbarWidth min: toolbarHeight)@(toolbarWidth min: toolbarHeight)
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'is 5/19/2024 11:59'
}
WBToolbar >> buttons [

	^ buttons
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'is 5/19/2024 11:58'
}
WBToolbar >> buttons: aCollection [

	buttons := aCollection
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'is 5/18/2024 16:05'
}
WBToolbar >> canvas [

	^ canvas
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'is 5/18/2024 16:05'
}
WBToolbar >> canvas: aCanvas [

	canvas := aCanvas
	
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'ACL 5/24/2024 15:58'
}
WBToolbar >> initializeWithCanvas: aCanvas [
	
	super initialize.
	self canvas: aCanvas;
		toolbarHeight: aCanvas extent y * self toolbarCanvasSizeFactor y;
		toolbarWidth: aCanvas extent x * self toolbarCanvasSizeFactor x;
		center: (canvas bounds origin x + self extent x / 2) @ 
			(canvas bounds origin y + ((canvas bounds corner y - canvas bounds origin y))/2);
		color: self backgroundColor;
		placeButtons: (Set withAll: {WBPlaceholderButton new.
									WBPlaceholderButton new.
									WBPlaceholderButton new.
									WBColorPaletteButton new.})
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'ACL 5/24/2024 13:33'
}
WBToolbar >> placeButtons: someButtons [
	| margin |
	
	margin := 20.
	
	someButtons doWithIndex: [:aButton :anIndex| 
		aButton margin:  margin;
			canvas: self canvas;
			extent: (self buttonSize x - aButton margin)@(self buttonSize y - aButton margin);
			center: (self bounds origin x + self buttonSize x/2)@(self bounds origin y + (self buttonSize y * anIndex)) - (0@self buttonSize y/2);
			backgroundColor: Color lightBlue;
			clickedColor: Color blue.
		self addMorph: aButton].
	self buttons: someButtons.
	
]

{
	#category : #layout,
	#'squeak_changestamp' : 'ACL 5/24/2024 13:59'
}
WBToolbar >> removeElementPopUp [

	self submorphs do: [:m | (m class == WBColorPaletteButton) ifTrue:[m removeElementPopUp]].
]

{
	#category : #layout,
	#'squeak_changestamp' : 'is 5/19/2024 11:39'
}
WBToolbar >> toolbarCanvasSizeFactor [

	^ 0.075@0.75
]

{
	#category : #layout,
	#'squeak_changestamp' : 'is 5/18/2024 17:16'
}
WBToolbar >> toolbarHeight [

	^ toolbarHeight
]

{
	#category : #layout,
	#'squeak_changestamp' : 'is 5/18/2024 18:41'
}
WBToolbar >> toolbarHeight: aNumber [

	toolbarHeight := aNumber.
	self updateDimensions
]

{
	#category : #layout,
	#'squeak_changestamp' : 'is 5/18/2024 17:17'
}
WBToolbar >> toolbarWidth [

	^ toolbarWidth
]

{
	#category : #layout,
	#'squeak_changestamp' : 'is 5/18/2024 19:41'
}
WBToolbar >> toolbarWidth: aNumber [

	toolbarWidth := aNumber.
	self updateDimensions.
]

{
	#category : #layout,
	#'squeak_changestamp' : 'is 5/18/2024 19:15'
}
WBToolbar >> updateDimensions [

	self toolbarHeight ifNotNil: [self height:  self toolbarHeight].
	self toolbarWidth ifNotNil: [self width: self toolbarWidth]
]
