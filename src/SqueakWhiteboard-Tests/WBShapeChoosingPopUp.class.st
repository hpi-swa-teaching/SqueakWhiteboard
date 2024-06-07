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
	#'squeak_changestamp' : 'si 6/8/2024 00:40'
}
WBShapeChoosingPopUp >> testButtonFunctionallity [

	|popUpMenu button buttonForShape arteficialMouseClick|
	
	self canvas toolbar buttons do: [:b | b class = WBShapeChoosingButton ifTrue: [button := b]].
	button clickFunctionality: nil.
	popUpMenu := button popUp.
	
	arteficialMouseClick := MouseButtonEvent new position: self canvas position + (100@100).
	
	popUpMenu submorphs do: [:s | s number = 1 ifTrue: [buttonForShape := s]].
	buttonForShape clickFunctionality: arteficialMouseClick.
	self assert: self canvas elementToSpawn class = WBRectangle.
	
	popUpMenu submorphs do: [:s | s number = 2 ifTrue: [buttonForShape := s]].
	buttonForShape clickFunctionality: arteficialMouseClick.
	self assert: self canvas elementToSpawn class = WBCircle.
	
	popUpMenu submorphs do: [:s | s number = 4 ifTrue: [buttonForShape := s]].
	buttonForShape clickFunctionality: arteficialMouseClick.
	self assert: self canvas elementToSpawn class = WBTextbox.
]

{
	#category : #testsForStandardElement,
	#'squeak_changestamp' : 'si 6/7/2024 23:31'
}
WBShapeChoosingPopUp >> testButtonsOfPopUp [

	| button|

	self canvas toolbar buttons do: [:b | b class = WBShapeChoosingButton ifTrue: [button := b]].
	button clickFunctionality: nil.
	
	self assert: button popUp submorphs size = 3
]

{
	#category : #testsForStandardElement,
	#'squeak_changestamp' : 'si 6/7/2024 23:31'
}
WBShapeChoosingPopUp >> testExistenxOfPopUp [

	| button|

	self canvas toolbar buttons do: [:b | b class = WBShapeChoosingButton ifTrue: [button := b]].
	button clickFunctionality: nil.
	
	self assert: button popUp notNil
	
]

{
	#category : #testsForStandardElement,
	#'squeak_changestamp' : 'si 6/7/2024 23:35'
}
WBShapeChoosingPopUp >> testPopUpPlacement [

	|popUpMenu button|
	
	self canvas toolbar buttons do: [:b | b class = WBShapeChoosingButton ifTrue: [button := b]].
	button clickFunctionality: nil.
	popUpMenu := button popUp.
	
	self assert: button center y - 200 < popUpMenu top.	
	self assert: popUpMenu bottom < (button center y + 500) .	
]

{
	#category : #testsForStandardElement,
	#'squeak_changestamp' : 'si 6/7/2024 23:35'
}
WBShapeChoosingPopUp >> testPopUpPlacementInX [

	|popUpMenu button|
	
	self canvas toolbar buttons do: [:b | b class = WBShapeChoosingButton ifTrue: [button := b]].
	button clickFunctionality: nil.
	popUpMenu := button popUp.
	
	self assert: button right <= popUpMenu left.	
	self assert: popUpMenu left <= (button right + 200).	
]
