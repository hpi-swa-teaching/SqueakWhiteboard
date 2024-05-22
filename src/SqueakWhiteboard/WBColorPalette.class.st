Class {
	#name : #WBColorPalette,
	#superclass : #WBPopUp,
	#instVars : [
		'colorRows',
		'colorColumns'
	],
	#classInstVars : [
		'colorRows'
	],
	#category : #SqueakWhiteboard
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'ACL 5/22/2024 19:11'
}
WBColorPalette >> colorColumns [

	^colorColumns.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'ACL 5/22/2024 19:11'
}
WBColorPalette >> colorColumns: aNumber [

	colorColumns:= aNumber.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'ACL 5/22/2024 18:26'
}
WBColorPalette >> colorRows [

	^colorRows.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'ACL 5/22/2024 18:26'
}
WBColorPalette >> colorRows: aNumber [

	colorRows:= aNumber.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'ACL 5/22/2024 18:27'
}
WBColorPalette >> initializeDefault [

	super initialize.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'ACL 5/22/2024 19:11'
}
WBColorPalette >> setDefaultValues [

	self 
		colorRows: 3;
		colorColumns: 3;
		color: Color veryLightGray;
		borderColor: Color gray;
		borderWidth: 1;
		extent: (self colorRows *20)@(self colorColumns *20);
		cornerStyle: #rounded;
		cornerRadius: 7.
]
