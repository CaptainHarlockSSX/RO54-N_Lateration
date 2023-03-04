//
//  Device.swift
//  N-Lateration
//
//  Created by Nathan Rassié on 03/03/2023.
//

/// Device protocol
/// Define a device by its position in a three-dimensional world
/// and by its ip adress.
protocol Device: Equatable, Hashable {
	// Device position in a three-dimensional world
	var x: Float {get set}
	var y: Float {get set}
	var z: Float {get set}
	
	// IP adress of the device
	var ipAdress: String {get set}
}

