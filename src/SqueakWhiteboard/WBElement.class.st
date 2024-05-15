Class {
	#name : #WBElement,
	#superclass : #Morph,
	#category : #SqueakWhiteboard
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'JK 5/15/2024 12:14'
}
WBElement >> handlesMouseDown: evt [
    ^ true.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'JK 5/15/2024 12:31'
}
WBElement >> mouseDown: anEvent [
	self addDropShadow.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'JK 5/15/2024 12:24'
}
WBElement >> mouseMove: anEvent [
    | newPosition |
    newPosition := anEvent cursorPoint - (self extent / 2).
    self position: newPosition
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'JK 5/15/2024 12:31'
}
WBElement >> mouseUp: anEvent [
	self removeDropShadow.
]
