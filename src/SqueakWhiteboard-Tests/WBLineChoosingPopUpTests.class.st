Class {
	#name : #WBLineChoosingPopUpTests,
	#superclass : #WBToolbarButtonTests,
	#instVars : [
		'lineChoosingButton'
	],
	#category : #'SqueakWhiteboard-Tests'
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'si 7/12/2024 11:21'
}
WBLineChoosingPopUpTests >> lineChoosingButton [

	^ lineChoosingButton
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'si 7/12/2024 11:21'
}
WBLineChoosingPopUpTests >> lineChoosingButton: aButton [

	lineChoosingButton := aButton
]

{
	#category : #setUp,
	#'squeak_changestamp' : 'si 7/12/2024 11:22'
}
WBLineChoosingPopUpTests >> setUp [

	super setUp.
	self lineChoosingButton: (self getButtonWithFunctionality: self canvas toolbar buttonFunctionalityForLineChoosing from: self canvas toolbar submorphs)
]

{
	#category : #tests,
	#'squeak_changestamp' : 'si 7/12/2024 11:48'
}
WBLineChoosingPopUpTests >> testButtonFunctionality [
	| buttonForLine |	
	
	self lineChoosingButton clickFunctionality: self artificialMouseClick.
	
	buttonForLine := self getButtonWithFunctionality: self canvas toolbar buttonFunctionalityForLine from: self canvas toolbar popUp submorphs. 
	buttonForLine clickFunctionality: self artificialMouseClick.
	self assert: self canvas elementToSpawn notNil.
	self assert: self canvas elementToSpawn arrowHead = false.
	
	buttonForLine := self getButtonWithFunctionality: self canvas toolbar buttonFunctionalityForArrow from: self canvas toolbar popUp submorphs. 
	buttonForLine clickFunctionality: self artificialMouseClick.
	self assert: self canvas elementToSpawn notNil.
	self assert: self canvas elementToSpawn arrowHead = true.
]

{
	#category : #tests,
	#'squeak_changestamp' : 'si 7/12/2024 11:46'
}
WBLineChoosingPopUpTests >> testButtonsOfPopUp [
	
	self lineChoosingButton clickFunctionality: self artificialMouseClick.
	
	self assert: self canvas toolbar popUp submorphs size = 2
]

{
	#category : #tests,
	#'squeak_changestamp' : 'si 7/12/2024 11:45'
}
WBLineChoosingPopUpTests >> testExistenceOfPopUp [
	
	self lineChoosingButton clickFunctionality: self artificialMouseClick. 
	
	self assert: self canvas toolbar popUp notNil
]

{
	#category : #tests,
	#'squeak_changestamp' : 'si 7/12/2024 11:45'
}
WBLineChoosingPopUpTests >> testPopUpPlacementInX [
	
	self lineChoosingButton clickFunctionality: self artificialMouseClick.
	
	self assert: self lineChoosingButton right <= self canvas toolbar popUp left.	
	self assert: self canvas toolbar popUp left <= (self lineChoosingButton right + 200)
]

{
	#category : #tests,
	#'squeak_changestamp' : 'si 7/12/2024 11:45'
}
WBLineChoosingPopUpTests >> testPopUpPlacementInY [
	
	self lineChoosingButton clickFunctionality: self artificialMouseClick.
	
	self assert: self lineChoosingButton center y - 200 < self canvas toolbar popUp top.	
	self assert: self canvas toolbar popUp bottom < (self lineChoosingButton center y + 500) 
]
