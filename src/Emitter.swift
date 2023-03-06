//
//  Emitter.swift
//  N-Lateration
//
//  Created by Nathan Rassié on 03/03/2023.
//

import Foundation

/// Emitter structure, following Device protocol.
/// Define an emitter by its position in a three-dimensional world
/// and by its ip adress. Position may be unknown as we are trying
/// to solve it through N-Lateration algorithm, so the coordinates
/// are optionals.
struct Emitter: Device {
    var x: Float? = nil
    var y: Float? = nil
    var z: Float? = nil
    var ipAdress: String
}
