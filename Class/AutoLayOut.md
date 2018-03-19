# AutoLayOut

## Understanding Auto Layout

> Auto Layout dynamically calculates the size and position of all the views in your view hierarchy, based on constraints placed on those views

## External Changes

> External changes occur when the size or shape of your superview changes. With each change, you must update the layout of your view hierarchy to best use the available space

## Internal Changes

> Internal changes occur when the size of the views or controls in your user interface change

- Internationalization is the process of making your app able to adapt to different languages, regions, and cultures. The layout of an internationalized app must take these differences into account and appear correctly in all the languages and regions that the app supports


## Auto Layout Versus Frame-Based Layout

 - **AutoLayOut**: Auto Layout defines your user interface using a series of constraints. Constraints typically represent a relationship between two views. Auto Layout then calculates the size and location of each view based on these constraints. This produces layouts that dynamically respond to both internal and external changes

<p align="center"><img width="400" height="350" src="/Img/autolayout1.png"></p>

 - **Frame-Based Layout**: raditionally, apps laid out their user interface by programmatically setting the frame for each view in a view hierarchy. The frame defined the view’s origin, height, and width in the superview’s coordinate system 

<p align="center"><img width="400" height="350" src="/Img/autolayout2.png"></p>

## Anatomy of a Constraint

<p align="center"><img width="400" height="350" src="/Img/autolayout3.png"></p>


- **Item 1**. The first item in the equation—in this case, the red view. The item must be either a view or a layout guide.

- **Attribute** 1. The attribute to be constrained on the first item—in this case, the red view’s leading edge.

- **Relationship**. The relationship between the left and right sides. The relationship can have one of three values: equal, greater than or equal, or less than or equal. In this case, the left and right side are equal.

- **Multiplier**. The value of attribute 2 is multiplied by this floating point number. In this case, the multiplier is 1.0.

- **Item** 2. The second item in the equation—in this case, the blue view. Unlike the first item, this can be left blank.

- **Attribute** 2. The attribute to be constrained on the second item—in this case, the blue view’s trailing edge. If the second item is left blank, this must be Not an Attribute.

- **Constant**. A constant, floating-point offset—in this case, 8.0. This value is added to the value of attribute 2.


## Auto Layout Attributes

> In Auto Layout, the attributes define a feature that can be constrained. In general, this includes the four edges (leading, trailing, top, and bottom), as well as the height, width, and vertical and horizontal centers. Text items also have one or more baseline attributes

<p align="center"><img width="400" height="350" src="/Img/autolayout4.png"></p>

