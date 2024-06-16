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
	#category : #appearance,
	#'squeak_changestamp' : 'is 6/16/2024 20:49'
}
WBRectangle >> drawOn: aCanvas [

	aCanvas fillRectangle: self bounds color: self color.
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'is 6/4/2024 16:21'
}
WBRectangle >> initialize [

	super initialize
]
