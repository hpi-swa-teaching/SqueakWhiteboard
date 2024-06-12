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
		'toolbar'
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
	#category : #'creating elements',
	#'squeak_changestamp' : 'ACL 6/7/2024 10:41'
}
WBCanvas >> addElement: anElement [

	self elements add:  anElement.
	self drawingSurface addMorph: anElement
]

{
	#category : #layout,
	#'squeak_changestamp' : 'is 5/18/2024 17:56'
}
WBCanvas >> clampElementToCanvas: anElement at: aPoint [

	^ (aPoint x clampLow: self bounds origin x high: self bounds corner x - anElement extent x)
		@(aPoint y clampLow: self bounds origin y high: self bounds corner y - anElement extent y)
]

{
	#category : #layout,
	#'squeak_changestamp' : 'is 5/18/2024 17:55'
}
WBCanvas >> clampPointToCanvas: aPoint [

	^ (aPoint x clampLow: self bounds origin x high: self bounds corner x)
		@(aPoint y clampLow: self bounds origin y high: self bounds corner y)
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'ACL 6/7/2024 13:37'
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
	#category : #drag,
	#'squeak_changestamp' : 'ACL 6/7/2024 12:25'
}
WBCanvas >> dragEnd: anEvent [
	
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
	#'squeak_changestamp' : 'ACL 6/7/2024 10:54'
}
WBCanvas >> dragOffset [
	^ dragOffset
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'ACL 6/7/2024 10:54'
}
WBCanvas >> dragOffset: anObject [
	dragOffset := anObject
]

{
	#category : #drag,
	#'squeak_changestamp' : 'ACL 6/7/2024 14:27'
}
WBCanvas >> dragStart: anEvent [

	self dragOffset: self drawingSurface position - anEvent cursorPoint.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'ACL 6/7/2024 10:40'
}
WBCanvas >> drawingSurface [
	^ drawingSurface
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'ACL 6/7/2024 10:40'
}
WBCanvas >> drawingSurface: anObject [
	drawingSurface := anObject
]

{
	#category : #'creating elements',
	#'squeak_changestamp' : 'is 6/3/2024 21:15'
}
WBCanvas >> dropElement [

	self elementToSpawn removeDropShadow.
	self elementToSpawn: nil
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'si 5/16/2024 19:23'
}
WBCanvas >> elementToSpawn [

	^elementToSpawn
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
	#'squeak_changestamp' : 'si 5/27/2024 11:18'
}
WBCanvas >> elements [

	^elements
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
	#'squeak_changestamp' : 'nicloeser 5/27/2024 12:19'
}
WBCanvas >> images [

	^images
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'nicloeser 5/27/2024 12:19'
}
WBCanvas >> images: anImageClass [

	images := anImageClass
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'ACL 6/7/2024 14:26'
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
		elements: OrderedCollection new.
	self spawnToolbar.
	self openInWindowLabeled: #SqueakWhiteboard.
	self globalColor: Color cyan.
	self createDrawingSurface.
	self toolbar comeToFront.
	self clipSubmorphs: true.
	
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
	#category : #'creating elements',
	#'squeak_changestamp' : 'si 6/3/2024 14:18'
}
WBCanvas >> removeElement: anElement [

	self elements remove: anElement ifAbsent: []
]

{
	#category : #'creating elements',
	#'squeak_changestamp' : 'JK 5/28/2024 14:10'
}
WBCanvas >> removePopUps [
	self activeElement ifNotNil: [self activeElement deactivateElement.
		self activeElement: nil]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'si 5/14/2024 10:49'
}
WBCanvas >> scale [

	^scale
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
	#'squeak_changestamp' : 'is 6/12/2024 16:35'
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
	self addElement: anElement.
	self elementToSpawn suportsText ifTrue: [self elementToSpawn activateTextbox: aMouseEvent]
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
