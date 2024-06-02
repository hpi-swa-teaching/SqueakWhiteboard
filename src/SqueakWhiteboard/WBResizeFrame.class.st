Class {
	#name : #WBResizeFrame,
	#superclass : #Morph,
	#instVars : [
		'parent',
		'handles'
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
	#category : #initialization,
	#'squeak_changestamp' : 'JK 5/28/2024 11:59'
}
WBResizeFrame >> createHandles [
	self handles: (Array
		with: (WBResizeTopLeft newWithParent: self)
		with: (WBResizeTopRight newWithParent: self)
		with: (WBResizeBottomLeft newWithParent: self)
		with: (WBResizeBottomRight newWithParent: self)
	).
]

{
	#category : #resize,
	#'squeak_changestamp' : 'JK 5/28/2024 12:27'
}
WBResizeFrame >> extent: aSize [
	super extent: aSize.
	self parent extent: aSize.
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
	#'squeak_changestamp' : 'JK 5/28/2024 12:27'
}
WBResizeFrame >> position: aPosition [
	self parent position: aPosition.
	super position: aPosition.
	self positionHandles.
]

{
	#category : #resize,
	#'squeak_changestamp' : 'is 5/28/2024 15:33'
}
WBResizeFrame >> positionHandles [
	self handles ifNotNil: [self handles do: [:handle | handle setLayout]]
]
