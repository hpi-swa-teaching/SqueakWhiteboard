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
	#'squeak_changestamp' : 'is 6/26/2024 10:42'
}
WBResizeHandleTests >> testMouseDown [
	| aResizeHandle aMouseEvent |
	
	aResizeHandle := WBResizeBar new.
	aMouseEvent := MouseButtonEvent new.
	aMouseEvent setType: #mouseDown position: aResizeHandle position which: 4 buttons: aMouseEvent class redButton hand: HandMorph new stamp: 0.
	
	self assert: (aResizeHandle handlesMouseDown: aMouseEvent) = true
	
]

{
	#category : #testing,
	#'squeak_changestamp' : 'is 6/26/2024 10:42'
}
WBResizeHandleTests >> testMouseOver [
	| aResizeHandle aMouseEvent |
	
	aResizeHandle := WBResizeBar new.
	aMouseEvent := MouseButtonEvent new.
	aMouseEvent setType: #mouseDown position: aResizeHandle position which: 4 buttons: aMouseEvent class redButton hand: HandMorph new stamp: 0.
	
	self assert: (aResizeHandle handlesMouseOver: aMouseEvent) = true
	
]

{
	#category : #testing,
	#'squeak_changestamp' : 'is 6/26/2024 10:34'
}
WBResizeHandleTests >> testResizeCursor [
	| aResizeHandleBottomLeft aResizeHandleBottomRight aResizeHandleTopLeft aResizeHandleTopRight aMouseEvent prevCursor |
	
	aResizeHandleBottomLeft := WBResizeBottomLeft new.
	aResizeHandleBottomRight := WBResizeBottomRight new.
	aResizeHandleTopLeft := WBResizeTopLeft new.
	aResizeHandleTopRight := WBResizeTopRight new.
	aMouseEvent := MouseButtonEvent new.
	aMouseEvent setType: #mouseDown position: (0@0) which: 4 buttons: aMouseEvent class redButton hand: HandMorph new stamp: 0.
	prevCursor := Cursor currentCursor.
	
	aResizeHandleBottomLeft mouseEnter: aMouseEvent.
	self assert: Cursor currentCursor = Cursor resizeBottomLeft.
	aResizeHandleBottomLeft mouseLeave: aMouseEvent.
	self assert: Cursor currentCursor = prevCursor.
	
	aResizeHandleBottomRight mouseEnter: aMouseEvent.
	self assert: Cursor currentCursor = Cursor resizeBottomRight.
	aResizeHandleBottomLeft mouseLeave: aMouseEvent.
	self assert: Cursor currentCursor = prevCursor.
	
	aResizeHandleTopLeft mouseEnter: aMouseEvent.
	self assert: Cursor currentCursor = Cursor resizeTopLeft.
	aResizeHandleBottomLeft mouseLeave: aMouseEvent.
	self assert: Cursor currentCursor = prevCursor.
	
	aResizeHandleTopRight mouseEnter: aMouseEvent.
	self assert: Cursor currentCursor = Cursor resizeTopRight.
	aResizeHandleBottomLeft mouseLeave: aMouseEvent.
	self assert: Cursor currentCursor = prevCursor
]
