"
The WBRectangle is a rectangle that is creatable within the canvas
"
Class {
	#name : #WBRectangle,
	#superclass : #WBElement,
	#category : #'SqueakWhiteboard-Core',
	#'squeak_changestamp' : 'is 5/17/2024 15:58'
}

{
	#category : #initialization,
	#'squeak_changestamp' : 'is 5/29/2024 01:42'
}
WBRectangle >> initialize [

	super initialize.
	self bounds: (0@0 extent: self defaultSize)
]
