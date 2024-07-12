Class {
	#name : #WBShapeChoosingPopUpTests,
	#superclass : #WBToolbarButtonTests,
	#instVars : [
		'shapeChoosingButton'
	],
	#category : #'SqueakWhiteboard-Tests'
}

{
	#category : #setUp,
	#'squeak_changestamp' : 'si 7/12/2024 11:24'
}
WBShapeChoosingPopUpTests >> setUp [

	super setUp.
	self shapeChoosingButton: (self getButtonWithFunctionality: self canvas toolbar buttonFunctionalityForShapeChoosing from: self canvas toolbar submorphs)
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'si 7/12/2024 11:23'
}
WBShapeChoosingPopUpTests >> shapeChoosingButton [

	^ shapeChoosingButton
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'si 7/12/2024 11:23'
}
WBShapeChoosingPopUpTests >> shapeChoosingButton: aButton [

	shapeChoosingButton := aButton
]

{
	#category : #tests,
	#'squeak_changestamp' : 'si 7/12/2024 11:53'
}
WBShapeChoosingPopUpTests >> testButtonFunctionality [
	| buttonForShape |
	
	self shapeChoosingButton clickFunctionality: self artificialMouseClick.
	
	buttonForShape := self getButtonWithFunctionality: self canvas toolbar buttonFunctionalityForRectangle from: canvas toolbar popUp submorphs. 
	buttonForShape clickFunctionality: self artificialMouseClick.
	self assert: self canvas elementToSpawn class = WBRectangularElement.
	
	buttonForShape := self getButtonWithFunctionality: self canvas toolbar buttonFunctionalityForCircle from: canvas toolbar popUp submorphs. 
	buttonForShape clickFunctionality: self artificialMouseClick.
	self assert: self canvas elementToSpawn class = WBCircularElement
]

{
	#category : #tests,
	#'squeak_changestamp' : 'si 7/12/2024 11:50'
}
WBShapeChoosingPopUpTests >> testButtonsOfPopUp [
	
	self shapeChoosingButton clickFunctionality: self artificialMouseClick.
	
	self assert: self canvas toolbar popUp submorphs size = 2
]

{
	#category : #tests,
	#'squeak_changestamp' : 'si 7/12/2024 11:49'
}
WBShapeChoosingPopUpTests >> testExistenceOfPopUp [
	
	self shapeChoosingButton clickFunctionality: self artificialMouseClick.
	
	self assert: self canvas toolbar popUp notNil
]

{
	#category : #tests,
	#'squeak_changestamp' : 'si 7/12/2024 11:49'
}
WBShapeChoosingPopUpTests >> testPopUpPlacementInX [
	
	self shapeChoosingButton clickFunctionality: self artificialMouseClick.
	
	self assert: self shapeChoosingButton right <= self canvas toolbar popUp left.	
	self assert: self canvas toolbar popUp left <= (self shapeChoosingButton right + 200)
]

{
	#category : #tests,
	#'squeak_changestamp' : 'si 7/12/2024 11:50'
}
WBShapeChoosingPopUpTests >> testPopUpPlacementInY [
	
	self shapeChoosingButton clickFunctionality: self artificialMouseClick.

	self assert: self shapeChoosingButton center y - 200 < self canvas toolbar popUp top.	
	self assert: self canvas toolbar popUp bottom < (self shapeChoosingButton center y + 500) 
]
