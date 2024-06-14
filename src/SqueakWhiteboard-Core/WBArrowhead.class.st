Class {
	#name : #WBArrowhead,
	#superclass : #PolygonMorph,
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
