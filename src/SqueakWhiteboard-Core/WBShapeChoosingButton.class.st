Class {
	#name : #WBShapeChoosingButton,
	#superclass : #WBButton,
	#category : #'SqueakWhiteboard-Core'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'si 6/7/2024 01:46'
}
WBShapeChoosingButton >> clickFunctionality: anEvent [

	self makePopUp.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'si 6/7/2024 01:41'
}
WBShapeChoosingButton >> makePopUp [

	self addMorph:
		(WBElementPopUp new
			numberOfColumns: 1;
			"sizeOfPopUp: self element class sizeOfPopUpForStandardElement; should be like this, until buttons are reworked magic number"
			sizeOfPopUp: 20;
			setDefaultValues;
			position: self topRight;
			comeToFront;
			addButtons: self makeShapeButtons;
			yourself).
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'si 6/7/2024 01:56'
}
WBShapeChoosingButton >> makeShapeButtons [

|collection|
	collection := OrderedCollection new.
	collection
		add: (WBToolbarButton new
			number: 1;
			image: (ImageMorph new image: 
			(self canvas images resize: (WBImage loadRectangleButtonImage) to: self owner buttonSize*0.8));
			yourself);
		add: (WBToolbarButton new
			number: 2;
			image: (ImageMorph new image: 
			(self canvas images resize: (WBImage loadCircleButtonImage) to: self owner buttonSize*0.8));
			yourself);
		add: (WBToolbarButton new
			number: 3;
			image: (ImageMorph new image: 
			(self canvas images resize: (WBImage loadTextboxButtonImage) to: self owner buttonSize*0.8));
			yourself).
		^collection
]
