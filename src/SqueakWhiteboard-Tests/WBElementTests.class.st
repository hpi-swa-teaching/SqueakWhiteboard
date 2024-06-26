Class {
	#name : #WBElementTests,
	#superclass : #TestCase,
	#instVars : [
		'canvas'
	],
	#category : #'SqueakWhiteboard-Tests'
}

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
	#'squeak_changestamp' : 'is 6/26/2024 10:42'
}
WBElementTests >> testMouseDown [
	| aMouseEvent anElement |
	
	anElement := WBRectangle newWithCanvas: self canvas.
	aMouseEvent := MouseButtonEvent new.
	aMouseEvent setType: #mouseDown position: anElement position which: 4 buttons: aMouseEvent class redButton hand: HandMorph new stamp: 0.
	self assert: (self canvas handlesMouseOver: aMouseEvent) = true.
	anElement supportsText: true.
	self assert: (self canvas handlesMouseDown: aMouseEvent) = (anElement textField enabled) not.
	
	anElement supportsText: false.
	self assert: (self canvas handlesMouseDown: aMouseEvent) = true

]
