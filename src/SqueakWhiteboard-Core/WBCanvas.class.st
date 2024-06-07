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
	#category : #'creating elements',
	#'squeak_changestamp' : 'si 5/27/2024 11:38'
}
WBCanvas >> addElement: anElement [

	self elements add:  anElement.
	self addMorph: anElement
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'JK 6/3/2024 12:29'
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
	
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'is 6/3/2024 18:23'
}
WBCanvas >> mouseDown: anEvent [
	
	self deactivateElement;
		deactivateTextbox
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'JK 5/26/2024 23:47'
}
WBCanvas >> mouseMove: anEvent [
	
	(self elementToSpawn) ifNotNil:
		[self elementToSpawn dragMove: anEvent]
]
