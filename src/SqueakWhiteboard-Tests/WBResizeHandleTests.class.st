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
	#'squeak_changestamp' : 'is 7/12/2024 19:57'
}
WBResizeHandleTests >> testResizeCursorBottomLeft [
	| aResizeHandleBottomLeft  aMouseEvent |
	
	aResizeHandleBottomLeft := WBResizeBottomLeft new.
	aMouseEvent := MouseButtonEvent new.
	aMouseEvent setType: #mouseDown position: (0 @ 0) which: 4 buttons: aMouseEvent class redButton hand: HandMorph new stamp: 0.
	
	aResizeHandleBottomLeft mouseEnter: aMouseEvent.
	self assert: Cursor currentCursor = aResizeHandleBottomLeft class resizeCursor.
	
	aResizeHandleBottomLeft mouseLeave: aMouseEvent.
	self assert: Cursor currentCursor = Cursor normal
]

{
	#category : #testing,
	#'squeak_changestamp' : 'is 7/12/2024 19:58'
}
WBResizeHandleTests >> testResizeCursorBottomRight [
	| aResizeHandleBottomRight aMouseEvent |

	aResizeHandleBottomRight := WBResizeBottomRight new.
	aMouseEvent := MouseButtonEvent new.
	aMouseEvent setType: #mouseDown position: (0 @ 0) which: 4 buttons: aMouseEvent class redButton hand: HandMorph new stamp: 0.
	
	aResizeHandleBottomRight mouseEnter: aMouseEvent.
	self assert: Cursor currentCursor = aResizeHandleBottomRight class resizeCursor.
	
	aResizeHandleBottomRight mouseLeave: aMouseEvent.
	self assert: Cursor currentCursor =  Cursor normal
]

{
	#category : #testing,
	#'squeak_changestamp' : 'is 7/12/2024 19:58'
}
WBResizeHandleTests >> testResizeCursorTopLeft [
	| aResizeHandleTopLeft aMouseEvent |
	
	aResizeHandleTopLeft := WBResizeTopLeft new.
	aMouseEvent := MouseButtonEvent new.
	aMouseEvent setType: #mouseDown position: (0 @ 0) which: 4 buttons: aMouseEvent class redButton hand: HandMorph new stamp: 0.
	
	aResizeHandleTopLeft mouseEnter: aMouseEvent.
	self assert: Cursor currentCursor = aResizeHandleTopLeft class resizeCursor.
	
	aResizeHandleTopLeft mouseLeave: aMouseEvent.
	self assert: Cursor currentCursor =  Cursor normal
	
	
]

{
	#category : #testing,
	#'squeak_changestamp' : 'is 7/12/2024 19:58'
}
WBResizeHandleTests >> testResizeCursorTopRight [
	| aResizeHandleTopRight aMouseEvent |

	aResizeHandleTopRight := WBResizeTopRight new.
	aMouseEvent := MouseButtonEvent new.
	aMouseEvent setType: #mouseDown position: (0 @ 0) which: 4 buttons: aMouseEvent class redButton hand: HandMorph new stamp: 0.
	
	aResizeHandleTopRight mouseEnter: aMouseEvent.
	self assert: Cursor currentCursor = aResizeHandleTopRight class resizeCursor.
	
	aResizeHandleTopRight mouseLeave: aMouseEvent.
	self assert: Cursor currentCursor =  Cursor normal
]
