"
This class represents a menu that is always displayed on the canvas from which different functionalities can be invoked
"
Class {
	#name : #WBToolbar,
	#superclass : #Morph,
	#instVars : [
		'canvas',
		'buttons',
		'aPoint',
		'popUp'
	],
	#category : #'SqueakWhiteboard-Core',
	#'squeak_changestamp' : 'is 6/23/2024 02:27'
}

{
	#category : #defaults,
	#'squeak_changestamp' : 'ACL 7/12/2024 12:17'
}
WBToolbar class >> defaultCanvasSizeFactor [

	^ 0.075 @ 0.75
]

{
	#category : #defaults,
	#'squeak_changestamp' : 'ACL 7/12/2024 12:20'
}
WBToolbar class >> defaultImageSizeFactor [

	^ 0.8
]

{
	#category : #defaults,
	#'squeak_changestamp' : 'ACL 7/12/2024 12:12'
}
WBToolbar class >> defaultMargin [ 

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
	#'squeak_changestamp' : 'si 7/10/2024 17:30'
}
WBToolbar class >> textForDeleteAll [

	^ 'Do you really want to delete all elements on the canvas?'
]

{
	#category : #'button functionalities',
	#'squeak_changestamp' : 'si 7/10/2024 13:22'
}
WBToolbar >> buttonFunctionalityForArrow [

	^ [:aButton | self canvas spawnAnElement: ((WBLine newWithCanvas: self canvas) arrowHead: true) At: aButton currentMouseEvent]
]

{
	#category : #'button functionalities',
	#'squeak_changestamp' : 'si 7/11/2024 14:10'
}
WBToolbar >> buttonFunctionalityForCircle [

	^ [:aButton | self canvas spawnAnElement: (WBCircularElement newWithCanvas: self canvas) At: aButton currentMouseEvent]
]

{
	#category : #'button functionalities',
	#'squeak_changestamp' : 'ACL 7/12/2024 12:12'
}
WBToolbar >> buttonFunctionalityForColorPalette [

	^ [:aButton | self makePopUpAt: aButton rightCenter + (self class defaultMargin + (self buttonSize x * (3 / 2)) @ 0) with: self createColorButtons columns: 3]
]

{
	#category : #'button functionalities',
	#'squeak_changestamp' : 'ACL 7/12/2024 12:12'
}
WBToolbar >> buttonFunctionalityForDeleteAll [

	^ [:aButton | self canvas showText: self class textForDeleteAll.
		self makePopUpAt: self canvas text bottomCenter + (0 @ (self class defaultMargin + self buttonSize x)) with: self createDeleteConfirmButtons columns: nil]
]

{
	#category : #'button functionalities',
	#'squeak_changestamp' : 'ACL 7/10/2024 12:12'
}
WBToolbar >> buttonFunctionalityForDeleteCancel [

	^ [:aButton | self deactivateElement.
		self canvas removeText]
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
	#'squeak_changestamp' : 'si 7/10/2024 13:22'
}
WBToolbar >> buttonFunctionalityForLine [

	^ [:aButton | self canvas spawnAnElement: ((WBLine newWithCanvas: self canvas) arrowHead: false) At: aButton currentMouseEvent]
]

{
	#category : #'button functionalities',
	#'squeak_changestamp' : 'ACL 7/12/2024 12:12'
}
WBToolbar >> buttonFunctionalityForLineChoosing [

	^ [:aButton | self makePopUpAt: aButton rightCenter + (self class defaultMargin + (self buttonSize x / 2) @ 0) with: self createLineChoosingButtons columns: 1]
]

{
	#category : #'button functionalities',
	#'squeak_changestamp' : 'si 7/10/2024 13:23'
}
WBToolbar >> buttonFunctionalityForNote [

	^ [:aButton | self canvas spawnAnElement: (WBNote newWithCanvas: self canvas) At: aButton currentMouseEvent]
]

{
	#category : #'button functionalities',
	#'squeak_changestamp' : 'si 7/11/2024 14:10'
}
WBToolbar >> buttonFunctionalityForRectangle [

	^ [:aButton | self canvas spawnAnElement: (WBRectangularElement newWithCanvas: self canvas) At: aButton currentMouseEvent]
]

{
	#category : #'button functionalities',
	#'squeak_changestamp' : 'ACL 7/12/2024 12:12'
}
WBToolbar >> buttonFunctionalityForShapeChoosing [

	^ [:aButton | self makePopUpAt: aButton rightCenter + (self class defaultMargin + (self buttonSize x / 2) @ 0) with: self createShapeChoosingButtons columns: 1]
]

{
	#category : #'button functionalities',
	#'squeak_changestamp' : 'si 7/10/2024 13:23'
}
WBToolbar >> buttonFunctionalityForTextbox [

	^ [:aButton | self canvas spawnAnElement: (WBTextbox newWithCanvas: self canvas) At: aButton currentMouseEvent]
]

{
	#category : #'button functionalities',
	#'squeak_changestamp' : 'si 7/12/2024 12:11'
}
WBToolbar >> buttonFunctionalityForTransparentColor [

	^ [:aButton | self canvas globalColor: Color transparent.
		self deactivateElement]
]

