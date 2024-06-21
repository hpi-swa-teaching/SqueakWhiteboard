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
	#category : #testing,
	#'squeak_changestamp' : 'is 6/21/2024 20:36'
}
WBCanvasTests >> testActiveElement [
	| anActiveElement aMouseEvent |
	
	anActiveElement := WBRectangle newWithCanvas: self canvas.
	aMouseEvent := MouseButtonEvent new.
	aMouseEvent setType: #mouseDown position: anActiveElement position which: 4 buttons: aMouseEvent class redButton hand: HandMorph new stamp: 0.
	anActiveElement mouseDown: aMouseEvent.
	self assert: self canvas activeElement = anActiveElement
	
]

{
	#category : #testing,
	#'squeak_changestamp' : 'is 6/21/2024 23:52'
}
WBCanvasTests >> testClampElementToCanvas [
	| aPoint anElement |
	
	aPoint := self canvas center.
	anElement := WBRectangle newWithCanvas: self canvas.
	self assert: (self canvas clampedPositionOfElement: anElement at: aPoint) = aPoint.
	
	aPoint := self canvas bounds corner + (anElement extent * 2).
	self assert: (self canvas clampedPositionOfElement: anElement at: aPoint)  = (self canvas bounds corner - anElement extent).
	
	aPoint := self canvas bounds origin - (anElement extent * 2).
	self assert: (self canvas clampedPositionOfElement: anElement at: aPoint)  = (self canvas bounds origin)
]

{
	#category : #testing,
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
	#category : #testing,
	#'squeak_changestamp' : 'is 6/22/2024 00:42'
}
WBCanvasTests >> testMouseEvents [
	| aMouseEvent |
	
	aMouseEvent := MouseButtonEvent new.
	aMouseEvent setType: #mouseDown position: (0 @ 0) which: 4 buttons: aMouseEvent class redButton hand: HandMorph new stamp: 0.
	
	self assert: (self canvas handlesMouseOver: aMouseEvent) = true.
	self assert: (self canvas handlesMouseMove: aMouseEvent) = true.
	self assert: (self canvas handlesMouseDown: aMouseEvent) = true
]

{
	#category : #testing,
	#'squeak_changestamp' : 'is 6/21/2024 18:54'
}
WBCanvasTests >> testRectangleCreate [
	|rectangle|
	
	rectangle := WBRectangle newWithCanvas: self canvas.
	self assert: rectangle class = WBRectangle
]
