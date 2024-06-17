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
		'aPoint',
		'popUp'
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
	#'squeak_changestamp' : 'si 6/17/2024 11:29'
}
WBToolbar >> buttonFunctionalityForCircle [

	^ [:aButton | self canvas spawnAnElement: (WBCircle newWithCanvas: self canvas) At: aButton currentEvent]
]

{
	#category : #buttonFunctionallities,
	#'squeak_changestamp' : 'si 6/17/2024 11:29'
}
WBToolbar >> buttonFunctionalityForColorPalette [

	^ [:aButton | self makePopUpAt: aButton rightCenter + (self class margin @ 0) with: self createColorButtons columns: 3]
]

{
	#category : #buttonFunctionallities,
	#'squeak_changestamp' : 'si 6/17/2024 11:29'
}
WBToolbar >> buttonFunctionalityForDeleteAll [

	^ [:aButton | self makePopUpAt: aButton rightCenter + (self class margin @ 0) with: self createDeleteConfirmButtons columns: 1]
]

{
	#category : #buttonFunctionallities,
	#'squeak_changestamp' : 'si 6/17/2024 11:30'
}
WBToolbar >> buttonFunctionalityForDeleteCancel [

	^ [:aButton | self deactivateElement]
]

{
	#category : #buttonFunctionallities,
	#'squeak_changestamp' : 'si 6/17/2024 11:39'
}
WBToolbar >> buttonFunctionalityForDeleteConfirm [

	^ [:aButton | self canvas deleteAllElements.
		self deactivateElement]
]

{
	#category : #buttonFunctionallities,
	#'squeak_changestamp' : 'si 6/17/2024 11:30'
}
WBToolbar >> buttonFunctionalityForGlobalColor [

	^ [:aButton | self canvas globalColor: aButton color]
]

{
	#category : #buttonFunctionallities,
	#'squeak_changestamp' : 'si 6/17/2024 11:30'
}
WBToolbar >> buttonFunctionalityForLine [

	^ [:aButton | self canvas spawnAnElement: WBLine new At: aButton currentEvent]
]

{
	#category : #buttonFunctionallities,
	#'squeak_changestamp' : 'si 6/17/2024 11:30'
}
WBToolbar >> buttonFunctionalityForNote [

	^ [:aButton | self canvas spawnAnElement: (WBNote newWithCanvas: self canvas) At: aButton currentEvent]
]

{
	#category : #buttonFunctionallities,
	#'squeak_changestamp' : 'si 6/17/2024 11:30'
}
WBToolbar >> buttonFunctionalityForRectangle [

	^ [:aButton | self canvas spawnAnElement: (WBRectangle newWithCanvas: self canvas) At: aButton currentEvent]
]

{
	#category : #buttonFunctionallities,
	#'squeak_changestamp' : 'si 6/17/2024 11:31'
}
WBToolbar >> buttonFunctionalityForShapeChoosing [

	^ [:aButton | self makePopUpAt: aButton rightCenter + (self class margin @ 0) with: self createShapeChoosingButtons columns: 1]
]

{
	#category : #layout,
	#'squeak_changestamp' : 'si 6/14/2024 12:12'
}
WBToolbar >> buttonSize [

	^ ((self toolbarWidth min: self toolbarHeight) - self class margin) @ ((self toolbarWidth min: self toolbarHeight) - self class margin)
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
	#category : #createButtons,
	#'squeak_changestamp' : 'si 6/13/2024 13:58'
}
WBToolbar >> createColorButtons [

	^OrderedCollection new
		add: (self getColorButtonWithColor: Color yellow);
		add: (self getColorButtonWithColor: Color orange);
		add: (self getColorButtonWithColor: Color red);
		add: (self getColorButtonWithColor: Color magenta);
		add: (self getColorButtonWithColor: Color blue);
		add: (self getColorButtonWithColor: Color cyan);
		add: (self getColorButtonWithColor: Color green);
		add: (self getColorButtonWithColor: Color gray);
		add: (self getColorButtonWithColor: Color black);
		yourself.
]

{
	#category : #createButtons,
	#'squeak_changestamp' : 'si 6/17/2024 11:23'
}
WBToolbar >> createDeleteConfirmButtons [

	^OrderedCollection new
		add: self getDeleteConfirmButton;
		add: self getDeleteCancelButton;
		yourself.
]

{
	#category : #createButtons,
	#'squeak_changestamp' : 'si 6/13/2024 14:12'
}
WBToolbar >> createShapeChoosingButtons [

	^OrderedCollection new
		add: self getCircleButton;
		add: self getRectangleButton;
		yourself.
]

{
	#category : #createButtons,
	#'squeak_changestamp' : 'si 6/14/2024 12:42'
}
WBToolbar >> createToolbarButtons [
	
	self placeButtons: (OrderedCollection withAll: {
		self getShapeChoosingButton.
		self getLineButton.
		self getNoteButton.
		self getColorsButton.
		self getDeleteAllButton})

	
]

{
	#category : #layout,
	#'squeak_changestamp' : 'si 6/13/2024 15:42'
}
WBToolbar >> deactivateElement [

	self popUp ifNotNil: [self popUp delete]
]

