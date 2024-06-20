Class {
	#name : #WBArrowhead,
	#superclass : #PolygonMorph,
	#instVars : [
		'isVisible'
	],
	#category : #'SqueakWhiteboard-Core'
}

{
	#category : #defaults,
	#'squeak_changestamp' : 'si 6/14/2024 12:48'
}
WBArrowhead class >> defaultVertecies [

	^ {0@0. 20@10. 0@20}
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'si 6/14/2024 12:48'
}
WBArrowhead >> initialize [
	
	super initialize.
	self
		addFlexShellIfNecessary;
		setVertices: self class defaultVertecies;
		fillStyle: Color black;
		goBehind.
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
