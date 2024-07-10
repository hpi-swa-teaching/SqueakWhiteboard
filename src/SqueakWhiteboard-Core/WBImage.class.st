"
This class is used to load Assets from the GitAssetloader
"
Class {
	#name : #WBImage,
	#superclass : #ImageMorph,
	#category : #'SqueakWhiteboard-Core',
	#'squeak_changestamp' : 'is 6/23/2024 02:20'
}

{
	#category : #loadImages,
	#'squeak_changestamp' : 'is 6/17/2024 12:27'
}
WBImage class >> loadCircleButtonImage [
	
	^ (GitAssetLoader for: 'SqueakWhiteboard') loadForm: '/circle.png'
]

{
	#category : #loadImages,
	#'squeak_changestamp' : 'is 6/17/2024 12:27'
}
WBImage class >> loadColorsButtonImage [
	
	^ (GitAssetLoader for: 'SqueakWhiteboard') loadForm: '/colorsToolbar.png'
]

{
	#category : #loadImages,
	#'squeak_changestamp' : 'is 6/17/2024 12:27'
}
WBImage class >> loadDeleteAllButtonImage [
	
	^ (GitAssetLoader for: 'SqueakWhiteboard') loadForm: '/delete_big.png'
]

{
	#category : #loadImages,
	#'squeak_changestamp' : 'is 6/17/2024 12:26'
}
WBImage class >> loadLineButtonImage [
	
	^ (GitAssetLoader for: 'SqueakWhiteboard') loadForm: '/line.png'
]

{
	#category : #loadImages,
	#'squeak_changestamp' : 'is 6/17/2024 12:26'
}
WBImage class >> loadNoteButtonImage [
	
	^ (GitAssetLoader for: 'SqueakWhiteboard') loadForm: '/note.png'
]

{
	#category : #loadImages,
	#'squeak_changestamp' : 'is 6/17/2024 12:26'
}
WBImage class >> loadRectangleButtonImage [
	
	^ (GitAssetLoader for: 'SqueakWhiteboard') loadForm: '/square2.png'
]

{
	#category : #loadImages,
	#'squeak_changestamp' : 'is 6/17/2024 12:26'
}
WBImage class >> loadShapeChoosingButtonImage [
	
	^ (GitAssetLoader for: 'SqueakWhiteboard') loadForm: '/shapechoosing.png'
]

{
	#category : #loadImages,
	#'squeak_changestamp' : 'is 6/17/2024 12:26'
}
WBImage class >> loadTextboxButtonImage [
	
	^ (GitAssetLoader for: 'SqueakWhiteboard') loadForm: '/textbox.png'
]

{
	#category : #edit,
	#'squeak_changestamp' : 'is 6/23/2024 02:21'
}
WBImage >> resize: aForm to: anExtent [
	| resizedImage |
	
	resizedImage := Form extent: anExtent depth: aForm depth.
	resizedImage := aForm scaledToSize: anExtent.
	^ resizedImage
]