{
	#category : #getButton,
	#'squeak_changestamp' : 'is 6/17/2024 13:43'
}
WBToolbar >> getCircleButton [

	^ WBButton new 
		block: self buttonFunctionalityForCircle;
		 image: (ImageMorph new image: (self canvas images resize: WBImage loadCircleButtonImage to: self buttonSize*0.8));
		yourself
			
]

{
	#category : #getButton,
	#'squeak_changestamp' : 'si 6/17/2024 11:30'
}
WBToolbar >> getColorButtonWithColor: aColor [ 
	
	^(WBButton new
		color: aColor;
		backgroundColor: aColor;
		clickedColor: aColor darker;
		block: self buttonFunctionalityForGlobalColor;
		yourself)
]

{
	#category : #getButton,
	#'squeak_changestamp' : 'is 6/17/2024 13:43'
}
WBToolbar >> getColorsButton [

	^ WBButton new 
		block: self buttonFunctionalityForColorPalette;
		 image: (ImageMorph new image: (self canvas images resize: WBImage loadColorsButtonImage to: self buttonSize*0.8));
		yourself
			
]

{
	#category : #getButton,
	#'squeak_changestamp' : 'is 6/17/2024 15:52'
}
WBToolbar >> getDeleteAllButton [

	^ WBButton new 
		block: self buttonFunctionalityForDeleteAll;
		backgroundColor: Color red muchLighter;
		image: (ImageMorph new image: (self canvas images resize: WBImage loadDeleteAllButtonImage to: self buttonSize*0.8));
		yourself
			
]

{
	#category : #getButton,
	#'squeak_changestamp' : 'si 6/17/2024 11:30'
}
WBToolbar >> getDeleteCancelButton [
	
	^ WBButton new 
		block: self buttonFunctionalityForDeleteCancel;
		backgroundColor: Color red muchLighter;
		yourself.
	
			
]

{
	#category : #getButton,
	#'squeak_changestamp' : 'si 6/17/2024 11:30'
}
WBToolbar >> getDeleteConfirmButton [
	
	^ WBButton new 
		block: self buttonFunctionalityForDeleteConfirm;
		backgroundColor: Color green muchLighter;
		yourself.
	
			
]

{
	#category : #getButton,
	#'squeak_changestamp' : 'is 6/17/2024 13:45'
}
WBToolbar >> getLineButton [

	^ WBButton new 
	block: self buttonFunctionalityForLine;
	 image: (ImageMorph new image: (self canvas images resize: WBImage loadLineButtonImage to: self buttonSize*0.8));
	yourself
	
			
]

{
	#category : #getButton,
	#'squeak_changestamp' : 'is 6/17/2024 13:45'
}
WBToolbar >> getNoteButton [

	^ WBButton new 
		block: self buttonFunctionalityForNote;
		image: (ImageMorph new image: (self canvas images resize: WBImage loadNoteButtonImage to: self buttonSize*0.8));
		yourself
]

{
	#category : #getButton,
	#'squeak_changestamp' : 'is 6/17/2024 13:42'
}
WBToolbar >> getRectangleButton [
	
	^ WBButton new 
		block: self buttonFunctionalityForRectangle;
		 image: (ImageMorph new image: (self canvas images resize: WBImage loadRectangleButtonImage to: self buttonSize*0.8));
		yourself
			
]

{
	#category : #getButton,
	#'squeak_changestamp' : 'is 6/17/2024 13:46'
}
WBToolbar >> getShapeChoosingButton [

	^ WBButton new 
		block: self buttonFunctionalityForShapeChoosing;
		image: (ImageMorph new image: (self canvas images resize: WBImage loadShapeChoosingButtonImage to: self buttonSize*0.8));
		yourself
			
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'si 6/13/2024 13:51'
}
WBToolbar >> initializeWithCanvas: aCanvas [
	
	super initialize.
	self 
		canvas: aCanvas;
		setLayout;
		createToolbarButtons
]

{
	#category : #popUp,
	#'squeak_changestamp' : 'si 6/14/2024 12:02'
}
WBToolbar >> makePopUpAt: aPoint with: aCollection columns: aNumber [

	self popUp ifNotNil: [self deactivateElement].
	self popUp: (WBPopUp new
		setDefaultValues;
		sizeOfPopUp: (self buttonSize x);
		numberOfColumns: aNumber;
		addButtons: aCollection;
		yourself).
	self addMorph: self popUp.
	self popUp center: aPoint + (self popUp center - self popUp leftCenter)
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'si 6/13/2024 15:23'
}
WBToolbar >> placeButtons: someButtons [
	
	someButtons doWithIndex: [:aButton :anIndex| 
		aButton 
			margin:  WBToolbar margin;
			extent: self buttonSize;
			center: (self bounds origin x + self toolbarWidth/2)@(self bounds origin y + ((self buttonSize y + WBToolbar margin) * anIndex) ) - (0@self buttonSize y/2);
			addImage.
		self addMorph: aButton].
	self buttons: someButtons.
	
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'si 6/13/2024 13:55'
}
WBToolbar >> popUp [

	^ popUp
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'si 6/13/2024 13:54'
}
WBToolbar >> popUp: aPopUp [

	popUp := aPopUp
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
