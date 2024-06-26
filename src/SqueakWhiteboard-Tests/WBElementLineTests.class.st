Class {
	#name : #WBElementLineTests,
	#superclass : #WBElementTests,
	#category : #'SqueakWhiteboard-Tests'
}

{
	#category : #tests,
	#'squeak_changestamp' : 'si 6/25/2024 14:20'
}
WBElementLineTests >> testSpawningViaClicking [
	| element mouseEvent1 mouseEvent2 |
	
	mouseEvent1 := MouseButtonEvent new.
	mouseEvent1 setType: #mouseDown position: self canvas position + (100 @ 100) which: 4 buttons: mouseEvent1 class redButton hand: HandMorph new stamp: 0.
	mouseEvent2 := MouseButtonEvent new.
	mouseEvent2 setType: #mouseDown position: self canvas position + (200 @ 200) which: 4 buttons: mouseEvent2 class redButton hand: HandMorph new stamp: 0.
	
	element := (WBLine new arrowHead: true).
	self canvas spawnAnElement: (element) At: (MouseButtonEvent new position: self canvas position + (100@100)).
	element mouseUp: mouseEvent1.
	element mouseUp: mouseEvent2.

	self assert: element morph vertices = { self canvas position + (200 @ 200) . self canvas position + (100 @ 100)}
]
