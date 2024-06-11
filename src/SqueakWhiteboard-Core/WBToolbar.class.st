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
		'backgroundColor',
		'aPoint'
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
	#category : #buttonFunctionallities,
	#'squeak_changestamp' : 'si 6/11/2024 18:06'
}
WBToolbar >> buttonForRectangle [

	^ [aPoint | self createRectangleAt: aPoint]
]

{
	#category : #buttonFunctionallities,
	#'squeak_changestamp' : 'si 6/11/2024 18:08'
}
WBToolbar >> buttonFunctionallityForRectangle [

	^ [:aPoint | self createRectangleAt: aPoint]
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
	#'squeak_changestamp' : 'si 6/11/2024 17:51'
}
WBToolbar >> createButtons [
	
	self placeButtons: (OrderedCollection withAll: {
		"self getShapeChoosingButton."
		self getRectangleButton.
		self getLineButton.
		"self getCircleButton."
		self getNoteButton.
		"self getTextboxButton."
		self getColorsButton.})

	
]

{
	#category : #'creating elements',
	#'squeak_changestamp' : 'si 6/11/2024 18:08'
}
WBToolbar >> createRectangleAt: aPoint [

	self canvas spawnAnElement: (WBRectangle newWithCanvas: self canvas) At: aPoint.
]

{
	#category : #layout,
	#'squeak_changestamp' : 'si 6/7/2024 22:29'
}
WBToolbar >> deactivateElement [

	self buttons do: [:m | m deactivateElement].
]

{
	#category : #getButton,
	#'squeak_changestamp' : 'is 6/9/2024 15:38'
}
WBToolbar >> getCircleButton [
	| circleImage circleButton|
	
	circleButton := WBToolbarButton new number: 2.
	circleImage := WBImage loadCircleButtonImage.
	
	circleImage notNil ifTrue: 
		[circleButton image: (ImageMorph new image: (self canvas images resize: circleImage to: self buttonSize*0.8))].
	^ circleButton
			
]

{
	#category : #getButton,
	#'squeak_changestamp' : 'is 6/9/2024 15:39'
}
WBToolbar >> getColorsButton [
	| colorsImage colorsButton|
	
	colorsButton := WBColorPaletteButton new.
	colorsImage := WBImage loadColorsButtonImage.
	
	colorsImage notNil ifTrue: 
		[colorsButton image: (ImageMorph new image: (self canvas images resize: colorsImage to: self buttonSize*0.8))].
	^ colorsButton
]

{
	#category : #getButton,
	#'squeak_changestamp' : 'is 6/9/2024 15:39'
}
WBToolbar >> getLineButton [
	| lineImage lineButton|
	
	lineButton := WBToolbarButton new number: 3.
	lineImage := WBImage loadLineButtonImage.
	
	lineImage notNil ifTrue: 
		[lineButton image: (ImageMorph new image: (self canvas images resize: lineImage to: self buttonSize*0.8))].
	^ lineButton
	
			
]

{
	#category : #getButton,
	#'squeak_changestamp' : 'is 6/9/2024 15:41'
}
WBToolbar >> getNoteButton [
	| noteImage noteButton|
	
	noteButton := WBToolbarButton new number: 5.
	noteImage := WBImage loadCircleButtonImage.
	
	noteImage notNil ifTrue: 
		[noteButton image: (ImageMorph new image: (self canvas images resize: noteImage to: self buttonSize*0.8))].
	^ noteButton
]

{
	#category : #getButton,
	#'squeak_changestamp' : 'si 6/11/2024 18:38'
}
WBToolbar >> getRectangleButton [
	| rectangleImage rectangleButton |
	
	rectangleButton := WBButton new 
		block: self buttonFunctionallityForRectangle;
		creator:	 self.
	rectangleImage := WBImage loadRectangleButtonImage.
	
	rectangleButton image: (ImageMorph new image: (self canvas images resize: rectangleImage to: self buttonSize*0.8)).
	^ rectangleButton
			
]

{
	#category : #getButton,
	#'squeak_changestamp' : 'is 6/9/2024 15:43'
}
WBToolbar >> getShapeChoosingButton [
	| shapeChoosingImage shapeChoosingButton |
	
	shapeChoosingButton := WBShapeChoosingButton new.
	shapeChoosingImage := WBImage loadRectangleButtonImage.

	shapeChoosingImage notNil ifTrue: 
		[shapeChoosingButton image: (ImageMorph new image: (self canvas images resize: shapeChoosingImage to: self buttonSize*0.8))].
	^ shapeChoosingButton
			
]

{
	#category : #getButton,
	#'squeak_changestamp' : 'is 6/9/2024 15:44'
}
WBToolbar >> getTextboxButton [
	| textboxImage textboxButton |
	
	textboxButton := WBToolbarButton new number: 4.
	textboxImage := WBImage loadTextboxButtonImage.

	textboxImage notNil ifTrue: 
		[textboxButton image: (ImageMorph new image: (self canvas images resize: textboxImage to: self buttonSize*0.8))].
	^ textboxButton
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
	#'squeak_changestamp' : 'si 6/7/2024 21:37'
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
