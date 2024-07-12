Class {
	#name : #WBGlobalColorPopUpTests,
	#superclass : #WBToolbarButtonTests,
	#instVars : [
		'buttonForGlobalColor'
	],
	#category : #'SqueakWhiteboard-Tests'
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'si 7/12/2024 11:19'
}
WBGlobalColorPopUpTests >> buttonForGlobalColor [

	^ buttonForGlobalColor
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'si 7/12/2024 11:19'
}
WBGlobalColorPopUpTests >> buttonForGlobalColor: aButton [

	buttonForGlobalColor := aButton
]

{
	#category : #setUp,
	#'squeak_changestamp' : 'si 7/12/2024 11:21'
}
WBGlobalColorPopUpTests >> setUp [

	super setUp.
	self buttonForGlobalColor: (self getButtonWithFunctionality: self canvas toolbar buttonFunctionalityForColorPalette from: self canvas toolbar submorphs)
]

{
	#category : #tests,
	#'squeak_changestamp' : 'si 7/12/2024 11:40'
}
WBGlobalColorPopUpTests >> testButtonFunctionality [
	| buttonForColor |

	self buttonForGlobalColor clickFunctionality: self artificialMouseClick.
	
	self canvas toolbar popUp submorphs do: [:b | b color = Color red ifTrue: [buttonForColor := b]].
	buttonForColor clickFunctionality: self artificialMouseClick.
	self assert: self canvas globalColor = buttonForColor color.

	self buttonForGlobalColor clickFunctionality: self artificialMouseClick.
	
	self canvas toolbar popUp submorphs do: [:b | b color = Color white ifTrue: [buttonForColor := b]].
	buttonForColor clickFunctionality: self artificialMouseClick.
	self assert: self canvas globalColor = Color transparent
	
	
]

{
	#category : #tests,
	#'squeak_changestamp' : 'si 7/12/2024 11:36'
}
WBGlobalColorPopUpTests >> testButtonsOfPopUp [
	
	self buttonForGlobalColor clickFunctionality: self artificialMouseClick.
	
	self assert: self canvas toolbar popUp submorphs size = 12
]

{
	#category : #tests,
	#'squeak_changestamp' : 'si 7/12/2024 11:24'
}
WBGlobalColorPopUpTests >> testExistenceOfPopUp [

	self buttonForGlobalColor clickFunctionality: self artificialMouseClick.
	
	self assert: self canvas toolbar popUp notNil
]

{
	#category : #tests,
	#'squeak_changestamp' : 'si 7/12/2024 11:25'
}
WBGlobalColorPopUpTests >> testPopUpPlacementInX [

	self buttonForGlobalColor clickFunctionality: self artificialMouseClick.
	
	self assert: self buttonForGlobalColor right <= self canvas toolbar popUp left.	
	self assert: self canvas toolbar popUp left <= (self buttonForGlobalColor right + 200)
]

{
	#category : #tests,
	#'squeak_changestamp' : 'si 7/12/2024 11:25'
}
WBGlobalColorPopUpTests >> testPopUpPlacementInY [
	
	self buttonForGlobalColor clickFunctionality: self artificialMouseClick.
	
	self assert: self buttonForGlobalColor center y - 200 < self canvas toolbar popUp top.	
	self assert: self canvas toolbar popUp bottom < (self buttonForGlobalColor center y + 500) 
]

{
	#category : #tests,
	#'squeak_changestamp' : 'si 7/12/2024 11:43'
}
WBGlobalColorPopUpTests >> testTransparentGlobalColor [
	| buttonForColor |
	
	self buttonForGlobalColor clickFunctionality: self artificialMouseClick.
	
	self canvas toolbar popUp submorphs do: [:b | b color = Color white ifTrue: [buttonForColor := b]].
	buttonForColor clickFunctionality: self artificialMouseClick.
	
	self canvas spawnAnElement: (WBRectangularElement newWithCanvas: self canvas) At: self artificialMouseClick.
	self canvas dropElement: self artificialMouseClick.
	
	self assert: (self canvas elements at: 1) morph borderColor = Color black
	
	
]
