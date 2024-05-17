"
The WBRectangle is a rectangle that is creatable within the canvas
"
Class {
	#name : #WBRectangle,
	#superclass : #WBElement,
	#category : #SqueakWhiteboard,
	#'squeak_changestamp' : 'is 5/17/2024 15:58'
}

{
	#category : #initialization,
	#'squeak_changestamp' : 'si 5/16/2024 18:47'
}
WBRectangle >> initialize [

	super initialize.
	self color: Color blue
]
