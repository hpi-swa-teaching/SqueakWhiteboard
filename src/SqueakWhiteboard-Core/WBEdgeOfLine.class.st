"
This class represents the two end points of a WBLine
"
Class {
	#name : #WBEdgeOfLine,
	#superclass : #WBRectangularElement,
	#instVars : [
		'line'
	],
	#category : #'SqueakWhiteboard-Core',
	#'squeak_changestamp' : 'is 6/23/2024 02:19'
}

{
	#category : #resize,
	#'squeak_changestamp' : 'ACL 7/10/2024 12:08'
}
WBEdgeOfLine >> addResizeFrame [
"overwrites Method because the line should not have a resize frame."
]

{
	#category : #'button functionalities',
	#'squeak_changestamp' : 'si 6/21/2024 00:07'
}
WBEdgeOfLine >> buttonFunctionalityForArrowSwitch [

	^ [:aButton | self checkArrwoDirection]
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
	#'squeak_changestamp' : 'si 7/10/2024 17:30'
}
WBEdgeOfLine >> buttonFunctionalityForCopy [
	
	^ [:aButton | self canvas deactivateElement.
		self canvas spawnAnElement: (self line veryDeepCopy state: 3) At: aButton currentEvent]
]

{
	#category : #'button functionalities',
	#'squeak_changestamp' : 'si 6/17/2024 11:32'
}
WBEdgeOfLine >> buttonFunctionalityForDelete [

	^ [:aButton |self line delete]
]

{
	#category : #'button creation',
	#'squeak_changestamp' : 'is 7/9/2024 21:14'
}
WBEdgeOfLine >> buttonsForPopUpBar [
	| aCollection |
	
	aCollection := super buttonsForPopUpBar.
	aCollection add: (WBButton new
			block: self buttonFunctionalityForArrowSwitch;
			backgroundColor: Color white;
			image: (ImageMorph new image: (self canvas images resize: WBImage loadSmallToggleArrowButtonImage to: self imageSize))).
	aCollection removeAt: 4. 
	^ aCollection
]

{
	#category : #geometry,
	#'squeak_changestamp' : 'is 6/23/2024 01:45'
}
WBEdgeOfLine >> checkArrwoDirection [

	(self line edges at: 1) = self
		ifTrue: 
			[self switchDirection.
			self line switchVisibilityOfArrowHead]
		ifFalse: [self line switchVisibilityOfArrowHead] 
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'si 7/7/2024 17:52'
}
WBEdgeOfLine >> handlesMouseOver: anEvent [

	^ true
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'si 6/20/2024 23:26'
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
	#'squeak_changestamp' : 'is 6/18/2024 19:03'
}
WBEdgeOfLine >> line [

	^ line
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'is 6/18/2024 19:03'
}
WBEdgeOfLine >> line: aLine [

	line := aLine
]

{
	#category : #'button creation',
	#'squeak_changestamp' : 'si 7/5/2024 11:52'
}
WBEdgeOfLine >> makeColorButtons [

	^ OrderedCollection new
		add: (self makeColorButtonWithColor: Color black);
		add: (self makeColorButtonWithColor: Color gray darker);
		add: (self makeColorButtonWithColor: Color gray lighter);
		add: (self makeColorButtonWithColor: Color red);
		add: (self makeColorButtonWithColor: Color orange);
		add: (self makeColorButtonWithColor: Color yellow);
		add: (self makeColorButtonWithColor: Color green);
		add: (self makeColorButtonWithColor: Color cyan);
		add: (self makeColorButtonWithColor: Color blue);
		add: (self makeColorButtonWithColor: Color ocean);
		add: (self makeColorButtonWithColor: Color magenta);
		add: (self makeColorButtonWithColor: Color magenta muchDarker);
		yourself
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'si 7/7/2024 17:54'
}
WBEdgeOfLine >> mouseEnter: anEvent [

	self line edges do: [:d | d morph color: self line morph borderColor]
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'si 7/7/2024 17:49'
}
WBEdgeOfLine >> mouseLeave: anEvent [

	self line edges do: [:d | d morph color: Color transparent]
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'nicloeser 7/9/2024 18:15'
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

{
	#category : #initialization,
	#'squeak_changestamp' : 'si 6/20/2024 23:24'
}
WBEdgeOfLine >> setDefaultValues [

	self
		cornerStyle: #rounded;
		cornerRadius: 100;
		width: 10;
		height: 10;
		color: Color black;
		supportsText: false
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'si 7/7/2024 17:53'
}
WBEdgeOfLine >> setupEventHandling [
"pass event triggers from the element itself to the methods of the WBElement"
	
	super setupEventHandling.
	self morph on: #mouseEnter send: #mouseEnter: to: self.
	self morph on: #mouseLeave send: #mouseLeave: to: self
]

{
	#category : #geometry,
	#'squeak_changestamp' : 'si 6/21/2024 00:24'
}
WBEdgeOfLine >> switchDirection [

	self line switchDirection.
	self canvas deactivateElement.
	(self line edges at: 2) showPopUp.
	self canvas activeElement: (self line edges at: 2)
]
