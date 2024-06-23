"
This class implements resizing a WBElement by dragging on its bottom side
"
Class {
	#name : #WBResizeBottom,
	#superclass : #WBResizeBar,
	#category : #'SqueakWhiteboard-Core',
	#'squeak_changestamp' : 'is 6/23/2024 02:24'
}

{
	#category : #sizing,
	#'squeak_changestamp' : 'is 6/23/2024 01:54'
}
WBResizeBottom >> resize: movement [

	self frame resizeBottom: self center y + movement y
]

{
	#category : #sizing,
	#'squeak_changestamp' : 'is 6/23/2024 01:54'
}
WBResizeBottom >> resizeCursor [

	Cursor resizeBottom show
]

{
	#category : #sizing,
	#'squeak_changestamp' : 'is 6/23/2024 01:54'
}
WBResizeBottom >> setLayout [

	self height: WBResizeFrame resizeWidth.
	self width: element width - WBResizeFrame resizeWidth.
	self center: element bottomCenter
]
