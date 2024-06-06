Class {
	#name : #WBResizeTopRight,
	#superclass : #WBResizeHandle,
	#category : #'SqueakWhiteboard-Core'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'JK 6/3/2024 19:13'
}
WBResizeTopRight >> resize: movement [
	self frame resizeRight: self center x + movement x.
	self frame resizeTop: self center y + movement y
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'JK 5/27/2024 16:26'
}
WBResizeTopRight >> resizeCursor [
	Cursor resizeTopRight show.
	
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'JK 6/3/2024 19:01'
}
WBResizeTopRight >> setLayout [
	self center: frame topRight.
	
]
