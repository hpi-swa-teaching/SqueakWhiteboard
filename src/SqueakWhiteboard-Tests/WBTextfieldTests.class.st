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
	#category : #testing,
	#'squeak_changestamp' : 'si 7/11/2024 14:15'
}
WBTextfieldTests >> testCenteredText [
	| anElement |
	
	anElement := WBRectangularElement newWithCanvas:  self canvas.
	"alignment = 2 means centered"
	
	self assert: anElement textField textMorph textStyle alignment = 2
]

{
	#category : #testing,
	#'squeak_changestamp' : 'si 7/11/2024 14:15'
}
WBTextfieldTests >> testDefaultContents [
	| anElement |
	
	anElement := WBRectangularElement newWithCanvas: self canvas.
	
	self assert: anElement supportsText = true
	
]

{
	#category : #testing,
	#'squeak_changestamp' : 'si 7/11/2024 14:15'
}
WBTextfieldTests >> testKeyboardInputOfTextfield [
	| anElement aKeyboardEvent |
	
	anElement := WBRectangularElement newWithCanvas: self canvas.
	aKeyboardEvent := KeyboardEvent new.
	"keyValue: 69 = e"
	aKeyboardEvent setType: #keystroke buttons: 1 position: 0 @ 0 keyValue: 69 hand: anElement currentHand stamp: 0.
	
	self assert: anElement supportsText = true.
	
	anElement textField textMorph keyStroke: aKeyboardEvent.
	self assert: anElement textField textMorph contents = 'E'.
	
	self assert: anElement textField hasUnacceptedEdits = false



]

{
	#category : #testing,
	#'squeak_changestamp' : 'si 7/11/2024 14:15'
}
WBTextfieldTests >> testSupportsText [
	| anElement |
	
	anElement := WBRectangularElement newWithCanvas:  self canvas.
	anElement supportsText:  false.
	self assert: (anElement textField) isNil = true.
	
	anElement supportsText:  true.
	self assert: (anElement textField) isNil = false.
	
	anElement supportsText:  false.
	self assert: (anElement textField) isNil = true
]

{
	#category : #testing,
	#'squeak_changestamp' : 'si 7/11/2024 14:15'
}
WBTextfieldTests >> testTextfieldActivation [
	| elements aFirstMouseEvent aSecondMouseEvent aThirdMouseEvent |
	
	elements := OrderedCollection withAll: 
	{ WBRectangularElement newWithCanvas: self canvas. WBCircularElement newWithCanvas: self canvas. WBNote newWithCanvas: self canvas . WBLine newWithCanvas: self canvas . WBEdgeOfLine newWithCanvas: self canvas}.
	aFirstMouseEvent := MouseButtonEvent new.
	aFirstMouseEvent setType: #mouseDown position: elements first position which: 4 buttons: aFirstMouseEvent class redButton hand: HandMorph new stamp: 0.
	aSecondMouseEvent := MouseButtonEvent new.
	aSecondMouseEvent setType: #mouseDown position: elements first position which: 4 buttons: aSecondMouseEvent class redButton hand: HandMorph new stamp: elements first class doubleClickMaxDelta + 1.
	aThirdMouseEvent := MouseButtonEvent new.
	aThirdMouseEvent setType: #mouseDown position: elements first position which: 4 buttons: aThirdMouseEvent class redButton hand: HandMorph new stamp: elements first class doubleClickMaxDelta + 2.
	
	elements do: [:anElement | 
		anElement supportsText ifTrue: [
			self assert: anElement textField enabled = false.
			
			anElement mouseDown: aFirstMouseEvent.
			anElement mouseDown: aSecondMouseEvent.
			self assert: anElement textField enabled = false.
			
			anElement mouseDown: aThirdMouseEvent.
			self assert: anElement textField enabled = true.
			
			self assert: self canvas activeElement = nil.
			
			self assert: self canvas activeTextbox = anElement]]
	
	
	
	
]

