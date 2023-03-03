# RO54 - TD 1 - N-Lateration

> This report is made by **RASSIÉ Nathan** and **DERAISIN Nicolas**.
> 
> It has been written in **Markdown**.

## Concept and example of an N-Lateration problem

N-Lateration is a method used to geolocalize someone (or more precisely <u>something</u>, like a numerical device acting as a **signal emitter**). It is based on the process of determining the **unknown position of this device** using **known positions of multiple receivers** (or anchors) and their distance to the emitter.

#### Basic example - Position of an indoor robot

> Let's say a computer vision laboratory is working on a fully automated robot, capable of moving across the facility from one room to another, taking corridors, crossing doors etc...

To move itself precisely without colliding any wall or person, <u>the robot has to be geolocalized.</u>

Wifi repeaters are installed all across the facilities to efficiently propagate the network for all the users, as we're in 2023 and all need a stable access to the internet.

We know position of wifi repeaters and want to process the position of the robot.
Hence we will use wifi repeaters as receivers, use the known distance between the robot (emitter, querying all nearby wifi repeaters) and the receivers by processing the time-response of the signal, then compute the equations of position and find the robot position. 

## Theoretical resolution of a N-Lateration problem

> **Theorem :** Solving the N-Lateration problem in a N-dimensional space requires N+1 geometrical distances.

Summing up our example, we have :

- Known informations :
  
  - Position of receivers
  
  - Time of flight of a query (Emitting / Receiving)
  
  - Distance between the emitter and each receiver

- To-find information :
  
  - Position of emitter

In a three-dimensional space, let's call $d_i, \forall{i} > 3$ each distance between the emitter and each receiver. Let $(x_i,y_i,z_i)$ the coordinates of each receiver, and $(x,y,z)$ the coordinates of the emitter.

Then :

$$
d_i = \sqrt{(x_i-x)^2 + (y_i-y)^2 + (z_i-z)^2}
$$

Solving this equation system will provide the localisation of the emitter.

> Note : Multiple solving methods and algorithms exists. In computer use-case, choosing one depends on the balance between speed and precision.

## Algorithm

```mermaid

```

## Implementation
