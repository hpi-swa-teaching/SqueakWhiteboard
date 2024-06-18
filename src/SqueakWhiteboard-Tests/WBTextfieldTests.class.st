Class {
	#name : #WBTextfieldTests,
	#superclass : #TestCase,
	#instVars : [
		'canvas'
	],
	#category : #'SqueakWhiteboard-Tests'
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'is 6/17/2024 00:36'
}
WBTextfieldTests >> canvas [

	^ canvas
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'is 6/17/2024 00:36'
}
WBTextfieldTests >> canvas: aCanvas [

	canvas := aCanvas
]

{
	#category : #setUp,
	#'squeak_changestamp' : 'is 6/17/2024 00:36'
}
WBTextfieldTests >> setUp [

	super setUp.
	self canvas: WBCanvas new

]

{
	#category : #tearDown,
	#'squeak_changestamp' : 'is 6/17/2024 00:36'
}
WBTextfieldTests >> tearDown [

	super tearDown.
	self canvas ifNotNil: [:canvas | canvas owner delete]
]

{
	#category : #Testing,
	#'squeak_changestamp' : 'is 6/18/2024 22:49'
}
WBTextfieldTests >> testCenteredText [
	| anElement |
	
	anElement := WBRectangle newWithCanvas:  self canvas.
	"alignment = 2 means centered"
	self assert: anElement textField textMorph textStyle alignment = 2
]

{
	#category : #Testing,
	#'squeak_changestamp' : 'is 6/18/2024 23:18'
}
WBTextfieldTests >> testSupportsText [
	| anElement |
	
	anElement := WBRectangle newWithCanvas:  self canvas.
	anElement supportsText:  false.
	self assert: (anElement textField) isNil = true.
	anElement supportsText:  true.
	self assert: (anElement textField) isNil = false.
	anElement supportsText:  false.
	self assert: (anElement textField) isNil = true.
]

{
	#category : #Testing,
	#'squeak_changestamp' : 'is 6/18/2024 23:02'
}
WBTextfieldTests >> testTextfieldActivation [
	| elements aFirstMouseEvent aSecondMouseEvent aThirdMouseEvent |
	
	elements := OrderedCollection withAll: 
	{ WBRectangle newWithCanvas: self canvas. WBCircle newWithCanvas: self canvas. WBNote newWithCanvas: self canvas . WBLine newWithCanvas: self canvas . WBEdgeOfLine newWithCanvas: self canvas}.
	aFirstMouseEvent := MouseButtonEvent new.
	aFirstMouseEvent setType: #mouseDown position: elements first position which: 4 buttons: aFirstMouseEvent class redButton hand: HandMorph new stamp: 0.
	aSecondMouseEvent := MouseButtonEvent new.
	aSecondMouseEvent setType: #mouseDown position: elements first position which: 4 buttons: aSecondMouseEvent class redButton hand: HandMorph new stamp: elements first doubleClickMaxDelta + 1.
	aThirdMouseEvent := MouseButtonEvent new.
	aThirdMouseEvent setType: #mouseDown position: elements first position which: 4 buttons: aThirdMouseEvent class redButton hand: HandMorph new stamp: elements first doubleClickMaxDelta + 2.
	
	elements do: [:anElement | 
		anElement supportsText ifTrue: [
			self assert: anElement textField enabled = false.
			anElement mouseDown: aFirstMouseEvent.
			anElement mouseDown: aSecondMouseEvent.
			self assert: anElement textField enabled = false.
			anElement mouseDown: aThirdMouseEvent.
			self assert: anElement textField enabled = true.
			self assert: self canvas activeElement = nil.
			self assert: self canvas activeTextbox = anElement]].
	
	
	
	
]

{
	#category : #Testing,
	#'squeak_changestamp' : 'is 6/18/2024 23:04'
}
WBTextfieldTests >> testTextfieldDeactivationViaCanvas [
	| elements aFirstMouseEvent aSecondMouseEvent|
	
	elements := OrderedCollection withAll: 
	{ WBRectangle newWithCanvas: self canvas. WBCircle newWithCanvas: self canvas. WBNote newWithCanvas: self canvas . WBLine newWithCanvas: self canvas . WBEdgeOfLine newWithCanvas: self canvas}.
	aFirstMouseEvent := MouseButtonEvent new.
	aFirstMouseEvent setType: #mouseDown position: elements first position which: 4 buttons: aFirstMouseEvent class redButton hand: HandMorph new stamp: 0.
	aSecondMouseEvent := MouseButtonEvent new.
	aSecondMouseEvent setType: #mouseDown position: elements first position + (1@1) which: 4 buttons: aSecondMouseEvent class redButton hand: HandMorph new stamp: 0.
	
	elements do: [:anElement |
		anElement supportsText ifTrue: [
			anElement activateTextbox: aFirstMouseEvent.
			self assert: self canvas activeElement = nil.
			self assert: self canvas activeTextbox = anElement.
			self canvas mouseDown: aSecondMouseEvent.
			self assert: anElement textField enabled = false.
			self assert: self canvas activeTextbox = nil]].
	
	
]

