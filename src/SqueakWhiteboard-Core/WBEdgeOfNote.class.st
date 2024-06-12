Class {
	#name : #WBEdgeOfNote,
	#superclass : #WBElement,
	#category : #'SqueakWhiteboard-Core'
}

{
	#category : #initialization,
	#'squeak_changestamp' : 'is 6/12/2024 16:27'
}
WBEdgeOfNote >> initialize [
	
	super initialize.
	self
		extent: 5 @ 5;
		cornerStyle: #rounded;
		cornerRadius: 100;
		color: Color black;
		supportsText: false
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'si 6/3/2024 13:31'
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
	#'squeak_changestamp' : 'si 6/3/2024 13:31'
}
WBEdgeOfNote >> mouseMove: anEvent [

	"here scaling could be implemented"
	self moveElement: anEvent.
	self owner makeShape
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'si 6/3/2024 13:32'
}
WBEdgeOfNote >> mouseUp: anEvent [
	
	self removeDropShadow.
	self owner makeShape
]
