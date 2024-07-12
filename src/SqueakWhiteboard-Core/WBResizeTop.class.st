"
This class implements resizing a WBElement by dragging on its upper side
"
Class {
	#name : #WBResizeTop,
	#superclass : #WBResizeBar,
	#category : #'SqueakWhiteboard-Core',
	#'squeak_changestamp' : 'is 6/23/2024 02:24'
}

{
	#category : #defaults,
	#'squeak_changestamp' : 'is 7/12/2024 15:10'
}
WBResizeTop class >> resizeCursor [

	^ Cursor resizeTop
]

{
	#category : #sizing,
	#'squeak_changestamp' : 'JK 6/30/2024 21:18'
}
WBResizeTop >> resize: movement [

	self frame resizeTop: self center y + movement y
]

{
	#category : #sizing,
	#'squeak_changestamp' : 'JK 6/30/2024 21:17'
}
WBResizeTop >> setLayout [

	self height: WBResizeFrame resizeWidth.
	self width: self frame width - WBResizeFrame resizeWidth.
	self center: self frame topCenter
]
