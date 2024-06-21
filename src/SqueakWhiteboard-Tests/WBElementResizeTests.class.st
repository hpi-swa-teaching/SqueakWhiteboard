Class {
	#name : #WBElementResizeTests,
	#superclass : #TestCase,
	#instVars : [
		'canvas'
	],
	#category : #'SqueakWhiteboard-Tests'
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'JK 6/3/2024 16:05'
}
WBElementResizeTests >> canvas [
	^ canvas
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JK 6/3/2024 16:05'
}
WBElementResizeTests >> canvas: anObject [
	canvas := anObject
]

{
	#category : #setUp,
	#'squeak_changestamp' : 'is 6/15/2024 12:58'
}
WBElementResizeTests >> setUp [
	
	super setUp.
	self canvas: WBCanvas new

]

{
	#category : #tearDown,
	#'squeak_changestamp' : 'is 6/4/2024 17:24'
}
WBElementResizeTests >> tearDown [
	
	super tearDown.
	self canvas ifNotNil: [:canvas | canvas owner delete]
]

{
	#category : #tests,
	#'squeak_changestamp' : 'is 6/21/2024 18:58'
}
WBElementResizeTests >> testOpenFrame [
	| rectangle |
	
	rectangle := WBRectangle newWithCanvas: self canvas.
	rectangle addResizeFrame.
	
	self assert: rectangle resizeFrame class = WBResizeFrame
	
]

{
	#category : #tests,
	#'squeak_changestamp' : 'is 6/21/2024 18:58'
}
WBElementResizeTests >> testRectangleResizeBottom [
	| rectangle frame |
	
	self canvas position: 0@0.
	self canvas extent: 300@300.
	rectangle := WBRectangle newWithCanvas: self canvas.
	rectangle position: 100@100.
	rectangle extent: 100@100.
	rectangle addResizeFrame.
	frame := rectangle resizeFrame.
	
	frame resizeBottom: 250.
	self assert: rectangle bottom = 250
	
]

{
	#category : #tests,
	#'squeak_changestamp' : 'is 6/21/2024 18:58'
}
WBElementResizeTests >> testRectangleResizeBottomMin [
	| rectangle frame |
	
	self canvas position: 0@0.
	self canvas extent: 300@300.
	rectangle := WBRectangle newWithCanvas: self canvas.
	rectangle position: 100@100.
	rectangle extent: 100@100.
	rectangle addResizeFrame.
	frame := rectangle resizeFrame.
	
	frame resizeBottom: 100.
	self assert: rectangle bottom = (100+WBResizeFrame resizeWidth)
	
]

{
	#category : #tests,
	#'squeak_changestamp' : 'is 6/21/2024 18:58'
}
WBElementResizeTests >> testRectangleResizeButtomBorder [
	| rectangle frame |
	
	self canvas position: 0@0.
	self canvas extent: 300@300.
	rectangle := WBRectangle newWithCanvas: self canvas.
	rectangle position: 100@100.
	rectangle extent: 100@100.
	rectangle addResizeFrame.
	frame := rectangle resizeFrame.
	
	frame resizeBottom: 350.
	self assert: rectangle bottom= 300
	
]

{
	#category : #tests,
	#'squeak_changestamp' : 'is 6/21/2024 18:58'
}
WBElementResizeTests >> testRectangleResizeLeft [
	| rectangle frame |
	
	self canvas position: 0@0.
	self canvas extent: 300@300.
	rectangle := WBRectangle newWithCanvas: self canvas.
	rectangle position: 100@100.
	rectangle extent: 100@100.
	rectangle addResizeFrame.
	frame := rectangle resizeFrame.
	
	frame resizeLeft: 50.
	self assert: rectangle left = 50
	
]

{
	#category : #tests,
	#'squeak_changestamp' : 'is 6/21/2024 18:58'
}
WBElementResizeTests >> testRectangleResizeLeftBorder [
	| rectangle frame |
	
	self canvas position: 0@0.
	self canvas extent: 300@300.
	rectangle := WBRectangle newWithCanvas: self canvas.
	rectangle position: 100@100.
	rectangle extent: 100@100.
	rectangle addResizeFrame.
	frame := rectangle resizeFrame.
	
	frame resizeLeft: -10.
	self assert: rectangle left = 0
	
]

