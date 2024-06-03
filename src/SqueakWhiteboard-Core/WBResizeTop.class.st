Class {
	#name : #WBResizeTop,
	#superclass : #WBResizeBar,
	#category : #'SqueakWhiteboard-Core'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'JK 6/3/2024 19:25'
}
WBResizeTop >> resize: movement [
	self frame resizeTop: self center y + movement y
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'JK 6/3/2024 13:03'
}
WBResizeTop >> resizeCursor [
	Cursor resizeTop show.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'JK 6/3/2024 13:04'
}
WBResizeTop >> setLayout [
	self height: WBResizeFrame resizeWidth.
	self width: element width-WBResizeFrame resizeWidth.
	self center: element topCenter.
]
