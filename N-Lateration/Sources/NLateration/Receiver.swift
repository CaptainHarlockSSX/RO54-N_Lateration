//
//  Receiver.swift
//  N-Lateration
//
//  Created by Nathan Rassié on 03/03/2023.
//

import Foundation

/// Receiver structure, following Device protocol.
/// Define an receiver by its position in a three-dimensional world,
/// its distance to the emitter and by its ip adress.
struct Receiver: Device {
	var x: Float? = 0
    var y: Float? = 0
    var z: Float? = 0
    var distance: Float // Distance to the Emitter, given by the exercise
    var ipAdress: String
}
