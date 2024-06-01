Class {
	#name : #WBElementPopUp,
	#superclass : #WBPopUp,
	#instVars : [
		'popUpButtons',
		'numberOfColumns',
		'numberOfRows'
	],
	#category : #'SqueakWhiteboard-Core'
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
	#'squeak_changestamp' : 'si 5/27/2024 22:51'
}
WBElementPopUp >> addButtons: aList [

	|row column|
	self numberOfColumns ifNil: [self numberOfRows: 1.
		self numberOfColumns: aList size.]
	ifNotNil: [self numberOfRows: (aList size / self numberOfColumns) ceiling].
	self popUpButtons: aList size.
	self extent: (self numberOfColumns  * 20) @ (self numberOfRows *20).
	row := 0. 
	column := 0.
	aList do: 
		[:m | self placeButton: m At: self position + ((self class sizeOfPopUp / 2) @ (self class sizeOfPopUp / 2)) + ((column * self class sizeOfPopUp) @ (row * self class sizeOfPopUp)).
		column := column + 1.
		(column  = (self numberOfColumns)) ifTrue: [column := 0.
			row := row + 1].]
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'ACL 5/23/2024 17:18'
}
WBElementPopUp >> initializeDefault [

	self setDefaultValues.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'si 5/27/2024 22:22'
}
WBElementPopUp >> numberOfColumns [

	^numberOfColumns
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'si 5/27/2024 22:22'
}
WBElementPopUp >> numberOfColumns: aNumber [

	numberOfColumns := aNumber
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'si 5/27/2024 22:23'
}
WBElementPopUp >> numberOfRows [

	^numberOfRows
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'si 5/27/2024 22:23'
}
WBElementPopUp >> numberOfRows: aNumber [

	numberOfRows:= aNumber
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
	#category : #addButtons,
	#'squeak_changestamp' : 'si 5/27/2024 22:33'
}
WBElementPopUp >> placeButton: aButton At: aPoint [

	self addMorph: (aButton
		extent: ((self class sizeOfPopUp - 5) @(self class sizeOfPopUp - 5));
		center: aPoint;
		yourself).
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
