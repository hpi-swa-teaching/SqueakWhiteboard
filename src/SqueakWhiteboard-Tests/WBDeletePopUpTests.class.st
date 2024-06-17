Class {
	#name : #WBDeletePopUpTests,
	#superclass : #WBToolbarButtonTests,
	#category : #'SqueakWhiteboard-Tests'
}

{
	#category : #tests,
	#'squeak_changestamp' : 'si 6/17/2024 12:24'
}
WBDeletePopUpTests >> testButtonFunctionallityForCancel [
| button buttonForCancel|

	button := self canvas toolbar buttons at: 5.
	button clickFunctionality: (MouseButtonEvent new position: self canvas position + (100@100)).
	
	self canvas spawnAnElement: (WBRectangle new) At: (MouseButtonEvent new position: self canvas position + (100@100)).
	self canvas dropElement.
	self canvas spawnAnElement: (WBRectangle new) At: (MouseButtonEvent new position: self canvas position + (200@200)).
	self canvas dropElement.
	
	buttonForCancel := self canvas toolbar popUp submorphs at: 2. 
	buttonForCancel clickFunctionality: (MouseButtonEvent new position: self canvas position + (100@100)).
	self assert: self canvas elements size = 2.
	"self assert: self canvas toolbar popUp = nil"
]

{
	#category : #tests,
	#'squeak_changestamp' : 'si 6/17/2024 12:17'
}
WBDeletePopUpTests >> testButtonsOfPopUp [

	| button|

	button := self canvas toolbar buttons at: 5.
	button clickFunctionality: (MouseButtonEvent new position: self canvas position + (100@100)).
	
	self assert: self canvas toolbar popUp submorphs size = 2
]

{
	#category : #tests,
	#'squeak_changestamp' : 'si 6/17/2024 12:16'
}
WBDeletePopUpTests >> testExistenceOfPopUp [

	| button|

	button := self canvas toolbar buttons at: 5.
	button clickFunctionality: (MouseButtonEvent new position: self canvas position + (100@100)).
	
	self assert: self canvas toolbar popUp notNil
]

{
	#category : #tests,
	#'squeak_changestamp' : 'si 6/17/2024 12:18'
}
WBDeletePopUpTests >> testPopUpPlacementInX [
| button|

	button := self canvas toolbar buttons at: 5.
	button clickFunctionality: (MouseButtonEvent new position: self canvas position + (100@100)).
	
	self assert: button right <= self canvas toolbar popUp left.	
	self assert: self canvas toolbar popUp left <= (button right + 200)
]

{
	#category : #tests,
	#'squeak_changestamp' : 'si 6/17/2024 12:18'
}
WBDeletePopUpTests >> testPopUpPlacementInY [
| button|

	button := self canvas toolbar buttons at: 5.
	button clickFunctionality: (MouseButtonEvent new position: self canvas position + (100@100)).
	
	self assert: button center y - 200 < self canvas toolbar popUp top.	
	self assert: self canvas toolbar popUp bottom < (button center y + 500) 
]
