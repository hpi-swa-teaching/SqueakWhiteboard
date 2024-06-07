Class {
	#name : #WBShapeChoosingButton,
	#superclass : #WBButtonForPopUp,
	#category : #'SqueakWhiteboard-Core'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'si 6/7/2024 22:16'
}
WBShapeChoosingButton >> clickFunctionality: anEvent [

	self popUp ifNil: [self makePopUp.]
	
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'si 6/7/2024 21:53'
}
WBShapeChoosingButton >> makeButtonWithNumber: aNumber [

		^WBToolbarButton new
			number: aNumber;
			canvas: self canvas;
			backgroundColor: Color lightBlue;
			clickedColor: Color blue;
			yourself.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'si 6/7/2024 22:24'
}
WBShapeChoosingButton >> makePopUp [

	self popUp:
		(WBToolbarPopUp new
			numberOfColumns: 1;
			"sizeOfPopUp: self element class sizeOfPopUpForStandardElement; should be like this, until buttons are reworked magic number"
			sizeOfPopUp: self owner buttonSize x;
			setDefaultValues;
			position: self topRight;
			comeToFront;
			addButtons: self makeShapeButtons;
			yourself).
		self addMorph: self popUp
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'si 6/7/2024 21:30'
}
WBShapeChoosingButton >> makeShapeButtons [

	^OrderedCollection new
		add: (self makeButtonWithNumber: 1);
		add: (self makeButtonWithNumber: 2);
		add: (self makeButtonWithNumber: 4);
		yourself.
]
