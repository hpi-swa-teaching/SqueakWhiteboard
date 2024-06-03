Class {
	#name : #WBResizeRight,
	#superclass : #WBResizeBar,
	#category : #'SqueakWhiteboard-Core'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'JK 6/3/2024 13:05'
}
WBResizeRight >> resize: movement [
	self element extent: (self element extent x+ movement x)@(self element extent y).
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
	#'squeak_changestamp' : 'JK 6/3/2024 13:04'
}
WBResizeRight >> setLayout [
	self height: self element height - WBResizeFrame resizeWidth.
	self width: WBResizeFrame resizeWidth.
	self center: element rightCenter.
]
