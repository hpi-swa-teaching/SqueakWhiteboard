Class {
	#name : #WBResizeHandle,
	#superclass : #EllipseMorph,
	#instVars : [
		'lastPosition',
		'frame'
	],
	#category : #'SqueakWhiteboard-Core'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'is 6/18/2024 18:05'
}
WBResizeHandle class >> newWithParent: aMorph [

	^ self new initializeWithParent: aMorph.
	
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
	#'squeak_changestamp' : 'JK 6/3/2024 19:01'
}
WBResizeHandle >> frame [
	^ frame
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JK 6/3/2024 19:02'
}
WBResizeHandle >> frame: anObject [
	frame := anObject
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
	#'squeak_changestamp' : 'is 6/18/2024 18:05'
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
	#'squeak_changestamp' : 'is 6/18/2024 17:52'
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
	#'squeak_changestamp' : 'JK 6/3/2024 19:03'
}
WBResizeHandle >> resizeCursor [
	^SubclassResponsibility
]

{
	#category : #sizing,
	#'squeak_changestamp' : 'JK 6/3/2024 19:04'
}
WBResizeHandle >> setLayout [
	^SubclassResponsibility
]
