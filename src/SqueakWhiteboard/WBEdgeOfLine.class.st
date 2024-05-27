Class {
	#name : #WBEdgeOfLine,
	#superclass : #WBElement,
	#instVars : [
		'line'
	],
	#category : #SqueakWhiteboard
}

{
	#category : #popUpBar,
	#'squeak_changestamp' : 'si 5/27/2024 12:06'
}
WBEdgeOfLine >> buttonsForPopUpBar [

	^OrderedCollection new
		add: (WBDeleteButton new
			canvas: self canvas;
			element: self line);
		add: (WBColorPaletteButton new
			canvas: self canvas;
			element: self line);
		add: (WBCopyButton new
			canvas: self canvas;
			element: self line);
		yourself.
]

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
	#category : #popUpBar,
	#'squeak_changestamp' : 'si 5/27/2024 11:49'
}
WBEdgeOfLine >> makeElementPopUp [

	self line popUpMenu: (WBElementPopUp new
		setDefaultValues;
		position: self topRight;
		addButtons: self buttonsForPopUpBar;
		yourself).
]

{
	#category : #mouseEvents,
	#'squeak_changestamp' : 'si 5/27/2024 21:46'
}
WBEdgeOfLine >> mouseDown: anEvent [
	
	(self canvas elementToSpawn) ifNil:
		[self canvas deactivateElement.
		self
			addDropShadow;
			makeElementPopUp;
			comeToFront;
			dragOffset: self position - anEvent cursorPoint.
		self canvas activeElement: self line.].
	(self canvas elementToSpawn) ifNotNil:
		[self canvas dropElement]
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