{
	#category : #appearance,
	#'squeak_changestamp' : 'ACL 7/12/2024 12:12'
}
WBToolbar >> buttonSize [

	^ ((self width min: self height) - self class defaultMargin) @ ((self width min: self height) - self class defaultMargin)
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
	#'squeak_changestamp' : 'si 7/12/2024 11:34'
}
WBToolbar >> createColorButtons [

	^ OrderedCollection new
		add: (self getColorButtonWithColor: Color black);
		add: (self getColorButtonWithColor: Color gray);
		add: (self getTransparentColorButton);
		add: (self getColorButtonWithColor: Color red);
		add: (self getColorButtonWithColor: Color orange);
		add: (self getColorButtonWithColor: Color yellow);
		add: (self getColorButtonWithColor: Color green);
		add: (self getColorButtonWithColor: Color cyan);
		add: (self getColorButtonWithColor: Color blue);
		add: (self getColorButtonWithColor: Color ocean);
		add: (self getColorButtonWithColor: Color magenta);
		add: (self getColorButtonWithColor: Color magenta muchDarker);
		yourself
]

{
	#category : #'button creation',
	#'squeak_changestamp' : 'si 7/11/2024 15:32'
}
WBToolbar >> createDeleteConfirmButtons [

	^ OrderedCollection new
		add: self getDeleteConfirmButton;
		add: self getDeleteCancelButton;
		yourself
]

{
	#category : #'button creation',
	#'squeak_changestamp' : 'si 7/11/2024 15:32'
}
WBToolbar >> createLineChoosingButtons [

	^ OrderedCollection new
		add: self getArrowButton;
		add: self getLineButton;
		yourself
]

{
	#category : #'button creation',
	#'squeak_changestamp' : 'si 7/11/2024 15:32'
}
WBToolbar >> createShapeChoosingButtons [

	^ OrderedCollection new
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
	#category : #appearance,
	#'squeak_changestamp' : 'si 6/17/2024 13:43'
}
WBToolbar >> deactivateElement [

	self popUp ifNotNil: 
		[self popUp delete.
		self popUp: nil]
]

{
	#category : #'get buttons',
	#'squeak_changestamp' : 'is 7/9/2024 20:44'
}
WBToolbar >> getArrowButton [

	^ WBButton new 
		block: self buttonFunctionalityForArrow;
		image: (ImageMorph new image: (self canvas images resize: WBImage loadArrowButtonImage to: self imageSize));
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
	#'squeak_changestamp' : 'is 7/9/2024 20:48'
}
WBToolbar >> getDeleteCancelButton [
	
	^ WBButton new 
		block: self buttonFunctionalityForDeleteCancel;
		image: (ImageMorph new image: (self canvas images resize: WBImage loadDenyButtonImage to: self imageSize));
		backgroundColor: Color red muchLighter;
		yourself
	
			
]

{
	#category : #'get buttons',
	#'squeak_changestamp' : 'is 7/9/2024 20:47'
}
WBToolbar >> getDeleteConfirmButton [
	
	^ WBButton new 
		block: self buttonFunctionalityForDeleteConfirm;
		image: (ImageMorph new image: (self canvas images resize: WBImage loadAcceptButtonImage to: self imageSize));
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
	#'squeak_changestamp' : 'is 7/9/2024 19:02'
}
WBToolbar >> getLineChoosingButton [

	^ WBButton new 
		block: self buttonFunctionalityForLineChoosing;
		image: (ImageMorph new image: (self canvas images resize: WBImage loadLineChoosingButtonImage to: self imageSize));
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
	#category : #'get buttons',
	#'squeak_changestamp' : 'si 7/12/2024 11:34'
}
WBToolbar >> getTransparentColorButton [

	^ WBButton new 
		color: Color white;
		backgroundColor: Color white;
		clickedColor: Color white muchDarker;
		block: self buttonFunctionalityForTransparentColor;
		yourself
]

{
	#category : #appearance,
	#'squeak_changestamp' : 'ACL 7/12/2024 12:20'
}
WBToolbar >> imageSize [

	^ self buttonSize * self class defaultImageSizeFactor
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
	#'squeak_changestamp' : 'si 7/11/2024 14:50'
}
WBToolbar >> makePopUpAt: aPoint with: aCollection columns: aNumber [

	self popUp ifNotNil: [self deactivateElement].
	self popUp: 
		(WBPopUp new
			setLayout;
			sizeOfPopUp: (self buttonSize x);
			numberOfColumns: aNumber;
			addButtons: aCollection;
			yourself).
	self addMorph: self popUp.
	self popUp center: aPoint
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'ACL 7/12/2024 12:12'
}
WBToolbar >> placeButtons: someButtons [
	
	someButtons doWithIndex: [:aButton :anIndex| 
		aButton 
			margin:  WBToolbar defaultMargin;
			extent: self buttonSize;
			center: (self bounds origin x + self width / 2) @ (self bounds origin y + ((self buttonSize y + WBToolbar defaultMargin) * anIndex) ) - (0 @ self buttonSize y / 2);
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
	#category : #appearance,
	#'squeak_changestamp' : 'ACL 7/12/2024 12:18'
}
WBToolbar >> setLayout [

	self 
		height: self canvas extent y * self class defaultCanvasSizeFactor y;
		width: self canvas extent x * self class defaultCanvasSizeFactor x;
		center: (self canvas bounds origin x + self extent x / 2) @ (self canvas bounds origin y + ((self canvas bounds corner y - self canvas bounds origin y)) / 2);
		color: Color gray
		
]
