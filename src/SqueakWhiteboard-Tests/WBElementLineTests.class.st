Class {
	#name : #WBElementLineTests,
	#superclass : #TestCase,
	#instVars : [
		'canvas'
	],
	#category : #'SqueakWhiteboard-Tests'
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'si 6/21/2024 00:53'
}
WBElementLineTests >> canvas [

	^ canvas
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'si 6/21/2024 00:53'
}
WBElementLineTests >> canvas: anObject [

	canvas := anObject
]

{
	#category : #setUp,
	#'squeak_changestamp' : 'si 6/21/2024 00:54'
}
WBElementLineTests >> setUp [

	super setUp.
	self canvas: WBCanvas new

]

{
	#category : #tearDown,
	#'squeak_changestamp' : 'si 6/21/2024 00:53'
}
WBElementLineTests >> tearDown [

	super tearDown.
	self canvas ifNotNil: [:canvas | canvas owner delete]
]

{
	#category : #tests,
	#'squeak_changestamp' : 'si 6/21/2024 01:04'
}
WBElementLineTests >> testSpawningViaClicking [

	| element mouseEvent1 mouseEvent2|
	
	mouseEvent1 := MouseButtonEvent new.
	mouseEvent1 setType: #mouseDown position: self canvas position + (100 @ 100) which: 4 buttons: mouseEvent1 class redButton hand: HandMorph new stamp: 0.
	mouseEvent2 := MouseButtonEvent new.
	mouseEvent2 setType: #mouseDown position: self canvas position + (200 @ 200) which: 4 buttons: mouseEvent2 class redButton hand: HandMorph new stamp: 0.
	
	element := (WBLine newWithCanvas: self canvas).
	self canvas spawnAnElement: (element) At: (MouseButtonEvent new position: self canvas position + (100@100)).
	element mouseUp: mouseEvent1.
	element mouseUp: mouseEvent2.

	self assert: element morph vertices = { self canvas position + (200 @ 200) . self canvas position + (100 @ 100)}
]
