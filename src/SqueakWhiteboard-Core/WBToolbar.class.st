"
This class represents a menu that is always displayed on the canvas from which different functionalities can be invoked
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
	#'squeak_changestamp' : 'is 6/23/2024 02:27'
}

{
	#category : #layout,
	#'squeak_changestamp' : 'is 6/23/2024 02:03'
}
WBToolbar class >> margin [ 

	^ 20
]

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'is 5/18/2024 18:33'
}
WBToolbar class >> newWithCanvas: aCanvas [

	^ WBToolbar basicNew initializeWithCanvas: aCanvas
]

{
	#category : #text,
	#'squeak_changestamp' : 'nicloeser 6/26/2024 10:58'
}
WBToolbar class >> textForDeleteAll [

	^ 'Do you really want to delete all elements on the canvas?
	Click red for cancel.
	Click green for confirm.'
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
	#category : #'button functionalities',
	#'squeak_changestamp' : 'is 7/1/2024 22:39'
}
WBToolbar >> buttonFunctionalityForArrow [

	^ [:aButton | self canvas spawnAnElement: ((WBLine newWithCanvas: self canvas) arrowHead: true) At: aButton currentEvent]
]

{
	#category : #'button functionalities',
	#'squeak_changestamp' : 'is 6/18/2024 12:25'
}
WBToolbar >> buttonFunctionalityForCircle [

	^ [:aButton | self canvas spawnAnElement: (WBCircle newWithCanvas: self canvas) At: aButton currentEvent]
]

{
	#category : #'button functionalities',
	#'squeak_changestamp' : 'si 6/25/2024 14:40'
}
WBToolbar >> buttonFunctionalityForColorPalette [

	^ [:aButton | self makePopUpAt: aButton rightCenter + (self class margin + (self buttonSize x * (3 / 2)) @ 0) with: self createColorButtons columns: 3]
]

{
	#category : #'button functionalities',
	#'squeak_changestamp' : 'si 6/25/2024 14:46'
}
WBToolbar >> buttonFunctionalityForDeleteAll [

	^ [:aButton | self canvas showText: self class textForDeleteAll.
		self makePopUpAt: self canvas text bottomCenter + (0 @ (self class margin + self buttonSize x)) with: self createDeleteConfirmButtons columns: nil]
]

{
	#category : #'button functionalities',
	#'squeak_changestamp' : 'si 6/25/2024 15:06'
}
WBToolbar >> buttonFunctionalityForDeleteCancel [

	^ [:aButton | self deactivateElement.
		self canvas removeText.]
]

{
	#category : #'button functionalities',
	#'squeak_changestamp' : 'si 6/25/2024 15:06'
}
WBToolbar >> buttonFunctionalityForDeleteConfirm [

	^ [:aButton | self canvas 
		deleteAllElements;
		removeText.
		self deactivateElement]
]

{
	#category : #'button functionalities',
	#'squeak_changestamp' : 'is 6/18/2024 21:14'
}
WBToolbar >> buttonFunctionalityForGlobalColor [

	^ [:aButton | self canvas globalColor: aButton color.
		self deactivateElement]
]

{
	#category : #'button functionalities',
	#'squeak_changestamp' : 'is 7/1/2024 22:39'
}
WBToolbar >> buttonFunctionalityForLine [

	^ [:aButton | self canvas spawnAnElement: ((WBLine newWithCanvas: self canvas) arrowHead: false) At: aButton currentEvent]
]

{
	#category : #'button functionalities',
	#'squeak_changestamp' : 'si 6/25/2024 14:39'
}
WBToolbar >> buttonFunctionalityForLineChoosing [

	^ [:aButton | self makePopUpAt: aButton rightCenter + (self class margin + (self buttonSize x / 2) @ 0) with: self createLineChoosingButtons columns: 1]
]

{
	#category : #'button functionalities',
	#'squeak_changestamp' : 'is 6/18/2024 12:25'
}
WBToolbar >> buttonFunctionalityForNote [

	^ [:aButton | self canvas spawnAnElement: (WBNote newWithCanvas: self canvas) At: aButton currentEvent]
]

{
	#category : #'button functionalities',
	#'squeak_changestamp' : 'is 6/18/2024 12:25'
}
WBToolbar >> buttonFunctionalityForRectangle [

	^ [:aButton | self canvas spawnAnElement: (WBRectangle newWithCanvas: self canvas) At: aButton currentEvent]
]

{
	#category : #'button functionalities',
	#'squeak_changestamp' : 'si 6/25/2024 14:39'
}
WBToolbar >> buttonFunctionalityForShapeChoosing [

	^ [:aButton | self makePopUpAt: aButton rightCenter + (self class margin + (self buttonSize x / 2) @ 0) with: self createShapeChoosingButtons columns: 1]
]

