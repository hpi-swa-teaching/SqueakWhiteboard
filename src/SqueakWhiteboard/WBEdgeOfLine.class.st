Class {
	#name : #WBEdgeOfLine,
	#superclass : #WBElement,
	#instVars : [
		'line'
	],
	#category : #SqueakWhiteboard
}

{
	#category : #deleting,
	#'squeak_changestamp' : 'si 5/20/2024 13:46'
}
WBEdgeOfLine >> delete [

	self line delete
]

{
	#category : #deleting,
	#'squeak_changestamp' : 'si 5/20/2024 13:49'
}
WBEdgeOfLine >> deleteSelf [

	super delete
]

{
	#category : #mouseEvents,
	#'squeak_changestamp' : 'si 5/20/2024 15:37'
}
WBEdgeOfLine >> handlesMouseOver: anEvent [

	^true
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'si 5/20/2024 15:41'
}
WBEdgeOfLine >> initialize [
	
	super initialize.
	self
		cornerStyle: #rounded;
		cornerRadius: 100;
		width: 10;
		height: 10;
		color: Color black.
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
	#'squeak_changestamp' : 'si 5/20/2024 13:38'
}
WBEdgeOfLine >> mouseMove: anEvent [

	super mouseMove: anEvent.
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
