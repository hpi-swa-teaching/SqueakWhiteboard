Class {
	#name : #WBResizeBar,
	#superclass : #Morph,
	#instVars : [
		'element',
		'lastPosition'
	],
	#category : #'SqueakWhiteboard-Core'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'JK 5/27/2024 14:53'
}
WBResizeBar class >> newWithParent: aMorph [
	^self new initializeWithParent: aMorph.
	
]

{
	#category : #cursor,
	#'squeak_changestamp' : 'JK 5/27/2024 15:46'
}
WBResizeBar >> defaultCursor [
	Cursor normal show.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JK 5/27/2024 16:21'
}
WBResizeBar >> element [
	^ element
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JK 5/27/2024 16:21'
}
WBResizeBar >> element: anObject [
	element := anObject
]

{
	#category : #mouseEvents,
	#'squeak_changestamp' : 'JK 5/28/2024 12:28'
}
WBResizeBar >> handlesMouseDown: aEvent [
	^true
]

{
	#category : #mouseEvents,
	#'squeak_changestamp' : 'JK 5/28/2024 12:28'
}
WBResizeBar >> handlesMouseOver: aEvent [
	^true.
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'JK 6/3/2024 13:16'
}
WBResizeBar >> initializeWithParent: aMorph [
	super initialize.
	self
 		extent: 20@20;
		element: aMorph;
		setLayout;
		color: Color transparent.
		
	aMorph addMorph: self.
		
	
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JK 5/27/2024 16:56'
}
WBResizeBar >> lastPosition [
	^ lastPosition
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JK 5/27/2024 16:56'
}
WBResizeBar >> lastPosition: anObject [
	lastPosition := anObject
]

{
	#category : #mouseEvents,
	#'squeak_changestamp' : 'JK 5/28/2024 12:28'
}
WBResizeBar >> mouseDown: mouseEvent [
	self lastPosition: mouseEvent cursorPoint.
]

{
	#category : #mouseEvents,
	#'squeak_changestamp' : 'JK 5/27/2024 16:05'
}
WBResizeBar >> mouseEnter: aEvent [
	self resizeCursor.
]

{
	#category : #mouseEvents,
	#'squeak_changestamp' : 'JK 5/27/2024 16:06'
}
WBResizeBar >> mouseLeave: aEvent [
	self defaultCursor.
]

{
	#category : #mouseEvents,
	#'squeak_changestamp' : 'is 5/28/2024 15:33'
}
WBResizeBar >> mouseMove: mouseEvent [
	self resize: (mouseEvent cursorPoint - self lastPosition).
	self lastPosition: mouseEvent cursorPoint.
	self setLayout.
]

{
	#category : #sizing,
	#'squeak_changestamp' : 'JK 5/28/2024 12:31'
}
WBResizeBar >> resize: movement [
	^SubclassResponsibility.
]

{
	#category : #cursor,
	#'squeak_changestamp' : 'JK 5/27/2024 16:08'
}
WBResizeBar >> resizeCursor [
	Cursor move show.
]

{
	#category : #sizing,
	#'squeak_changestamp' : 'is 5/28/2024 15:33'
}
WBResizeBar >> setLayout [
	self center: element position.
]
