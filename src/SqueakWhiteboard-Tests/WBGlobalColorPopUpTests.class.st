Class {
	#name : #WBGlobalColorPopUpTests,
	#superclass : #WBToolbarButtonTests,
	#category : #'SqueakWhiteboard-Tests'
}

{
	#category : #tests,
	#'squeak_changestamp' : 'si 6/17/2024 14:12'
}
WBGlobalColorPopUpTests >> testButtonFunctionallity [
| button buttonForColor|

	button := self canvas toolbar buttons at: 4.
	button clickFunctionality: (MouseButtonEvent new position: self canvas position + (100@100)).
	
	buttonForColor := self canvas toolbar popUp submorphs at: 1. 
	buttonForColor clickFunctionality: (MouseButtonEvent new position: self canvas position + (100@100)).
	self assert: self canvas globalColor = Color black.
	
	buttonForColor := self canvas toolbar popUp submorphs at: 2. 
	buttonForColor clickFunctionality: (MouseButtonEvent new position: self canvas position + (100@100)).
	self assert: self canvas globalColor = Color gray.
	
		buttonForColor := self canvas toolbar popUp submorphs at: 3. 
	buttonForColor clickFunctionality: (MouseButtonEvent new position: self canvas position + (100@100)).
	self assert: self canvas globalColor = Color green.
	
	buttonForColor := self canvas toolbar popUp submorphs at: 4. 
	buttonForColor clickFunctionality: (MouseButtonEvent new position: self canvas position + (100@100)).
	self assert: self canvas globalColor = Color cyan.
	
		buttonForColor := self canvas toolbar popUp submorphs at: 5. 
	buttonForColor clickFunctionality: (MouseButtonEvent new position: self canvas position + (100@100)).
	self assert: self canvas globalColor = Color blue.
	
	buttonForColor := self canvas toolbar popUp submorphs at: 6. 
	buttonForColor clickFunctionality: (MouseButtonEvent new position: self canvas position + (100@100)).
	self assert: self canvas globalColor = Color magenta.
	
		buttonForColor := self canvas toolbar popUp submorphs at: 7. 
	buttonForColor clickFunctionality: (MouseButtonEvent new position: self canvas position + (100@100)).
	self assert: self canvas globalColor = Color red.
	
	buttonForColor := self canvas toolbar popUp submorphs at: 8. 
	buttonForColor clickFunctionality: (MouseButtonEvent new position: self canvas position + (100@100)).
	self assert: self canvas globalColor = Color orange.
	
		buttonForColor := self canvas toolbar popUp submorphs at: 9. 
	buttonForColor clickFunctionality: (MouseButtonEvent new position: self canvas position + (100@100)).
	self assert: self canvas globalColor = Color yellow
	
]

{
	#category : #tests,
	#'squeak_changestamp' : 'si 6/17/2024 14:06'
}
WBGlobalColorPopUpTests >> testButtonsOfPopUp [

	| button|

	button := self canvas toolbar buttons at: 4.
	button clickFunctionality: (MouseButtonEvent new position: self canvas position + (100@100)).
	
	self assert: self canvas toolbar popUp submorphs size = 9
]

{
	#category : #tests,
	#'squeak_changestamp' : 'si 6/17/2024 14:05'
}
WBGlobalColorPopUpTests >> testExistenceOfPopUp [

	| button|

	button := self canvas toolbar buttons at: 4.
	button clickFunctionality: (MouseButtonEvent new position: self canvas position + (100@100)).
	
	self assert: self canvas toolbar popUp notNil
]

{
	#category : #tests,
	#'squeak_changestamp' : 'si 6/17/2024 14:08'
}
WBGlobalColorPopUpTests >> testPopUpPlacementInX [
| button|

	button := self canvas toolbar buttons at: 4.
	button clickFunctionality: (MouseButtonEvent new position: self canvas position + (100@100)).
	
	self assert: button right <= self canvas toolbar popUp left.	
	self assert: self canvas toolbar popUp left <= (button right + 200)
]

{
	#category : #tests,
	#'squeak_changestamp' : 'si 6/17/2024 14:08'
}
WBGlobalColorPopUpTests >> testPopUpPlacementInY [
| button|

	button := self canvas toolbar buttons at: 4.
	button clickFunctionality: (MouseButtonEvent new position: self canvas position + (100@100)).
	
	self assert: button center y - 200 < self canvas toolbar popUp top.	
	self assert: self canvas toolbar popUp bottom < (button center y + 500) 
]
