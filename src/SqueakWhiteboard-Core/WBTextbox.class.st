Class {
	#name : #WBTextbox,
	#superclass : #WBRectangularElement,
	#category : #'SqueakWhiteboard-Core'
}

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'is 7/1/2024 00:29'
}
WBTextbox class >> defaultSize [

	^ 15@35
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'is 7/1/2024 00:36'
}
WBTextbox >> initialize [
	
	self resizable: false.
	super initialize.
	self color: Color transparent.
	self textField wrapFlag: false;
		hResizing: #shrinkWrap;
		vResizing: #shrinkWrap;
		onChanged: [self resize];
		position: self position.
	self textField textMorph justified
]

{
	#category : #resize,
	#'squeak_changestamp' : 'JK 6/30/2024 15:12'
}
WBTextbox >> resize [

	self morph bounds: self textField bounds
]
