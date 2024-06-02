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
		'buttons',
		'backgroundColor'
	],
	#category : #'SqueakWhiteboard-Core',
	#'squeak_changestamp' : 'is 5/18/2024 17:12'
}

{
	#category : #layout,
	#'squeak_changestamp' : 'nicloeser 5/28/2024 11:38'
}
WBToolbar class >> margin [ 

	^20
]

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'is 5/18/2024 18:33'
}
WBToolbar class >> newWithCanvas: aCanvas [

	^ WBToolbar basicNew initializeWithCanvas: aCanvas
]

{
	#category : #layout,
	#'squeak_changestamp' : 'is 5/28/2024 15:41'
}
WBToolbar >> backgroundColor [

	^ backgroundColor ifNil: [backgroundColor := Color gray]
]

{
	#category : #layout,
	#'squeak_changestamp' : 'is 5/28/2024 15:47'
}
WBToolbar >> backgroundColor: aColor [

	backgroundColor := aColor.
	self updateColor
]

{
	#category : #layout,
	#'squeak_changestamp' : 'nicloeser 5/27/2024 14:23'
}
WBToolbar >> buttonSize [

	^ ((toolbarWidth min: toolbarHeight) - WBToolbar margin)@((toolbarWidth min: toolbarHeight) - WBToolbar margin)
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
	#'squeak_changestamp' : 'is 5/28/2024 20:00'
}
WBToolbar >> createButtons [
	
	self placeButtons: (OrderedCollection withAll: {
		self getRectangleButton.
		self getCircleButton.
		self getLineButton.
		self getColorsButton.
		self getTextboxButton.})

	
]

{
	#category : #layout,
	#'squeak_changestamp' : 'JK 5/27/2024 11:13'
}
WBToolbar >> deactivateElement [

	self submorphs do: [:m | (m class == WBColorPaletteButton) ifTrue:[m deactivateElement]].
]

{
	#category : #getButton,
	#'squeak_changestamp' : 'nicloeser 5/28/2024 11:50'
}
WBToolbar >> getCircleButton [

	^WBToolbarButton new
			number: 2;
			image: (ImageMorph new image: 
			(self canvas images resize: (WBImage loadCircleButtonImage) to: self buttonSize*0.8));
			yourself.
			
]

{
	#category : #getButton,
	#'squeak_changestamp' : 'nicloeser 5/28/2024 11:50'
}
WBToolbar >> getColorsButton [

	^WBColorPaletteButton new
			image: (ImageMorph new image: 
			(self canvas images resize: (WBImage loadColorsButtonImage) to: self buttonSize*0.8));
			yourself.
]

{
	#category : #getButton,
	#'squeak_changestamp' : 'nicloeser 5/28/2024 11:50'
}
WBToolbar >> getLineButton [

	^WBToolbarButton new
			number: 3;
			image: (ImageMorph new image: 
			(self canvas images resize: (WBImage loadLineButtonImage) to: self buttonSize*0.8));
			yourself.
			
]

{
	#category : #getButton,
	#'squeak_changestamp' : 'nicloeser 5/28/2024 11:50'
}
WBToolbar >> getRectangleButton [

	^WBToolbarButton new
			number: 1;
			image: (ImageMorph new image: 
			(self canvas images resize: (WBImage loadRectangleButtonImage) to: self buttonSize*0.8));
			yourself.
			
]

{
	#category : #getButton,
	#'squeak_changestamp' : 'is 5/28/2024 20:01'
}
WBToolbar >> getTextboxButton [

	^WBToolbarButton new
			number: 4;
			image: (ImageMorph new image: 
			(self canvas images resize: (WBImage loadCircleButtonImage) to: self buttonSize*0.8));
			yourself.
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'JK 5/28/2024 23:23'
}
WBToolbar >> initializeWithCanvas: aCanvas [
	
	super initialize.
	self 
		canvas: aCanvas;
		setLayout;
		createButtons
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'nicloeser 5/28/2024 11:49'
}
WBToolbar >> placeButtons: someButtons [
	
	someButtons doWithIndex: [:aButton :anIndex| 
		aButton margin:  WBToolbar margin;
			canvas: self canvas;
			extent: self buttonSize;
			center: (self bounds origin x + self toolbarWidth/2)@(self bounds origin y + ((self buttonSize y + WBToolbar margin) * anIndex) ) - (0@self buttonSize y/2);
			addImage;
			backgroundColor: Color lightBlue;
			clickedColor: Color blue.
		self addMorph: aButton].
	self buttons: someButtons.
	
]

{
	#category : #layout,
	#'squeak_changestamp' : 'is 5/28/2024 15:46'
}
WBToolbar >> setLayout [

	self 
		toolbarHeight: self canvas extent y * self toolbarCanvasSizeFactor y;
		toolbarWidth: self canvas extent x * self toolbarCanvasSizeFactor x;
		center: (canvas bounds origin x + self extent x / 2) @ 
			(canvas bounds origin y + ((canvas bounds corner y - canvas bounds origin y))/2);
		updateColor.
		
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
	#'squeak_changestamp' : 'is 5/28/2024 15:45'
}
WBToolbar >> updateColor [

	self backgroundColor ifNotNil: [self color: self backgroundColor]
]

{
	#category : #layout,
	#'squeak_changestamp' : 'is 5/18/2024 19:15'
}
WBToolbar >> updateDimensions [

	self toolbarHeight ifNotNil: [self height:  self toolbarHeight].
	self toolbarWidth ifNotNil: [self width: self toolbarWidth]
]