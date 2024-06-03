Class {
	#name : #WBResizeTop,
	#superclass : #WBResizeBar,
	#category : #'SqueakWhiteboard-Core'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'JK 6/3/2024 13:03'
}
WBResizeTop >> resize: movement [
	self element position: (self element position x)@(self element position y + movement y).
	self element extent: (self element extent x)@(self element extent y - movement y).
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