{
	#category : #testing,
	#'squeak_changestamp' : 'is 7/12/2024 18:30'
}
WBTextfieldTests >> testTextfieldCursor [
	| anElement aMouseEvent prevCursor |
	
	anElement := WBRectangularElement newWithCanvas: self canvas.
	aMouseEvent := MouseButtonEvent new.
	aMouseEvent setType: #mouseDown position: anElement position which: 4 buttons: aMouseEvent class redButton hand: HandMorph new stamp: 0.

	prevCursor := Cursor currentCursor.
	anElement textField textMorph mouseEnter: aMouseEvent.
	self assert: Cursor currentCursor = Cursor text.
	
	anElement textField textMorph mouseLeave: aMouseEvent.
	self assert: Cursor currentCursor = prevCursor
]

{
	#category : #testing,
	#'squeak_changestamp' : 'is 7/12/2024 20:10'
}
WBTextfieldTests >> testTextfieldDeactivationViaCanvas [
	| elements aFirstMouseEvent aSecondMouseEvent |
	
	elements := OrderedCollection withAll: 
	{ WBRectangularElement newWithCanvas: self canvas. WBCircularElement newWithCanvas: self canvas. WBNote newWithCanvas: self canvas . WBLine newWithCanvas: self canvas . WBEdgeOfLine newWithCanvas: self canvas }.
	aFirstMouseEvent := MouseButtonEvent new.
	aFirstMouseEvent setType: #mouseDown position: elements first position which: 4 buttons: aFirstMouseEvent class redButton hand: HandMorph new stamp: 0.
	aSecondMouseEvent := MouseButtonEvent new.
	aSecondMouseEvent setType: #mouseDown position: elements first position + (1 @ 1) which: 4 buttons: aSecondMouseEvent class redButton hand: HandMorph new stamp: 0.
	
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
	#category : #testing,
	#'squeak_changestamp' : 'si 7/11/2024 14:15'
}
WBTextfieldTests >> testTextfieldDeactivationViaElement [
	| aFirstElement aSecondElement aFirstMouseEvent aSecondMouseEvent |
	
	aFirstElement := WBRectangularElement newWithCanvas: self canvas.
	aSecondElement := WBRectangularElement newWithCanvas: self canvas.
	aSecondElement position: aFirstElement position + aSecondElement extent.
	aFirstMouseEvent := MouseButtonEvent new.
	aFirstMouseEvent setType: #mouseDown position: aFirstElement position which: 4 buttons: aFirstMouseEvent class redButton hand: HandMorph new stamp: 0.
	aSecondMouseEvent := MouseButtonEvent new.
	aSecondMouseEvent setType: #mouseDown position: aSecondElement position which: 4 buttons: aSecondMouseEvent class redButton hand: HandMorph new stamp: 0.
	
	aFirstElement activateTextbox: aFirstMouseEvent.
	
	self assert: self canvas activeElement = nil.
	self assert: self canvas activeTextbox = aFirstElement.
	
	aSecondElement mouseDown: aSecondMouseEvent.
	
	self assert: aFirstElement textField enabled = false.
	self assert: self canvas activeTextbox = nil
]

{
	#category : #testing,
	#'squeak_changestamp' : 'si 7/11/2024 14:15'
}
WBTextfieldTests >> testTextfieldDeactivationViaEscape [
	| anElement aMouseEvent aKeyboardEvent |
	
	anElement := WBRectangularElement newWithCanvas: self canvas.
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
	self assert: self canvas activeTextbox = nil
]

{
	#category : #testing,
	#'squeak_changestamp' : 'si 7/11/2024 14:15'
}
WBTextfieldTests >> testTextfieldKeyboardEventHandling [
	| anElement aFirstMouseEvent aSecondMouseEvent aKeyboardEvent |
	
	anElement := WBRectangularElement newWithCanvas: self canvas.
	aFirstMouseEvent := MouseButtonEvent new.
	aFirstMouseEvent setType: #mouseDown position: anElement position which: 4 buttons: aFirstMouseEvent class redButton hand: HandMorph new stamp: 0.
	aSecondMouseEvent := MouseButtonEvent new.
	aSecondMouseEvent setType: #mouseDown position: anElement position which: 4 buttons: aSecondMouseEvent class redButton hand: HandMorph new stamp: 0.
	aKeyboardEvent := KeyboardEvent new.
	
	self assert: (anElement textField handlesKeyboard: aFirstMouseEvent) = anElement textField enabled.
	self assert: (anElement textField textMorph handlesKeyboard: aKeyboardEvent) = false.
	
	anElement mouseDown: aFirstMouseEvent.
	anElement mouseDown: aSecondMouseEvent.
	
	self assert: (anElement textField textMorph handlesKeyboard: aKeyboardEvent) = true
]

