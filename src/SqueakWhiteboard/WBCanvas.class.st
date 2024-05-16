Class {
	#name : #WBCanvas,
	#superclass : #Morph,
	#instVars : [
		'scale',
		'elementToSpawn'
	],
	#category : #SqueakWhiteboard
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
	#'squeak_changestamp' : 'si 5/16/2024 19:23'
}
WBCanvas >> elementToSpawn [

	^elementToSpawn
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'si 5/16/2024 19:23'
}
WBCanvas >> elementToSpawn: anElement [

	elementToSpawn := anElement
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'JK 5/15/2024 12:04'
}
WBCanvas >> handlesMouseDown: evt [
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
	#'squeak_changestamp' : 'si 5/16/2024 19:24'
}
WBCanvas >> mouseDown: anEvent [
	
	(self elementToSpawn) ifNotNil: 
		[self 
			spawnAnElement: self elementToSpawn At: anEvent cursorPoint;
		 	elementToSpawn: nil]
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
	#'squeak_changestamp' : 'si 5/16/2024 18:36'
}
WBCanvas >> spawnAnElement: anElement At: aPoint [

	anElement center: aPoint.	
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
