Class {
	#name : #WBShapeChoosingPopUpTests,
	#superclass : #WBToolbarButtonTests,
	#category : #'SqueakWhiteboard-Tests'
}

{
	#category : #tests,
	#'squeak_changestamp' : 'is 6/21/2024 18:54'
}
WBShapeChoosingPopUpTests >> testButtonFunctionality [
	| button buttonForShape |

	button := self canvas toolbar buttons at: 1.
	button clickFunctionality: (MouseButtonEvent new position: self canvas position + (100@100)).
	
	buttonForShape := self canvas toolbar popUp submorphs at: 1. 
	buttonForShape clickFunctionality: (MouseButtonEvent new position: self canvas position + (100@100)).
	self assert: self canvas elementToSpawn class = WBRectangle.
	
	buttonForShape := self canvas toolbar popUp submorphs at: 2. 
	buttonForShape clickFunctionality: (MouseButtonEvent new position: self canvas position + (100@100)).
	self assert: self canvas elementToSpawn class = WBCircle
]

{
	#category : #tests,
	#'squeak_changestamp' : 'is 6/21/2024 18:54'
}
WBShapeChoosingPopUpTests >> testButtonsOfPopUp [
	| button |

	button := self canvas toolbar buttons at: 1.
	button clickFunctionality: (MouseButtonEvent new position: self canvas position + (100@100)).
	
	self assert: self canvas toolbar popUp submorphs size = 2
]

{
	#category : #tests,
	#'squeak_changestamp' : 'is 6/21/2024 18:54'
}
WBShapeChoosingPopUpTests >> testExistenceOfPopUp [
	| button |

	button := self canvas toolbar buttons at: 1.
	button clickFunctionality: (MouseButtonEvent new position: self canvas position + (100@100)).
	
	self assert: self canvas toolbar popUp notNil
]

{
	#category : #tests,
	#'squeak_changestamp' : 'is 6/21/2024 18:54'
}
WBShapeChoosingPopUpTests >> testPopUpPlacementInX [
	| button |

	button := self canvas toolbar buttons at: 1.
	button clickFunctionality: (MouseButtonEvent new position: self canvas position + (100@100)).
	
	self assert: button right <= self canvas toolbar popUp left.	
	self assert: self canvas toolbar popUp left <= (button right + 200)
]

{
	#category : #tests,
	#'squeak_changestamp' : 'is 6/21/2024 18:54'
}
WBShapeChoosingPopUpTests >> testPopUpPlacementInY [
	| button |

	button := self canvas toolbar buttons at: 1.
	button clickFunctionality: (MouseButtonEvent new position: self canvas position + (100@100)).
	
	self assert: button center y - 200 < self canvas toolbar popUp top.	
	self assert: self canvas toolbar popUp bottom < (button center y + 500) 
]
