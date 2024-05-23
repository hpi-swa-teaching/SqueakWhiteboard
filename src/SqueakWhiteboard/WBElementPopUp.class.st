Class {
	#name : #WBElementPopUp,
	#superclass : #WBPopUp,
	#instVars : [
		'popUpButtons'
	],
	#category : #SqueakWhiteboard
}

{
	#category : #size,
	#'squeak_changestamp' : 'si 5/23/2024 20:31'
}
WBElementPopUp class >> CornerRadius [

	^7
]

{
	#category : #size,
	#'squeak_changestamp' : 'si 5/23/2024 20:30'
}
WBElementPopUp class >> sizeOfPopUp [

	^20
]

{
	#category : #addButtons,
	#'squeak_changestamp' : 'si 5/23/2024 23:04'
}
WBElementPopUp >> addButtons: aList [

	self popUpButtons: aList size.
	self extent: (self popUpButtons*20)@20.
	aList do: [:m | self placeButton: m]
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'ACL 5/23/2024 17:18'
}
WBElementPopUp >> initializeDefault [

	self setDefaultValues.
]

{
	#category : #addButtons,
	#'squeak_changestamp' : 'si 5/23/2024 22:52'
}
WBElementPopUp >> placeButton: aButton [

	self addMorph: (aButton
		extent: ((self class sizeOfPopUp - 5) @(self class sizeOfPopUp - 5));
		center: self leftCenter + (self class sizeOfPopUp / 2 @ 0) + ((self popUpButtons - 1)*self class sizeOfPopUp @ 0);
		yourself).
	self popUpButtons: self popUpButtons - 1
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'ACL 5/23/2024 17:18'
}
WBElementPopUp >> popUpButtons [

	^ popUpButtons.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'ACL 5/22/2024 18:18'
}
WBElementPopUp >> popUpButtons: aNumber [

	popUpButtons := aNumber.
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'si 5/23/2024 21:31'
}
WBElementPopUp >> setDefaultValues [

	self
		color: Color veryVeryLightGray;
		borderColor: Color gray;
		borderWidth: 1;
		cornerStyle: #rounded;
		cornerRadius: self class CornerRadius.
]