{
	#category : #Testing,
	#'squeak_changestamp' : 'is 6/18/2024 22:49'
}
WBTextfieldTests >> testTextfieldDeactivationViaElement [
	| aFirstElement aSecondElement aFirstMouseEvent aSecondMouseEvent|
	
	aFirstElement := WBRectangle newWithCanvas: self canvas.
	aSecondElement := WBRectangle newWithCanvas: self canvas.
	aSecondElement position: aFirstElement position + aSecondElement extent.
	aFirstMouseEvent := MouseButtonEvent new.
	aFirstMouseEvent setType: #mouseDown position: aFirstElement position which: 4 buttons: aFirstMouseEvent class redButton hand: HandMorph new stamp: 0.
	aSecondMouseEvent := MouseButtonEvent new.
	aSecondMouseEvent setType: #mouseDown position: aFirstElement position + (1@1) which: 4 buttons: aSecondMouseEvent class redButton hand: HandMorph new stamp: 0.
	
	aFirstElement activateTextbox: aFirstMouseEvent.
	self assert: self canvas activeElement = nil.
	self assert: self canvas activeTextbox = aFirstElement.
	aSecondElement mouseDown: aSecondMouseEvent.
	self assert: aFirstElement textField enabled = false.
	self assert: self canvas activeTextbox = nil.
]

{
	#category : #Testing,
	#'squeak_changestamp' : 'is 6/18/2024 22:50'
}
WBTextfieldTests >> testTextfieldDeactivationViaEscape [
| anElement aMouseEvent aKeyboardEvent|
	
	anElement := WBRectangle newWithCanvas: self canvas.
	aMouseEvent := MouseButtonEvent new.
	aMouseEvent setType: #mouseDown position: anElement position which: 4 buttons: aMouseEvent class redButton hand: HandMorph new stamp: 0.
	aKeyboardEvent := KeyboardEvent new.
	"keyValue: 27 = escape"
	aKeyboardEvent setType: #keystroke buttons: 1 position: 0@0 keyValue: 27 hand: anElement currentHand stamp: 0.

	anElement activateTextbox: aMouseEvent.
	self assert: self canvas activeElement = nil.
	self assert: self canvas activeTextbox = anElement.
	anElement textField textMorph keyStroke: aKeyboardEvent.
	self assert: anElement textField enabled = false.
	self assert: self canvas activeTextbox = nil.
]

{
	#category : #Testing,
	#'squeak_changestamp' : 'is 6/18/2024 22:50'
}
WBTextfieldTests >> testTextfieldResize [
	| anElement elementBounds textfieldBounds |
	
	anElement := WBRectangle newWithCanvas: self canvas.
	anElement extent: anElement extent * 2.
	textfieldBounds := anElement textField bounds.
	elementBounds := anElement bounds.
	
	self assert: elementBounds origin = ((textfieldBounds origin x - (anElement textBorderOffset/2)) @ (textfieldBounds origin y - (anElement textBorderOffset/2))).
	self assert: elementBounds corner = ((textfieldBounds corner x + (anElement textBorderOffset/2)) @ (textfieldBounds corner y + (anElement textBorderOffset/2))).
	
	anElement extent: anElement extent * 0.25.
	textfieldBounds := anElement textField bounds.
	elementBounds := anElement bounds.
	
	self assert: elementBounds origin = ((textfieldBounds origin x - (anElement textBorderOffset/2)) @ (textfieldBounds origin y - (anElement textBorderOffset/2))).
	self assert: elementBounds corner = ((textfieldBounds corner x + (anElement textBorderOffset/2)) @ (textfieldBounds corner y + (anElement textBorderOffset/2))).
	
	anElement extent: anElement extent * (-2).
	textfieldBounds := anElement textField bounds.
	elementBounds := anElement bounds.
	
	self assert: elementBounds origin = ((textfieldBounds origin x - (anElement textBorderOffset/2)) @ (textfieldBounds origin y - (anElement textBorderOffset/2))).
	self assert: elementBounds corner = ((textfieldBounds corner x + (anElement textBorderOffset/2)) @ (textfieldBounds corner y + (anElement textBorderOffset/2)))
	
	
]

{
	#category : #Testing,
	#'squeak_changestamp' : 'is 6/18/2024 22:50'
}
WBTextfieldTests >> testTextfieldSize [
	| anElement textfieldBounds elementBounds |
	
	anElement := WBRectangle newWithCanvas: self canvas.
	textfieldBounds := anElement textField bounds.
	elementBounds := anElement  bounds.
	
	self assert: elementBounds origin = ((textfieldBounds origin x - (anElement textBorderOffset/2)) @ (textfieldBounds origin y - (anElement textBorderOffset/2))).
	self assert: elementBounds corner = ((textfieldBounds corner x + (anElement textBorderOffset/2)) @ (textfieldBounds corner y + (anElement textBorderOffset/2)))
	
	
	
]
