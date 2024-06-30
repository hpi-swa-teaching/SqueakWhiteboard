Class {
	#name : #WBTextbox,
	#superclass : #WBRectangularElement,
	#category : #'SqueakWhiteboard-Core'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'JK 6/30/2024 15:52'
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
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'JK 6/30/2024 15:12'
}
WBTextbox >> resize [

	self morph bounds: self textField bounds
]
