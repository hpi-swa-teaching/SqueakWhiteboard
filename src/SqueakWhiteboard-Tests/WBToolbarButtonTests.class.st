Class {
	#name : #WBToolbarButtonTests,
	#superclass : #WBButtonTests,
	#category : #'SqueakWhiteboard-Tests'
}

{
	#category : #tests,
	#'squeak_changestamp' : 'si 7/12/2024 11:03'
}
WBToolbarButtonTests >> testNoteButtonFunctionality [
	| button |

	button := self getButtonWithFunctionality: self canvas toolbar buttonFunctionalityForNote from: self canvas toolbar submorphs.
	button clickFunctionality: self artificialMouseClick.
	
	self assert: self canvas elementToSpawn class = WBNote
]

{
	#category : #tests,
	#'squeak_changestamp' : 'si 7/12/2024 11:05'
}
WBToolbarButtonTests >> testTextboxButtonFunctionality [
	| button |

	button := self getButtonWithFunctionality: self canvas toolbar buttonFunctionalityForTextbox from: self canvas toolbar submorphs.
	button clickFunctionality: self artificialMouseClick.
	
	self assert: self canvas elementToSpawn class = WBTextbox
]
