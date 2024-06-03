Class {
	#name : #WBResizeLeft,
	#superclass : #WBResizeBar,
	#category : #'SqueakWhiteboard-Core'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'JK 6/3/2024 13:01'
}
WBResizeLeft >> resize: movement [
	self element position: (self element position x + movement x)@(self element position y).
	self element extent: (self element extent x - movement x)@(self element extent y).
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'JK 6/3/2024 13:13'
}
WBResizeLeft >> resizeCursor [
	Cursor resizeLeft show.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'JK 6/3/2024 12:59'
}
WBResizeLeft >> setLayout [
	self height: element height - WBResizeFrame resizeWidth.
	self width: WBResizeFrame resizeWidth.
	self center: element leftCenter.
]
