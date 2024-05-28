Class {
	#name : #WBMenuBar,
	#superclass : #WBElement,
	#category : #SqueakWhiteboard
}

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'is 5/28/2024 10:30'
}
WBMenuBar class >> newWithCanvas: aCanvas [

	^ WBMenuBar basicNew initializeWithCanvas: aCanvas
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'is 5/28/2024 10:33'
}
WBMenuBar >> initializeWithCanvas: aCanvas [

	super initialize.
	self canvas: aCanvas
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'is 5/28/2024 10:38'
}
WBMenuBar >> moveElement: anEvent [
	|newPosition |
	
 	newPosition := anEvent cursorPoint + self dragOffset.
	self canvas position: newPosition
]
