Class {
	#name : #WBResizeRight,
	#superclass : #WBResizeBar,
	#category : #'SqueakWhiteboard-Core'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'JK 6/3/2024 19:25'
}
WBResizeRight >> resize: movement [
	self frame resizeRight: self center x + movement x
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'JK 6/3/2024 13:05'
}
WBResizeRight >> resizeCursor [
	Cursor resizeRight show.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'JK 6/3/2024 19:01'
}
WBResizeRight >> setLayout [
	self height: self frame height - WBResizeFrame resizeWidth.
	self width: WBResizeFrame resizeWidth.
	self center: element rightCenter.
]
