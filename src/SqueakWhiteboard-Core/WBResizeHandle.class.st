Class {
	#name : #WBResizeHandle,
	#superclass : #EllipseMorph,
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
WBResizeHandle class >> newWithParent: aMorph [
	^self new initializeWithParent: aMorph.
	
]

{
	#category : #cursor,
	#'squeak_changestamp' : 'JK 5/27/2024 15:46'
}
WBResizeHandle >> defaultCursor [
	Cursor normal show.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JK 5/27/2024 16:21'
}
WBResizeHandle >> element [
	^ element
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JK 5/27/2024 16:21'
}
WBResizeHandle >> element: anObject [
	element := anObject
]

{
	#category : #mouseEvents,
	#'squeak_changestamp' : 'JK 5/28/2024 12:28'
}
WBResizeHandle >> handlesMouseDown: aEvent [
	^true
]

{
	#category : #mouseEvents,
	#'squeak_changestamp' : 'JK 5/28/2024 12:28'
}
WBResizeHandle >> handlesMouseOver: aEvent [
	^true.
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'JK 5/28/2024 22:07'
}
WBResizeHandle >> initializeWithParent: aMorph [
	super initialize.
	self
 		extent: 20@20;
		element: aMorph;
		setLayout;
		color: Color white;
		borderWidth: 2;
		borderColor: Color gray.
		
	aMorph addMorph: self.
		
	
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JK 5/27/2024 16:56'
}
WBResizeHandle >> lastPosition [
	^ lastPosition
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JK 5/27/2024 16:56'
}
WBResizeHandle >> lastPosition: anObject [
	lastPosition := anObject
]

{
	#category : #mouseEvents,
	#'squeak_changestamp' : 'JK 5/28/2024 12:28'
}
WBResizeHandle >> mouseDown: mouseEvent [
	self lastPosition: mouseEvent cursorPoint.
]

{
	#category : #mouseEvents,
	#'squeak_changestamp' : 'JK 5/27/2024 16:05'
}
WBResizeHandle >> mouseEnter: aEvent [
	self resizeCursor.
]

{
	#category : #mouseEvents,
	#'squeak_changestamp' : 'JK 5/27/2024 16:06'
}
WBResizeHandle >> mouseLeave: aEvent [
	self defaultCursor.
]

{
	#category : #mouseEvents,
	#'squeak_changestamp' : 'is 5/28/2024 15:33'
}
WBResizeHandle >> mouseMove: mouseEvent [
	self resize: (mouseEvent cursorPoint - self lastPosition).
	self lastPosition: mouseEvent cursorPoint.
	self setLayout.
]

{
	#category : #sizing,
	#'squeak_changestamp' : 'JK 5/28/2024 12:31'
}
WBResizeHandle >> resize: movement [
	^SubclassResponsibility.
]

{
	#category : #cursor,
	#'squeak_changestamp' : 'JK 5/27/2024 16:08'
}
WBResizeHandle >> resizeCursor [
	Cursor move show.
]

{
	#category : #sizing,
	#'squeak_changestamp' : 'is 5/28/2024 15:33'
}
WBResizeHandle >> setLayout [
	self center: element position.
]