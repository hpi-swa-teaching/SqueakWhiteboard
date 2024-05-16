Class {
	#name : #WBTemporaryButton,
	#superclass : #WBElement,
	#instVars : [
		'canvas',
		'number'
	],
	#category : #SqueakWhiteboard
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'si 5/16/2024 18:27'
}
WBTemporaryButton >> canvas [

	^canvas
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'si 5/16/2024 18:27'
}
WBTemporaryButton >> canvas: aCanvas [

	canvas := aCanvas
]

{
	#category : #initialisation,
	#'squeak_changestamp' : 'si 5/16/2024 18:25'
}
WBTemporaryButton >> initialize [

	super initialize.
	self
		cornerStyle: #rounded;
		cornerRadius: 100.
]

{
	#category : #clicking,
	#'squeak_changestamp' : 'si 5/16/2024 19:24'
}
WBTemporaryButton >> mouseDown: anEvent [

	(self number == 1) ifTrue: 
		[self canvas elementToSpawn: (WBRectangle new)].
	(self number == 2) ifTrue: 
		[self canvas elementToSpawn: (WBTemporaryCircle new)]
]

{
	#category : #clicking,
	#'squeak_changestamp' : 'si 5/16/2024 19:07'
}
WBTemporaryButton >> mouseMove: anEvent [
]

{
	#category : #clicking,
	#'squeak_changestamp' : 'si 5/16/2024 19:07'
}
WBTemporaryButton >> mouseUp: anEvent [
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'si 5/16/2024 18:50'
}
WBTemporaryButton >> number [

	^number
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'si 5/16/2024 18:50'
}
WBTemporaryButton >> number: aNumber [

	number := aNumber
]
