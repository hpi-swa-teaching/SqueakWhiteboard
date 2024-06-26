Class {
	#name : #WBLineChoosingPopUpTests,
	#superclass : #WBToolbarButtonTests,
	#category : #'SqueakWhiteboard-Tests'
}

{
	#category : #tests,
	#'squeak_changestamp' : 'si 6/25/2024 14:17'
}
WBLineChoosingPopUpTests >> testButtonFunctionality [
	| button buttonForLine|

	button := self canvas toolbar buttons at: 2.
	button clickFunctionality: (MouseButtonEvent new position: self canvas position + (100@100)).
	
	buttonForLine := self canvas toolbar popUp submorphs at: 1. 
	buttonForLine clickFunctionality: (MouseButtonEvent new position: self canvas position + (100@100)).
	self assert: self canvas elementToSpawn notNil.
	self assert: self canvas elementToSpawn arrowHead = true.
	
	buttonForLine := self canvas toolbar popUp submorphs at: 2. 
	buttonForLine clickFunctionality: (MouseButtonEvent new position: self canvas position + (100@100)).
	self assert: self canvas elementToSpawn notNil.
	self assert: self canvas elementToSpawn arrowHead = false.
]

{
	#category : #tests,
	#'squeak_changestamp' : 'si 6/25/2024 14:17'
}
WBLineChoosingPopUpTests >> testButtonsOfPopUp [
	| button |

	button := self canvas toolbar buttons at: 2.
	button clickFunctionality: (MouseButtonEvent new position: self canvas position + (100@100)).
	
	self assert: self canvas toolbar popUp submorphs size = 2
]

{
	#category : #tests,
	#'squeak_changestamp' : 'si 6/25/2024 14:17'
}
WBLineChoosingPopUpTests >> testExistenceOfPopUp [
	| button |

	button := self canvas toolbar buttons at: 2.
	button clickFunctionality: (MouseButtonEvent new position: self canvas position + (100@100)).
	
	self assert: self canvas toolbar popUp notNil
]

{
	#category : #tests,
	#'squeak_changestamp' : 'si 6/25/2024 14:17'
}
WBLineChoosingPopUpTests >> testPopUpPlacementInX [
	| button |

	button := self canvas toolbar buttons at: 2.
	button clickFunctionality: (MouseButtonEvent new position: self canvas position + (100@100)).
	
	self assert: button right <= self canvas toolbar popUp left.	
	self assert: self canvas toolbar popUp left <= (button right + 200)
]

{
	#category : #tests,
	#'squeak_changestamp' : 'si 6/25/2024 14:17'
}
WBLineChoosingPopUpTests >> testPopUpPlacementInY [
	| button |

	button := self canvas toolbar buttons at: 2.
	button clickFunctionality: (MouseButtonEvent new position: self canvas position + (100@100)).
	
	self assert: button center y - 200 < self canvas toolbar popUp top.	
	self assert: self canvas toolbar popUp bottom < (button center y + 500) 
]
