Class {
	#name : #WBResizeLeft,
	#superclass : #WBResizeBar,
	#category : #'SqueakWhiteboard-Core'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'JK 6/3/2024 19:26'
}
WBResizeLeft >> resize: movement [
	self frame resizeLeft: self center x + movement x
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
