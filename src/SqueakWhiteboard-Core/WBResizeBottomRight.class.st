"
This class implements resizing a WBElement by dragging on its bottom right corner
"
Class {
	#name : #WBResizeBottomRight,
	#superclass : #WBResizeHandle,
	#category : #'SqueakWhiteboard-Core',
	#'squeak_changestamp' : 'is 6/23/2024 02:26'
}

{
	#category : #defaults,
	#'squeak_changestamp' : 'is 7/12/2024 15:01'
}
WBResizeBottomRight class >> resizeCursor [

	^ Cursor resizeBottomRight
]

{
	#category : #sizing,
	#'squeak_changestamp' : 'JK 6/30/2024 21:18'
}
WBResizeBottomRight >> resize: movement [

	self frame resizeRight: self center x + movement x.
	self frame resizeBottom: self center y + movement y
]

{
	#category : #sizing,
	#'squeak_changestamp' : 'JK 6/30/2024 21:14'
}
WBResizeBottomRight >> setLayout [

	self center: self frame bottomRight
	
]
