"
This class represents the arrow part of a WBLine
"
Class {
	#name : #WBArrowhead,
	#superclass : #PolygonMorph,
	#instVars : [
		'isVisible'
	],
	#category : #'SqueakWhiteboard-Core',
	#'squeak_changestamp' : 'is 6/23/2024 02:31'
}

{
	#category : #defaults,
	#'squeak_changestamp' : 'ACL 7/11/2024 12:10'
}
WBArrowhead class >> defaultVertices [

	^ {0 @ 0. 20 @ 10. 0 @ 20}
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'is 6/23/2024 01:28'
}
WBArrowhead >> initialize [
	
	super initialize.
	self
		addFlexShellIfNecessary;
		setVertices: self class defaultVertices;
		fillStyle: Color black;
		goBehind
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'si 6/20/2024 23:01'
}
WBArrowhead >> isVisible [

	^ isVisible
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'si 6/20/2024 23:02'
}
WBArrowhead >> isVisible: aBoolean [

	isVisible := aBoolean.
	aBoolean 
		ifTrue: [self show]
		ifFalse: [self hide]
]
