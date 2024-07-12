"
This class implements resizing a WBElement by dragging on its right side
"
Class {
	#name : #WBResizeRight,
	#superclass : #WBResizeBar,
	#category : #'SqueakWhiteboard-Core',
	#'squeak_changestamp' : 'is 6/23/2024 02:24'
}

{
	#category : #defaults,
	#'squeak_changestamp' : 'is 7/12/2024 15:10'
}
WBResizeRight class >> resizeCursor [

	^ Cursor resizeRight
]

{
	#category : #sizing,
	#'squeak_changestamp' : 'JK 6/30/2024 21:18'
}
WBResizeRight >> resize: movement [

	self frame resizeRight: self center x + movement x
]

{
	#category : #sizing,
	#'squeak_changestamp' : 'JK 6/30/2024 21:13'
}
WBResizeRight >> setLayout [

	self height: self frame height - WBResizeFrame resizeWidth.
	self width: WBResizeFrame resizeWidth.
	self center: self frame rightCenter
]
