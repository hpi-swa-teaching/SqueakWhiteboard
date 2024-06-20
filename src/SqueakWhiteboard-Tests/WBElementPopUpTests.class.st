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
	#'squeak_changestamp' : 'si 6/17/2024 19:15'
}
WBElementPopUpTests >> testFunctionalityOfColor [
| element mouseEvent buttonForColor|
	
	mouseEvent := MouseButtonEvent new.
	mouseEvent setType: #mouseDown position: self canvas position + (100 @ 100) which: 4 buttons: mouseEvent class redButton hand: HandMorph new stamp: 0.
	
	self canvas spawnAnElement: (WBRectangle new) At: (MouseButtonEvent new position: self canvas position + (100@100)).
	self canvas dropElement: mouseEvent.
	element := self canvas elements at: 1.
	
	element mouseDown: mouseEvent.
	(element popUp submorphs at: 1) clickFunctionality: 	mouseEvent.
		
	buttonForColor := element popUp popUp submorphs at: 1. 
	buttonForColor clickFunctionality: (MouseButtonEvent new position: self canvas position + (100@100)).
	self assert: element color = Color black.
	
	buttonForColor := element popUp popUp submorphs at: 2.
	buttonForColor clickFunctionality: (MouseButtonEvent new position: self canvas position + (100@100)).
	self assert: element color = Color gray.
	
	buttonForColor := element popUp popUp submorphs at: 3.
	buttonForColor clickFunctionality: (MouseButtonEvent new position: self canvas position + (100@100)).
	self assert: element color = Color green.
	
	buttonForColor := element popUp popUp submorphs at: 4.
	buttonForColor clickFunctionality: (MouseButtonEvent new position: self canvas position + (100@100)).
	self assert: element color = Color cyan.
	
	buttonForColor := element popUp popUp submorphs at: 5.
	buttonForColor clickFunctionality: (MouseButtonEvent new position: self canvas position + (100@100)).
	self assert: element color = Color blue.
	
	buttonForColor := element popUp popUp submorphs at: 6.
	buttonForColor clickFunctionality: (MouseButtonEvent new position: self canvas position + (100@100)).
	self assert: element color = Color magenta.
	
	buttonForColor := element popUp popUp submorphs at: 7.
	buttonForColor clickFunctionality: (MouseButtonEvent new position: self canvas position + (100@100)).
	self assert: element color = Color red.
	
	buttonForColor := element popUp popUp submorphs at: 8.
	buttonForColor clickFunctionality: (MouseButtonEvent new position: self canvas position + (100@100)).
	self assert: element color = Color orange.
	
	buttonForColor := element popUp popUp submorphs at: 9. 
	buttonForColor clickFunctionality: (MouseButtonEvent new position: self canvas position + (100@100)).
	self assert: element color = Color yellow
]

{
	#category : #tests,
	#'squeak_changestamp' : 'si 6/17/2024 19:08'
}
WBElementPopUpTests >> testFunctionalityOfColorPopUp [
| element mouseEvent |
	
	mouseEvent := MouseButtonEvent new.
	mouseEvent setType: #mouseDown position: self canvas position + (100 @ 100) which: 4 buttons: mouseEvent class redButton hand: HandMorph new stamp: 0.
	
	self canvas spawnAnElement: (WBRectangle new) At: (MouseButtonEvent new position: self canvas position + (100@100)).
	self canvas dropElement: mouseEvent.
	element := self canvas elements at: 1.
	
	element mouseDown: mouseEvent.
	(element popUp submorphs at: 1) clickFunctionality: 	mouseEvent.
		
	self assert: element popUp notNil
]

{
	#category : #tests,
	#'squeak_changestamp' : 'si 6/17/2024 19:07'
}
WBElementPopUpTests >> testFunctionalityOfCopy [
| element mouseEvent |
	
	mouseEvent := MouseButtonEvent new.
	mouseEvent setType: #mouseDown position: self canvas position + (100 @ 100) which: 4 buttons: mouseEvent class redButton hand: HandMorph new stamp: 0.
	
	self canvas spawnAnElement: (WBRectangle new) At: (MouseButtonEvent new position: self canvas position + (100@100)).
	self canvas dropElement: mouseEvent.
	element := self canvas elements at: 1.
	
	element mouseDown: mouseEvent.
	(element popUp submorphs at: 2) clickFunctionality: 	mouseEvent.
		
	self assert: self canvas elementToSpawn class = element class
]

{
	#category : #tests,
	#'squeak_changestamp' : 'si 6/17/2024 14:54'
}
WBElementPopUpTests >> testFunctionalityOfDelete [
| element mouseEvent |
	
	mouseEvent := MouseButtonEvent new.
	mouseEvent setType: #mouseDown position: self canvas position + (100 @ 100) which: 4 buttons: mouseEvent class redButton hand: HandMorph new stamp: 0.
	
	self canvas spawnAnElement: (WBRectangle new) At: (MouseButtonEvent new position: self canvas position + (100@100)).
	self canvas dropElement: mouseEvent.
	element := self canvas elements at: 1.
	
	element mouseDown: mouseEvent.
	(element popUp submorphs at: 3) clickFunctionality: 	mouseEvent.
		
	self assert: self canvas elements size = 0
]

{
	#category : #tests,
	#'squeak_changestamp' : 'si 6/21/2024 00:51'
}
WBElementPopUpTests >> testFunctionalityOfSwitchVisibilityOfArrowHead [
| element mouseEvent1 mouseEvent2|
	
	mouseEvent1 := MouseButtonEvent new.
	mouseEvent1 setType: #mouseDown position: self canvas position + (100 @ 100) which: 4 buttons: mouseEvent1 class redButton hand: HandMorph new stamp: 0.
	mouseEvent2 := MouseButtonEvent new.
	mouseEvent2 setType: #mouseDown position: self canvas position + (200 @ 200) which: 4 buttons: mouseEvent2 class redButton hand: HandMorph new stamp: 0.
	element := (WBLine newWithCanvas: self canvas).
	
	self canvas spawnAnElement: (element) At: (MouseButtonEvent new position: self canvas position + (100@100)).
	element mouseUp: mouseEvent1.
	element mouseUp: mouseEvent2.
	
	
	(element edges at: 1) mouseDown: mouseEvent1.
	((element edges at: 1) popUp submorphs at: 1) clickFunctionality: mouseEvent1.
	
	self assert: element arrowHead isVisible = false.
	
	((element edges at: 1) popUp submorphs at: 1) clickFunctionality: mouseEvent1.
	
	self assert: element arrowHead isVisible = true.
]
