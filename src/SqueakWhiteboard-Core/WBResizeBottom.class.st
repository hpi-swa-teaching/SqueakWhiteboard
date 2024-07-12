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
	#category : #defaults,
	#'squeak_changestamp' : 'is 7/12/2024 15:09'
}
WBResizeBottom class >> resizeCursor [

	^ Cursor resizeBottom
]

{
	#category : #sizing,
	#'squeak_changestamp' : 'JK 6/30/2024 21:17'
}
WBResizeBottom >> resize: movement [

	self frame resizeBottom: self center y + movement y
]

{
	#category : #sizing,
	#'squeak_changestamp' : 'JK 6/30/2024 21:12'
}
WBResizeBottom >> setLayout [

	self height: WBResizeFrame resizeWidth.
	self width: self frame width - WBResizeFrame resizeWidth.
	self center: self frame bottomCenter
]
