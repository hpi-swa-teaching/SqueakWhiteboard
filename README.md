# SqueakWhiteboard
An interactive whiteboard that can be used to plan, coordinate and brainstorm.

# How To Use
In order to start your experience, open a workspace and run "WBCanvas new".
A "SqueakWhiteboard" window appears with a toolbar on the left-hand side from which you can invoke different functionalities.

# What To Do
The toolbar provides buttons to spawn different forms and kinds of elements which can be placed onto the canvas by clicking at the place you want the element to be.
For most elements, you can type some text onto the element directly after. If you just want it blanc, just click anywhere else to defocus the current Element.
If you want to create a line or an arrow, just click on the corresponding button and click once in the canvas for its starting position and a second time to determine the end
of the line or arrow.

Not satisfied how some of the elements look? Click on said element and resize it by clicking and dragging to its side or the handles in the corners. The popup menu 
that appears after clicking on an element can be used to change the color of an element, to change the border color, to duplicate an element or to delete the current element.
If you have spawned a line or an arrow you can convert them to the other one by clicking the right most button in the popup menu.
If you want to add some text to an element (except for lines and arrows) just quickly double-click on an element and start typing!
Of course you can also drag and drop elements anywhere on the canvas.

To change the color of all newly spawning element, click on the color wheel in the toolbar and select a color to your liking.

Sometimes the provided canvas seems too little for all your ideas. Just right click in the canvas and start dragging in order to expand the canvas.

After some experimenting you might find a devastating error in your planning but don't worry, it happens to all of us! Just click on the trashcan in the toolbar and confirm to erase
everything you have placed so far.

# Architecture
![architecture_squeakwhiteboard](https://github.com/user-attachments/assets/6958465b-6b16-410f-a89b-6ad05dfe26f9)

The element classes are abstract classes which hold different kinds of morphs as instance variables and delegate all morph specific calls to those instance variables.
All other classes should act as if the Element class with which they communicate is a morph and thus should not directly communicate with the morph instance variable.
