# SculptAR
For this project I wanted to try something I have never tried before: AR and 3D models.
I love art very much and I am surrounded by it here, since I was a child, I have loved visiting museums and historical buildings and I used to force my father to take me there😆. I was and still am fascinated by them. Unfortunately during the pandemic the museums here in Italy were all closed, so I thought for this project why not take advantage of AR to bring an art exhibition at home? and I immediately thought of sculptures, and bring two very famous Renaissance sculptures that are 310 kilometres away from each other and compare them and allow the visitor to visit them virtually and see how the same subject can be represented in a different way even if similar and from the same period.

## Description
So at the beginning of April I started studying ARKit and RealityKit, I looked for the 3D models of the statues, did some tests and discovered that the model of Michelangelo's David was 4 meters high and had too many polygons, at that point I had to look for some kind of 3D editor, so I found Blender where I decreased the quality of the sculptures and created the various descriptive plates for the works, then converted everything with Reality Converter and composed the scene in Reality Composer, and finally I created an illustration of the Michelangelo’s David and used it as an app icon.
In this project I mainly used the frameworks SwiftUI, ARKit and RealityKit, the first one to realize the graphical interfaces as for example significantly in the first screen at the app opening, the second one instead that allows to use the camera and the sensors to manage the augmented reality, the third one that through ARKit that manages the 3D rendering in AR.
<div>
   <img src="https://github.com/frankkk1013/SculptAR/blob/87f2476ff3379bcb1f90626059bc1fc0ef512527/pictures/IMG_8B227E493B25-1.jpeg" width="250">
</div>
For the AR session I used the ARCoachingOverlayView which allows the device with the help of the user to detect the surface, in this case a horizontal surface. After detecting the surface a pointer appears that allows the user to choose where to place the scene on the horizontal surface and finally with a tap the device loads the model and places it in the chosen position. At that point the user can visit this small AR exhibition and read information about the sculptures through the floating plaques.
<div>
   <img src="https://github.com/frankkk1013/SculptAR/blob/87f2476ff3379bcb1f90626059bc1fc0ef512527/pictures/IMG_0087.PNG" width="250">
</div>
