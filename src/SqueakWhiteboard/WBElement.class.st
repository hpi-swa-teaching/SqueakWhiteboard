"
The WBElement is an object that can be created within the canvas
"
Class {
	#name : #WBElement,
	#superclass : #Morph,
	#instVars : [
		'dragOffeset',
		'canvas'
	],
	#category : #SqueakWhiteboard,
	#'squeak_changestamp' : 'is 5/17/2024 15:58'
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'si 5/17/2024 12:50'
}
WBElement >> canvas [

	^canvas
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
	#'squeak_changestamp' : 'is 5/17/2024 16:18'
}
WBElement >> dragOffset [
	^ dragOffeset
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'is 5/17/2024 16:18'
}
WBElement >> dragOffset: anObject [
	dragOffeset := anObject
]

{
	#category : #'drag&drop',
	#'squeak_changestamp' : 'JK 5/15/2024 12:14'
}
WBElement >> handlesMouseDown: evt [
    ^ true.
]

{
	#category : #'drag&drop',
	#'squeak_changestamp' : 'ACL 5/17/2024 13:39'
}
WBElement >> makePopUp [

| popUp |
	
	popUp := WBPopUp new.
	self addMorph: 
	(WBPopUp new
		position: self topRight;
		yourself	);
		
		addMorph:
	(WBxButton new
		position: self topRight + (2.25@2.25) + ((popUp popUpButtons -1)*20@0);
		yourself	)	
]

{
	#category : #'drag&drop',
	#'squeak_changestamp' : 'si 5/17/2024 20:31'
}
WBElement >> mouseDown: anEvent [
	
	(self canvas elementToSpawn) ifNil:
		[self 
			addDropShadow;
			makePopUp;
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
	#'squeak_changestamp' : 'is 5/17/2024 16:18'
}
WBElement >> moveElement: anEvent [
	|newPosition |
	
 	newPosition := anEvent cursorPoint + self dragOffset.
	self position: newPosition
]

{
	#category : #'drag&drop',
	#'squeak_changestamp' : 'ACL 5/17/2024 15:12'
}
WBElement >> removePopUp [

	self submorphs do: [:m | m delete].
]
