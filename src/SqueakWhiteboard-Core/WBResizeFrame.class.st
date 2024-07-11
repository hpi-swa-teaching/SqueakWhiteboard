"
This class creates resize related handles for a WBElement
"
Class {
	#name : #WBResizeFrame,
	#superclass : #Morph,
	#instVars : [
		'handles',
		'element'
	],
	#classVars : [
		'ResizeWidth'
	],
	#category : #'SqueakWhiteboard-Core',
	#'squeak_changestamp' : 'is 6/23/2024 02:25'
}

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'is 6/23/2024 01:56'
}
WBResizeFrame class >> newWithParent: aMorph [

	^ self new initializeWithParent: aMorph
	
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'is 6/23/2024 01:56'
}
WBResizeFrame class >> resizeWidth [

	^ ResizeWidth ifNil: [ResizeWidth := 20]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'is 6/23/2024 01:56'
}
WBResizeFrame class >> resizeWidth: aNumber [

	ResizeWidth := aNumber
	
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'is 6/23/2024 01:57'
}
WBResizeFrame >> createHandles [

	self handles: OrderedCollection new.
	self handles
		add: (WBResizeTopLeft newWithParent: self);
		add: (WBResizeTopRight newWithParent: self);
		add: (WBResizeBottomLeft newWithParent: self);
		add: (WBResizeBottomRight newWithParent: self);
		add: (WBResizeLeft newWithParent: self);
		add: (WBResizeRight newWithParent: self);
		add: (WBResizeTop newWithParent: self);
		add: (WBResizeBottom newWithParent: self)
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'is 6/18/2024 17:56'
}
WBResizeFrame >> element [

	^ element
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'is 6/18/2024 17:54'
}
WBResizeFrame >> element: anElement [

	element := anElement
]

{
	#category : #resize,
	#'squeak_changestamp' : 'is 6/18/2024 18:02'
}
WBResizeFrame >> extent: aSize [

	self element extent: aSize.
	super extent: aSize.
	self positionHandles
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'is 6/18/2024 17:53'
}
WBResizeFrame >> handles [

	^ handles
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'is 6/18/2024 17:53'
}
WBResizeFrame >> handles: anObject [

	handles := anObject
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'nicloeser 7/10/2024 12:00'
}
WBResizeFrame >> initializeWithParent: aMorph [

	super initialize.
	self
		element: aMorph;
		bounds: self element bounds;
		color: Color transparent;
		borderColor: Color gray;
		borderWidth: 1;
		createHandles.
	self element addMorph: self
]

{
	#category : #resize,
	#'squeak_changestamp' : 'nicloeser 7/10/2024 12:01'
}
WBResizeFrame >> position: aPosition [
	
	self element position: aPosition.
	super position: self element position.
	self positionHandles
]

{
	#category : #resize,
	#'squeak_changestamp' : 'is 6/23/2024 01:57'
}
WBResizeFrame >> positionHandles [

	self handles ifNotNil: [self handles do: [:handle | handle setLayout]]
]

{
	#category : #resize,
	#'squeak_changestamp' : 'is 6/23/2024 01:57'
}
WBResizeFrame >> resizeBottom: aYCoordinate [
	| newYCoordinate |
	
	newYCoordinate := (aYCoordinate min: self element canvas bottom) max: (self top + ResizeWidth).
	self height: newYCoordinate - self top
]

{
	#category : #resize,
	#'squeak_changestamp' : 'is 6/23/2024 01:58'
}
WBResizeFrame >> resizeLeft: aXCoordinate [
	| newXCoordinate |
	
	newXCoordinate := (aXCoordinate min: (self right - ResizeWidth)) max: self element canvas left.
	self width: self right - newXCoordinate.
	self left: newXCoordinate
]

{
	#category : #resize,
	#'squeak_changestamp' : 'is 6/23/2024 01:58'
}
WBResizeFrame >> resizeRight: aXCoordinate [
	| newXCoordinate |
	
	newXCoordinate := (aXCoordinate min:  self element canvas right) max: (self left + ResizeWidth). 
	self width: newXCoordinate - self left
]

{
	#category : #resize,
	#'squeak_changestamp' : 'is 6/23/2024 01:58'
}
WBResizeFrame >> resizeTop: aYCoordinate [
	| newYCoordinate |
	
	newYCoordinate := (aYCoordinate min: (self bottom - ResizeWidth)) max: self element canvas top.
	self height: self bottom - newYCoordinate.
	self top: newYCoordinate
]
