Class {
	#name : #WBNote,
	#superclass : #WBPolygonElement,
	#instVars : [
		'sizeOfNote',
		'sizeOfCorner'
	],
	#category : #'SqueakWhiteboard-Core'
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'is 6/18/2024 22:19'
}
WBNote class >> defaultSizeOfCorner [

	^20@20
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'si 6/3/2024 12:26'
}
WBNote >> color: aColor [

	self lineColor: aColor muchDarker.
	super color: aColor
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'is 6/18/2024 22:20'
}
WBNote >> createVertecies [

	self edges removeAll.
	self edges 
		add: self center - (self sizeOfNote/2);
	 	add: self center + (((self sizeOfNote x / 2) - self sizeOfCorner y) @ (-1* (self sizeOfNote y/ 2)));
		add: self center + ((self sizeOfNote x /  2) @ (-1 * ((self sizeOfNote y / 2) - self sizeOfCorner y)));
		add: self center + (((self sizeOfNote x / 2) - self sizeOfCorner x) @ (-1 * ((self sizeOfNote y / 2) - self sizeOfCorner y)));
		add: self center + (((self sizeOfNote x / 2) - self sizeOfCorner x) @ (-1* (self sizeOfNote y / 2)));
		add: self center + ((self sizeOfNote x / 2) @ (-1 * ((self sizeOfNote y / 2) - self sizeOfCorner y)));
		add: self center + ((self sizeOfNote x / 2) @ (self sizeOfNote y / 2));
		add: self center - ((self sizeOfNote x / 2) @  (-1 * (self sizeOfNote y / 2))).
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'is 6/18/2024 22:26'
}
WBNote >> initialize [

	super initialize.
	self 
		sizeOfNote: self class defaultSize;
	 	sizeOfCorner: self class defaultSizeOfCorner;
		lineColor: self color muchDarker; 
		createVertecies;
		makeShape;
		initializeTextfield
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'is 6/18/2024 00:01'
}
WBNote >> makeShape [

	| arrayOfEdgePoints indexOfArray |
	
	arrayOfEdgePoints := Array new: self edges size.
	indexOfArray := 1.
	self edges do: [:m | arrayOfEdgePoints at: indexOfArray put: m.
		indexOfArray := indexOfArray + 1.].
	self setVertices: arrayOfEdgePoints

]

{
	#category : #accessing,
	#'squeak_changestamp' : 'is 6/18/2024 00:02'
}
WBNote >> sizeOfCorner [

	^ sizeOfCorner
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'si 6/3/2024 12:27'
}
WBNote >> sizeOfCorner: aNumber [

	sizeOfCorner := aNumber
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'is 6/18/2024 00:02'
}
WBNote >> sizeOfNote [

	^ sizeOfNote
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'si 6/3/2024 12:27'
}
WBNote >> sizeOfNote: aNumber [

	sizeOfNote := aNumber 
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'is 6/18/2024 18:18'
}
WBNote >> supportsText [

	^ supportsText ifNil: [ supportsText := true ]
]
