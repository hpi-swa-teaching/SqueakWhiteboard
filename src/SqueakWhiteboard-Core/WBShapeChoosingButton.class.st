Class {
	#name : #WBShapeChoosingButton,
	#superclass : #WBButtonForPopUp,
	#category : #'SqueakWhiteboard-Core'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'si 6/7/2024 23:26'
}
WBShapeChoosingButton >> clickFunctionality: anEvent [

	self popUp ifNil: [self makePopUp.]
	
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'si 6/7/2024 23:13'
}
WBShapeChoosingButton >> makeButtonWithNumber: aNumber [

		^WBToolbarButton new
			number: aNumber;
			canvas: self canvas;
			backgroundColor: Color lightBlue;
			clickedColor: Color blue;
			extent: self owner buttonSize;
			borderColor: Color black;
			borderWidth: 1;
			yourself.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'si 6/7/2024 23:14'
}
WBShapeChoosingButton >> makePopUp [

	self popUp:
		(WBToolbarPopUp new
			numberOfColumns: 1;
			sizeOfPopUp: (self owner buttonSize x) * 1.3;
			setDefaultValues;
			position: self topRight;
			comeToFront;
			addButtons: self makeShapeButtons;
			yourself).
		self addMorph: self popUp
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'is 6/12/2024 20:31'
}
WBShapeChoosingButton >> makeShapeButtons [

	^OrderedCollection new
		add: (self makeButtonWithNumber: 1);
		add: (self makeButtonWithNumber: 2);
		yourself.
]
