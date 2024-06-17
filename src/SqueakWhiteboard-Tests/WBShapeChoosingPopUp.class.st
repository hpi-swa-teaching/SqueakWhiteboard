Class {
	#name : #WBShapeChoosingPopUp,
	#superclass : #TestCase,
	#instVars : [
		'canvas'
	],
	#category : #'SqueakWhiteboard-Tests'
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'si 6/7/2024 00:29'
}
WBShapeChoosingPopUp >> canvas [
	^ canvas
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'si 6/7/2024 00:30'
}
WBShapeChoosingPopUp >> canvas: anObject [

	canvas := anObject
]

{
	#category : #setUp,
	#'squeak_changestamp' : 'is 6/15/2024 12:59'
}
WBShapeChoosingPopUp >> setUp [

	super setUp.
	self canvas: WBCanvas new

]

{
	#category : #tearDown,
	#'squeak_changestamp' : 'si 6/7/2024 00:29'
}
WBShapeChoosingPopUp >> tearDown [

	super tearDown.
	self canvas ifNotNil: [:canvas | canvas owner delete]
]

{
	#category : #testsForStandardElement,
	#'squeak_changestamp' : 'si 6/17/2024 12:07'
}
WBShapeChoosingPopUp >> testButtonFunctionallity [
| button buttonForShape|

	button := self canvas toolbar buttons at: 1.
	button clickFunctionality: (MouseButtonEvent new position: self canvas position + (100@100)).
	
	buttonForShape := self canvas toolbar popUp submorphs at: 1. 
	buttonForShape clickFunctionality: (MouseButtonEvent new position: self canvas position + (100@100)).
	self assert: self canvas elementToSpawn class = WBRectangle.
	
	buttonForShape := self canvas toolbar popUp submorphs at: 2. 
	buttonForShape clickFunctionality: (MouseButtonEvent new position: self canvas position + (100@100)).
	self assert: self canvas elementToSpawn class = WBCircle
]

{
	#category : #testsForStandardElement,
	#'squeak_changestamp' : 'si 6/17/2024 11:59'
}
WBShapeChoosingPopUp >> testButtonsOfPopUp [

	| button|

	button := self canvas toolbar buttons at: 1.
	button clickFunctionality: (MouseButtonEvent new position: self canvas position + (100@100)).
	
	self assert: self canvas toolbar popUp submorphs size = 2
]

{
	#category : #testsForStandardElement,
	#'squeak_changestamp' : 'si 6/17/2024 11:58'
}
WBShapeChoosingPopUp >> testExistenceOfPopUp [

	| button|

	button := self canvas toolbar buttons at: 1.
	button clickFunctionality: (MouseButtonEvent new position: self canvas position + (100@100)).
	
	self assert: self canvas toolbar popUp notNil
]

{
	#category : #testsForStandardElement,
	#'squeak_changestamp' : 'si 6/17/2024 12:02'
}
WBShapeChoosingPopUp >> testPopUpPlacementInX [
| button|

	button := self canvas toolbar buttons at: 1.
	button clickFunctionality: (MouseButtonEvent new position: self canvas position + (100@100)).
	
	self assert: button right <= self canvas toolbar popUp left.	
	self assert: self canvas toolbar popUp left <= (button right + 200).	
]

{
	#category : #testsForStandardElement,
	#'squeak_changestamp' : 'si 6/17/2024 12:01'
}
WBShapeChoosingPopUp >> testPopUpPlacementInY [
| button|

	button := self canvas toolbar buttons at: 1.
	button clickFunctionality: (MouseButtonEvent new position: self canvas position + (100@100)).
	
	self assert: button center y - 200 < self canvas toolbar popUp top.	
	self assert: self canvas toolbar popUp bottom < (button center y + 500) 
]
