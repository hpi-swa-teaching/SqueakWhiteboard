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
	#'squeak_changestamp' : 'JK 6/3/2024 16:05'
}
WBElementResizeTests >> setUp [

	self canvas: WBCanvas new.

]

{
	#category : #tearDown,
	#'squeak_changestamp' : 'JK 6/3/2024 16:05'
}
WBElementResizeTests >> tearDown [

	self canvas owner delete.
]

{
	#category : #tests,
	#'squeak_changestamp' : 'JK 6/3/2024 16:42'
}
WBElementResizeTests >> testOpenFrame [

	|rectangle|
	rectangle := WBRectangle newWithCanvas: self canvas.
	rectangle addResizeFrame.
	
	self assert: rectangle resizeFrame class = WBResizeFrame.
	
]

{
	#category : #tests,
	#'squeak_changestamp' : 'JK 6/3/2024 16:23'
}
WBElementResizeTests >> testRectangleCreate [

	|rectangle|
	rectangle := WBRectangle newWithCanvas: self canvas.
	
	self assert: rectangle class = WBElement
	
]

{
	#category : #tests,
	#'squeak_changestamp' : 'JK 6/3/2024 20:25'
}
WBElementResizeTests >> testRectangleResizeBottom [

	|rectangle frame|
	self canvas position: 0@0.
	self canvas extent: 300@300.
	rectangle := WBRectangle newWithCanvas: self canvas.
	rectangle position: 100@100.
	rectangle extent: 100@100.
	rectangle addResizeFrame.
	frame := rectangle resizeFrame.
	
	frame resizeBottom: 250.
	self assert: rectangle bottom = 250.
	
]

{
	#category : #tests,
	#'squeak_changestamp' : 'JK 6/3/2024 20:26'
}
WBElementResizeTests >> testRectangleResizeBottomMin [

	|rectangle frame|
	self canvas position: 0@0.
	self canvas extent: 300@300.
	rectangle := WBRectangle newWithCanvas: self canvas.
	rectangle position: 100@100.
	rectangle extent: 100@100.
	rectangle addResizeFrame.
	frame := rectangle resizeFrame.
	
	frame resizeBottom: 100.
	self assert: rectangle bottom = (100+WBResizeFrame resizeWidth).
	
]

{
	#category : #tests,
	#'squeak_changestamp' : 'JK 6/3/2024 20:26'
}
WBElementResizeTests >> testRectangleResizeButtomBorder [

	|rectangle frame|
	self canvas position: 0@0.
	self canvas extent: 300@300.
	rectangle := WBRectangle newWithCanvas: self canvas.
	rectangle position: 100@100.
	rectangle extent: 100@100.
	rectangle addResizeFrame.
	frame := rectangle resizeFrame.
	
	frame resizeBottom: 350.
	self assert: rectangle bottom= 300.
	
]

{
	#category : #tests,
	#'squeak_changestamp' : 'JK 6/3/2024 20:16'
}
WBElementResizeTests >> testRectangleResizeLeft [

	|rectangle frame|
	self canvas position: 0@0.
	self canvas extent: 300@300.
	rectangle := WBRectangle newWithCanvas: self canvas.
	rectangle position: 100@100.
	rectangle extent: 100@100.
	rectangle addResizeFrame.
	frame := rectangle resizeFrame.
	
	frame resizeLeft: 50.
	self assert: rectangle left = 50.
	
]

{
	#category : #tests,
	#'squeak_changestamp' : 'JK 6/3/2024 20:16'
}
WBElementResizeTests >> testRectangleResizeLeftBorder [

	|rectangle frame|
	self canvas position: 0@0.
	self canvas extent: 300@300.
	rectangle := WBRectangle newWithCanvas: self canvas.
	rectangle position: 100@100.
	rectangle extent: 100@100.
	rectangle addResizeFrame.
	frame := rectangle resizeFrame.
	
	frame resizeLeft: -10.
	self assert: rectangle left = 0.
	
]

