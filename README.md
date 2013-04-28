Organik-iOS
===========

Organik-iOS is a set of L-System drawing and management classes for iOS.  Included is a sample project which included a couple L-System presets.

Organik can draw randomly generated realistic "trees" in core graphics.  But more than that, it provides a generic set of classes which you can use to implement your own drawing using L-Systems.

![Alt text](/Screenshots/organik1.png "Screenshot 1")
![Alt text](/Screenshots/organik2.png "Screenshot 2")
![Alt text](/Screenshots/organik3.png "Screenshot 3")

L-System?
---------

L-System is short for Lindenmayer system.  
Read more on the [a link](https://en.wikipedia.org/wiki/L-system "L-System wikipedia page.")


Organik Files
-------------

NPLSystem and NPTurtle are the foundation of Organik.  Together they manage iterations of an L-System and drawing respectively.

These classes are the "engine", but the "brains" of the system comes from the delegate.

In the NPLSystemLibrary file you will find an abstract base class called NPLSystemRepresentation as well as a few example subclasses.  Subclasses of this class can be used as delegates for both the NPLSystem and NPTurtle classes providing both the rules and drawing mechanisms needed for a given system.

NPLSystemView is a UIView subclasses which synchronizes the logic from the NPLSystem and drawing from the NPTurtle and renders the output by animating the resulting path.


How it works
------------

NPLSystem coordinates with its delegate to calculate the system iterations.
NPTurtle coordinates with its delegate to create a path based on the NPLSystem iterations.
NPLSystemView then uses the turtle's path to draw and animate the system on the screen.

The delegate for both NPLSystem and NPTurtle are the same class in Organik (subclasses of NPLSystemRepresentation).  This allows you to define a complete L-System from rules and axiom to rendering in a simple and clean way.  