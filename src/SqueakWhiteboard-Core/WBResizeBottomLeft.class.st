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
	#category : #resize,
	#'squeak_changestamp' : 'JK 6/30/2024 21:18'
}
WBResizeBottomLeft >> resize: movement [

	self frame resizeLeft: self center x + movement x.
	self frame resizeBottom: self center y + movement y
]

{
	#category : #resize,
	#'squeak_changestamp' : 'is 6/23/2024 02:01'
}
WBResizeBottomLeft >> resizeCursor [

	Cursor resizeBottomLeft show
	
]

{
	#category : #resize,
	#'squeak_changestamp' : 'JK 6/30/2024 21:14'
}
WBResizeBottomLeft >> setLayout [

	self center: self frame bottomLeft
	
]
