"
This class implements resizing a WBElement by dragging on its upper right corner
"
Class {
	#name : #WBResizeTopRight,
	#superclass : #WBResizeHandle,
	#category : #'SqueakWhiteboard-Core',
	#'squeak_changestamp' : 'is 6/23/2024 02:26'
}

{
	#category : #sizing,
	#'squeak_changestamp' : 'is 6/23/2024 02:02'
}
WBResizeTopRight >> resize: movement [

	self frame resizeRight: self center x + movement x.
	self frame resizeTop: self center y + movement y
]

{
	#category : #sizing,
	#'squeak_changestamp' : 'is 6/23/2024 02:02'
}
WBResizeTopRight >> resizeCursor [

	Cursor resizeTopRight show
	
]

{
	#category : #sizing,
	#'squeak_changestamp' : 'is 6/23/2024 02:02'
}
WBResizeTopRight >> setLayout [

	self center: frame topRight
	
]