{
	#category : #'button functionalities',
	#'squeak_changestamp' : 'JK 6/30/2024 14:56'
}
WBToolbar >> buttonFunctionalityForTextbox [

	^ [:aButton | self canvas spawnAnElement: (WBTextbox newWithCanvas: self canvas) At: aButton currentEvent]
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
	#category : #'button creation',
	#'squeak_changestamp' : 'is 6/23/2024 02:04'
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
		yourself
]

{
	#category : #'button creation',
	#'squeak_changestamp' : 'is 6/23/2024 02:04'
}
WBToolbar >> createDeleteConfirmButtons [

	^OrderedCollection new
		add: self getDeleteConfirmButton;
		add: self getDeleteCancelButton;
		yourself
]

{
	#category : #'button creation',
	#'squeak_changestamp' : 'si 6/25/2024 13:43'
}
WBToolbar >> createLineChoosingButtons [

	^OrderedCollection new
		add: self getLineButton;
		add: self getArrowButton;
		yourself
]

{
	#category : #'button creation',
	#'squeak_changestamp' : 'is 6/25/2024 15:46'
}
WBToolbar >> createShapeChoosingButtons [

	^OrderedCollection new
		add: self getCircleButton;
		add: self getRectangleButton;
		yourself
]

{
	#category : #'button creation',
	#'squeak_changestamp' : 'is 6/25/2024 15:47'
}
WBToolbar >> createToolbarButtons [
	
	self placeButtons: (OrderedCollection withAll: {
		self getShapeChoosingButton.
		self getLineChoosingButton.
		self getNoteButton.
		self getTextboxButton.
		self getColorsButton.
		self getDeleteAllButton})

	
]

{
	#category : #layout,
	#'squeak_changestamp' : 'si 6/17/2024 13:43'
}
WBToolbar >> deactivateElement [

	self popUp ifNotNil: 
		[self popUp delete.
		self popUp: nil]
]

{
	#category : #'get buttons',
	#'squeak_changestamp' : 'si 6/25/2024 13:47'
}
WBToolbar >> getArrowButton [

	^ WBButton new 
		block: self buttonFunctionalityForArrow;
		image: (ImageMorph new image: (self canvas images resize: WBImage loadCircleButtonImage to: self imageSize));
		yourself
	
			
]

{
	#category : #'get buttons',
	#'squeak_changestamp' : 'is 6/23/2024 02:09'
}
WBToolbar >> getCircleButton [

	^ WBButton new 
		block: self buttonFunctionalityForCircle;
		image: (ImageMorph new image: (self canvas images resize: WBImage loadCircleButtonImage to: self imageSize));
		yourself
			
]

{
	#category : #'get buttons',
	#'squeak_changestamp' : 'is 6/23/2024 02:05'
}
WBToolbar >> getColorButtonWithColor: aColor [ 
	
	^ WBButton new
		color: aColor;
		backgroundColor: aColor;
		clickedColor: aColor darker;
		block: self buttonFunctionalityForGlobalColor;
		yourself
]

{
	#category : #'get buttons',
	#'squeak_changestamp' : 'is 6/23/2024 02:09'
}
WBToolbar >> getColorsButton [

	^ WBButton new 
		block: self buttonFunctionalityForColorPalette;
		image: (ImageMorph new image: (self canvas images resize: WBImage loadColorsButtonImage to: self imageSize));
		yourself
			
]

{
	#category : #'get buttons',
	#'squeak_changestamp' : 'is 6/23/2024 02:09'
}
WBToolbar >> getDeleteAllButton [

	^ WBButton new 
		block: self buttonFunctionalityForDeleteAll;
		backgroundColor: Color red muchLighter;
		image: (ImageMorph new image: (self canvas images resize: WBImage loadDeleteAllButtonImage to: self imageSize));
		yourself
			
]

{
	#category : #'get buttons',
	#'squeak_changestamp' : 'is 6/23/2024 02:05'
}
WBToolbar >> getDeleteCancelButton [
	
	^ WBButton new 
		block: self buttonFunctionalityForDeleteCancel;
		backgroundColor: Color red muchLighter;
		yourself
	
			
]

{
	#category : #'get buttons',
	#'squeak_changestamp' : 'is 6/23/2024 02:05'
}
WBToolbar >> getDeleteConfirmButton [
	
	^ WBButton new 
		block: self buttonFunctionalityForDeleteConfirm;
		backgroundColor: Color green muchLighter;
		yourself
	
			
]

