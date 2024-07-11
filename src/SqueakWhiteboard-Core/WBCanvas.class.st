"
This class represents the whiteboard on which the user can interact with UI
"
Class {
	#name : #WBCanvas,
	#superclass : #Morph,
	#instVars : [
		'elementToSpawn',
		'globalColor',
		'elements',
		'activeElement',
		'activeTextbox',
		'drawingSurface',
		'dragOffset',
		'toolbar',
		'images',
		'text'
	],
	#category : #'SqueakWhiteboard-Core',
	#'squeak_changestamp' : 'is 6/23/2024 02:27'
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'is 6/23/2024 01:27'
}
WBCanvas class >> WhiteBoardSize [

	^ 800
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'si 7/11/2024 14:32'
}
WBCanvas class >> defaultGlobalColor [

	^ Color cyan
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'is 6/2/2024 15:50'
}
WBCanvas >> activeElement [

	^ activeElement
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'si 5/27/2024 11:24'
}
WBCanvas >> activeElement: anElement [

	activeElement := anElement
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'is 6/3/2024 18:20'
}
WBCanvas >> activeTextbox [

	^ activeTextbox
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'is 6/3/2024 18:20'
}
WBCanvas >> activeTextbox: aTextbox [

	activeTextbox := aTextbox
]

{
	#category : #'handle elements',
	#'squeak_changestamp' : 'is 6/19/2024 16:23'
}
WBCanvas >> addElement: anElement [

	self elements add:  anElement.
	anElement addOwnMorphTo: self drawingSurface
]

{
	#category : #layout,
	#'squeak_changestamp' : 'is 6/21/2024 21:10'
}
WBCanvas >> clampedPositionOfElement: anElement at: aPoint [

	^ (aPoint x clampLow: self bounds origin x high: self bounds corner x - anElement extent x) @ (aPoint y clampLow: self bounds origin y high: self bounds corner y - anElement extent y)
	
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'si 7/10/2024 14:18'
}
WBCanvas >> createDrawingSurface [
	
	self drawingSurface: 
		(Morph new 
			extent: 0@0; 
			color: Color transparent;
			yourself).
	self addMorph: self drawingSurface
	
	
]

{
	#category : #'handle elements',
	#'squeak_changestamp' : 'ACL 7/10/2024 11:54'
}
WBCanvas >> deactivateElement [

	self activeElement ifNotNil: 
		[self activeElement deactivateElement.
		self activeElement: nil]

]

{
	#category : #'handle elements',
	#'squeak_changestamp' : 'is 6/23/2024 01:18'
}
WBCanvas >> deactivateTextbox [

	self activeTextbox ifNotNil: 
		[self activeTextbox deactivateTextbox.
		self activeTextbox: nil]

]

{
	#category : #'handle elements',
	#'squeak_changestamp' : 'is 6/23/2024 01:19'
}
WBCanvas >> deleteAllElements [
	| aCollection |

	aCollection := self elements copy.
	aCollection do: [:e | e delete].
	self elements removeAll
]

{
	#category : #drag,
	#'squeak_changestamp' : 'si 7/11/2024 14:20'
}
WBCanvas >> dragMove: mouseEvent [
	| newPosition |

 	newPosition := mouseEvent cursorPoint + self dragOffset.
	self drawingSurface position: newPosition
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'si 6/14/2024 13:11'
}
WBCanvas >> dragOffset [

	^ dragOffset
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'si 6/14/2024 13:11'
}
WBCanvas >> dragOffset: anObject [

	dragOffset := anObject
]

{
	#category : #drag,
	#'squeak_changestamp' : 'si 7/11/2024 14:19'
}
WBCanvas >> dragStart: anEvent [

	self dragOffset: self drawingSurface position - anEvent cursorPoint
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'si 6/14/2024 13:11'
}
WBCanvas >> drawingSurface [

	^ drawingSurface
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'si 6/14/2024 13:11'
}
WBCanvas >> drawingSurface: anObject [

	drawingSurface := anObject
]

