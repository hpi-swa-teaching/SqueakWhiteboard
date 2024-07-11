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
	#category : #resize,
	#'squeak_changestamp' : 'JK 6/30/2024 21:18'
}
WBResizeTop >> resize: movement [

	self frame resizeTop: self center y + movement y
]

{
	#category : #resize,
	#'squeak_changestamp' : 'is 6/23/2024 01:56'
}
WBResizeTop >> resizeCursor [

	Cursor resizeTop show
]

{
	#category : #resize,
	#'squeak_changestamp' : 'ACL 7/10/2024 18:07'
}
WBResizeTop >> setLayout [

	self height: WBResizeFrame defaultResizeWidth.
	self width: self frame width - WBResizeFrame defaultResizeWidth.
	self center: self frame topCenter
]
