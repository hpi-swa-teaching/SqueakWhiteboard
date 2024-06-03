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
	#category : #'SqueakWhiteboard-Core'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'JK 5/28/2024 11:10'
}
WBResizeFrame class >> newWithParent: aMorph [
	^self new initializeWithParent: aMorph.
	
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JK 6/3/2024 12:51'
}
WBResizeFrame class >> resizeWidth [
	^ ResizeWidth ifNil: [ResizeWidth := 20]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JK 6/3/2024 12:52'
}
WBResizeFrame class >> resizeWidth: aNumber [
	ResizeWidth := aNumber
	
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'JK 6/3/2024 13:13'
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
		add: (WBResizeBottom newWithParent: self).
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JK 6/3/2024 19:10'
}
WBResizeFrame >> element [
	^ element
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JK 6/3/2024 19:10'
}
WBResizeFrame >> element: anObject [
	element := anObject
]

{
	#category : #resize,
	#'squeak_changestamp' : 'JK 6/3/2024 19:10'
}
WBResizeFrame >> extent: aSize [

	self element extent: aSize.
	super extent: element extent.
	self positionHandles.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JK 5/28/2024 12:12'
}
WBResizeFrame >> handles [
	^ handles
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JK 5/28/2024 11:59'
}
WBResizeFrame >> handles: anObject [
	handles := anObject
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'JK 6/3/2024 19:10'
}
WBResizeFrame >> initializeWithParent: aMorph [
	super initialize.
	self
		element: aMorph;
		bounds: element bounds;
		color: Color transparent;
		borderColor: Color gray;
		borderWidth: 1;
		createHandles.
	self element addMorph: self.
]

{
	#category : #resize,
	#'squeak_changestamp' : 'JK 6/3/2024 19:10'
}
WBResizeFrame >> position: aPosition [
	
	self element position: aPosition.
	super position: element position.
	self positionHandles.
]

{
	#category : #resize,
	#'squeak_changestamp' : 'is 5/28/2024 15:33'
}
WBResizeFrame >> positionHandles [
	self handles ifNotNil: [self handles do: [:handle | handle setLayout]]
]

{
	#category : #resize,
	#'squeak_changestamp' : 'JK 6/3/2024 19:22'
}
WBResizeFrame >> resizeBottom: aYCoordinate [
	
	|newYCoordinate|
	newYCoordinate := (aYCoordinate min: self element canvas bottom) max: (self top + ResizeWidth).
	self height: newYCoordinate - self top.
]

{
	#category : #resize,
	#'squeak_changestamp' : 'JK 6/3/2024 19:20'
}
WBResizeFrame >> resizeLeft: aXCoordinate [
	
	|newXCoordinate|
	newXCoordinate := (aXCoordinate min: (self right - ResizeWidth)) max: self element canvas left.
	self width: self right - newXCoordinate.
	self left: newXCoordinate.
]

{
	#category : #resize,
	#'squeak_changestamp' : 'JK 6/3/2024 19:22'
}
WBResizeFrame >> resizeRight: aXCoordinate [
	
	|newXCoordinate|
	newXCoordinate := (aXCoordinate min:  self element canvas right) max: (self left + ResizeWidth). 
	self width: newXCoordinate - self left.
]

{
	#category : #resize,
	#'squeak_changestamp' : 'JK 6/3/2024 19:21'
}
WBResizeFrame >> resizeTop: aYCoordinate [
	
	|newYCoordinate|
	newYCoordinate := (aYCoordinate min: (self bottom - ResizeWidth)) max: self element canvas top.
	self height: self bottom - newYCoordinate.
	self top: newYCoordinate.
]
