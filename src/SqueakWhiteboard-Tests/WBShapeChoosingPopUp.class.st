Class {
	#name : #WBShapeChoosingPopUp,
	#superclass : #TestCase,
	#instVars : [
		'canvas'
	],
	#category : #'SqueakWhiteboard-Tests'
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'si 6/7/2024 00:29'
}
WBShapeChoosingPopUp >> canvas [
	^ canvas
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'si 6/7/2024 00:30'
}
WBShapeChoosingPopUp >> canvas: anObject [

	canvas := anObject
]

{
	#category : #setUp,
	#'squeak_changestamp' : 'si 6/7/2024 00:29'
}
WBShapeChoosingPopUp >> setUp [

	super setUp.
	self canvas: WBCanvas newForTests.

]

{
	#category : #tearDown,
	#'squeak_changestamp' : 'si 6/7/2024 00:29'
}
WBShapeChoosingPopUp >> tearDown [

	super tearDown.
	self canvas ifNotNil: [:canvas | canvas owner delete]
]
