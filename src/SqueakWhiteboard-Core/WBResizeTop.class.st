Class {
	#name : #WBResizeTop,
	#superclass : #WBResizeBar,
	#category : #'SqueakWhiteboard-Core'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'JK 6/3/2024 19:01'
}
WBResizeTop >> resize: movement [
	self frame position: (self frame position x)@(self frame position y + movement y).
	self frame extent: (self frame extent x)@(self frame extent y - movement y).
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
