Class {
	#name : #WBEdgeOfLine,
	#superclass : #WBStandartElement,
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
	#category : #'button functionalities',
	#'squeak_changestamp' : 'si 6/17/2024 11:31'
}
WBEdgeOfLine >> buttonFunctionalityForColor [

	^ [:aButton |self line color: aButton color]
]

{
	#category : #'button functionalities',
	#'squeak_changestamp' : 'si 6/17/2024 11:32'
}
WBEdgeOfLine >> buttonFunctionalityForCopy [

	^ [:aButton | self canvas deactivateElement. 
		self canvas spawnACopiedElement: self line copy At: aButton currentEvent cursorPoint.]
]

{
	#category : #'button functionalities',
	#'squeak_changestamp' : 'si 6/17/2024 11:32'
}
WBEdgeOfLine >> buttonFunctionalityForDelete [

	^ [:aButton |self line delete]
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
	#category : #'event handling',
	#'squeak_changestamp' : 'si 6/14/2024 11:46'
}
WBEdgeOfLine >> mouseMove: anEvent [

	super dragMove: anEvent.
	self line updateEdges
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'si 5/20/2024 13:38'
}
WBEdgeOfLine >> mouseUp: anEvent [

	super mouseUp: anEvent.
	self line updateEdges
]
