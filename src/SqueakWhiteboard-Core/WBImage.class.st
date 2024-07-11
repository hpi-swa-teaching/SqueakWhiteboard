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
	#'squeak_changestamp' : 'is 7/9/2024 19:05'
}
WBImage class >> loadAcceptButtonImage [
	
	^ (GitAssetLoader for: 'SqueakWhiteboard') loadForm: '/textures/Icon-Accept.png'
]

{
	#category : #loadImages,
	#'squeak_changestamp' : 'is 7/9/2024 19:05'
}
WBImage class >> loadArrowButtonImage [
	
	^ (GitAssetLoader for: 'SqueakWhiteboard') loadForm: '/textures/Icon-Arrow.png'
]

{
	#category : #loadImages,
	#'squeak_changestamp' : 'is 7/9/2024 19:01'
}
WBImage class >> loadCircleButtonImage [
	
	^ (GitAssetLoader for: 'SqueakWhiteboard') loadForm: '/textures/Icon-Circle.png'
]

{
	#category : #loadImages,
	#'squeak_changestamp' : 'is 7/9/2024 19:03'
}
WBImage class >> loadColorsButtonImage [
	
	^ (GitAssetLoader for: 'SqueakWhiteboard') loadForm: '/textures/Icon-Colorpicker.png'
]

{
	#category : #loadImages,
	#'squeak_changestamp' : 'is 7/9/2024 19:04'
}
WBImage class >> loadDeleteAllButtonImage [
	
	^ (GitAssetLoader for: 'SqueakWhiteboard') loadForm: '/textures/Icon-Trashcan.png'
]

{
	#category : #loadImages,
	#'squeak_changestamp' : 'is 7/9/2024 19:06'
}
WBImage class >> loadDenyButtonImage [
	
	^ (GitAssetLoader for: 'SqueakWhiteboard') loadForm: '/textures/Icon-Deny.png'
]

{
	#category : #loadImages,
	#'squeak_changestamp' : 'is 7/9/2024 19:05'
}
WBImage class >> loadLineButtonImage [
	
	^ (GitAssetLoader for: 'SqueakWhiteboard') loadForm: '/textures/Icon-Line.png'
]

{
	#category : #loadImages,
	#'squeak_changestamp' : 'is 7/9/2024 19:01'
}
WBImage class >> loadLineChoosingButtonImage [
	
	^ (GitAssetLoader for: 'SqueakWhiteboard') loadForm: '/textures/Icon-Linetool.png'
]

{
	#category : #loadImages,
	#'squeak_changestamp' : 'is 7/9/2024 19:03'
}
WBImage class >> loadNoteButtonImage [
	
	^ (GitAssetLoader for: 'SqueakWhiteboard') loadForm: '/textures/Icon-Note.png'
]

{
	#category : #loadImages,
	#'squeak_changestamp' : 'is 7/9/2024 18:59'
}
WBImage class >> loadRectangleButtonImage [
	
	^ (GitAssetLoader for: 'SqueakWhiteboard') loadForm: '/textures/Icon-Square.png'
]

{
	#category : #loadImages,
	#'squeak_changestamp' : 'is 7/9/2024 19:00'
}
WBImage class >> loadShapeChoosingButtonImage [
	
	^ (GitAssetLoader for: 'SqueakWhiteboard') loadForm: '/textures/Icon-Shape.png'
]

{
	#category : #loadImages,
	#'squeak_changestamp' : 'is 7/9/2024 19:08'
}
WBImage class >> loadSmallBordercolorButtonImage [
	
	^ (GitAssetLoader for: 'SqueakWhiteboard') loadForm: '/textures/Icon-Small-Colorpicker-Outline.png'
]

{
	#category : #loadImages,
	#'squeak_changestamp' : 'is 7/9/2024 19:07'
}
WBImage class >> loadSmallColorsButtonImage [
	
	^ (GitAssetLoader for: 'SqueakWhiteboard') loadForm: '/textures/Icon-Small-Colorpicker.png'
]

{
	#category : #loadImages,
	#'squeak_changestamp' : 'is 7/9/2024 19:08'
}
WBImage class >> loadSmallDuplicateButtonImage [
	
	^ (GitAssetLoader for: 'SqueakWhiteboard') loadForm: '/textures/Icon-Small-Duplicate.png'
]

{
	#category : #loadImages,
	#'squeak_changestamp' : 'is 7/9/2024 19:08'
}
WBImage class >> loadSmallToggleArrowButtonImage [
	
	^ (GitAssetLoader for: 'SqueakWhiteboard') loadForm: '/textures/Icon-Small-Toggle-Arrow.png'
]

{
	#category : #loadImages,
	#'squeak_changestamp' : 'is 7/9/2024 19:01'
}
WBImage class >> loadTextboxButtonImage [
	
	^ (GitAssetLoader for: 'SqueakWhiteboard') loadForm: '/textures/Icon-Text.png'
]

{
	#category : #initialize,
	#'squeak_changestamp' : 'nicloeser 5/27/2024 13:34'
}
WBImage >> initialize [

	super initialize
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
