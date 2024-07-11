"
The class represents a menu that opens up when clicking on an element that is displayed on the canvas
"
Class {
	#name : #WBPopUp,
	#superclass : #Morph,
	#instVars : [
		'popUpButtons',
		'numberOfColumns',
		'numberOfRows',
		'sizeOfPopUp',
		'popUp'
	],
	#category : #'SqueakWhiteboard-Core',
	#'squeak_changestamp' : 'is 6/23/2024 02:22'
}

{
	#category : #size,
	#'squeak_changestamp' : 'is 6/23/2024 01:49'
}
WBPopUp class >> cornerRadius [

	^ 7
]

{
	#category : #size,
	#'squeak_changestamp' : 'si 7/11/2024 14:55'
}
WBPopUp class >> defaultSizeOfPopUp [

	^ 20
]

{
	#category : #size,
	#'squeak_changestamp' : 'si 7/10/2024 12:10'
}
WBPopUp class >> margin [

	^ 5
]

{
	#category : #'adding buttons',
	#'squeak_changestamp' : 'si 7/11/2024 17:03'
}
WBPopUp >> addButtons: aList [
	| row column |
	
	self computeLayoutVariables: aList.
	self extent: (self numberOfColumns  * self sizeOfPopUp) @ (self numberOfRows * self sizeOfPopUp).
	row := 0. 
	column := 0.
	aList do: 
		[:m | self placeButton: m At: self position + ((self sizeOfPopUp / 2) @ (self  sizeOfPopUp / 2)) + ((column * self sizeOfPopUp) @ (row * self sizeOfPopUp)).
		column := column + 1.
		(column  = self numberOfColumns) ifTrue: 
			[column := 0.
			row := row + 1]]
]

{
	#category : #'adding buttons',
	#'squeak_changestamp' : 'si 7/11/2024 17:02'
}
WBPopUp >> computeLayoutVariables: aList [

	self numberOfColumns ifNil: 
		[self numberOfRows: 1.
		self numberOfColumns: aList size]
	ifNotNil: [self numberOfRows: (aList size / self numberOfColumns) ceiling].
	self popUpButtons: aList size.
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'si 6/13/2024 12:18'
}
WBPopUp >> handlesMouseDown: anEvent [

	^ true
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'si 6/13/2024 12:19'
}
WBPopUp >> initialize [

	super initialize
]

{
	#category : #popUp,
	#'squeak_changestamp' : 'si 7/11/2024 14:54'
}
WBPopUp >> makePopUpAt: aPoint with: aCollection columns: aNumber [

	self popUp: 
		(WBPopUp new
			setLayout;
			numberOfColumns: aNumber;
			addButtons: aCollection;
			yourself).
	self addMorph: self popUp.
	self popUp center: aPoint - (self popUp bottomCenter - self popUp center)
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'is 6/23/2024 01:51'
}
WBPopUp >> numberOfColumns [

	^ numberOfColumns
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'si 5/27/2024 22:22'
}
WBPopUp >> numberOfColumns: aNumber [

	numberOfColumns := aNumber
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'is 6/23/2024 01:51'
}
WBPopUp >> numberOfRows [

	^ numberOfRows
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'si 7/10/2024 11:39'
}
WBPopUp >> numberOfRows: aNumber [

	numberOfRows := aNumber
]

{
	#category : #'adding buttons',
	#'squeak_changestamp' : 'si 7/10/2024 11:39'
}
WBPopUp >> placeButton: aButton At: aPoint [

	self addMorph: 
		(aButton
			extent: self sizeOfButton;
			center: aPoint;
			addImage;
			yourself)
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'si 6/13/2024 13:35'
}
WBPopUp >> popUp [

	^ popUp
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'si 6/13/2024 13:35'
}
WBPopUp >> popUp: aPopUp [

	popUp := aPopUp
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'is 6/23/2024 01:51'
}
WBPopUp >> popUpButtons [

	^ popUpButtons
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'is 6/23/2024 01:52'
}
WBPopUp >> popUpButtons: aNumber [

	popUpButtons := aNumber
]

{
	#category : #layout,
	#'squeak_changestamp' : 'si 7/11/2024 14:55'
}
WBPopUp >> setLayout [

	self
		color: Color veryVeryLightGray;
		borderColor: Color gray;
		borderWidth: 1;
		cornerStyle: #rounded;
		cornerRadius: self class cornerRadius;
		sizeOfPopUp: self class defaultSizeOfPopUp
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'si 7/10/2024 11:40'
}
WBPopUp >> sizeOfButton [	

	^ (self sizeOfPopUp - self class margin) @ (self sizeOfPopUp - self class margin)
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'si 6/7/2024 00:40'
}
WBPopUp >> sizeOfPopUp [

	^ sizeOfPopUp
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'si 6/7/2024 00:41'
}
WBPopUp >> sizeOfPopUp: aNumber [

	sizeOfPopUp := aNumber
]

{
	#category : #popUp,
	#'squeak_changestamp' : 'si 7/10/2024 17:03'
}
WBPopUp >> tryToMakePopUpAt: aPoint with: aCollection columns: aNumber [

	self popUp ifNotNil: [self popUp delete].
	self makePopUpAt: aPoint with: aCollection columns: aNumber
]
