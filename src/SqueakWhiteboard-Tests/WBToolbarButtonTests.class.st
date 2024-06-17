Class {
	#name : #WBToolbarButtonTests,
	#superclass : #WBButtonTests,
	#category : #'SqueakWhiteboard-Tests'
}

{
	#category : #tests,
	#'squeak_changestamp' : 'si 6/17/2024 13:56'
}
WBToolbarButtonTests >> testButtonFunctionallity [
| button|

	button := self canvas toolbar buttons at: 1.
	button clickFunctionality: (MouseButtonEvent new position: self canvas position + (100@100)).
]

{
	#category : #tests,
	#'squeak_changestamp' : 'si 6/17/2024 13:59'
}
WBToolbarButtonTests >> testLineButtonFunctionallity [
| button|

	button := self canvas toolbar buttons at: 2.
	button clickFunctionality: (MouseButtonEvent new position: self canvas position + (100@100)).
	
	self assert: self canvas elementToSpawn class = WBLine
]

{
	#category : #tests,
	#'squeak_changestamp' : 'si 6/17/2024 13:59'
}
WBToolbarButtonTests >> testNoteButtonFunctionallity [
| button|

	button := self canvas toolbar buttons at: 3.
	button clickFunctionality: (MouseButtonEvent new position: self canvas position + (100@100)).
	
	self assert: self canvas elementToSpawn class = WBNote
]