{
	#category : #tests,
	#'squeak_changestamp' : 'JK 6/3/2024 20:22'
}
WBElementResizeTests >> testRectangleResizeLeftMin [

	|rectangle frame|
	self canvas position: 0@0.
	self canvas extent: 300@300.
	rectangle := WBRectangle newWithCanvas: self canvas.
	rectangle position: 100@100.
	rectangle extent: 100@100.
	rectangle addResizeFrame.
	frame := rectangle resizeFrame.
	
	frame resizeLeft: 250.
	self assert: rectangle left = (200 - (WBResizeFrame resizeWidth)).
	
]

{
	#category : #tests,
	#'squeak_changestamp' : 'JK 6/3/2024 20:19'
}
WBElementResizeTests >> testRectangleResizeRight [

	|rectangle frame|
	self canvas position: 0@0.
	self canvas extent: 300@300.
	rectangle := WBRectangle newWithCanvas: self canvas.
	rectangle position: 100@100.
	rectangle extent: 100@100.
	rectangle addResizeFrame.
	frame := rectangle resizeFrame.
	
	frame resizeRight: 250.
	self assert: rectangle right = 250.
	
]

{
	#category : #tests,
	#'squeak_changestamp' : 'JK 6/3/2024 20:25'
}
WBElementResizeTests >> testRectangleResizeRightBorder [

	|rectangle frame|
	self canvas position: 0@0.
	self canvas extent: 300@300.
	rectangle := WBRectangle newWithCanvas: self canvas.
	rectangle position: 100@100.
	rectangle extent: 100@100.
	rectangle addResizeFrame.
	frame := rectangle resizeFrame.
	
	frame resizeRight: 350.
	self assert: rectangle right= 300.
	
]

{
	#category : #tests,
	#'squeak_changestamp' : 'JK 6/3/2024 20:24'
}
WBElementResizeTests >> testRectangleResizeRightMin [

	|rectangle frame|
	self canvas position: 0@0.
	self canvas extent: 300@300.
	rectangle := WBRectangle newWithCanvas: self canvas.
	rectangle position: 100@100.
	rectangle extent: 100@100.
	rectangle addResizeFrame.
	frame := rectangle resizeFrame.
	
	frame resizeRight: 100.
	self assert: rectangle right = (100+WBResizeFrame resizeWidth).
	
]

{
	#category : #tests,
	#'squeak_changestamp' : 'JK 6/3/2024 20:27'
}
WBElementResizeTests >> testRectangleResizeTop [

	|rectangle frame|
	self canvas position: 0@0.
	self canvas extent: 300@300.
	rectangle := WBRectangle newWithCanvas: self canvas.
	rectangle position: 100@100.
	rectangle extent: 100@100.
	rectangle addResizeFrame.
	frame := rectangle resizeFrame.
	
	frame resizeTop: 50.
	self assert: rectangle top = 50.
	
]

{
	#category : #tests,
	#'squeak_changestamp' : 'JK 6/3/2024 20:27'
}
WBElementResizeTests >> testRectangleResizeTopBorder [

	|rectangle frame|
	self canvas position: 0@0.
	self canvas extent: 300@300.
	rectangle := WBRectangle newWithCanvas: self canvas.
	rectangle position: 100@100.
	rectangle extent: 100@100.
	rectangle addResizeFrame.
	frame := rectangle resizeFrame.
	
	frame resizeTop: -10.
	self assert: rectangle top = 0.
	
]

{
	#category : #tests,
	#'squeak_changestamp' : 'JK 6/3/2024 20:28'
}
WBElementResizeTests >> testRectangleResizeTopMin [

	|rectangle frame|
	self canvas position: 0@0.
	self canvas extent: 300@300.
	rectangle := WBRectangle newWithCanvas: self canvas.
	rectangle position: 100@100.
	rectangle extent: 100@100.
	rectangle addResizeFrame.
	frame := rectangle resizeFrame.
	
	frame resizeTop: 250.
	self assert: rectangle top = (200 - (WBResizeFrame resizeWidth)).
	
]
