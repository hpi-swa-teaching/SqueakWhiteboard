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
	#'squeak_changestamp' : 'ACL 7/7/2024 19:50'
}
WBResizeBarTests >> testMouseDown [
	| aResizeBar aMouseEvent |
	
	aResizeBar := WBResizeBar new.
	aMouseEvent := MouseButtonEvent new.
	aMouseEvent setType: #mouseDown position: aResizeBar position which: 4 buttons: aMouseEvent class redButton hand: HandMorph new stamp: 0.
	
	self assert: (aResizeBar handlesMouseDown: aMouseEvent) = true
]

{
	#category : #testing,
	#'squeak_changestamp' : 'ACL 7/7/2024 19:50'
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
	#'squeak_changestamp' : 'is 7/12/2024 19:58'
}
WBResizeBarTests >> testResizeCursorBottom [
	| aResizeBarBottom aMouseEvent |
	
	aResizeBarBottom := WBResizeBottom new.
	aMouseEvent := MouseButtonEvent new.
	aMouseEvent setType: #mouseDown position: (0 @ 0) which: 4 buttons: aMouseEvent class redButton hand: HandMorph new stamp: 0.
	
	aResizeBarBottom mouseEnter: aMouseEvent.
	self assert: Cursor currentCursor = aResizeBarBottom class resizeCursor.
	
	aResizeBarBottom mouseLeave: aMouseEvent.
	self assert: Cursor currentCursor =  Cursor normal
]

{
	#category : #testing,
	#'squeak_changestamp' : 'is 7/12/2024 19:58'
}
WBResizeBarTests >> testResizeCursorLeft [
	| aResizeBarLeft aMouseEvent |
	
	aResizeBarLeft := WBResizeLeft new.
	aMouseEvent := MouseButtonEvent new.
	aMouseEvent setType: #mouseDown position: (0 @ 0) which: 4 buttons: aMouseEvent class redButton hand: HandMorph new stamp: 0.
	
	aResizeBarLeft mouseEnter: aMouseEvent.
	self assert: Cursor currentCursor = aResizeBarLeft class resizeCursor.
	
	aResizeBarLeft mouseLeave: aMouseEvent.
	self assert: Cursor currentCursor =  Cursor normal
]

{
	#category : #testing,
	#'squeak_changestamp' : 'is 7/12/2024 19:58'
}
WBResizeBarTests >> testResizeCursorRight [
	| aResizeBarRight  aMouseEvent |
	
	aResizeBarRight := WBResizeRight new.
	aMouseEvent := MouseButtonEvent new.
	aMouseEvent setType: #mouseDown position: (0 @ 0) which: 4 buttons: aMouseEvent class redButton hand: HandMorph new stamp: 0.
	
	aResizeBarRight mouseEnter: aMouseEvent.
	self assert: Cursor currentCursor = aResizeBarRight class resizeCursor.
	
	aResizeBarRight mouseLeave: aMouseEvent.
	self assert: Cursor currentCursor =  Cursor normal
]

{
	#category : #testing,
	#'squeak_changestamp' : 'is 7/12/2024 19:58'
}
WBResizeBarTests >> testResizeCursorTop [
	| aResizeBarTop aMouseEvent |
	
	aResizeBarTop := WBResizeTop new.
	aMouseEvent := MouseButtonEvent new.
	aMouseEvent setType: #mouseDown position: (0 @ 0) which: 4 buttons: aMouseEvent class redButton hand: HandMorph new stamp: 0.
	
	aResizeBarTop mouseEnter: aMouseEvent.
	self assert: Cursor currentCursor = aResizeBarTop class resizeCursor.
	
	aResizeBarTop mouseLeave: aMouseEvent.
	self assert: Cursor currentCursor =  Cursor normal
]
