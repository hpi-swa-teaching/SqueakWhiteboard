Class {
	#name : #WBToolbarButtonTests,
	#superclass : #WBButtonTests,
	#category : #'SqueakWhiteboard-Tests'
}

{
	#category : #tests,
	#'squeak_changestamp' : 'is 6/21/2024 18:52'
}
WBToolbarButtonTests >> testButtonFunctionality [
	| button |

	button := self canvas toolbar buttons at: 1.
	button clickFunctionality: (MouseButtonEvent new position: self canvas position + (100@100))
]

{
	#category : #tests,
	#'squeak_changestamp' : 'is 6/21/2024 18:52'
}
WBToolbarButtonTests >> testNoteButtonFunctionality [
	| button |

	button := self canvas toolbar buttons at: 3.
	button clickFunctionality: (MouseButtonEvent new position: self canvas position + (100@100)).	
	self assert: self canvas elementToSpawn class = WBNote
]
