Class {
	#name : #WBElement,
	#superclass : #Morph,
	#instVars : [
		'dragOffeset'
	],
	#category : #SqueakWhiteboard
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'JK 5/15/2024 13:16'
}
WBElement >> dragOffeset [
	^ dragOffeset
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JK 5/15/2024 13:16'
}
WBElement >> dragOffeset: anObject [
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
	#'squeak_changestamp' : 'ACL 5/17/2024 15:03'
}
WBElement >> mouseDown: anEvent [
	self addDropShadow;
		dragOffeset: self position - anEvent cursorPoint;
		makePopUp.
	
	
]

{
	#category : #'drag&drop',
	#'squeak_changestamp' : 'ACL 5/17/2024 14:28'
}
WBElement >> mouseMove: anEvent [
    
	| newPosition |
	newPosition := anEvent cursorPoint + self dragOffeset.
	self position: newPosition
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
	#'squeak_changestamp' : 'ACL 5/17/2024 15:12'
}
WBElement >> removePopUp [

	self submorphs do: [:m | m delete].
]
