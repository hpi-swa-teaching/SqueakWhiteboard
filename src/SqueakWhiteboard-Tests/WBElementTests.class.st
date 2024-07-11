Class {
	#name : #WBElementTests,
	#superclass : #TestCase,
	#instVars : [
		'canvas'
	],
	#category : #'SqueakWhiteboard-Tests'
}

{
	#category : #'mouse click',
	#'squeak_changestamp' : 'si 7/11/2024 21:43'
}
WBElementTests >> artificialMouseClick [
	| mouseEvent |
	
	mouseEvent := MouseButtonEvent new.
	mouseEvent setType: #mouseDown position: self canvas position + (100 @ 100) which: 4 buttons: mouseEvent class redButton hand: HandMorph new stamp: 0.
	^ mouseEvent
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'is 6/22/2024 00:50'
}
WBElementTests >> canvas [

	^ canvas
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'is 6/22/2024 00:50'
}
WBElementTests >> canvas: aCavas [

	canvas := aCavas
]

{
	#category : #setUp,
	#'squeak_changestamp' : 'is 6/22/2024 00:50'
}
WBElementTests >> setUp [
	
	super setUp.
	self canvas: WBCanvas new

]

{
	#category : #tearDown,
	#'squeak_changestamp' : 'is 6/22/2024 00:50'
}
WBElementTests >> tearDown [
	
	super tearDown.
	self canvas ifNotNil: [:canvas | canvas owner delete]
]

{
	#category : #testing,
	#'squeak_changestamp' : 'si 7/11/2024 14:23'
}
WBElementTests >> testMouseDown [
	| aMouseEvent anElement |
	
	anElement := WBRectangularElement newWithCanvas: self canvas.
	aMouseEvent := MouseButtonEvent new.
	aMouseEvent setType: #mouseDown position: anElement position which: 4 buttons: aMouseEvent class redButton hand: HandMorph new stamp: 0.
	
	anElement supportsText: true.
	self assert: (self canvas handlesMouseDown: aMouseEvent) = (anElement textField enabled) not.
	
	anElement supportsText: false.
	self assert: (self canvas handlesMouseDown: aMouseEvent) = true

]
