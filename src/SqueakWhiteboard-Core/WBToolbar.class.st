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
	#'squeak_changestamp' : 'si 6/12/2024 23:12'
}
WBToolbar >> buttonFunctionallityForCircle [

	^ [:aPoint :aColor | self canvas spawnAnElement: WBCircle new At: aPoint]
]

{
	#category : #buttonFunctionallities,
	#'squeak_changestamp' : 'si 6/12/2024 23:13'
}
WBToolbar >> buttonFunctionallityForGlobalColor [

	^ [:aPoint :aColor | self canvas globalColor: aColor]
]

{
	#category : #buttonFunctionallities,
	#'squeak_changestamp' : 'si 6/12/2024 23:13'
}
WBToolbar >> buttonFunctionallityForLine [

	^ [:aPoint :aColor  | self canvas spawnAnElement: WBLine new At: aPoint]
]

{
	#category : #buttonFunctionallities,
	#'squeak_changestamp' : 'si 6/12/2024 23:13'
}
WBToolbar >> buttonFunctionallityForNote [

	^ [:aPoint :aColor  | self canvas spawnAnElement: WBNote new At: aPoint]
]

{
	#category : #buttonFunctionallities,
	#'squeak_changestamp' : 'si 6/12/2024 23:13'
}
WBToolbar >> buttonFunctionallityForRectangle [

	^ [:aPoint :aColor | self canvas spawnAnElement: WBRectangle new At: aPoint]
]

{
	#category : #buttonFunctionallities,
	#'squeak_changestamp' : 'si 6/12/2024 23:13'
}
WBToolbar >> buttonFunctionallityForTextbox [

	^ [:aPoint :aColor | self canvas spawnAnElement: WBTextbox new At: aPoint]
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
	#'squeak_changestamp' : 'si 6/12/2024 12:51'
}
WBToolbar >> createButtons [
	
	self placeButtons: (OrderedCollection withAll: {
		self getShapeChoosingButton.
		self getRectangleButton.
		self getLineButton.
		"self getCircleButton."
		self getNoteButton.
		"self getTextboxButton."
		self getColorsButton.})

	
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
	#'squeak_changestamp' : 'si 6/13/2024 00:25'
}
WBToolbar >> getCircleButton [
	| circleImage circleButton|
	
	circleButton := WBButton new 
		block: self buttonFunctionallityForCircle.
	circleImage := WBImage loadCircleButtonImage.
	
	circleImage notNil ifTrue: 
		[circleButton image: (ImageMorph new image: (self canvas images resize: circleImage to: self buttonSize*0.8))].
	^ circleButton
			
]

{
	#category : #getButton,
	#'squeak_changestamp' : 'si 6/13/2024 00:25'
}
WBToolbar >> getColorsButton [
	| colorsImage colorsButton|
	
	colorsButton := WBButton new 
		block: self buttonFunctionallityForGlobalColor.
	colorsImage := WBImage loadColorsButtonImage.
	
	colorsImage notNil ifTrue: 
		[colorsButton image: (ImageMorph new image: (self canvas images resize: colorsImage to: self buttonSize*0.8))].
	^ colorsButton
]

{
	#category : #getButton,
	#'squeak_changestamp' : 'si 6/13/2024 00:25'
}
WBToolbar >> getLineButton [
	| lineImage lineButton|
	
	lineButton := WBButton new 
		block: self buttonFunctionallityForLine.
	lineImage := WBImage loadLineButtonImage.
	
	lineImage notNil ifTrue: 
		[lineButton image: (ImageMorph new image: (self canvas images resize: lineImage to: self buttonSize*0.8))].
	^ lineButton
	
			
]

{
	#category : #getButton,
	#'squeak_changestamp' : 'si 6/13/2024 00:25'
}
WBToolbar >> getNoteButton [
	| noteImage noteButton|
	
	noteButton := WBButton new 
		block: self buttonFunctionallityForNote.
	noteImage := WBImage loadCircleButtonImage.
	
	noteImage notNil ifTrue: 
		[noteButton image: (ImageMorph new image: (self canvas images resize: noteImage to: self buttonSize*0.8))].
	^ noteButton
]

{
	#category : #getButton,
	#'squeak_changestamp' : 'si 6/13/2024 00:25'
}
WBToolbar >> getRectangleButton [
	| rectangleImage rectangleButton |
	
	rectangleButton := WBButton new 
		block: self buttonFunctionallityForRectangle.
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
	#'squeak_changestamp' : 'si 6/13/2024 00:26'
}
WBToolbar >> getTextboxButton [
	| textboxImage textboxButton |
	
	textboxButton := WBButton new 
		block: self buttonFunctionallityForTextbox.
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
	#'squeak_changestamp' : 'si 6/13/2024 00:26'
}
WBToolbar >> placeButtons: someButtons [
	
	someButtons doWithIndex: [:aButton :anIndex| 
		aButton margin:  WBToolbar margin;
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
