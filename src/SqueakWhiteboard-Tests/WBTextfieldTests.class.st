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
	#'squeak_changestamp' : 'is 6/17/2024 01:51'
}
WBTextfieldTests >> testCenteredText [
	| anElement |
	
	anElement := WBElement newWithCanvas:  self canvas.
	"alignment = 2 means centered"
	self assert: anElement textField textMorph textStyle alignment = 2
]

{
	#category : #Testing,
	#'squeak_changestamp' : 'is 6/17/2024 01:09'
}
WBTextfieldTests >> testTextfieldActivation [
	| anElement aFirstMouseEvent aSecondMouseEvent aThirdMouseEvent |
	
	anElement := WBElement newWithCanvas: self canvas.
	aFirstMouseEvent := MouseButtonEvent new.
	aFirstMouseEvent setType: #mouseDown position: anElement position which: 4 buttons: aFirstMouseEvent class redButton hand: HandMorph new stamp: 0.
	aSecondMouseEvent := MouseButtonEvent new.
	aSecondMouseEvent setType: #mouseDown position: anElement position which: 4 buttons: aSecondMouseEvent class redButton hand: HandMorph new stamp: anElement doubleClickMaxDelta + 1.
	aThirdMouseEvent := MouseButtonEvent new.
	aThirdMouseEvent setType: #mouseDown position: anElement position which: 4 buttons: aThirdMouseEvent class redButton hand: HandMorph new stamp: anElement doubleClickMaxDelta + 2.
	
	self assert: anElement textField enabled = false.
	anElement mouseDown: aFirstMouseEvent.
	anElement mouseDown: aSecondMouseEvent.
	self assert: anElement textField enabled = false.
	anElement mouseDown: aThirdMouseEvent.
	self assert: anElement textField enabled = true.
	self assert: self canvas activeElement = nil.
	self assert: self canvas activeTextbox = anElement.
	
	
	
]

{
	#category : #Testing,
	#'squeak_changestamp' : 'is 6/17/2024 01:19'
}
WBTextfieldTests >> testTextfieldDeactivationViaCanvas [
	| anElement aFirstMouseEvent aSecondMouseEvent|
	
	anElement := WBElement newWithCanvas: self canvas.
	aFirstMouseEvent := MouseButtonEvent new.
	aFirstMouseEvent setType: #mouseDown position: anElement position which: 4 buttons: aFirstMouseEvent class redButton hand: HandMorph new stamp: 0.
	aSecondMouseEvent := MouseButtonEvent new.
	aSecondMouseEvent setType: #mouseDown position: anElement position + (1@1) which: 4 buttons: aSecondMouseEvent class redButton hand: HandMorph new stamp: 0.
	
	anElement activateTextbox: aFirstMouseEvent.
	self assert: self canvas activeElement = nil.
	self assert: self canvas activeTextbox = anElement.
	self canvas mouseDown: aSecondMouseEvent.
	self assert: anElement textField enabled = false.
	self assert: self canvas activeTextbox = nil.
	
]

{
	#category : #Testing,
	#'squeak_changestamp' : 'is 6/17/2024 01:19'
}
WBTextfieldTests >> testTextfieldDeactivationViaElement [
	| aFirstElement aSecondElement aFirstMouseEvent aSecondMouseEvent|
	
	aFirstElement := WBElement newWithCanvas: self canvas.
	aSecondElement := WBElement newWithCanvas: self canvas.
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
	#'squeak_changestamp' : 'is 6/17/2024 01:29'
}
WBTextfieldTests >> testTextfieldDeactivationViaEscape [
| anElement aMouseEvent aKeyboardEvent|
	
	anElement := WBElement newWithCanvas: self canvas.
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
	#'squeak_changestamp' : 'is 6/17/2024 23:37'
}
WBTextfieldTests >> testTextfieldResize [
	| anElement elementBounds textfieldBounds |
	
	anElement := WBElement newWithCanvas: self canvas.
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
	#'squeak_changestamp' : 'is 6/17/2024 23:37'
}
WBTextfieldTests >> testTextfieldSize [
	| anElement textfieldBounds elementBounds |
	
	anElement := WBElement newWithCanvas: self canvas.
	textfieldBounds := anElement textField bounds.
	elementBounds := anElement  bounds.
	
	self assert: elementBounds origin = ((textfieldBounds origin x - (anElement textBorderOffset/2)) @ (textfieldBounds origin y - (anElement textBorderOffset/2))).
	self assert: elementBounds corner = ((textfieldBounds corner x + (anElement textBorderOffset/2)) @ (textfieldBounds corner y + (anElement textBorderOffset/2)))
	
	
	
]
