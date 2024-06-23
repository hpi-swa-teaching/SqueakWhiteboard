"
This class implements resizing a WBElement by dragging on its bottom left corner
"
Class {
	#name : #WBResizeBottomLeft,
	#superclass : #WBResizeHandle,
	#category : #'SqueakWhiteboard-Core',
	#'squeak_changestamp' : 'is 6/23/2024 02:25'
}

{
	#category : #sizing,
	#'squeak_changestamp' : 'is 6/23/2024 02:01'
}
WBResizeBottomLeft >> resize: movement [

	self frame resizeLeft: self center x + movement x.
	self frame resizeBottom: self center y + movement y
]

{
	#category : #sizing,
	#'squeak_changestamp' : 'is 6/23/2024 02:01'
}
WBResizeBottomLeft >> resizeCursor [

	Cursor resizeBottomLeft show
	
]

{
	#category : #sizing,
	#'squeak_changestamp' : 'is 6/23/2024 02:01'
}
WBResizeBottomLeft >> setLayout [

	self center: frame bottomLeft
	
]
