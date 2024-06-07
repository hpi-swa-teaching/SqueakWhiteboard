Class {
	#name : #WBToolbarPopUp,
	#superclass : #WBElementPopUp,
	#category : #'SqueakWhiteboard-Core'
}

{
	#category : #addButtons,
	#'squeak_changestamp' : 'si 6/7/2024 21:56'
}
WBToolbarPopUp >> placeButton: aButton At: aPoint [

	self addMorph: (aButton
		center: aPoint;
		addImage;
		yourself).
]
