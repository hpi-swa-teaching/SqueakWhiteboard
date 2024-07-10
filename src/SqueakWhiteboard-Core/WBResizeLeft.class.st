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
	#category : #resize,
	#'squeak_changestamp' : 'JK 6/30/2024 21:18'
}
WBResizeLeft >> resize: movement [

	self frame resizeLeft: self center x + movement x
]

{
	#category : #resize,
	#'squeak_changestamp' : 'is 6/23/2024 01:55'
}
WBResizeLeft >> resizeCursor [

	Cursor resizeLeft show
]

{
	#category : #resize,
	#'squeak_changestamp' : 'JK 6/30/2024 21:13'
}
WBResizeLeft >> setLayout [

	self height: self frame height - WBResizeFrame resizeWidth.
	self width: WBResizeFrame resizeWidth.
	self center: self frame leftCenter
]
