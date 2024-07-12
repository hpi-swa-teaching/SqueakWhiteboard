Class {
	#name : #WBMoveElementTests,
	#superclass : #WBElementTests,
	#instVars : [
		'element'
	],
	#category : #'SqueakWhiteboard-Tests'
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'si 7/12/2024 09:33'
}
WBMoveElementTests >> element [

	^ element
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'si 7/12/2024 09:33'
}
WBMoveElementTests >> element: anElement [

	element := anElement
]

{
	#category : #setUp,
	#'squeak_changestamp' : 'si 7/12/2024 09:37'
}
WBMoveElementTests >> setUp [

	super setUp.
	self canvas spawnAnElement: (WBRectangularElement newWithCanvas: self canvas) At: self artificialMouseClick.
	self canvas dropElement: self artificialMouseClick.
	self element: (self canvas elements at: 1).
]

{
	#category : #testing,
	#'squeak_changestamp' : 'si 7/12/2024 09:38'
}
WBMoveElementTests >> testDragOffset [

	self element mouseDown: self artificialMouseClick.
	
	self assert: self element dragOffset = (self element position - self artificialMouseClick cursorPoint) 
]

{
	#category : #testing,
	#'squeak_changestamp' : 'si 7/12/2024 09:45'
}
WBMoveElementTests >> testDropShadow [
	
	self element mouseDown: self artificialMouseClick.
	
	self assert: self element morph hasDropShadow 
]

{
	#category : #testing,
	#'squeak_changestamp' : 'si 7/12/2024 09:43'
}
WBMoveElementTests >> testMouseMove [
	| oldPosition |
	
	oldPosition := self element position. 
	self element mouseDown: self artificialMouseClick.
	self element mouseMove: (self artificialMouseClick position: self artificialMouseClick position + (5 @ 5)).
	self element mouseUp: (self artificialMouseClick position: self artificialMouseClick position + (5 @ 5)).
	
	self assert: self element position = (oldPosition + (5 @ 5)) 
]

{
	#category : #testing,
	#'squeak_changestamp' : 'si 7/12/2024 09:45'
}
WBMoveElementTests >> testRemoveDropShadow [
	
	self element mouseDown: self artificialMouseClick.
	self element mouseUp: self artificialMouseClick.
	
	self assert: self element morph hasDropShadow = false
]
