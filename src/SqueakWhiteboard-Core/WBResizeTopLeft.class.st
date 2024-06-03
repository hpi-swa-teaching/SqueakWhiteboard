Class {
	#name : #WBResizeTopLeft,
	#superclass : #WBResizeHandle,
	#category : #'SqueakWhiteboard-Core'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'JK 6/3/2024 19:12'
}
WBResizeTopLeft >> resize: movement [
	self frame resizeLeft: self center x + movement x.
	self frame resizeTop: self center y + movement y
	
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'JK 5/27/2024 16:09'
}
WBResizeTopLeft >> resizeCursor [
	Cursor resizeTopLeft show.
	
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'JK 6/3/2024 19:01'
}
WBResizeTopLeft >> setLayout [
	self center: frame topLeft.
	
]