{
	#category : #'creating elements',
	#'squeak_changestamp' : 'nicloeser 7/9/2024 11:33'
}
WBCanvas >> dropElement: anEvent [

	self elementToSpawn 
		removeDropShadow;
		postDropRoutine: anEvent.
	self elementToSpawn: nil 
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'si 6/14/2024 13:11'
}
WBCanvas >> elementToSpawn [

	^ elementToSpawn
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'si 5/17/2024 13:01'
}
WBCanvas >> elementToSpawn: anElement [

	elementToSpawn := anElement
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'si 7/11/2024 14:27'
}
WBCanvas >> elements [

	^ elements ifNil: [elements := OrderedCollection new]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'si 5/27/2024 11:18'
}
WBCanvas >> elements: aCollection [

	elements := aCollection
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'si 7/11/2024 14:33'
}
WBCanvas >> globalColor [

	^ globalColor ifNil: [globalColor := self class defaultGlobalColor]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'is 6/18/2024 16:36'
}
WBCanvas >> globalColor: aColor [

	globalColor := aColor
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'is 6/23/2024 01:23'
}
WBCanvas >> handlesMouseDown: anEvent [
    
	^ true
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'is 6/23/2024 01:23'
}
WBCanvas >> handlesMouseMove: anEvent [
    
	^ true
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'si 6/14/2024 13:16'
}
WBCanvas >> images [

	^ images
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'si 6/14/2024 13:16'
}
WBCanvas >> images: anImage [

	images := anImage	
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'si 7/11/2024 14:33'
}
WBCanvas >> initialize [
	
	super initialize.
	self images: WBImage new.
	self
		setLayout;
		spawnToolbar;
		openInWindowLabeled: #SqueakWhiteboard
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'si 6/25/2024 15:05'
}
WBCanvas >> mouseDown: anEvent [
	
	self 
		deactivateElement;
		removeText;
		deactivateTextbox.
	self toolbar deactivateElement.
	(anEvent yellowButtonPressed) ifTrue: [self dragStart: anEvent]
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'is 6/23/2024 01:24'
}
WBCanvas >> mouseMove: anEvent [
	
	(self elementToSpawn) ifNotNil: [self elementToSpawn dragMove: anEvent].
	anEvent yellowButtonPressed ifTrue: [self dragMove: anEvent]
]

{
	#category : #'show text',
	#'squeak_changestamp' : 'si 6/25/2024 15:08'
}
WBCanvas >> removeText [

	self text ifNotNil:
		[self text abandon.
		self text: nil]
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'si 7/11/2024 14:30'
}
WBCanvas >> setLayout [

	self
		height: self class WhiteBoardSize;
		width: (self class WhiteBoardSize * self widthToHeightRatio);
		color: Color white;
		borderColor: Color black;
		borderWidth: 1;
		createDrawingSurface;
		clipSubmorphs: true
]

{
	#category : #'show text',
	#'squeak_changestamp' : 'si 7/10/2024 17:30'
}
WBCanvas >> showText: aString [

	self text ifNotNil: [self text abandon].
	self text: (TextMorph new
		contents: aString;
		fontName: #Calibri pointSize: 25;
		lock;
		yourself).
	self addMorph: text.
	self text center: self center
]

{
	#category : #'creating elements',
	#'squeak_changestamp' : 'ACL 7/10/2024 11:55'
}
WBCanvas >> spawnACopiedLine: anElement At: aPoint [
	
	self elementToSpawn: 
		(anElement
			center: aPoint;
			dragOffset: anElement position - aPoint;
			canvas: self;
			yourself).
	self addElement: anElement
	
]

{
	#category : #'creating elements',
	#'squeak_changestamp' : 'is 7/1/2024 22:32'
}
WBCanvas >> spawnAnElement: anElement At: aMouseEvent [
	
	self elementToSpawn: 
		(anElement
			center: aMouseEvent cursorPoint;
			dragOffset: anElement position - aMouseEvent cursorPoint;
			canvas: self;
			addDropShadow;
			yourself).
	self addElement: anElement 
]

{
	#category : #'creating elements',
	#'squeak_changestamp' : 'si 7/11/2024 14:29'
}
WBCanvas >> spawnToolbar [
	
	self toolbar: (WBToolbar newWithCanvas: self).
	self addMorph: self toolbar.
	self toolbar comeToFront
	
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'si 6/25/2024 14:30'
}
WBCanvas >> text [ 

	^ text
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'si 6/25/2024 14:31'
}
WBCanvas >> text: anElement [ 

	text := anElement
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'si 6/7/2024 22:27'
}
WBCanvas >> toolbar [

	^ toolbar
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'si 6/7/2024 22:27'
}
WBCanvas >> toolbar: aToolbar [

	toolbar := aToolbar
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'is 6/23/2024 01:26'
}
WBCanvas >> widthToHeightRatio [

	^ 1.5
]
