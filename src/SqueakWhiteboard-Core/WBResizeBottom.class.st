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
	#category : #resize,
	#'squeak_changestamp' : 'JK 6/30/2024 21:17'
}
WBResizeBottom >> resize: movement [

	self frame resizeBottom: self center y + movement y
]

{
	#category : #resize,
	#'squeak_changestamp' : 'is 6/23/2024 01:54'
}
WBResizeBottom >> resizeCursor [

	Cursor resizeBottom show
]

{
	#category : #resize,
	#'squeak_changestamp' : 'ACL 7/10/2024 18:07'
}
WBResizeBottom >> setLayout [

	self height: WBResizeFrame defaultResizeWidth.
	self width: self frame width - WBResizeFrame defaultResizeWidth.
	self center: self frame bottomCenter
]
