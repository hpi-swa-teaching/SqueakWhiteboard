Class {
	#name : #WBResizeHandleTests,
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
WBResizeHandleTests >> canvas [

	^ canvas
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'si 6/21/2024 00:53'
}
WBResizeHandleTests >> canvas: anObject [

	canvas := anObject
]

{
	#category : #setUp,
	#'squeak_changestamp' : 'is 6/15/2024 12:58'
}
WBResizeHandleTests >> setUp [

	super setUp.
	self canvas: WBCanvas new

]

{
	#category : #tearDown,
	#'squeak_changestamp' : 'is 6/4/2024 17:24'
}
WBResizeHandleTests >> tearDown [

	super tearDown.
	self canvas ifNotNil: [:canvas | canvas owner delete]
]

{
	#category : #testing,
	#'squeak_changestamp' : 'JK 6/25/2024 16:19'
}
WBResizeHandleTests >> testMouseEvents [
	| aResizeHandle aMouseEvent |
	
	aResizeHandle := WBResizeHandle new.
	aMouseEvent := MouseButtonEvent new.
	aMouseEvent setType: #mouseDown position: aResizeHandle center which: 4 buttons: aMouseEvent class redButton hand: HandMorph new stamp: 0.
	self assert: (aResizeHandle handlesMouseDown: aMouseEvent) = true.
	self assert: (aResizeHandle handlesMouseOver: aMouseEvent) = true.
]
