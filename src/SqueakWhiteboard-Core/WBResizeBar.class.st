"
This class implements resizing a WBElement by dragging on its sides
"
Class {
	#name : #WBResizeBar,
	#superclass : #Morph,
	#instVars : [
		'lastPosition',
		'frame'
	],
	#category : #'SqueakWhiteboard-Core',
	#'squeak_changestamp' : 'is 6/23/2024 02:24'
}

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'is 6/23/2024 01:50'
}
WBResizeBar class >> newWithParent: aMorph [

	^ self new initializeWithParent: aMorph
	
]

{
	#category : #cursor,
	#'squeak_changestamp' : 'is 6/23/2024 01:53'
}
WBResizeBar >> defaultCursor [

	Cursor normal show
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JK 6/30/2024 21:20'
}
WBResizeBar >> frame [

	^ frame
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JK 6/30/2024 21:20'
}
WBResizeBar >> frame: anElement [

	frame := anElement
]

{
	#category : #mouseEvents,
	#'squeak_changestamp' : 'is 6/23/2024 01:53'
}
WBResizeBar >> handlesMouseDown: aEvent [

	^ true
]

{
	#category : #mouseEvents,
	#'squeak_changestamp' : 'is 6/23/2024 01:53'
}
WBResizeBar >> handlesMouseOver: aEvent [

	^ true
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'is 6/23/2024 01:53'
}
WBResizeBar >> initializeWithParent: aMorph [

	super initialize.
	self
 		extent: 20@20;
		frame: aMorph;
		setLayout;
		color: Color transparent.
	aMorph addMorph: self
		
	
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'is 6/23/2024 01:53'
}
WBResizeBar >> lastPosition [

	^ lastPosition
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'is 6/23/2024 01:53'
}
WBResizeBar >> lastPosition: anObject [

	lastPosition := anObject
]

{
	#category : #mouseEvents,
	#'squeak_changestamp' : 'is 6/23/2024 01:53'
}
WBResizeBar >> mouseDown: mouseEvent [

	self lastPosition: mouseEvent cursorPoint
]

{
	#category : #mouseEvents,
	#'squeak_changestamp' : 'is 6/23/2024 01:53'
}
WBResizeBar >> mouseEnter: aEvent [

	self resizeCursor
]

{
	#category : #mouseEvents,
	#'squeak_changestamp' : 'is 6/23/2024 01:53'
}
WBResizeBar >> mouseLeave: aEvent [

	self defaultCursor
]

{
	#category : #mouseEvents,
	#'squeak_changestamp' : 'is 6/23/2024 01:53'
}
WBResizeBar >> mouseMove: mouseEvent [

	self resize: (mouseEvent cursorPoint - self lastPosition).
	self lastPosition: mouseEvent cursorPoint.
	self setLayout
]

{
	#category : #sizing,
	#'squeak_changestamp' : 'is 6/23/2024 01:54'
}
WBResizeBar >> resize: movement [

	^ self SubclassResponsibility
]

{
	#category : #cursor,
	#'squeak_changestamp' : 'is 6/23/2024 01:53'
}
WBResizeBar >> resizeCursor [

	Cursor move show
]

{
	#category : #sizing,
	#'squeak_changestamp' : 'JK 6/30/2024 21:20'
}
WBResizeBar >> setLayout [

	self center: frame position
]
