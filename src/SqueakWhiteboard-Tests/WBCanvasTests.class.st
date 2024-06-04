Class {
	#name : #WBCanvasTests,
	#superclass : #TestCase,
	#instVars : [
		'canvas'
	],
	#category : #'SqueakWhiteboard-Tests'
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'JK 6/3/2024 21:15'
}
WBCanvasTests >> canvas [
	^ canvas
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JK 6/3/2024 21:15'
}
WBCanvasTests >> canvas: anObject [
	canvas := anObject
]

{
	#category : #setUp,
	#'squeak_changestamp' : 'is 6/4/2024 17:24'
}
WBCanvasTests >> setUp [

	super setUp.
	self canvas: WBCanvas new.

]

{
	#category : #tearDown,
	#'squeak_changestamp' : 'is 6/4/2024 17:24'
}
WBCanvasTests >> tearDown [

	super tearDown.
	self canvas ifNotNil: [:canvas | canvas owner delete]
]

{
	#category : #tests,
	#'squeak_changestamp' : 'JK 6/3/2024 21:13'
}
WBCanvasTests >> testRectangleCreate [

	|rectangle|
	rectangle := WBRectangle newWithCanvas: self canvas.
	
	self assert: rectangle class = WBRectangle
]
