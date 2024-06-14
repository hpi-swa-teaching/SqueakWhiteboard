Class {
	#name : #WBEdgeOfLine,
	#superclass : #WBElement,
	#instVars : [
		'line'
	],
	#category : #'SqueakWhiteboard-Core'
}

{
	#category : #resize,
	#'squeak_changestamp' : 'si 6/14/2024 14:59'
}
WBEdgeOfLine >> addResizeFrame [
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'si 6/14/2024 15:02'
}
WBEdgeOfLine >> color: aColor [

	self line 
		ifNotNil: [self line color: aColor]
		ifNil: [super color: aColor]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'si 6/14/2024 15:00'
}
WBEdgeOfLine >> colorSelf: aColor [

	super color: aColor
]

{
	#category : #copying,
	#'squeak_changestamp' : 'si 6/14/2024 15:07'
}
WBEdgeOfLine >> copy [

	^ self line copy
]

{
	#category : #delete,
	#'squeak_changestamp' : 'si 6/14/2024 14:56'
}
WBEdgeOfLine >> delete [

	self line delete 
]

{
	#category : #delete,
	#'squeak_changestamp' : 'si 6/14/2024 14:57'
}
WBEdgeOfLine >> deleteSelf [

	super delete
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'is 6/12/2024 16:27'
}
WBEdgeOfLine >> initialize [
	
	super initialize.
	self
		cornerStyle: #rounded;
		cornerRadius: 100;
		width: 10;
		height: 10;
		color: Color black;
		supportsText: false
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'si 5/20/2024 13:31'
}
WBEdgeOfLine >> line [

	^line
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'si 5/20/2024 13:30'
}
WBEdgeOfLine >> line: aWBLine [

	line := aWBLine
]

{
	#category : #mouseEvents,
	#'squeak_changestamp' : 'si 6/14/2024 11:46'
}
WBEdgeOfLine >> mouseMove: anEvent [

	super dragMove: anEvent.
	self line updateEdges
]

{
	#category : #mouseEvents,
	#'squeak_changestamp' : 'si 5/20/2024 13:38'
}
WBEdgeOfLine >> mouseUp: anEvent [

	super mouseUp: anEvent.
	self line updateEdges
]
