Class {
	#name : #WBResizeFrame,
	#superclass : #Morph,
	#instVars : [
		'parent',
		'handles'
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
	#category : #resize,
	#'squeak_changestamp' : 'JK 6/3/2024 14:21'
}
WBResizeFrame >> extent: aSize [

	self parent extent: aSize.
	super extent: parent extent.
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
	#'squeak_changestamp' : 'JK 5/28/2024 22:10'
}
WBResizeFrame >> initializeWithParent: aMorph [
	super initialize.
	self
		parent: aMorph;
		bounds: parent bounds;
		color: Color transparent;
		borderColor: Color gray;
		borderWidth: 1;
		createHandles.
	self parent addMorph: self.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JK 5/28/2024 11:11'
}
WBResizeFrame >> parent [
	^ parent
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JK 5/28/2024 11:11'
}
WBResizeFrame >> parent: anObject [
	parent := anObject
]

{
	#category : #resize,
	#'squeak_changestamp' : 'JK 6/3/2024 14:01'
}
WBResizeFrame >> position: aPosition [
	
	self parent position: aPosition.
	super position: parent position.
	self positionHandles.
]

{
	#category : #resize,
	#'squeak_changestamp' : 'is 5/28/2024 15:33'
}
WBResizeFrame >> positionHandles [
	self handles ifNotNil: [self handles do: [:handle | handle setLayout]]
]
