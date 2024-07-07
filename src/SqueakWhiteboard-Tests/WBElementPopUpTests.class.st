Class {
	#name : #WBElementPopUpTests,
	#superclass : #WBElementTests,
	#category : #'SqueakWhiteboard-Tests'
}

{
	#category : #tests,
	#'squeak_changestamp' : 'ACL 7/7/2024 18:27'
}
WBElementPopUpTests >> testButtonsOfPopUp [
	| element mouseEvent |
	
	mouseEvent := MouseButtonEvent new.
	mouseEvent setType: #mouseDown position: self canvas position + (100 @ 100) which: 4 buttons: mouseEvent class redButton hand: HandMorph new stamp: 0.
	
	self canvas spawnAnElement: (WBRectangle newWithCanvas: self canvas) At: (MouseButtonEvent new position: self canvas position + (100 @ 100)).
	self canvas dropElement: mouseEvent.
	element := self canvas elements at: 1.
	
	element mouseDown: mouseEvent.
	
	self assert: element popUp submorphs size = 4
]

{
	#category : #tests,
	#'squeak_changestamp' : 'ACL 7/7/2024 18:27'
}
WBElementPopUpTests >> testExistenceOfPopUp [
	| element mouseEvent |
	
	mouseEvent := MouseButtonEvent new.
	mouseEvent setType: #mouseDown position: self canvas position + (100 @ 100) which: 4 buttons: mouseEvent class redButton hand: HandMorph new stamp: 0.
	
	self canvas spawnAnElement: (WBRectangle newWithCanvas: self canvas) At: (MouseButtonEvent new position: self canvas position + (100 @ 100)).
	self canvas dropElement: mouseEvent.
	element := self canvas elements at: 1.
	
	element mouseDown: mouseEvent.
	
	self assert: element popUp notNil
	
]

{
	#category : #tests,
	#'squeak_changestamp' : 'ACL 7/7/2024 18:28'
}
WBElementPopUpTests >> testFunctionalityOfBorderColor [
	| element mouseEvent buttonForColor |
	
	mouseEvent := MouseButtonEvent new.
	mouseEvent setType: #mouseDown position: self canvas position + (100 @ 100) which: 4 buttons: mouseEvent class redButton hand: HandMorph new stamp: 0.
	
	self canvas spawnAnElement: (WBRectangle newWithCanvas: self canvas) At: (MouseButtonEvent new position: self canvas position + (100 @ 100)).
	self canvas dropElement: mouseEvent.
	element := self canvas elements at: 1.
	
	element mouseDown: mouseEvent.
	(element popUp submorphs at: 1) clickFunctionality: 	mouseEvent.
		
	self assert: element popUp popUp submorphs size = 12.
		
	buttonForColor := element popUp popUp submorphs at: 1. 
	buttonForColor clickFunctionality: (MouseButtonEvent new position: self canvas position + (100 @ 100)).
	self assert: element morph borderColor = Color magenta muchDarker.
	
	buttonForColor := element popUp popUp submorphs at: 6.
	buttonForColor clickFunctionality: (MouseButtonEvent new position: self canvas position + (100 @ 100)).
	self assert: element morph borderColor = Color green.
	
	buttonForColor := element popUp popUp submorphs at: 10.
	buttonForColor clickFunctionality: (MouseButtonEvent new position: self canvas position + (100 @ 100)).
	self assert: element morph borderColor = Color transparent.
]

{
	#category : #tests,
	#'squeak_changestamp' : 'ACL 7/7/2024 18:28'
}
WBElementPopUpTests >> testFunctionalityOfBorderColorPopUp [
	| element mouseEvent |
	
	mouseEvent := MouseButtonEvent new.
	mouseEvent setType: #mouseDown position: self canvas position + (100 @ 100) which: 4 buttons: mouseEvent class redButton hand: HandMorph new stamp: 0.
	
	self canvas spawnAnElement: (WBRectangle newWithCanvas: self canvas) At: (MouseButtonEvent new position: self canvas position + (100 @ 100)).
	self canvas dropElement: mouseEvent.
	element := self canvas elements at: 1.
	
	element mouseDown: mouseEvent.
	(element popUp submorphs at: 1) clickFunctionality: mouseEvent.
		
	self assert: element popUp notNil
]