{
	#category : #testing,
	#'squeak_changestamp' : 'si 7/11/2024 14:15'
}
WBTextfieldTests >> testTextfieldMouseEventHandling [
	| anElement aFirstMouseEvent aSecondMouseEvent |
	
	anElement := WBRectangularElement newWithCanvas: self canvas.
	aFirstMouseEvent := MouseButtonEvent new.
	aFirstMouseEvent setType: #mouseDown position: anElement position which: 4 buttons: aFirstMouseEvent class redButton hand: HandMorph new stamp: 0.
	aSecondMouseEvent := MouseButtonEvent new.
	aSecondMouseEvent setType: #mouseDown position: anElement position which: 4 buttons: aSecondMouseEvent class redButton hand: HandMorph new stamp: 0.
	
	self assert: (anElement textField handlesMouseOver: aFirstMouseEvent) = false.
	self assert: (anElement textField handlesMouseDown: aFirstMouseEvent) = false.
	self assert: (anElement textField textMorph handlesMouseDown: aFirstMouseEvent) = false.
	
	anElement mouseDown: aFirstMouseEvent.
	anElement mouseDown: aSecondMouseEvent.
	
	self assert: (anElement textField handlesMouseOver: aFirstMouseEvent) = false.
	self assert: (anElement textField handlesMouseDown: aFirstMouseEvent) = true.
	self assert: (anElement textField textMorph handlesMouseDown: aFirstMouseEvent) = true
	
	
]

{
	#category : #testing,
	#'squeak_changestamp' : 'si 7/11/2024 14:15'
}
WBTextfieldTests >> testTextfieldResize [
	| anElement elementBounds textfieldBounds |
	
	anElement := WBRectangularElement newWithCanvas: self canvas.
	anElement extent: anElement extent * 2.
	textfieldBounds := anElement textField bounds.
	elementBounds := anElement bounds.
	
	self assert: elementBounds origin = ((textfieldBounds origin x - (anElement class defaultTextBorderOffset / 2)) @ (textfieldBounds origin y - (anElement class defaultTextBorderOffset / 2))).
	self assert: elementBounds corner = ((textfieldBounds corner x + (anElement class defaultTextBorderOffset / 2)) @ (textfieldBounds corner y + (anElement class defaultTextBorderOffset / 2))).
	
	anElement extent: anElement extent * 0.25.
	textfieldBounds := anElement textField bounds.
	elementBounds := anElement bounds.
	
	self assert: elementBounds origin = ((textfieldBounds origin x - (anElement class defaultTextBorderOffset / 2)) @ (textfieldBounds origin y - (anElement class defaultTextBorderOffset / 2))).
	self assert: elementBounds corner = ((textfieldBounds corner x + (anElement class defaultTextBorderOffset / 2)) @ (textfieldBounds corner y + (anElement class defaultTextBorderOffset / 2))).
	
	anElement extent: anElement extent * (-2).
	textfieldBounds := anElement textField bounds.
	elementBounds := anElement bounds.
	
	self assert: elementBounds origin = ((textfieldBounds origin x - (anElement class defaultTextBorderOffset / 2)) @ (textfieldBounds origin y - (anElement class defaultTextBorderOffset / 2))).
	self assert: elementBounds corner = ((textfieldBounds corner x + (anElement class defaultTextBorderOffset / 2)) @ (textfieldBounds corner y + (anElement class defaultTextBorderOffset / 2)))
]

{
	#category : #testing,
	#'squeak_changestamp' : 'si 7/11/2024 14:15'
}
WBTextfieldTests >> testTextfieldSize [
	| anElement textfieldBounds elementBounds |
	
	anElement := WBRectangularElement newWithCanvas: self canvas.
	textfieldBounds := anElement textField bounds.
	elementBounds := anElement  bounds.
	
	self assert: elementBounds origin = ((textfieldBounds origin x - (anElement class defaultTextBorderOffset / 2)) @ (textfieldBounds origin y - (anElement class defaultTextBorderOffset / 2))).
	self assert: elementBounds corner = ((textfieldBounds corner x + (anElement class defaultTextBorderOffset / 2)) @ (textfieldBounds corner y + (anElement class defaultTextBorderOffset / 2)))
	
	
	
]
