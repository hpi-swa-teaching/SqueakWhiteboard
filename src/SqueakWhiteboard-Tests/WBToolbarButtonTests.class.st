Class {
	#name : #WBToolbarButtonTests,
	#superclass : #WBButtonTests,
	#category : #'SqueakWhiteboard-Tests'
}

{
	#category : #tests,
	#'squeak_changestamp' : 'ACL 7/7/2024 18:19'
}
WBToolbarButtonTests >> testButtonFunctionality [
	| button |

	button := self canvas toolbar buttons at: 1.
	button clickFunctionality: (MouseButtonEvent new position: self canvas position + (100 @ 100))
]

{
	#category : #tests,
	#'squeak_changestamp' : 'ACL 7/7/2024 18:26'
}
WBToolbarButtonTests >> testNoteButtonFunctionality [
	| button |

	button := self canvas toolbar buttons at: 3.
	button clickFunctionality: (MouseButtonEvent new position: self canvas position + (100 @ 100)).	
	
	self assert: self canvas elementToSpawn class = WBNote
]
