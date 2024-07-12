"
This class represent a concrete textbox
"
Class {
	#name : #WBTextbox,
	#superclass : #WBRectangularElement,
	#category : #'SqueakWhiteboard-Core',
	#'squeak_changestamp' : 'ACL 7/10/2024 13:44'
}

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'ACL 7/12/2024 12:10'
}
WBTextbox class >> defaultSize [

	^ 15 @ 35
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'is 7/12/2024 14:32'
}
WBTextbox >> initialize [
	
	self resizable: false.
	super initialize.
	self 
		color: Color transparent;
		setTextfield
	
]

{
	#category : #resize,
	#'squeak_changestamp' : 'JK 6/30/2024 15:12'
}
WBTextbox >> resize [

	self morph bounds: self textField bounds
]

{
	#category : #appearance,
	#'squeak_changestamp' : 'is 7/12/2024 14:32'
}
WBTextbox >> setTextfield [
	
	self textField wrapFlag: false;
		hResizing: #shrinkWrap;
		vResizing: #shrinkWrap;
		onChanged: [self resize];
		position: self position.
	self textField textMorph justified
]
