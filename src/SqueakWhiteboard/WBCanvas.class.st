Class {
	#name : #WBCanvas,
	#superclass : #Morph,
	#instVars : [
		'scale',
		'flags'
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
	#category : #'creating elements',
	#'squeak_changestamp' : 'si 5/16/2024 15:45'
}
WBCanvas >> enableSpawning [

	self flags: 1
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'si 5/16/2024 15:43'
}
WBCanvas >> flags [

	^flags
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'si 5/16/2024 15:43'
}
WBCanvas >> flags: aNumber [

	flags := aNumber
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
	#'squeak_changestamp' : 'si 5/16/2024 15:44'
}
WBCanvas >> initialize [
	
	super initialize.
	self 
		scale: 1;
		height: (self class WhiteBoardSize * self scale);
		width: (self class WhiteBoardSize * self scale * 1.5);
		color: Color white;
		borderWidth: (self scale * 5);
		borderColor: Color black;
		flags: 0.
	self openInWorld
	
]

{
	#category : #'creating elements',
	#'squeak_changestamp' : 'si 5/16/2024 15:50'
}
WBCanvas >> mouseDown: anEvent [
	
	(self flags == 1) ifTrue: 
		[self 
			spawnRectangleAt: anEvent cursorPoint;
		 	flags: 0]
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
	#'squeak_changestamp' : 'si 5/16/2024 15:29'
}
WBCanvas >> spawnRectangleAt: aPoint [

	self addMorph: 
	(WBRectangle new
		position: aPoint;
		color: Color lightBlue;
		yourself)
]
