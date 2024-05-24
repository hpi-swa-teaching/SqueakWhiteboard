"
The WBCanvas is the whiteboard on which the user can interact with its functionality
"
Class {
	#name : #WBCanvas,
	#superclass : #Morph,
	#instVars : [
		'scale',
		'elementToSpawn',
		'elements'
	],
	#category : #SqueakWhiteboard,
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
	#category : #'creating elements',
	#'squeak_changestamp' : 'si 5/24/2024 13:52'
}
WBCanvas >> addElement: anElement [

	self elements add: anElement.
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
	#'squeak_changestamp' : 'si 5/17/2024 13:53'
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
	#'squeak_changestamp' : 'si 5/24/2024 13:51'
}
WBCanvas >> elements [
	
	elements ifNotNil: [^elements].
	elements := OrderedCollection new.
	^elements
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'si 5/24/2024 13:50'
}
WBCanvas >> elements: aList [
	
	elements := aList
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
	#category : #initialization,
	#'squeak_changestamp' : 'si 5/24/2024 12:59'
}
WBCanvas >> initialize [
	
	super initialize.
	self 
		scale: 0.7;
		height: (self class WhiteBoardSize * self scale);
		width: (self class WhiteBoardSize * self scale * 1.5);
		color: Color white;
		borderWidth: (self scale * 5);
		borderColor: Color black.
	self spawnToolbarWithCanvas: self.
	self openInWorld
	
]

{
	#category : #'creating elements',
	#'squeak_changestamp' : 'ACL 5/22/2024 16:20'
}
WBCanvas >> mouseDown: anEvent [

	self removePopUps.
]

{
	#category : #'creating elements',
	#'squeak_changestamp' : 'si 5/17/2024 12:36'
}
WBCanvas >> mouseMove: anEvent [
	
	(self elementToSpawn) ifNotNil:
		[self elementToSpawn moveElement: anEvent]
]

{
	#category : #'creating elements',
	#'squeak_changestamp' : 'si 5/24/2024 14:45'
}
WBCanvas >> removeElement: anElement [

	self elements remove: anElement ifAbsent: []
]

{
	#category : #'creating elements',
	#'squeak_changestamp' : 'si 5/24/2024 14:00'
}
WBCanvas >> removePopUps [

	self elements do: [:m | m removeElementPopUp].
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
	#'squeak_changestamp' : 'si 5/24/2024 13:52'
}
WBCanvas >> spawnAnElement: anElement At: aPoint [

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
	#'squeak_changestamp' : 'si 5/24/2024 09:57'
}
WBCanvas >> spawnToolbarWithCanvas: aCanvas [
	
	self addMorph: (WBToolbar newWithCanvas: aCanvas)
	
]
