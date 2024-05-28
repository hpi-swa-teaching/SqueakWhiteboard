Class {
	#name : #WBTextbox,
	#superclass : #WBElement,
	#category : #SqueakWhiteboard
}

{
	#category : #appearance,
	#'squeak_changestamp' : 'is 5/29/2024 00:16'
}
WBTextbox >> drawOn: aCanvas [

	| innerRectangle |
   	innerRectangle := self bounds insetBy: 20.
	aCanvas fillRectangle: innerRectangle color: Color red.
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'is 5/29/2024 00:13'
}
WBTextbox >> initialize [

	super initialize
]
