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
	#category : #defaults,
	#'squeak_changestamp' : 'ACL 7/12/2024 11:57'
}
WBEdgeOfLine class >> defaultCornerRadius [

	^100
]

{
	#category : #defaults,
	#'squeak_changestamp' : 'ACL 7/12/2024 11:57'
}
WBEdgeOfLine class >> defaultHeight [

	^10
]

{
	#category : #defaults,
	#'squeak_changestamp' : 'ACL 7/12/2024 11:57'
}
WBEdgeOfLine class >> defaultWidth [

	^10
]

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
	#'squeak_changestamp' : 'si 7/11/2024 15:22'
}
WBEdgeOfLine >> buttonFunctionalityForDelete [

	^ [:aButton | self line delete]
]

{
	#category : #'button creation',
	#'squeak_changestamp' : 'si 7/11/2024 15:46'
}
WBEdgeOfLine >> buttonsForPopUpBar [

	^ OrderedCollection new
		add: (WBButton new
			block: self buttonFunctionalityForDelete;
			backgroundColor: Color red;
			image: (ImageMorph new image: (self canvas images resize: WBImage loadDenyButtonImage to: self imageSize)));
		add: (WBButton new
			block: self buttonFunctionalityForCopy;
			backgroundColor: Color white;
			image: (ImageMorph new image: (self canvas images resize: WBImage loadSmallDuplicateButtonImage to: self imageSize)));
		add: (WBButton new
			block: self buttonFunctionalityForColorPalette;
			backgroundColor: Color white;
			image: (ImageMorph new image: (self canvas images resize: WBImage loadSmallColorsButtonImage to: self imageSize)));
		add: (WBButton new
			block: self buttonFunctionalityForArrowSwitch;
			backgroundColor: Color white;
			image: (ImageMorph new image: (self canvas images resize: WBImage loadSmallToggleArrowButtonImage to: self imageSize)));
		yourself
]

{
	#category : #geometry,
	#'squeak_changestamp' : 'ACL 7/11/2024 16:31'
}
WBEdgeOfLine >> checkArrowDirection [

	self line edges first = self	ifTrue: [self switchDirection].
	self line switchVisibilityOfArrowHead
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
	#'squeak_changestamp' : 'ACL 7/12/2024 11:58'
}
WBEdgeOfLine >> initialize [

	super initialize.
	self
		cornerStyle: #rounded;
		cornerRadius: self class defaultCornerRadius;
		width: self class defaultWidth;
		height: self class defaultHeight;
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
	#'squeak_changestamp' : 'si 7/11/2024 14:49'
}
WBEdgeOfLine >> setLayout [
	
	super setLayout.
	self borderWidth: 0
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
	#'squeak_changestamp' : 'ACL 7/12/2024 11:58'
}
WBEdgeOfLine >> switchDirection [

	self line switchDirection.
	self canvas deactivateElement.
	(self line edges second) showPopUp.
	self canvas activeElement: (self line edges second)
]
