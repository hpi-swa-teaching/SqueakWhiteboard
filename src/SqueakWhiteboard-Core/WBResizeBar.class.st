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
	#category : #defaults,
	#'squeak_changestamp' : 'ACL 7/12/2024 12:08'
}
WBResizeBar class >> defaultExtent [

	^ 20 @ 20
	
]

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'is 6/23/2024 01:50'
}
WBResizeBar class >> newWithParent: aMorph [

	^ self new initializeWithParent: aMorph
	
]

{
	#category : #defaults,
	#'squeak_changestamp' : 'is 7/12/2024 20:01'
}
WBResizeBar class >> resizeCursor [

	^ self subclassResponsibility
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
	#'squeak_changestamp' : 'is 7/12/2024 19:59'
}
WBResizeBar >> handlesMouseDown: anEvent [

	^ true
]

{
	#category : #mouseEvents,
	#'squeak_changestamp' : 'is 7/12/2024 19:59'
}
WBResizeBar >> handlesMouseOver: anEvent [

	^ true
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'ACL 7/12/2024 12:09'
}
WBResizeBar >> initializeWithParent: aMorph [

	super initialize.
	self
 		extent: self class defaultExtent;
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
	#'squeak_changestamp' : 'is 7/12/2024 19:59'
}
WBResizeBar >> mouseLeave: anEvent [

	self defaultCursor
]

{
	#category : #mouseEvents,
	#'squeak_changestamp' : 'is 7/12/2024 19:59'
}
WBResizeBar >> mouseMove: anEvent [

	self resize: (anEvent cursorPoint - self lastPosition).
	self lastPosition: anEvent cursorPoint.
	self setLayout
]

{
	#category : #sizing,
	#'squeak_changestamp' : 'is 7/12/2024 20:00'
}
WBResizeBar >> resize: movement [

	^ self subclassResponsibility
]

{
	#category : #cursor,
	#'squeak_changestamp' : 'is 7/12/2024 15:09'
}
WBResizeBar >> resizeCursor [

	self class resizeCursor show
]

{
	#category : #sizing,
	#'squeak_changestamp' : 'nicloeser 7/10/2024 12:00'
}
WBResizeBar >> setLayout [

	self center: self frame position
]
