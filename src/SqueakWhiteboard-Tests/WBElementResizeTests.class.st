Class {
	#name : #WBElementResizeTests,
	#superclass : #WBElementTests,
	#instVars : [
		'element'
	],
	#category : #'SqueakWhiteboard-Tests'
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'si 7/11/2024 20:40'
}
WBElementResizeTests >> element [

	^ element
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'si 7/11/2024 20:40'
}
WBElementResizeTests >> element: anElement [

	element := anElement
]

{
	#category : #setUp,
	#'squeak_changestamp' : 'si 7/11/2024 20:41'
}
WBElementResizeTests >> setUp [

	super setUp.
	self element: (WBRectangularElement newWithCanvas: self canvas).
	self element position: 100 @ 100.
	self element extent: 100 @ 100.
]

{
	#category : #tests,
	#'squeak_changestamp' : 'si 7/11/2024 20:41'
}
WBElementResizeTests >> testOpenFrame [
	
	self element addResizeFrame.
	
	self assert: self element resizeFrame class = WBResizeFrame
	
]

{
	#category : #tests,
	#'squeak_changestamp' : 'si 7/11/2024 20:42'
}
WBElementResizeTests >> testRectangleResizeBottom [
	| frame |
	
	self canvas position: 0 @ 0.
	self canvas extent: 300 @ 300.
	self element addResizeFrame.
	frame := self element resizeFrame.
	frame resizeBottom: 250.
	
	self assert: self element bottom = 250
	
]

{
	#category : #tests,
	#'squeak_changestamp' : 'si 7/11/2024 20:43'
}
WBElementResizeTests >> testRectangleResizeBottomMin [
	| frame |
	
	self canvas position: 0 @ 0.
	self canvas extent: 300 @ 300.
	self element addResizeFrame.
	frame := self element resizeFrame.
	frame resizeBottom: 100.
	
	self assert: self element bottom = (100 + WBResizeFrame resizeWidth)
	
]

{
	#category : #tests,
	#'squeak_changestamp' : 'si 7/11/2024 20:43'
}
WBElementResizeTests >> testRectangleResizeButtomBorder [
	| frame |
	
	self canvas position: 0 @ 0.
	self canvas extent: 300 @ 300.
	self element addResizeFrame.
	frame := self element resizeFrame.
	frame resizeBottom: 350.
	
	self assert: self element bottom = 300
	
]

{
	#category : #tests,
	#'squeak_changestamp' : 'si 7/11/2024 20:43'
}
WBElementResizeTests >> testRectangleResizeLeft [
	| frame |
	
	self canvas position: 0 @ 0.
	self canvas extent: 300 @ 300.
	self element addResizeFrame.
	frame := self element resizeFrame.
	frame resizeLeft: 50.
	
	self assert: self element left = 50
	
]

{
	#category : #tests,
	#'squeak_changestamp' : 'si 7/11/2024 20:43'
}
WBElementResizeTests >> testRectangleResizeLeftBorder [
	| frame |
	
	self canvas position: 0 @ 0.
	self canvas extent: 300 @ 300.
	self element addResizeFrame.
	frame := self element resizeFrame.
	frame resizeLeft: -10.
	
	self assert: self element left = 0
	
]

{
	#category : #tests,
	#'squeak_changestamp' : 'si 7/11/2024 20:44'
}
WBElementResizeTests >> testRectangleResizeLeftMin [
	| frame |
	
	self canvas position: 0 @ 0.
	self canvas extent: 300 @ 300.
	self element addResizeFrame.
	frame := self element resizeFrame.
	frame resizeLeft: 250.
	
	self assert: self element left = (200 - (WBResizeFrame resizeWidth))
	
]

{
	#category : #tests,
	#'squeak_changestamp' : 'si 7/11/2024 20:44'
}
WBElementResizeTests >> testRectangleResizeRight [
	| frame |
	
	self canvas position: 0 @ 0.
	self canvas extent: 300 @ 300.
	self element addResizeFrame.
	frame := self element resizeFrame.
	frame resizeRight: 250.
	
	self assert: self element right = 250
	
]

{
	#category : #tests,
	#'squeak_changestamp' : 'si 7/11/2024 20:44'
}
WBElementResizeTests >> testRectangleResizeRightBorder [
	| frame |
	
	self canvas position: 0 @ 0.
	self canvas extent: 300 @ 300.
	self element addResizeFrame.
	frame := self element resizeFrame.
	frame resizeRight: 350.
	
	self assert: self element right = 300
	
]

{
	#category : #tests,
	#'squeak_changestamp' : 'si 7/11/2024 20:44'
}
WBElementResizeTests >> testRectangleResizeRightMin [
	| frame |
	
	self canvas position: 0 @ 0.
	self canvas extent: 300 @ 300.
	self element addResizeFrame.
	frame := self element resizeFrame.
	frame resizeRight: 100.
	
	self assert: self element right = (100 + WBResizeFrame resizeWidth)
	
]

{
	#category : #tests,
	#'squeak_changestamp' : 'si 7/11/2024 20:45'
}
WBElementResizeTests >> testRectangleResizeTop [
	| frame |
	
	self canvas position: 0 @ 0.
	self canvas extent: 300 @ 300.
	self element addResizeFrame.
	frame := self element resizeFrame.
	frame resizeTop: 50.
	
	self assert: self element top = 50
	
]

{
	#category : #tests,
	#'squeak_changestamp' : 'si 7/11/2024 20:45'
}
WBElementResizeTests >> testRectangleResizeTopBorder [
	| frame |
	
	self canvas position: 0 @ 0.
	self canvas extent: 300 @ 300.
	self element addResizeFrame.
	frame := self element resizeFrame.
	frame resizeTop: -10.
	
	self assert: self element top = 0
	
]

{
	#category : #tests,
	#'squeak_changestamp' : 'si 7/11/2024 20:45'
}
WBElementResizeTests >> testRectangleResizeTopMin [
	| frame |
	
	self canvas position: 0 @ 0.
	self canvas extent: 300 @ 300.
	self element addResizeFrame.
	frame := self element resizeFrame.
	frame resizeTop: 250.
	
	self assert: self element top = (200 - (WBResizeFrame resizeWidth))
	
]
