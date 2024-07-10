"
This class implements resizing a WBElement by dragging on its corners
"
Class {
	#name : #WBResizeHandle,
	#superclass : #EllipseMorph,
	#instVars : [
		'lastPosition',
		'frame'
	],
	#category : #'SqueakWhiteboard-Core',
	#'squeak_changestamp' : 'is 6/23/2024 02:25'
}

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'is 6/23/2024 01:57'
}
WBResizeHandle class >> newWithParent: aMorph [

	^ self new initializeWithParent: aMorph
	
]

{
	#category : #cursor,
	#'squeak_changestamp' : 'is 6/23/2024 01:59'
}
WBResizeHandle >> defaultCursor [

	Cursor normal show
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'is 6/23/2024 01:59'
}
WBResizeHandle >> frame [

	^ frame
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'is 6/23/2024 01:59'
}
WBResizeHandle >> frame: anObject [

	frame := anObject
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'is 6/23/2024 01:59'
}
WBResizeHandle >> handlesMouseDown: anEvent [

	^ true
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'is 6/23/2024 01:59'
}
WBResizeHandle >> handlesMouseOver: anEvent [

	^ true
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'is 6/23/2024 01:59'
}
WBResizeHandle >> initializeWithParent: aMorph [

	super initialize.
	self
 		extent: WBResizeFrame resizeWidth@WBResizeFrame resizeWidth;
		frame: aMorph;
		setLayout;
		color: Color white;
		borderWidth: 2;
		borderColor: Color gray.
	aMorph addMorph: self
		
	
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'is 6/23/2024 01:59'
}
WBResizeHandle >> lastPosition [

	^ lastPosition
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'is 6/23/2024 02:00'
}
WBResizeHandle >> lastPosition: aPosition [

	lastPosition := aPosition
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'is 6/23/2024 02:00'
}
WBResizeHandle >> mouseDown: anEvent [

	self lastPosition: anEvent cursorPoint
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'is 6/23/2024 02:00'
}
WBResizeHandle >> mouseEnter: anEvent [

	self resizeCursor
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'is 6/23/2024 02:00'
}
WBResizeHandle >> mouseLeave: aEvent [

	self defaultCursor
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'is 6/23/2024 02:00'
}
WBResizeHandle >> mouseMove: anEvent [

	self resize: (anEvent cursorPoint - self lastPosition).
	self lastPosition: anEvent cursorPoint.
	self setLayout
]

{
	#category : #resize,
	#'squeak_changestamp' : 'is 6/23/2024 02:00'
}
WBResizeHandle >> resize: movement [

	^ self SubclassResponsibility
]

{
	#category : #cursor,
	#'squeak_changestamp' : 'is 6/23/2024 02:01'
}
WBResizeHandle >> resizeCursor [

	^ self SubclassResponsibility
]

{
	#category : #resize,
	#'squeak_changestamp' : 'is 6/23/2024 02:01'
}
WBResizeHandle >> setLayout [

	^ self SubclassResponsibility
]
