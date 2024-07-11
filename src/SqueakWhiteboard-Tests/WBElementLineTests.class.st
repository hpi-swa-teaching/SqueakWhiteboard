Class {
	#name : #WBElementLineTests,
	#superclass : #WBElementTests,
	#instVars : [
		'line'
	],
	#category : #'SqueakWhiteboard-Tests'
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'si 7/11/2024 18:19'
}
WBElementLineTests >> line [

	^ line
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'si 7/11/2024 18:19'
}
WBElementLineTests >> line: aLine [

	line := aLine
]

{
	#category : #setUp,
	#'squeak_changestamp' : 'si 7/11/2024 18:20'
}
WBElementLineTests >> setUp [
	| mouseEvent1 mouseEvent2 |
	super setUp.
	mouseEvent1 := MouseButtonEvent new.
	mouseEvent1 setType: #mouseDown position: self canvas position + (100 @ 100) which: 4 buttons: mouseEvent1 class redButton hand: HandMorph new stamp: 0.
	mouseEvent2 := MouseButtonEvent new.
	mouseEvent2 setType: #mouseDown position: self canvas position + (200 @ 200) which: 4 buttons: mouseEvent2 class redButton hand: HandMorph new stamp: 0.
	
	line := ((WBLine newWithCanvas: self canvas) arrowHead: true).
	self canvas spawnAnElement: (line) At: (MouseButtonEvent new position: self canvas position + (100 @ 100)).
	line mouseUp: mouseEvent1.
	line mouseUp: mouseEvent2.
]

{
	#category : #tests,
	#'squeak_changestamp' : 'si 7/11/2024 19:13'
}
WBElementLineTests >> testArrowHeadDirection [

	self assert: line arrowHead rotationDegrees = 44.41321980490211 
]

{
	#category : #tests,
	#'squeak_changestamp' : 'si 7/11/2024 19:22'
}
WBElementLineTests >> testArrowVisibility [
	| visibility |
	 
	visibility := self line arrowHead isVisible.
	self line switchVisibilityOfArrowHead.
	
	self assert: self line arrowHead isVisible = visibility not.
	
	self line switchVisibilityOfArrowHead.
	
	self assert: self line arrowHead isVisible = visibility
]

{
	#category : #tests,
	#'squeak_changestamp' : 'si 7/11/2024 18:33'
}
WBElementLineTests >> testHitboxSendsMouseDownEvent [
	| mouseEvent |
	
	mouseEvent := MouseButtonEvent new.
	mouseEvent setType: #mouseDown position: self canvas position + (100 @ 100) which: 4 buttons: mouseEvent class redButton hand: HandMorph new stamp: 0.
	self line hitbox mouseDown: mouseEvent.
	
	self assert: (self line edges at: 2) morph hasDropShadow.
	self assert: (self line edges at: 2) popUp notNil
]

{
	#category : #tests,
	#'squeak_changestamp' : 'si 7/11/2024 18:43'
}
WBElementLineTests >> testHitboxSendsMouseEnterEvent [
	| mouseEvent |
	
	mouseEvent := MouseButtonEvent new.
	mouseEvent setType: #mouseDown position: self canvas position + (100 @ 100) which: 4 buttons: mouseEvent class redButton hand: HandMorph new stamp: 0.
	self line hitbox mouseEnter: mouseEvent.
	
	self assert: (self line edges at: 2) color = self line morph borderColor
]

{
	#category : #tests,
	#'squeak_changestamp' : 'si 7/11/2024 18:44'
}
WBElementLineTests >> testHitboxSendsMouseLeaveEvent [
	| mouseEvent |
	
	mouseEvent := MouseButtonEvent new.
	mouseEvent setType: #mouseDown position: self canvas position + (100 @ 100) which: 4 buttons: mouseEvent class redButton hand: HandMorph new stamp: 0.
	self line hitbox mouseLeave: mouseEvent.
	
	self assert: (self line edges at: 2) color = Color transparent
]

{
	#category : #tests,
	#'squeak_changestamp' : 'si 7/11/2024 18:32'
}
WBElementLineTests >> testHitboxSendsMouseUpEvent [
	| mouseEvent |
	
	mouseEvent := MouseButtonEvent new.
	mouseEvent setType: #mouseDown position: self canvas position + (100 @ 100) which: 4 buttons: mouseEvent class redButton hand: HandMorph new stamp: 0.
	self line hitbox mouseUp: mouseEvent.
	
	self assert: (self line edges at: 2) morph hasDropShadow = false
]

{
	#category : #tests,
	#'squeak_changestamp' : 'si 7/11/2024 18:21'
}
WBElementLineTests >> testLineHitbox [

	self assert: line hitbox vertices = { self canvas position + (200 @ 200) . self canvas position + (100 @ 100)}
]

{
	#category : #tests,
	#'squeak_changestamp' : 'si 7/11/2024 18:21'
}
WBElementLineTests >> testLineHitboxAcceptsPoint [

	self assert: (line hitbox containsPoint: self canvas position + (150 @ 150)) = true
]

{
	#category : #tests,
	#'squeak_changestamp' : 'si 7/11/2024 18:29'
}
WBElementLineTests >> testLineHitboxRejectsPoint [

	self assert: (line hitbox containsPoint: self canvas position + (150 @ 165)) = false
]

{
	#category : #tests,
	#'squeak_changestamp' : 'si 7/11/2024 18:21'
}
WBElementLineTests >> testSpawningViaClicking [

	self assert: line morph vertices = { self canvas position + (200 @ 200) . self canvas position + (100 @ 100)}
]
