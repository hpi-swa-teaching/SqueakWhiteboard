Class {
	#name : #WBResizeBottom,
	#superclass : #WBResizeBar,
	#category : #'SqueakWhiteboard-Core'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'JK 6/3/2024 19:25'
}
WBResizeBottom >> resize: movement [
	self frame resizeBottom: self center y + movement y
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'JK 6/3/2024 12:39'
}
WBResizeBottom >> resizeCursor [
	Cursor resizeBottom show.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'JK 6/3/2024 12:56'
}
WBResizeBottom >> setLayout [
	self height: WBResizeFrame resizeWidth.
	self width: element width-WBResizeFrame resizeWidth.
	self center: element bottomCenter.
]
