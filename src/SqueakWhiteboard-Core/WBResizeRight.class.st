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
	#category : #sizing,
	#'squeak_changestamp' : 'is 6/23/2024 01:55'
}
WBResizeRight >> resize: movement [

	self frame resizeRight: self center x + movement x
]

{
	#category : #sizing,
	#'squeak_changestamp' : 'is 6/23/2024 01:55'
}
WBResizeRight >> resizeCursor [

	Cursor resizeRight show
]

{
	#category : #sizing,
	#'squeak_changestamp' : 'is 6/23/2024 01:55'
}
WBResizeRight >> setLayout [

	self height: self frame height - WBResizeFrame resizeWidth.
	self width: WBResizeFrame resizeWidth.
	self center: element rightCenter
]
