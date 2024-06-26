Class {
	#name : #WBButtonTests,
	#superclass : #TestCase,
	#instVars : [
		'canvas'
	],
	#category : #'SqueakWhiteboard-Tests'
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'is 6/15/2024 13:00'
}
WBButtonTests >> canvas [

	^ canvas
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'is 6/15/2024 13:00'
}
WBButtonTests >> canvas: aCanvas [

	canvas := aCanvas
]

{
	#category : #setUp,
	#'squeak_changestamp' : 'is 6/15/2024 13:02'
}
WBButtonTests >> setUp [

	super setUp.
	self canvas: WBCanvas new

]

{
	#category : #tearDown,
	#'squeak_changestamp' : 'is 6/15/2024 13:02'
}
WBButtonTests >> tearDown [

	super tearDown.
	self canvas ifNotNil: [:canvas | canvas owner delete]
]

{
	#category : #testing,
	#'squeak_changestamp' : 'is 6/21/2024 18:52'
}
WBButtonTests >> testButtonClickColor [
	| aButton aMouseEvent |
	
	aButton := WBButton new block: [:b | nil].
	self assert: aButton color = aButton backgroundColor.
	
	aMouseEvent := MouseButtonEvent new.
	aMouseEvent setType: #mouseDown position: aButton position which: 4 buttons: aMouseEvent class redButton hand: HandMorph new stamp: 1.
	aButton mouseDown: aMouseEvent.
	self assert: aButton color = aButton clickedColor.
	
	aButton mouseUp: aMouseEvent.
	self assert: aButton color = aButton backgroundColor
	
	
	
	
	
	
]

{
	#category : #testing,
	#'squeak_changestamp' : 'is 6/21/2024 18:52'
}
WBButtonTests >> testButtonHoverColor [
	| aButton aMouseEvent |
	
	aButton := WBButton new.
	self assert: aButton color = aButton backgroundColor.
	
	aMouseEvent := MouseEvent new position: aButton position.
	aButton mouseEnter: aMouseEvent.
	self assert: aButton color = aButton hoverColor.
	
	aMouseEvent position: aMouseEvent position + aButton extent + 1000.
	aButton mouseLeave: aMouseEvent.
	self assert: aButton color = aButton backgroundColor
	
	
	
	
	
	
]

{
	#category : #testing,
	#'squeak_changestamp' : 'is 6/26/2024 10:42'
}
WBButtonTests >> testMouseDown [
	| aButton aMouseEvent |
	
	aButton := self canvas toolbar buttons at: 1.
	aMouseEvent := MouseButtonEvent new.
	aMouseEvent setType: #mouseDown position: (aButton position + aButton extent + (1@1)) which: 4 buttons: aMouseEvent class redButton hand: HandMorph new stamp: 0.
	self assert: (aButton handlesMouseOver: aMouseEvent) = true.
	self assert: (aButton handlesMouseDown: aMouseEvent) = true.
	
	"Test whether button actives on mouseUp"
	aButton mouseDown: aMouseEvent.
	self assert: aButton currentEvent = nil.
	
	"Test whether button activates only if position of mouse is still above button. Currently the mouse isn't"
	aButton mouseUp: aMouseEvent.
	self assert: aButton currentEvent = nil.
	
	aMouseEvent position: aButton position.
	aButton mouseUp: aMouseEvent.
	self assert: aButton currentEvent = aMouseEvent
	
	
	
]
