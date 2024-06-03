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
		'activeTextbox'
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
	#'squeak_changestamp' : 'is 6/2/2024 15:50'
}
WBCanvas >> activeTextbox [

	^ activeTextbox
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'is 6/2/2024 15:50'
}
WBCanvas >> activeTextbox: aTextbox [

	activeTextbox := aTextbox
]

{
	#category : #'creating elements',
	#'squeak_changestamp' : 'si 5/27/2024 11:38'
}
WBCanvas >> addElement: anElement [

	self elements add:  anElement.
	self addMorph: anElement
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
	#'squeak_changestamp' : 'is 6/2/2024 18:55'
}
WBCanvas >> deactivateTextbox [

	self activeTextbox ifNotNil: [
		self activeTextbox deactivateTextbox.
		self activeTextbox: nil]
]

{
	#category : #'creating elements',
	#'squeak_changestamp' : 'is 6/1/2024 17:46'
}
WBCanvas >> dropElement [

	self elementToSpawn removeDropShadow;
		postDropRoutine.
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
	#category : #'creating elements',
	#'squeak_changestamp' : 'is 5/29/2024 01:03'
}
WBCanvas >> globalColor [

	^ globalColor.
]

{
	#category : #'creating elements',
	#'squeak_changestamp' : 'is 5/29/2024 01:03'
}
WBCanvas >> globalColor: aColor [

	globalColor := aColor.
]

{
	#category : #'creating elements',
	#'squeak_changestamp' : 'JK 5/27/2024 15:56'
}
WBCanvas >> handleMouseOver: evt [
    
	^ true.
]

{
	#category : #'creating elements',
	#'squeak_changestamp' : 'si 5/17/2024 13:53'
}
WBCanvas >> handlesMouseDown: evt [
    
	^ true.
]

{
	#category : #'creating elements',
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
	#'squeak_changestamp' : 'is 5/29/2024 00:16'
}
WBCanvas >> initialize [
	
	super initialize.
	self images: WBImage new.
	self 
		scale: 1.0;
		height: (self class WhiteBoardSize * self scale);
		width: (self class WhiteBoardSize * self scale * 1.5);
		color: Color white;
		borderWidth: (self scale * 5);
		borderColor: Color black;
		elements: OrderedCollection new.
	self spawnToolbar.
	self openInWindowLabeled: #SqueakWhiteboard.
	self globalColor: Color cyan.
	
]

{
	#category : #'creating elements',
	#'squeak_changestamp' : 'is 6/2/2024 18:54'
}
WBCanvas >> mouseDown: anEvent [

	anEvent redButtonPressed ifTrue: [self deactivateElement].
	anEvent yellowButtonPressed ifTrue: [self deactivateTextbox]
	
	
]

{
	#category : #'creating elements',
	#'squeak_changestamp' : 'JK 5/26/2024 23:47'
}
WBCanvas >> mouseMove: anEvent [
	
	(self elementToSpawn) ifNotNil:
		[self elementToSpawn dragMove: anEvent]
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
	#'squeak_changestamp' : 'si 5/27/2024 11:39'
}
WBCanvas >> spawnACopiedElement: anElement At: aPoint [

	self elementToSpawn: 
	(anElement
		center: aPoint;
		dragOffset: anElement position - aPoint;
		canvas: self;
		addDropShadow;
		yourself).
	self addElement: anElement
]

{
	#category : #'creating elements',
	#'squeak_changestamp' : 'is 5/29/2024 01:09'
}
WBCanvas >> spawnAnElement: anElement At: aPoint [
	
	self elementToSpawn: 
	(anElement
		center: aPoint;
		dragOffset: anElement position - aPoint;
		canvas: self;
		color: self globalColor;
		addDropShadow;
		yourself).
	self addElement: anElement
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
	#'squeak_changestamp' : 'is 5/28/2024 10:18'
}
WBCanvas >> spawnToolbar [
	
	self addMorph: (WBToolbar newWithCanvas: self)
	
]
