"
The WBCanvas is the whiteboard on which the user can interact with its functionality
"
Class {
	#name : #WBCanvas,
	#superclass : #Morph,
	#instVars : [
		'scale',
		'elementToSpawn'
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
	#category : #initialization,
	#'squeak_changestamp' : 'si 5/17/2024 13:53'
}
WBCanvas >> handlesMouseDown: evt [
    
	^ true.
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'si 5/17/2024 13:53'
}
WBCanvas >> handlesMouseMove: evt [
    
	^ true.
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'si 5/16/2024 18:57'
}
WBCanvas >> initialize [
	
	super initialize.
	self 
		scale: 1;
		height: (self class WhiteBoardSize * self scale);
		width: (self class WhiteBoardSize * self scale * 1.5);
		color: Color white;
		borderWidth: (self scale * 5);
		borderColor: Color black.
	(self spawnTemporaryButtonAt: 100@100)
		number: 1;
		color: Color red.
	(self spawnTemporaryButtonAt: 200@200)
		number: 2;
		color: Color yellow.
	self openInWorld
	
]

{
	#category : #'creating elements',
	#'squeak_changestamp' : 'si 5/17/2024 13:54'
}
WBCanvas >> mouseDown: anEvent [

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
	#'squeak_changestamp' : 'si 5/17/2024 13:52'
}
WBCanvas >> spawnAnElement: anElement At: aPoint [

	self elementToSpawn: 
	(anElement
		center: aPoint;
		dragOffeset: anElement position - aPoint;
		canvas: self;
		addDropShadow;
		yourself).
	self addMorph: anElement
]

{
	#category : #'creating elements',
	#'squeak_changestamp' : 'si 5/16/2024 19:03'
}
WBCanvas >> spawnTemporaryButtonAt: aPoint [

	|temp|
	temp := WBTemporaryButton new
		center: aPoint;
		canvas: self;
		yourself.
	self addMorph: temp.
	^temp
]
