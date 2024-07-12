Class {
	#name : #WBDeletePopUpTests,
	#superclass : #WBToolbarButtonTests,
	#instVars : [
		'buttonForDelete'
	],
	#category : #'SqueakWhiteboard-Tests'
}

{
	#category : #asserting,
	#'squeak_changestamp' : 'si 7/12/2024 11:12'
}
WBDeletePopUpTests >> buttonForDelete [

	^ buttonForDelete
]

{
	#category : #asserting,
	#'squeak_changestamp' : 'si 7/12/2024 11:12'
}
WBDeletePopUpTests >> buttonForDelete: aButton [

	buttonForDelete := aButton
]

{
	#category : #setUp,
	#'squeak_changestamp' : 'si 7/12/2024 11:13'
}
WBDeletePopUpTests >> setUp [

	super setUp.
	self buttonForDelete: (self getButtonWithFunctionality: self canvas toolbar buttonFunctionalityForDeleteAll from: self canvas toolbar submorphs)
]

{
	#category : #tests,
	#'squeak_changestamp' : 'si 7/12/2024 11:18'
}
WBDeletePopUpTests >> testButtonFunctionalityForCancel [
	| buttonForConfirm |
	
	self buttonForDelete clickFunctionality: self artificialMouseClick.
	
	self canvas spawnAnElement: (WBRectangularElement newWithCanvas: self canvas) At: self artificialMouseClick.
	self canvas dropElement: self artificialMouseClick.
	self canvas spawnAnElement: (WBRectangularElement newWithCanvas: self canvas) At: self artificialMouseClick.
	self canvas dropElement: self artificialMouseClick.
	
	self assert: self canvas elements size = 2.
	
	buttonForConfirm := self getButtonWithFunctionality: self canvas toolbar buttonFunctionalityForDeleteCancel from: canvas toolbar popUp submorphs. 
	buttonForConfirm clickFunctionality: self artificialMouseClick.
	
	self assert: self canvas elements size = 2.
	self assert: self canvas toolbar popUp = nil.
	self assert: self canvas text = nil
]

{
	#category : #tests,
	#'squeak_changestamp' : 'si 7/12/2024 11:18'
}
WBDeletePopUpTests >> testButtonFunctionalityForConfirm [
	| buttonForConfirm |
	
	self buttonForDelete clickFunctionality: self artificialMouseClick.
	
	self canvas spawnAnElement: (WBRectangularElement newWithCanvas: self canvas) At: self artificialMouseClick.
	self canvas dropElement: self artificialMouseClick.
	self canvas spawnAnElement: (WBRectangularElement newWithCanvas: self canvas) At: self artificialMouseClick.
	self canvas dropElement: self artificialMouseClick.
	
	self assert: self canvas elements size = 2.
	
	buttonForConfirm := self getButtonWithFunctionality: self canvas toolbar buttonFunctionalityForDeleteConfirm from: canvas toolbar popUp submorphs. 
	buttonForConfirm clickFunctionality: self artificialMouseClick.
	
	self assert: self canvas elements size = 0.
	self assert: self canvas toolbar popUp = nil.
	self assert: self canvas text = nil
]

{
	#category : #tests,
	#'squeak_changestamp' : 'si 7/12/2024 11:15'
}
WBDeletePopUpTests >> testButtonsOfPopUp [

	self buttonForDelete clickFunctionality: self artificialMouseClick.
	
	self assert: self canvas toolbar popUp submorphs size = 2
]

{
	#category : #tests,
	#'squeak_changestamp' : 'si 7/12/2024 11:14'
}
WBDeletePopUpTests >> testExistenceOfPopUp [

	self buttonForDelete clickFunctionality: self artificialMouseClick.
	
	self assert: self canvas toolbar popUp notNil.
	self assert: self canvas text contents = WBToolbar textForDeleteAll
]

{
	#category : #tests,
	#'squeak_changestamp' : 'si 7/12/2024 11:15'
}
WBDeletePopUpTests >> testPopUpPlacementInX [

	self buttonForDelete clickFunctionality: self artificialMouseClick.
	
	self assert: (self canvas center x - 100) <= self canvas toolbar popUp left.	
	self assert: self canvas toolbar popUp right <= (self canvas center x + 100)
]

{
	#category : #tests,
	#'squeak_changestamp' : 'si 7/12/2024 11:15'
}
WBDeletePopUpTests >> testPopUpPlacementInY [

	self buttonForDelete clickFunctionality: self artificialMouseClick.
	
	self assert: self canvas center y <= self canvas toolbar popUp top.	
	self assert: self canvas toolbar popUp bottom <= (self canvas bottom)
]
