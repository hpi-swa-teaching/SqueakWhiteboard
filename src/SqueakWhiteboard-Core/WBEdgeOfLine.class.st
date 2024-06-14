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
	#'squeak_changestamp' : 'si 6/14/2024 11:48'
}
WBEdgeOfLine >> addResizeFrame [
]

{
	#category : #buttonFunctionallities,
	#'squeak_changestamp' : 'si 6/14/2024 11:50'
}
WBEdgeOfLine >> buttonFunctionallityForCopy [

	^ [:aButton | self canvas deactivateElement. 
		self canvas spawnACopiedElement: self line copy At: aButton currentEvent cursorPoint.]
]

{
	#category : #buttonFunctionallities,
	#'squeak_changestamp' : 'si 6/14/2024 11:48'
}
WBEdgeOfLine >> buttonFunctionallityForDelete [

	^ [:aButton |self line delete]
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
