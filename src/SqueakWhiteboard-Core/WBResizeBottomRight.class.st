Class {
	#name : #WBResizeBottomRight,
	#superclass : #WBResizeHandle,
	#category : #'SqueakWhiteboard-Core'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'JK 6/3/2024 19:12'
}
WBResizeBottomRight >> resize: movement [
	self frame resizeRight: self center x + movement x.
	self frame resizeBottom: self center y + movement y
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'JK 5/27/2024 16:26'
}
WBResizeBottomRight >> resizeCursor [
	Cursor resizeBottomRight show.
	
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'JK 6/3/2024 19:01'
}
WBResizeBottomRight >> setLayout [
	self center: frame bottomRight.
	
]
