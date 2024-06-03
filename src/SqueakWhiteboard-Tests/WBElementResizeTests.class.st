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
