Class {
	#name : #WBButtonTests,
	#superclass : #TestCase,
	#instVars : [
		'canvas'
	],
	#category : #'SqueakWhiteboard-Tests'
}

{
	#category : #'mouse click',
	#'squeak_changestamp' : 'si 7/12/2024 10:57'
}
WBButtonTests >> artificialMouseClick [
	| mouseEvent |
	
	mouseEvent := MouseButtonEvent new.
	mouseEvent setType: #mouseDown position: self canvas position + (100 @ 100) which: 4 buttons: mouseEvent class redButton hand: HandMorph new stamp: 0.
	^ mouseEvent
]

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
	#category : #'getting button',
	#'squeak_changestamp' : 'si 7/12/2024 10:56'
}
WBButtonTests >> getButtonWithFunctionality: aBlock from: aCollection [

	aCollection do: [:b | b block asString = aBlock asString ifTrue: [^ b]]
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
	#'squeak_changestamp' : 'si 7/12/2024 10:58'
}
WBButtonTests >> testButtonClickColor [
	| aButton |
	
	aButton := WBButton new block: [:b | nil].
	self assert: aButton color = aButton backgroundColor.
	
	aButton mouseDown: self artificialMouseClick.
	self assert: aButton color = aButton clickedColor.
	
	aButton mouseUp: self artificialMouseClick.
	self assert: aButton color = aButton backgroundColor
	
	
	
	
	
	
]

{
	#category : #testing,
	#'squeak_changestamp' : 'si 7/12/2024 10:59'
}
WBButtonTests >> testButtonHoverColor [
	| aButton |
	
	aButton := WBButton new.
	self assert: aButton color = aButton backgroundColor.
	
	aButton mouseEnter: self artificialMouseClick.
	self assert: aButton color = aButton hoverColor.
	
	aButton mouseLeave: self artificialMouseClick.
	self assert: aButton color = aButton backgroundColor
	
	
	
	
	
	
]

{
	#category : #testing,
	#'squeak_changestamp' : 'si 7/12/2024 11:01'
}
WBButtonTests >> testMouseDown [
	| aButton |
	
	aButton := self canvas toolbar buttons at: 1.
	self assert: (aButton handlesMouseOver: self artificialMouseClick) = true.
	self assert: (aButton handlesMouseDown: self artificialMouseClick) = true.
	
	"Test whether button actives on mouseUp"
	aButton mouseDown: self artificialMouseClick.
	self assert: aButton currentMouseEvent = nil.
	
	"Test whether button activates only if position of mouse is still above button. Currently the mouse isn't"
	aButton mouseUp: self artificialMouseClick.
	self assert: aButton currentMouseEvent = nil.
	
	aButton mouseUp: (self artificialMouseClick position: aButton center).
	self assert: aButton currentMouseEvent = (self artificialMouseClick position: aButton center)
	
	
	
]
