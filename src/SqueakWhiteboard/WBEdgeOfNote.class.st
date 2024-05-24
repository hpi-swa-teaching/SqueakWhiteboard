Class {
	#name : #WBEdgeOfNote,
	#superclass : #WBElement,
	#category : #SqueakWhiteboard
}

{
	#category : #initialization,
	#'squeak_changestamp' : 'si 5/24/2024 15:00'
}
WBEdgeOfNote >> initialize [
	
	super initialize.
	self
		extent: 5 @ 5;
		cornerStyle: #rounded;
		cornerRadius: 100;
		color: Color black
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'si 5/24/2024 14:49'
}
WBEdgeOfNote >> mouseDown: anEvent [
	
	(self canvas elementToSpawn) ifNil:
		[self
			addDropShadow;
			comeToFront;
			dragOffset: self position - anEvent cursorPoint.].
	(self canvas elementToSpawn) ifNotNil:
		[self canvas dropElement]
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'si 5/24/2024 14:55'
}
WBEdgeOfNote >> mouseMove: anEvent [

	"here scaling could be implemented"
	self moveElement: anEvent.
	self owner makeShape
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'si 5/24/2024 14:51'
}
WBEdgeOfNote >> mouseUp: anEvent [
	
	self removeDropShadow.
	self owner makeShape
]
