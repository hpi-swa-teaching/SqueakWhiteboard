Class {
	#name : #WBDeletePopUpTests,
	#superclass : #WBToolbarButtonTests,
	#category : #'SqueakWhiteboard-Tests'
}

{
	#category : #tests,
	#'squeak_changestamp' : 'si 6/25/2024 15:01'
}
WBDeletePopUpTests >> testButtonFunctionalityForCancel [
	| button buttonForCancel mouseEvent |
	
	mouseEvent := MouseButtonEvent new.
	mouseEvent setType: #mouseDown position: self canvas position + (100 @ 100) which: 4 buttons: mouseEvent class redButton hand: HandMorph new stamp: 0.
	button := self canvas toolbar buttons at: 5.
	button clickFunctionality: (MouseButtonEvent new position: self canvas position + (100@100)).
	
	self canvas spawnAnElement: (WBRectangle new) At: (MouseButtonEvent new position: self canvas position + (100@100)).
	self canvas dropElement: mouseEvent.
	self canvas spawnAnElement: (WBRectangle new) At: (MouseButtonEvent new position: self canvas position + (200@200)).
	self canvas dropElement: mouseEvent.
	
	buttonForCancel := self canvas toolbar popUp submorphs at: 1. 
	buttonForCancel clickFunctionality: (MouseButtonEvent new position: self canvas position + (100@100)).
	self assert: self canvas elements size = 2.
	self assert: self canvas toolbar popUp = nil.
	self assert: self canvas text = nil
]

{
	#category : #tests,
	#'squeak_changestamp' : 'si 6/25/2024 15:01'
}
WBDeletePopUpTests >> testButtonFunctionalityForConfirm [
	| button buttonForConfirm mouseEvent |
	
	mouseEvent := MouseButtonEvent new.
	mouseEvent setType: #mouseDown position: self canvas position + (100 @ 100) which: 4 buttons: mouseEvent class redButton hand: HandMorph new stamp: 0.
	
		button := self canvas toolbar buttons at: 5.
	button clickFunctionality: (MouseButtonEvent new position: self canvas position + (100@100)).
	
	self canvas spawnAnElement: (WBRectangle new) At: (MouseButtonEvent new position: self canvas position + (100@100)).
	self canvas dropElement: mouseEvent.
	self canvas spawnAnElement: (WBRectangle new) At: (MouseButtonEvent new position: self canvas position + (200@200)).
	self canvas dropElement: mouseEvent.
	
	buttonForConfirm := self canvas toolbar popUp submorphs at: 2. 
	buttonForConfirm clickFunctionality: (MouseButtonEvent new position: self canvas position + (100@100)).
	self assert: self canvas elements size = 0.
	self assert: self canvas toolbar popUp = nil.
	self assert: self canvas text = nil
]

{
	#category : #tests,
	#'squeak_changestamp' : 'is 6/21/2024 18:53'
}
WBDeletePopUpTests >> testButtonsOfPopUp [
	| button |

	button := self canvas toolbar buttons at: 5.
	button clickFunctionality: (MouseButtonEvent new position: self canvas position + (100@100)).
	
	self assert: self canvas toolbar popUp submorphs size = 2
]

{
	#category : #tests,
	#'squeak_changestamp' : 'si 6/25/2024 15:00'
}
WBDeletePopUpTests >> testExistenceOfPopUp [
	| button|

	button := self canvas toolbar buttons at: 5.
	button clickFunctionality: (MouseButtonEvent new position: self canvas position + (100@100)).
	
	self assert: self canvas toolbar popUp notNil.
	self assert: self canvas text contents = WBToolbar textForDeleteAll
]

{
	#category : #tests,
	#'squeak_changestamp' : 'si 6/25/2024 14:57'
}
WBDeletePopUpTests >> testPopUpPlacementInX [
	| button |

	button := self canvas toolbar buttons at: 5.
	button clickFunctionality: (MouseButtonEvent new position: self canvas position + (100@100)).
	
	self assert: (self canvas center x - 100) <= self canvas toolbar popUp left.	
	self assert: self canvas toolbar popUp right <= (self canvas center x + 100)
]

{
	#category : #tests,
	#'squeak_changestamp' : 'si 6/25/2024 14:58'
}
WBDeletePopUpTests >> testPopUpPlacementInY [
	| button |

	button := self canvas toolbar buttons at: 5.
	button clickFunctionality: (MouseButtonEvent new position: self canvas position + (100@100)).
	
	self assert: self canvas center y <= self canvas toolbar popUp top.	
	self assert: self canvas toolbar popUp bottom <= (self canvas center y + 200)
]
