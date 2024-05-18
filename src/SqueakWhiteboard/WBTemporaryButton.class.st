"
The WBTemporaryButton is a placeholder for functionality that is coming later
"
Class {
	#name : #WBTemporaryButton,
	#superclass : #WBElement,
	#instVars : [
		'number'
	],
	#category : #SqueakWhiteboard,
	#'squeak_changestamp' : 'is 5/17/2024 15:59'
}

{
	#category : #initialization,
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
	#'squeak_changestamp' : 'si 5/17/2024 13:47'
}
WBTemporaryButton >> mouseDown: anEvent [

	(self number == 1) ifTrue: 
		[self canvas spawnAnElement: WBRectangle new At: anEvent cursorPoint.].
	(self number == 2) ifTrue: 
		[self canvas spawnAnElement: WBTemporaryCircle new At: anEvent cursorPoint.].
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
