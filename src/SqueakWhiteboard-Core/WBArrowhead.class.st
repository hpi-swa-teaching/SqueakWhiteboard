Class {
	#name : #WBArrowhead,
	#superclass : #PolygonMorph,
	#category : #'SqueakWhiteboard-Core'
}

{
	#category : #initialization,
	#'squeak_changestamp' : 'si 6/14/2024 11:49'
}
WBArrowhead >> initialize [
	
	super initialize.
	self
		addFlexShellIfNecessary;
		setVertices: {0@0. 20@10. 0@20};
		fillStyle: Color black;
		goBehind.
]