{
	#category : #tests,
	#'squeak_changestamp' : 'is 6/21/2024 18:58'
}
WBElementResizeTests >> testRectangleResizeLeftMin [
	| rectangle frame |
	
	self canvas position: 0@0.
	self canvas extent: 300@300.
	rectangle := WBRectangle newWithCanvas: self canvas.
	rectangle position: 100@100.
	rectangle extent: 100@100.
	rectangle addResizeFrame.
	frame := rectangle resizeFrame.
	
	frame resizeLeft: 250.
	self assert: rectangle left = (200 - (WBResizeFrame resizeWidth))
	
]

{
	#category : #tests,
	#'squeak_changestamp' : 'is 6/21/2024 18:59'
}
WBElementResizeTests >> testRectangleResizeRight [
	| rectangle frame |
	
	self canvas position: 0@0.
	self canvas extent: 300@300.
	rectangle := WBRectangle newWithCanvas: self canvas.
	rectangle position: 100@100.
	rectangle extent: 100@100.
	rectangle addResizeFrame.
	frame := rectangle resizeFrame.
	
	frame resizeRight: 250.
	self assert: rectangle right = 250
	
]

{
	#category : #tests,
	#'squeak_changestamp' : 'is 6/21/2024 18:59'
}
WBElementResizeTests >> testRectangleResizeRightBorder [
	| rectangle frame |
	
	self canvas position: 0@0.
	self canvas extent: 300@300.
	rectangle := WBRectangle newWithCanvas: self canvas.
	rectangle position: 100@100.
	rectangle extent: 100@100.
	rectangle addResizeFrame.
	frame := rectangle resizeFrame.
	
	frame resizeRight: 350.
	self assert: rectangle right= 300
	
]

{
	#category : #tests,
	#'squeak_changestamp' : 'is 6/21/2024 19:00'
}
WBElementResizeTests >> testRectangleResizeRightMin [
	| rectangle frame |
	
	self canvas position: 0@0.
	self canvas extent: 300@300.
	rectangle := WBRectangle newWithCanvas: self canvas.
	rectangle position: 100@100.
	rectangle extent: 100@100.
	rectangle addResizeFrame.
	frame := rectangle resizeFrame.
	
	frame resizeRight: 100.
	self assert: rectangle right = (100+WBResizeFrame resizeWidth)
	
]

{
	#category : #tests,
	#'squeak_changestamp' : 'is 6/21/2024 19:00'
}
WBElementResizeTests >> testRectangleResizeTop [
	| rectangle frame |
	
	self canvas position: 0@0.
	self canvas extent: 300@300.
	rectangle := WBRectangle newWithCanvas: self canvas.
	rectangle position: 100@100.
	rectangle extent: 100@100.
	rectangle addResizeFrame.
	frame := rectangle resizeFrame.
	
	frame resizeTop: 50.
	self assert: rectangle top = 50
	
]

{
	#category : #tests,
	#'squeak_changestamp' : 'is 6/21/2024 19:00'
}
WBElementResizeTests >> testRectangleResizeTopBorder [
	| rectangle frame |
	
	self canvas position: 0@0.
	self canvas extent: 300@300.
	rectangle := WBRectangle newWithCanvas: self canvas.
	rectangle position: 100@100.
	rectangle extent: 100@100.
	rectangle addResizeFrame.
	frame := rectangle resizeFrame.
	
	frame resizeTop: -10.
	self assert: rectangle top = 0
	
]

{
	#category : #tests,
	#'squeak_changestamp' : 'is 6/21/2024 19:00'
}
WBElementResizeTests >> testRectangleResizeTopMin [
	| rectangle frame |
	
	self canvas position: 0@0.
	self canvas extent: 300@300.
	rectangle := WBRectangle newWithCanvas: self canvas.
	rectangle position: 100@100.
	rectangle extent: 100@100.
	rectangle addResizeFrame.
	frame := rectangle resizeFrame.
	
	frame resizeTop: 250.
	self assert: rectangle top = (200 - (WBResizeFrame resizeWidth))
	
]
