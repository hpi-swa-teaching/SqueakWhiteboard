Class {
	#name : #WBCanvas,
	#superclass : #Morph,
	#instVars : [
		'scale'
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
	#category : #initialization,
	#'squeak_changestamp' : 'JK 5/15/2024 12:04'
}
WBCanvas >> handlesMouseDown: evt [
    ^ true.
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'ACL 5/17/2024 15:02'
}
WBCanvas >> initialize [
	
	super initialize.
	self 
		scale: 0.5;
		height: (self class WhiteBoardSize * self scale);
		width: (self class WhiteBoardSize * self scale * 1.5);
		color: Color white;
		borderWidth: (self scale * 5);
		borderColor: Color black.
	self openInWorld
	
]

{
	#category : #'creating elements',
	#'squeak_changestamp' : 'ACL 5/17/2024 15:02'
}
WBCanvas >> mouseDown: anEvent [

	self submorphs do: [:m | m removePopUp].
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
	#'squeak_changestamp' : 'ACL 5/17/2024 15:11'
}
WBCanvas >> spawnRectangle [

	self addMorph: 
	(WBRectangle new
		position: self position + (100@100);
		color: Color lightBlue;
		yourself	)
]
