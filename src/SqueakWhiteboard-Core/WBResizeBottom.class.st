Class {
	#name : #WBResizeBottom,
	#superclass : #WBResizeBar,
	#category : #'SqueakWhiteboard-Core'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'JK 6/3/2024 12:57'
}
WBResizeBottom >> resize: movement [
	self element extent: (self element extent x)@(self element extent y + movement y).
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
