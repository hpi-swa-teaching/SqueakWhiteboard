"
The WBElement is an object that can be created within the canvas
"
Class {
	#name : #WBElement,
	#superclass : #Morph,
	#instVars : [
		'dragOffset',
		'canvas'
	],
	#category : #SqueakWhiteboard,
	#'squeak_changestamp' : 'is 5/17/2024 15:58'
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'is 5/18/2024 16:04'
}
WBElement >> canvas [

	^ canvas
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'si 5/17/2024 12:50'
}
WBElement >> canvas: aCanvas [

	canvas := aCanvas
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'is 5/18/2024 15:59'
}
WBElement >> dragOffset [
	^ dragOffset
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'is 5/18/2024 15:59'
}
WBElement >> dragOffset: anObject [
	dragOffset := anObject
]

{
	#category : #'drag&drop',
	#'squeak_changestamp' : 'is 5/19/2024 16:21'
}
WBElement >> handlesMouseDown: anEvent [
    ^ true.
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'is 5/18/2024 17:42'
}
WBElement >> initialize [
	
	super initialize
]

{
	#category : #'drag&drop',
	#'squeak_changestamp' : 'ACL 5/22/2024 19:05'
}
WBElement >> makeElementPopUp [
	| elementPopUp |
	
	elementPopUp := WBElementPopUp new.
	self addMorph: 
	(WBElementPopUp new
	
		position: self topRight;
		yourself);
		
		addMorph: 
	(WBColorButton new
		setDefaultValues;
		position: self topRight + (2.25@2.25) + ((elementPopUp popUpButtons -2)*20@0);
		yourself);
		
		addMorph:
	(WBDeleteButton new
		setDefaultValues;
		position: self topRight + (2.25@2.25) + ((elementPopUp popUpButtons -1)*20@0);
		yourself)	
	
		
]

{
	#category : #'drag&drop',
	#'squeak_changestamp' : 'ACL 5/22/2024 16:56'
}
WBElement >> makePopUp [
	| popUp |
	
	popUp := WBPopUp new.
	self addMorph: 
	(WBPopUp new
		position: self topRight;
		yourself);
		
		addMorph: 
	(WBColorButton new
		setDefaultValues;
		position: self topRight + (2.25@2.25) + ((popUp popUpButtons -2)*20@0);
		yourself);
		
		addMorph:
	(WBDeleteButton new
		setDefaultValues;
		position: self topRight + (2.25@2.25) + ((popUp popUpButtons -1)*20@0);
		yourself)	
	
		
]

{
	#category : #'drag&drop',
	#'squeak_changestamp' : 'ACL 5/22/2024 19:06'
}
WBElement >> mouseDown: anEvent [
	
	(self canvas elementToSpawn) ifNil:
		[owner removePopUps.
		self
			addDropShadow;
			makeElementPopUp;
			comeToFront;
			dragOffset: self position - anEvent cursorPoint.].
	(self canvas elementToSpawn) ifNotNil:
		[self canvas dropElement]
]

{
	#category : #'drag&drop',
	#'squeak_changestamp' : 'si 5/17/2024 12:21'
}
WBElement >> mouseMove: anEvent [

	self moveElement: anEvent
]

{
	#category : #'drag&drop',
	#'squeak_changestamp' : 'ACL 5/17/2024 15:12'
}
WBElement >> mouseUp: anEvent [
	
	self removeDropShadow.
]

{
	#category : #'drag&drop',
	#'squeak_changestamp' : 'is 5/18/2024 17:53'
}
WBElement >> moveElement: anEvent [
	|newPosition |
	
 	newPosition := self canvas clampElementToCanvas: self at: anEvent cursorPoint + self dragOffset.
	self position: newPosition
]

{
	#category : #'drag&drop',
	#'squeak_changestamp' : 'is 5/18/2024 20:27'
}
WBElement >> removePopUp [

	self submorphs do: [:m | m delete].
]
