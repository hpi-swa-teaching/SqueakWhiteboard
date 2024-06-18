"
The WBCanvas is the whiteboard on which the user can interact with its functionality
"
Class {
	#name : #WBCanvas,
	#superclass : #Morph,
	#instVars : [
		'scale',
		'elementToSpawn',
		'globalColor',
		'elements',
		'activeElement',
		'activeTextbox',
		'drawingSurface',
		'dragOffset',
		'toolbar',
		'images'
	],
	#category : #'SqueakWhiteboard-Core',
	#'squeak_changestamp' : 'is 5/17/2024 15:53'
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'si 5/14/2024 11:08'
}
WBCanvas class >> WhiteBoardSize [

	^800
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
	#'squeak_changestamp' : 'si 6/13/2024 15:39'
}
WBCanvas >> addElement: anElement [

	self elements add:  anElement.
	self drawingSurface addMorph: anElement
]

{
	#category : #layout,
	#'squeak_changestamp' : 'si 6/14/2024 13:08'
}
WBCanvas >> clampElementToCanvas: anElement at: aPoint [

	^ (aPoint x clampLow: self bounds origin x high: self bounds corner x - anElement extent x) @ (aPoint y clampLow: self bounds origin y high: self bounds corner y - anElement extent y)
	
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'si 6/14/2024 13:08'
}
WBCanvas >> createDrawingSurface [
	
	self drawingSurface: (Morph new
		extent: 0@0;
		yourself).
	self addMorph: self drawingSurface.
	
	
]

{
	#category : #'creating elements',
	#'squeak_changestamp' : 'si 6/3/2024 15:50'
}
WBCanvas >> deactivateElement [

	self activeElement ifNotNil: [
		self activeElement deactivateElement.
		self activeElement: nil]

]

{
	#category : #'creating elements',
	#'squeak_changestamp' : 'is 6/3/2024 18:29'
}
WBCanvas >> deactivateTextbox [

	self activeTextbox ifNotNil: [
		self activeTextbox deactivateTextbox.
		self activeTextbox: nil]

]

{
	#category : #'handle elements',
	#'squeak_changestamp' : 'si 6/14/2024 13:10'
}
WBCanvas >> deleteAllElements [
	"maybe it could be cleaner but intuitive way didnt work"
	| aCollection |

	aCollection := self elements copy.
	aCollection do: [:e | e delete].
	self elements removeAll
]

{
	#category : #drag,
	#'squeak_changestamp' : 'si 6/14/2024 13:10'
}
WBCanvas >> dragEnd: anEvent [
	"nötig?"
]

{
	#category : #drag,
	#'squeak_changestamp' : 'ACL 6/7/2024 12:22'
}
WBCanvas >> dragMove: mouseEvent [
	| newPosition |

 	newPosition := mouseEvent cursorPoint + self dragOffset.
	self drawingSurface position: newPosition.
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
	#'squeak_changestamp' : 'si 6/14/2024 13:11'
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
	#category : #'handle elements',
	#'squeak_changestamp' : 'is 6/3/2024 21:15'
}
WBCanvas >> dropElement [

	self elementToSpawn removeDropShadow.
	self elementToSpawn: nil
]

{
	#category : #'creating elements',
	#'squeak_changestamp' : 'is 6/12/2024 17:50'
}
WBCanvas >> dropElement: aMouseEvent [

	self elementToSpawn removeDropShadow.
	self elementToSpawn supportsText ifTrue: [self elementToSpawn activateTextbox: aMouseEvent].
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
	#'squeak_changestamp' : 'si 6/14/2024 13:12'
}
WBCanvas >> elements [

	^ elements ifNil: [^ self element: OrderedCollection new]
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
	#'squeak_changestamp' : 'is 5/29/2024 01:03'
}
WBCanvas >> globalColor [

	^ globalColor.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'is 5/29/2024 01:03'
}
WBCanvas >> globalColor: aColor [

	globalColor := aColor.
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'JK 5/27/2024 15:56'
}
WBCanvas >> handleMouseOver: evt [
    
	^ true.
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'si 5/17/2024 13:53'
}
WBCanvas >> handlesMouseDown: evt [
    
	^ true.
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'si 5/17/2024 13:53'
}
WBCanvas >> handlesMouseMove: evt [
    
	^ true.
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
	#'squeak_changestamp' : 'si 6/14/2024 13:18'
}
WBCanvas >> initialize [
	
	super initialize.
	self images: WBImage new.
	self 
		scale: 1.0;
		height: (self class WhiteBoardSize * self scale);
		width: (self class WhiteBoardSize * self scale * 1.5);
		color: Color white;
		borderWidth: 1;
		borderColor: Color black;
		elements: OrderedCollection new;
		spawnToolbar;
		openInWindowLabeled: #SqueakWhiteboard;
		globalColor: Color cyan;
		createDrawingSurface;
		clipSubmorphs: true.
	self toolbar comeToFront
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'si 6/8/2024 00:22'
}
WBCanvas >> mouseDown: anEvent [
	
	self deactivateElement;
		deactivateTextbox.
	self toolbar deactivateElement.
	(anEvent yellowButtonPressed) ifTrue: [self dragStart: anEvent]
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'ACL 6/7/2024 11:53'
}
WBCanvas >> mouseMove: anEvent [
	
	(self elementToSpawn) ifNotNil:
		[self elementToSpawn dragMove: anEvent].
	anEvent yellowButtonPressed ifTrue:[self dragMove: anEvent]
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'ACL 6/7/2024 11:42'
}
WBCanvas >> mouseUp: anEvent [
	
	self dragEnd: anEvent.
]

{
	#category : #'handle elements',
	#'squeak_changestamp' : 'si 6/3/2024 14:18'
}
WBCanvas >> removeElement: anElement [

	self elements remove: anElement ifAbsent: []
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'si 6/14/2024 13:19'
}
WBCanvas >> scale [

	^ scale
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'si 5/14/2024 10:48'
}
WBCanvas >> scale: aFactor [
	
	scale := aFactor
]

{
	#category : #'creating elements',
	#'squeak_changestamp' : 'ACL 6/7/2024 14:30'
}
WBCanvas >> spawnACopiedElement: anElement At: aPoint [

	self elementToSpawn: 
	(anElement
		center: aPoint;
		dragOffset: anElement position - aPoint;
		canvas: self;
		addDropShadow;
		yourself).
	self addElement: anElement.
]

{
	#category : #'creating elements',
	#'squeak_changestamp' : 'is 6/18/2024 14:02'
}
WBCanvas >> spawnAnElement: anElement At: aMouseEvent [
	
	self elementToSpawn: 
	(anElement
		center: aMouseEvent cursorPoint;
		dragOffset: anElement position - aMouseEvent cursorPoint;
		canvas: self;
		color: self globalColor;
		addDropShadow;
		yourself).
	self addElement: anElement element
]

{
	#category : #'creating elements',
	#'squeak_changestamp' : 'is 5/28/2024 10:38'
}
WBCanvas >> spawnMenuBar [

	self addMorph: (WBMenuBar newWithCanvas: self)
]

{
	#category : #'creating elements',
	#'squeak_changestamp' : 'si 6/7/2024 22:29'
}
WBCanvas >> spawnToolbar [
	
	self toolbar: (WBToolbar newWithCanvas: self).
	self addMorph: self toolbar
	
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
