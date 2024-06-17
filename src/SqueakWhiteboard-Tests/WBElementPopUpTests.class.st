Class {
	#name : #WBElementPopUpTests,
	#superclass : #TestCase,
	#instVars : [
		'canvas'
	],
	#category : #'SqueakWhiteboard-Tests'
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'si 6/17/2024 14:36'
}
WBElementPopUpTests >> canvas [

	^ canvas
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'si 6/17/2024 14:37'
}
WBElementPopUpTests >> canvas: aCanvas [

	canvas := aCanvas 
]

{
	#category : #setUp,
	#'squeak_changestamp' : 'si 6/17/2024 14:23'
}
WBElementPopUpTests >> setUp [

	super setUp.
	self canvas: WBCanvas new

]

{
	#category : #tearDown,
	#'squeak_changestamp' : 'si 6/17/2024 14:23'
}
WBElementPopUpTests >> tearDown [

	super tearDown.
	self canvas ifNotNil: [:canvas | canvas owner delete]
]

{
	#category : #tests,
	#'squeak_changestamp' : 'si 6/17/2024 14:39'
}
WBElementPopUpTests >> testButtonsOfPopUp [
| element mouseEvent |
	
	mouseEvent := MouseButtonEvent new.
	mouseEvent setType: #mouseDown position: self canvas position + (100 @ 100) which: 4 buttons: mouseEvent class redButton hand: HandMorph new stamp: 0.
	
	self canvas spawnAnElement: (WBRectangle new) At: (MouseButtonEvent new position: self canvas position + (100@100)).
	self canvas dropElement: mouseEvent.
	element := self canvas elements at: 1.
	
	element mouseDown: mouseEvent.
	self assert: element popUp submorphs size = 3	
]

{
	#category : #tests,
	#'squeak_changestamp' : 'si 6/17/2024 14:34'
}
WBElementPopUpTests >> testExistenceOfPopUp [
| element mouseEvent |
	
	mouseEvent := MouseButtonEvent new.
	mouseEvent setType: #mouseDown position: self canvas position + (100 @ 100) which: 4 buttons: mouseEvent class redButton hand: HandMorph new stamp: 0.
	
	self canvas spawnAnElement: (WBRectangle new) At: (MouseButtonEvent new position: self canvas position + (100@100)).
	self canvas dropElement: mouseEvent.
	element := self canvas elements at: 1.
	
	element mouseDown: mouseEvent.
	self assert: element popUp notNil
	
]

{
	#category : #tests,
	#'squeak_changestamp' : 'si 6/17/2024 14:41'
}
WBElementPopUpTests >> testFunctionalityOfDelete [
| element mouseEvent |
	
	mouseEvent := MouseButtonEvent new.
	mouseEvent setType: #mouseDown position: self canvas position + (100 @ 100) which: 4 buttons: mouseEvent class redButton hand: HandMorph new stamp: 0.
	
	self canvas spawnAnElement: (WBRectangle new) At: (MouseButtonEvent new position: self canvas position + (100@100)).
	self canvas dropElement: mouseEvent.
	element := self canvas elements at: 1.
	
	element mouseDown: mouseEvent.
	self assert: element popUp submorphs size = 3	
]
