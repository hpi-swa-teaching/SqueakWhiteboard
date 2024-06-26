Class {
	#name : #WBResizeBarTests,
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
WBResizeBarTests >> canvas [

	^ canvas
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'si 6/21/2024 00:53'
}
WBResizeBarTests >> canvas: anObject [

	canvas := anObject
]

{
	#category : #setUp,
	#'squeak_changestamp' : 'is 6/15/2024 12:58'
}
WBResizeBarTests >> setUp [

	super setUp.
	self canvas: WBCanvas new

]

{
	#category : #tearDown,
	#'squeak_changestamp' : 'is 6/4/2024 17:24'
}
WBResizeBarTests >> tearDown [

	super tearDown.
	self canvas ifNotNil: [:canvas | canvas owner delete]
]

{
	#category : #testing,
	#'squeak_changestamp' : 'JK 6/25/2024 16:14'
}
WBResizeBarTests >> testMouseCurser [
	| aResizeBar aMouseEvent prevCursor |
	
	aResizeBar := WBResizeBar new.
	aMouseEvent := MouseButtonEvent new.
	aMouseEvent setType: #mouseDown position: aResizeBar center which: 4 buttons: aMouseEvent class redButton hand: HandMorph new stamp: 0.
	prevCursor := Cursor currentCursor.
	aResizeBar mouseEnter: aMouseEvent.
	self assert: Cursor currentCursor = Cursor move.
]

{
	#category : #testing,
	#'squeak_changestamp' : 'JK 6/25/2024 16:09'
}
WBResizeBarTests >> testMouseDown [
	| aResizeBar aMouseEvent |
	
	aResizeBar := WBResizeBar new.
	aMouseEvent := MouseButtonEvent new.
	aMouseEvent setType: #mouseDown position: aResizeBar position which: 4 buttons: aMouseEvent class redButton hand: HandMorph new stamp: 0.
	self assert: (aResizeBar handlesMouseDown: aMouseEvent) = true.
]

{
	#category : #testing,
	#'squeak_changestamp' : 'is 6/26/2024 10:24'
}
WBResizeBarTests >> testMouseEvents [
	| aResizeBar aMouseEvent |
	
	aResizeBar := WBResizeBar new.
	aMouseEvent := MouseButtonEvent new.
	aMouseEvent setType: #mouseDown position: aResizeBar position which: 4 buttons: aMouseEvent class redButton hand: HandMorph new stamp: 0.
	
	self assert: (aResizeBar handlesMouseDown: aMouseEvent) = true.
	self assert: (aResizeBar handlesMouseOver: aMouseEvent) = true
	
]

{
	#category : #testing,
	#'squeak_changestamp' : 'JK 6/25/2024 16:09'
}
WBResizeBarTests >> testMouseOver [
	| aResizeBar aMouseEvent |
	
	aResizeBar := WBResizeBar new.
	aMouseEvent := MouseButtonEvent new.
	aMouseEvent setType: #mouseDown position: aResizeBar position which: 4 buttons: aMouseEvent class redButton hand: HandMorph new stamp: 0.
	self assert: (aResizeBar handlesMouseOver: aMouseEvent) = true
]

{
	#category : #testing,
	#'squeak_changestamp' : 'is 6/26/2024 10:24'
}
WBResizeBarTests >> testResizeCursor [
	| aResizeBar aMouseEvent prevCursor |
	
	aResizeBar := WBResizeBar new.
	aMouseEvent := MouseButtonEvent new.
	aMouseEvent setType: #mouseDown position: aResizeBar position which: 4 buttons: aMouseEvent class redButton hand: HandMorph new stamp: 0.
	prevCursor := Cursor currentCursor.
	
	aResizeBar mouseEnter: aMouseEvent.
	self assert: Cursor currentCursor = Cursor move.
	aResizeBar mouseLeave: aMouseEvent.
	self assert: Cursor currentCursor = prevCursor
]