{
	#category : #'get buttons',
	#'squeak_changestamp' : 'is 6/23/2024 02:10'
}
WBToolbar >> getLineButton [

	^ WBButton new 
		block: self buttonFunctionalityForLine;
		image: (ImageMorph new image: (self canvas images resize: WBImage loadLineButtonImage to: self imageSize));
		yourself
	
			
]

{
	#category : #'get buttons',
	#'squeak_changestamp' : 'si 6/25/2024 13:46'
}
WBToolbar >> getLineChoosingButton [

	^ WBButton new 
		block: self buttonFunctionalityForLineChoosing;
		image: (ImageMorph new image: (self canvas images resize: WBImage loadShapeChoosingButtonImage to: self imageSize));
		yourself
			
]

{
	#category : #'get buttons',
	#'squeak_changestamp' : 'is 6/23/2024 02:10'
}
WBToolbar >> getNoteButton [

	^ WBButton new 
		block: self buttonFunctionalityForNote;
		image: (ImageMorph new image: (self canvas images resize: WBImage loadNoteButtonImage to: self imageSize));
		yourself
]

{
	#category : #'get buttons',
	#'squeak_changestamp' : 'is 6/23/2024 02:10'
}
WBToolbar >> getRectangleButton [
	
	^ WBButton new 
		block: self buttonFunctionalityForRectangle;
		image: (ImageMorph new image: (self canvas images resize: WBImage loadRectangleButtonImage to: self imageSize));
		yourself
			
]

{
	#category : #'get buttons',
	#'squeak_changestamp' : 'is 6/23/2024 02:10'
}
WBToolbar >> getShapeChoosingButton [

	^ WBButton new 
		block: self buttonFunctionalityForShapeChoosing;
		image: (ImageMorph new image: (self canvas images resize: WBImage loadShapeChoosingButtonImage to: self imageSize));
		yourself
			
]

{
	#category : #'get buttons',
	#'squeak_changestamp' : 'is 6/25/2024 15:36'
}
WBToolbar >> getTextboxButton [
	
	^ WBButton new 
		block: self buttonFunctionalityForTextbox;
		image: (ImageMorph new image: (self canvas images resize: WBImage loadTextboxButtonImage to: self imageSize));
		yourself
			
]

{
	#category : #layout,
	#'squeak_changestamp' : 'is 6/23/2024 02:09'
}
WBToolbar >> imageSize [

	^ self buttonSize * 0.8
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
	#'squeak_changestamp' : 'si 6/25/2024 14:38'
}
WBToolbar >> makePopUpAt: aPoint with: aCollection columns: aNumber [

	self popUp ifNotNil: [self deactivateElement].
	self popUp: 
		(WBPopUp new
			setDefaultValues;
			sizeOfPopUp: (self buttonSize x);
			numberOfColumns: aNumber;
			addButtons: aCollection;
			yourself).
	self addMorph: self popUp.
	self popUp center: aPoint
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'is 6/23/2024 02:06'
}
WBToolbar >> placeButtons: someButtons [
	
	someButtons doWithIndex: [:aButton :anIndex| 
		aButton 
			margin:  WBToolbar margin;
			extent: self buttonSize;
			center: (self bounds origin x + self toolbarWidth/2)@(self bounds origin y + ((self buttonSize y + WBToolbar margin) * anIndex) ) - (0@self buttonSize y/2);
			addImage.
		self addMorph: aButton].
	self buttons: someButtons
	
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
	#'squeak_changestamp' : 'is 6/23/2024 02:07'
}
WBToolbar >> setLayout [

	self 
		toolbarHeight: self canvas extent y * self toolbarCanvasSizeFactor y;
		toolbarWidth: self canvas extent x * self toolbarCanvasSizeFactor x;
		center: (canvas bounds origin x + self extent x / 2) @ (canvas bounds origin y + ((canvas bounds corner y - canvas bounds origin y))/2);
		updateColor
		
]

{
	#category : #layout,
	#'squeak_changestamp' : 'is 6/23/2024 02:07'
}
WBToolbar >> toolbarCanvasSizeFactor [

	^ 0.075 @ 0.75
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
	#'squeak_changestamp' : 'is 6/23/2024 02:07'
}
WBToolbar >> toolbarWidth: aNumber [

	toolbarWidth := aNumber.
	self updateDimensions
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
	#'squeak_changestamp' : 'is 6/23/2024 02:07'
}
WBToolbar >> updateDimensions [

	self toolbarHeight ifNotNil: [self height: self toolbarHeight].
	self toolbarWidth ifNotNil: [self width: self toolbarWidth]
]
