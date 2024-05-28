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
	#'squeak_changestamp' : 'is 5/29/2024 01:26'
}
WBRectangle >> initialize [

	super initialize.
	self bounds: (0@0 extent: self defaultSize@self defaultSize)
]
