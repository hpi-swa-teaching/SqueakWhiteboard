Class {
	#name : #WBResizeBottomLeft,
	#superclass : #WBResizeHandle,
	#category : #'SqueakWhiteboard-Core'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'JK 6/3/2024 19:07'
}
WBResizeBottomLeft >> resize: movement [
	self frame resizeLeft: self center x + movement x.
	self frame resizeBottom: self center y + movement y
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'JK 5/27/2024 16:25'
}
WBResizeBottomLeft >> resizeCursor [
	Cursor resizeBottomLeft show.
	
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'JK 6/3/2024 19:01'
}
WBResizeBottomLeft >> setLayout [
	self center: frame bottomLeft.
	
]
