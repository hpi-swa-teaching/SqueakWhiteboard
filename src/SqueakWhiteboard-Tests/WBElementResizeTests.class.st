Class {
	#name : #WBElementResizeTests,
	#superclass : #WBElementTests,
	#category : #'SqueakWhiteboard-Tests'
}

{
	#category : #tests,
	#'squeak_changestamp' : 'si 7/11/2024 14:14'
}
WBElementResizeTests >> testOpenFrame [
	| rectangle |
	
	rectangle := WBRectangularElement newWithCanvas: self canvas.
	rectangle addResizeFrame.
	
	self assert: rectangle resizeFrame class = WBResizeFrame
	
]

{
	#category : #tests,
	#'squeak_changestamp' : 'si 7/11/2024 14:14'
}
WBElementResizeTests >> testRectangleResizeBottom [
	| rectangle frame |
	
	self canvas position: 0 @ 0.
	self canvas extent: 300 @ 300.
	rectangle := WBRectangularElement newWithCanvas: self canvas.
	rectangle position: 100 @ 100.
	rectangle extent: 100 @ 100.
	rectangle addResizeFrame.
	frame := rectangle resizeFrame.
	frame resizeBottom: 250.
	
	self assert: rectangle bottom = 250
	
]

{
	#category : #tests,
	#'squeak_changestamp' : 'si 7/11/2024 14:14'
}
WBElementResizeTests >> testRectangleResizeBottomMin [
	| rectangle frame |
	
	self canvas position: 0 @ 0.
	self canvas extent: 300 @ 300.
	rectangle := WBRectangularElement newWithCanvas: self canvas.
	rectangle position: 100 @ 100.
	rectangle extent: 100 @ 100.
	rectangle addResizeFrame.
	frame := rectangle resizeFrame.
	frame resizeBottom: 100.
	
	self assert: rectangle bottom = (100 + WBResizeFrame resizeWidth)
	
]

{
	#category : #tests,
	#'squeak_changestamp' : 'si 7/11/2024 14:14'
}
WBElementResizeTests >> testRectangleResizeButtomBorder [
	| rectangle frame |
	
	self canvas position: 0 @ 0.
	self canvas extent: 300 @ 300.
	rectangle := WBRectangularElement newWithCanvas: self canvas.
	rectangle position: 100 @ 100.
	rectangle extent: 100 @ 100.
	rectangle addResizeFrame.
	frame := rectangle resizeFrame.
	frame resizeBottom: 350.
	
	self assert: rectangle bottom = 300
	
]

{
	#category : #tests,
	#'squeak_changestamp' : 'si 7/11/2024 14:14'
}
WBElementResizeTests >> testRectangleResizeLeft [
	| rectangle frame |
	
	self canvas position: 0 @ 0.
	self canvas extent: 300 @ 300.
	rectangle := WBRectangularElement newWithCanvas: self canvas.
	rectangle position: 100 @ 100.
	rectangle extent: 100 @ 100.
	rectangle addResizeFrame.
	frame := rectangle resizeFrame.
	frame resizeLeft: 50.
	
	self assert: rectangle left = 50
	
]

{
	#category : #tests,
	#'squeak_changestamp' : 'si 7/11/2024 14:14'
}
WBElementResizeTests >> testRectangleResizeLeftBorder [
	| rectangle frame |
	
	self canvas position: 0 @ 0.
	self canvas extent: 300 @ 300.
	rectangle := WBRectangularElement newWithCanvas: self canvas.
	rectangle position: 100 @ 100.
	rectangle extent: 100 @ 100.
	rectangle addResizeFrame.
	frame := rectangle resizeFrame.
	frame resizeLeft: -10.
	
	self assert: rectangle left = 0
	
]

