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
	#'squeak_changestamp' : 'si 6/7/2024 00:29'
}
WBShapeChoosingPopUp >> setUp [

	super setUp.
	self canvas: WBCanvas newForTests.

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
	#'squeak_changestamp' : 'si 6/7/2024 01:32'
}
WBShapeChoosingPopUp >> testButtonFunctionallity [

	|popUpMenu toolbar button buttonForShape|
	self canvas submorphs do: [:s | s class = WBToolbarForTests ifTrue: [toolbar := s]].
	toolbar buttons do: [:b | b class = WBShapeChoosingButton ifTrue: [button := b]].
	button clickFunctionality: AbstractEvent new.
	button submorphs do: [:s | s class = WBElementPopUp ifTrue: [popUpMenu := s]].
	
	popUpMenu submorphs do: [:s | s number = 1 ifTrue: [buttonForShape := s]].
	buttonForShape clickFunctionality: AbstractEvent new.
	self assert: self canvas elementToSpawn class = WBRectangle.
	
	popUpMenu submorphs do: [:s | s number = 2 ifTrue: [buttonForShape := s]].
	buttonForShape clickFunctionality: AbstractEvent new.
	self assert: self canvas elementToSpawn class = WBCircle.
	
	popUpMenu submorphs do: [:s | s number = 4 ifTrue: [buttonForShape := s]].
	buttonForShape clickFunctionality: AbstractEvent new.
	self assert: self canvas elementToSpawn class = WBTextbox.
]

{
	#category : #testsForStandardElement,
	#'squeak_changestamp' : 'si 6/7/2024 01:37'
}
WBShapeChoosingPopUp >> testButtonsOfPopUp [

	|popUpMenu toolbar button|
	self canvas submorphs do: [:s | s class = WBToolbarForTests ifTrue: [toolbar := s]].
	toolbar buttons do: [:b | b class = WBShapeChoosingButton ifTrue: [button := b]].
	button clickFunctionality: AbstractEvent new.
	button submorphs do: [:s | s class = WBElementPopUp ifTrue: [popUpMenu := s]].
	
	self assert: popUpMenu submorphs size = 3
]

{
	#category : #testsForStandardElement,
	#'squeak_changestamp' : 'si 6/7/2024 01:34'
}
WBShapeChoosingPopUp >> testExistenxOfPopUp [

	|popUpMenu toolbar button|
	self canvas submorphs do: [:s | s class = WBToolbarForTests ifTrue: [toolbar := s]].
	toolbar buttons do: [:b | b class = WBShapeChoosingButton ifTrue: [button := b]].
	button clickFunctionality: MouseButtonEvent new.
	button submorphs do: [:s | s class = WBElementPopUp ifTrue: [popUpMenu := s]].
	self assert: popUpMenu notNil
	
]

{
	#category : #testsForStandardElement,
	#'squeak_changestamp' : 'si 6/7/2024 01:38'
}
WBShapeChoosingPopUp >> testPopUpPlacement [

	|popUpMenu toolbar button|
	self canvas submorphs do: [:s | s class = WBToolbarForTests ifTrue: [toolbar := s]].
	toolbar buttons do: [:b | b class = WBShapeChoosingButton ifTrue: [button := b]].
	button clickFunctionality: AbstractEvent new.
	button submorphs do: [:s | s class = WBElementPopUp ifTrue: [popUpMenu := s]].
	
	self assert: button center y - 200 < popUpMenu top.	
	self assert: popUpMenu center y + 200 < button bottom.	
]

{
	#category : #testsForStandardElement,
	#'squeak_changestamp' : 'si 6/7/2024 01:37'
}
WBShapeChoosingPopUp >> testPopUpPlacementInX [

	|popUpMenu toolbar button|
	self canvas submorphs do: [:s | s class = WBToolbarForTests ifTrue: [toolbar := s]].
	toolbar buttons do: [:b | b class = WBShapeChoosingButton ifTrue: [button := b]].
	button clickFunctionality: AbstractEvent new.
	button submorphs do: [:s | s class = WBElementPopUp ifTrue: [popUpMenu := s]].
	
	self assert: button right < popUpMenu left.	
	self assert: popUpMenu left < button right + 200.	
]
