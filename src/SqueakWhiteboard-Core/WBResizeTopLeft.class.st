"
This class implements resizing a WBElement by dragging on its upper left corner
"
Class {
	#name : #WBResizeTopLeft,
	#superclass : #WBResizeHandle,
	#category : #'SqueakWhiteboard-Core',
	#'squeak_changestamp' : 'is 6/23/2024 02:26'
}

{
	#category : #resize,
	#'squeak_changestamp' : 'JK 6/30/2024 21:18'
}
WBResizeTopLeft >> resize: movement [

	self frame resizeLeft: self center x + movement x.
	self frame resizeTop: self center y + movement y
	
]

{
	#category : #resize,
	#'squeak_changestamp' : 'is 6/23/2024 02:02'
}
WBResizeTopLeft >> resizeCursor [

	Cursor resizeTopLeft show
	
]

{
	#category : #resize,
	#'squeak_changestamp' : 'JK 6/30/2024 21:14'
}
WBResizeTopLeft >> setLayout [

	self center: self frame topLeft
	
]
