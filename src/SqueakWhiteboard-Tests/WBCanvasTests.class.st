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
	#'squeak_changestamp' : 'si 6/7/2024 00:30'
}
WBCanvasTests >> canvas [

	^ canvas
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'si 6/21/2024 00:53'
}
WBCanvasTests >> canvas: anObject [

	canvas := anObject
]

{
	#category : #setUp,
	#'squeak_changestamp' : 'is 6/15/2024 12:58'
}
WBCanvasTests >> setUp [

	super setUp.
	self canvas: WBCanvas new

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
	#'squeak_changestamp' : 'is 6/21/2024 18:50'
}
WBCanvasTests >> testElementsCollection [
	| elementToDelete |
	
	self assert: self canvas elements size = 0.
	self canvas addElement: (WBRectangle newWithCanvas: self canvas).
	self assert: self canvas elements size = 1.
	elementToDelete := WBRectangle newWithCanvas: self canvas.
	self canvas addElement: elementToDelete.
	self assert: self canvas elements size = 2.
	elementToDelete delete.
	self assert: self canvas elements size = 1
	
		
]

{
	#category : #tests,
	#'squeak_changestamp' : 'is 6/21/2024 18:54'
}
WBCanvasTests >> testRectangleCreate [
	|rectangle|
	
	rectangle := WBRectangle newWithCanvas: self canvas.
	self assert: rectangle class = WBRectangle
]
