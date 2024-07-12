"
This class implements resizing a WBElement by dragging on its left side
"
Class {
	#name : #WBResizeLeft,
	#superclass : #WBResizeBar,
	#category : #'SqueakWhiteboard-Core',
	#'squeak_changestamp' : 'is 6/23/2024 02:24'
}

{
	#category : #defaults,
	#'squeak_changestamp' : 'is 7/12/2024 15:10'
}
WBResizeLeft class >> resizeCursor [

	^ Cursor resizeLeft
]

{
	#category : #sizing,
	#'squeak_changestamp' : 'JK 6/30/2024 21:18'
}
WBResizeLeft >> resize: movement [

	self frame resizeLeft: self center x + movement x
]

{
	#category : #sizing,
	#'squeak_changestamp' : 'JK 6/30/2024 21:13'
}
WBResizeLeft >> setLayout [

	self height: self frame height - WBResizeFrame resizeWidth.
	self width: WBResizeFrame resizeWidth.
	self center: self frame leftCenter
]
