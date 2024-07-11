Class {
	#name : #WBElementPopUpTests,
	#superclass : #WBElementTests,
	#instVars : [
		'element',
		'popUp'
	],
	#category : #'SqueakWhiteboard-Tests'
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'si 7/11/2024 20:50'
}
WBElementPopUpTests >> element [

	^ element
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'si 7/11/2024 20:50'
}
WBElementPopUpTests >> element: anElement [

	element := anElement
]

{
	#category : #'getting button',
	#'squeak_changestamp' : 'si 7/11/2024 21:00'
}
WBElementPopUpTests >> getButtonWithFunctionality: aBlock from: aCollection [

	aCollection do: [:b | b block asString = aBlock asString ifTrue: [^ b]]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'si 7/11/2024 20:55'
}
WBElementPopUpTests >> popUp [

	^ popUp
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'si 7/11/2024 20:55'
}
WBElementPopUpTests >> popUp: aPopUp [

	popUp := aPopUp
]

{
	#category : #setUp,
	#'squeak_changestamp' : 'si 7/11/2024 20:54'
}
WBElementPopUpTests >> setUp [

	super setUp.
	self canvas spawnAnElement: (WBRectangularElement newWithCanvas: self canvas) At: self artificialMouseClick.
	self canvas dropElement: self artificialMouseClick.
	self element: (self canvas elements at: 1).
	self element mouseDown: self artificialMouseClick.
	self popUp: self element popUp 
]

{
	#category : #tests,
	#'squeak_changestamp' : 'si 7/11/2024 20:57'
}
WBElementPopUpTests >> testButtonsOfPopUp [
	
	self assert: self popUp submorphs size = 4
]

{
	#category : #tests,
	#'squeak_changestamp' : 'si 7/11/2024 21:14'
}
WBElementPopUpTests >> testDeactivationOfElement [
	
	self element deactivateElement.

	self assert: self element popUp isNil
	
]

{
	#category : #tests,
	#'squeak_changestamp' : 'si 7/11/2024 21:19'
}
WBElementPopUpTests >> testExistenceOfPopUp [
	
	self assert: self popUp notNil
	
]

{
	#category : #tests,
	#'squeak_changestamp' : 'si 7/11/2024 21:40'
}
WBElementPopUpTests >> testFunctionalityOfBorderColor [
	| buttonForColor buttonForColorPallete |
	
	buttonForColorPallete := self getButtonWithFunctionality: self element buttonFunctionalityForBorderColorPalette from: self popUp submorphs.
	buttonForColorPallete clickFunctionality: self artificialMouseClick.
	
	self popUp popUp submorphs do: [:b | b color = Color red ifTrue: [buttonForColor := b]].
	buttonForColor clickFunctionality: self artificialMouseClick.
	self assert: self element morph borderColor = buttonForColor color.
	
	self popUp popUp submorphs do: [:b | b color = Color white ifTrue: [buttonForColor := b]].
	buttonForColor clickFunctionality: self artificialMouseClick.
	self assert: self element morph borderColor = self element color
	
]

{
	#category : #tests,
	#'squeak_changestamp' : 'si 7/11/2024 21:21'
}
WBElementPopUpTests >> testFunctionalityOfBorderColorPopUp [
	| button |
	
	button := self getButtonWithFunctionality: self element buttonFunctionalityForBorderColorPalette from: self popUp submorphs.
	button clickFunctionality: self artificialMouseClick.
	
	self assert: self popUp popUp notNil.
	self assert: self popUp popUp submorphs size = 12
]

{
	#category : #tests,
	#'squeak_changestamp' : 'si 7/11/2024 21:40'
}
WBElementPopUpTests >> testFunctionalityOfColor [
	| buttonForColor buttonForColorPallete |
	
	buttonForColorPallete := self getButtonWithFunctionality: self element buttonFunctionalityForColorPalette from: self popUp submorphs.
	buttonForColorPallete clickFunctionality: self artificialMouseClick.
	
	self popUp popUp submorphs do: [:b | b color = Color red ifTrue: [buttonForColor := b]].
	buttonForColor clickFunctionality: self artificialMouseClick.
	self assert: self element morph color = buttonForColor color.
	
	self popUp popUp submorphs do: [:b | b color = Color white ifTrue: [buttonForColor := b]].
	buttonForColor clickFunctionality: self artificialMouseClick.
	self assert: self element morph color = Color transparent
]

{
	#category : #tests,
	#'squeak_changestamp' : 'si 7/11/2024 21:22'
}
WBElementPopUpTests >> testFunctionalityOfColorPopUp [
	| button |
	
	button := self getButtonWithFunctionality: self element buttonFunctionalityForColorPalette from: self popUp submorphs.
	button clickFunctionality: self artificialMouseClick.
	
	self assert: self popUp popUp notNil.
	self assert: self popUp popUp submorphs size = 12
]

{
	#category : #tests,
	#'squeak_changestamp' : 'si 7/11/2024 21:04'
}
WBElementPopUpTests >> testFunctionalityOfCopy [
	| button |
	
	button := self getButtonWithFunctionality: self element buttonFunctionalityForCopy from: self popUp submorphs.
	button clickFunctionality: self artificialMouseClick.
		
	self assert: self canvas elementToSpawn class = self element class
]

{
	#category : #tests,
	#'squeak_changestamp' : 'si 7/11/2024 21:04'
}
WBElementPopUpTests >> testFunctionalityOfDelete [
	| button |
	
	button := self getButtonWithFunctionality: self element buttonFunctionalityForDelete from: self popUp submorphs.
	button clickFunctionality: self artificialMouseClick.
	
	self assert: self canvas elements size = 0
]
