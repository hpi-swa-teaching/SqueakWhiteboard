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
	#category : #defaults,
	#'squeak_changestamp' : 'is 7/12/2024 15:03'
}
WBResizeTopRight class >> resizeCursor [

	^ Cursor resizeTopRight
]

{
	#category : #sizing,
	#'squeak_changestamp' : 'JK 6/30/2024 21:18'
}
WBResizeTopRight >> resize: movement [

	self frame resizeRight: self center x + movement x.
	self frame resizeTop: self center y + movement y
]

{
	#category : #sizing,
	#'squeak_changestamp' : 'JK 6/30/2024 21:14'
}
WBResizeTopRight >> setLayout [

	self center: self frame topRight
	
]