{
	#category : #tests,
	#'squeak_changestamp' : 'ACL 7/7/2024 18:28'
}
WBElementPopUpTests >> testFunctionalityOfColor [
	| element mouseEvent buttonForColor |
	
	mouseEvent := MouseButtonEvent new.
	mouseEvent setType: #mouseDown position: self canvas position + (100 @ 100) which: 4 buttons: mouseEvent class redButton hand: HandMorph new stamp: 0.
	
	self canvas spawnAnElement: (WBRectangle newWithCanvas: self canvas) At: (MouseButtonEvent new position: self canvas position + (100 @ 100)).
	self canvas dropElement: mouseEvent.
	element := self canvas elements at: 1.
	
	element mouseDown: mouseEvent.
	(element popUp submorphs at: 2) clickFunctionality: mouseEvent.
	
	self assert: element popUp popUp submorphs size = 12.
		
	buttonForColor := element popUp popUp submorphs at: 1. 
	buttonForColor clickFunctionality: (MouseButtonEvent new position: self canvas position + (100 @ 100)).
	self assert: element color = Color magenta muchDarker.
	
	buttonForColor := element popUp popUp submorphs at: 6.
	buttonForColor clickFunctionality: (MouseButtonEvent new position: self canvas position + (100 @ 100)).
	self assert: element color = Color green.
	
	buttonForColor := element popUp popUp submorphs at: 10.
	buttonForColor clickFunctionality: (MouseButtonEvent new position: self canvas position + (100 @ 100)).
	self assert: element color = Color transparent.
]

{
	#category : #tests,
	#'squeak_changestamp' : 'ACL 7/7/2024 18:28'
}
WBElementPopUpTests >> testFunctionalityOfColorPopUp [
	| element mouseEvent |
	
	mouseEvent := MouseButtonEvent new.
	mouseEvent setType: #mouseDown position: self canvas position + (100 @ 100) which: 4 buttons: mouseEvent class redButton hand: HandMorph new stamp: 0.
	
	self canvas spawnAnElement: (WBRectangle newWithCanvas: self canvas) At: (MouseButtonEvent new position: self canvas position + (100 @ 100)).
	self canvas dropElement: mouseEvent.
	element := self canvas elements at: 1.
	
	element mouseDown: mouseEvent.
	(element popUp submorphs at: 2) clickFunctionality: mouseEvent.
		
	self assert: element popUp notNil
]

{
	#category : #tests,
	#'squeak_changestamp' : 'ACL 7/7/2024 18:28'
}
WBElementPopUpTests >> testFunctionalityOfCopy [
	| element mouseEvent |
	
	mouseEvent := MouseButtonEvent new.
	mouseEvent setType: #mouseDown position: self canvas position + (100 @ 100) which: 4 buttons: mouseEvent class redButton hand: HandMorph new stamp: 0.
	
	self canvas spawnAnElement: (WBRectangle newWithCanvas: self canvas) At: (MouseButtonEvent new position: self canvas position + (100 @ 100)).
	self canvas dropElement: mouseEvent.
	element := self canvas elements at: 1.
	
	element mouseDown: mouseEvent.
	(element popUp submorphs at: 3) clickFunctionality: mouseEvent.
		
	self assert: self canvas elementToSpawn class = element class
]

{
	#category : #tests,
	#'squeak_changestamp' : 'ACL 7/7/2024 18:28'
}
WBElementPopUpTests >> testFunctionalityOfDelete [
	| element mouseEvent |
	
	mouseEvent := MouseButtonEvent new.
	mouseEvent setType: #mouseDown position: self canvas position + (100 @ 100) which: 4 buttons: mouseEvent class redButton hand: HandMorph new stamp: 0.
	
	self canvas spawnAnElement: (WBRectangle newWithCanvas: self canvas) At: (MouseButtonEvent new position: self canvas position + (100 @ 100)).
	self canvas dropElement: mouseEvent.
	element := self canvas elements at: 1.
	
	element mouseDown: mouseEvent.
	(element popUp submorphs at: 4) clickFunctionality: mouseEvent.
		
	self assert: self canvas elements size = 0
]

{
	#category : #tests,
	#'squeak_changestamp' : 'ACL 7/7/2024 18:28'
}
WBElementPopUpTests >> testFunctionalityOfSwitchVisibilityOfArrowHead [
	| element mouseEvent1 mouseEvent2 |
	
	mouseEvent1 := MouseButtonEvent new.
	mouseEvent1 setType: #mouseDown position: self canvas position + (100 @ 100) which: 4 buttons: mouseEvent1 class redButton hand: HandMorph new stamp: 0.
	mouseEvent2 := MouseButtonEvent new.
	mouseEvent2 setType: #mouseDown position: self canvas position + (200 @ 200) which: 4 buttons: mouseEvent2 class redButton hand: HandMorph new stamp: 0.
	element := ((WBLine newWithCanvas: self canvas) arrowHead: true).
	
	self canvas spawnAnElement: (element) At: (MouseButtonEvent new position: self canvas position + (100 @ 100)).
	element mouseUp: mouseEvent1.
	element mouseUp: mouseEvent2.
	
	
	(element edges at: 1) mouseDown: mouseEvent1.
	((element edges at: 1) popUp submorphs at: 1) clickFunctionality: mouseEvent1.
	
	self assert: element arrowHead isVisible = false.
	
	((element edges at: 1) popUp submorphs at: 1) clickFunctionality: mouseEvent1.
	
	self assert: element arrowHead isVisible = true
]
