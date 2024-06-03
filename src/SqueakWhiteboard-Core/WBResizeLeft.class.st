Class {
	#name : #WBResizeLeft,
	#superclass : #WBResizeBar,
	#category : #'SqueakWhiteboard-Core'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'JK 6/3/2024 19:01'
}
WBResizeLeft >> resize: movement [
	self frame position: (self frame position x + movement x)@(self frame position y).
	self frame extent: (self frame extent x - movement x)@(self frame extent y).
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