{
	#category : #tests,
	#'squeak_changestamp' : 'si 7/11/2024 14:14'
}
WBElementResizeTests >> testRectangleResizeLeftMin [
	| rectangle frame |
	
	self canvas position: 0 @ 0.
	self canvas extent: 300 @ 300.
	rectangle := WBRectangularElement newWithCanvas: self canvas.
	rectangle position: 100 @ 100.
	rectangle extent: 100 @ 100.
	rectangle addResizeFrame.
	frame := rectangle resizeFrame.
	frame resizeLeft: 250.
	
	self assert: rectangle left = (200 - (WBResizeFrame resizeWidth))
	
]

{
	#category : #tests,
	#'squeak_changestamp' : 'si 7/11/2024 14:14'
}
WBElementResizeTests >> testRectangleResizeRight [
	| rectangle frame |
	
	self canvas position: 0 @ 0.
	self canvas extent: 300 @ 300.
	rectangle := WBRectangularElement newWithCanvas: self canvas.
	rectangle position: 100 @ 100.
	rectangle extent: 100 @ 100.
	rectangle addResizeFrame.
	frame := rectangle resizeFrame.
	frame resizeRight: 250.
	
	self assert: rectangle right = 250
	
]

{
	#category : #tests,
	#'squeak_changestamp' : 'si 7/11/2024 14:14'
}
WBElementResizeTests >> testRectangleResizeRightBorder [
	| rectangle frame |
	
	self canvas position: 0 @ 0.
	self canvas extent: 300 @ 300.
	rectangle := WBRectangularElement newWithCanvas: self canvas.
	rectangle position: 100 @ 100.
	rectangle extent: 100 @ 100.
	rectangle addResizeFrame.
	frame := rectangle resizeFrame.
	frame resizeRight: 350.
	
	self assert: rectangle right = 300
	
]

{
	#category : #tests,
	#'squeak_changestamp' : 'si 7/11/2024 14:14'
}
WBElementResizeTests >> testRectangleResizeRightMin [
	| rectangle frame |
	
	self canvas position: 0 @ 0.
	self canvas extent: 300 @ 300.
	rectangle := WBRectangularElement newWithCanvas: self canvas.
	rectangle position: 100 @ 100.
	rectangle extent: 100 @ 100.
	rectangle addResizeFrame.
	frame := rectangle resizeFrame.
	frame resizeRight: 100.
	
	self assert: rectangle right = (100 + WBResizeFrame resizeWidth)
	
]

{
	#category : #tests,
	#'squeak_changestamp' : 'si 7/11/2024 14:14'
}
WBElementResizeTests >> testRectangleResizeTop [
	| rectangle frame |
	
	self canvas position: 0 @ 0.
	self canvas extent: 300 @ 300.
	rectangle := WBRectangularElement newWithCanvas: self canvas.
	rectangle position: 100 @ 100.
	rectangle extent: 100 @ 100.
	rectangle addResizeFrame.
	frame := rectangle resizeFrame.
	frame resizeTop: 50.
	
	self assert: rectangle top = 50
	
]

{
	#category : #tests,
	#'squeak_changestamp' : 'si 7/11/2024 14:14'
}
WBElementResizeTests >> testRectangleResizeTopBorder [
	| rectangle frame |
	
	self canvas position: 0 @ 0.
	self canvas extent: 300 @ 300.
	rectangle := WBRectangularElement newWithCanvas: self canvas.
	rectangle position: 100 @ 100.
	rectangle extent: 100 @ 100.
	rectangle addResizeFrame.
	frame := rectangle resizeFrame.
	frame resizeTop: -10.
	
	self assert: rectangle top = 0
	
]

{
	#category : #tests,
	#'squeak_changestamp' : 'si 7/11/2024 14:14'
}
WBElementResizeTests >> testRectangleResizeTopMin [
	| rectangle frame |
	
	self canvas position: 0 @ 0.
	self canvas extent: 300 @ 300.
	rectangle := WBRectangularElement newWithCanvas: self canvas.
	rectangle position: 100 @ 100.
	rectangle extent: 100 @ 100.
	rectangle addResizeFrame.
	frame := rectangle resizeFrame.
	frame resizeTop: 250.
	
	self assert: rectangle top = (200 - (WBResizeFrame resizeWidth))
	
]
