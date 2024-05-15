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
	#'squeak_changestamp' : 'JK 5/15/2024 13:19'
}
WBElement >> mouseDown: anEvent [
	self addDropShadow.
	self dragOffeset: self position - anEvent cursorPoint.
	
]

{
	#category : #'drag&drop',
	#'squeak_changestamp' : 'JK 5/15/2024 13:19'
}
WBElement >> mouseMove: anEvent [
    | newPosition |
    newPosition := anEvent cursorPoint + self dragOffeset.
    self position: newPosition
]

{
	#category : #'drag&drop',
	#'squeak_changestamp' : 'JK 5/15/2024 12:31'
}
WBElement >> mouseUp: anEvent [
	self removeDropShadow.
]
