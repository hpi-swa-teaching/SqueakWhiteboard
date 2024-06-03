Class {
	#name : #WBArrowhead,
	#superclass : #PolygonMorph,
	#category : #'SqueakWhiteboard-Core'
}

{
	#category : #initialization,
	#'squeak_changestamp' : 'nicloeser 5/30/2024 14:35'
}
WBArrowhead >> initialize [
	
	super initialize.
	self
		addFlexShellIfNecessary;
		setVertices: {0@0. 20@10. 0@20};
		fillStyle: Color black.
]
