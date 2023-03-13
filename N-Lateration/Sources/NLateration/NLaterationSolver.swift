//
//  NLaterationSolver.swift
//  N-Lateration
//
//  Created by Nathan Rassié on 03/03/2023.
//

import Foundation
//import simd

/// N-Lateration Solver Structure
/// Geolocalize a Device by providing one Emitter and at least
/// four Receivers with filled position and distance.
struct NLaterationSolver {
	private var receivers: [String: Receiver] = [:] // Dictionnary of Receivers [ipAdress: Receiver]
    private var emitter: Emitter
	private var minAreaPoint = [Float](repeating: 0.0, count: 3)
	private var maxAreaPoint = [Float](repeating: 0.0, count: 3)
	
	init(receivers: [String : Receiver]? = [:], emitter: Emitter) {
		self.receivers = receivers!
		self.emitter = emitter
	}
	
	/// Add a Receiver to Receivers dictionnary using itself and its ip adress as key
	mutating func add(receiver: Receiver, withIpAdress ipAdress: String) {
        receivers.updateValue(receiver, forKey: ipAdress)
    }
	
	/// Remove a Receiver from the Receivers dictionnary using its ip adress.
	/// Return **false** if operation failed.
	mutating func removeReceiverFrom(ipAdress: String) -> Bool {
		if let _ = receivers.removeValue(forKey: ipAdress) {
			return true
		} else {
			return false
		}
    }
	
	/// Get the number of Receivers in the dictionnary.
    func getReceiverCount() -> Int {
        return receivers.count
    }
	
	/// Try to solve position of the emitter by minimizing
	/// the sum of distances to all Receivers. Return an optional
	/// with x, y, z coordinates if the operation succeed, nil otherwise.
	mutating func solveEmitterPosition(withStep step: Float = 0.1) -> [Float]? {
		
		// Ensure there is four or more receivers in the dictionnary to be able to solve the emitter position
		guard getReceiverCount() >= 4 else { return nil }
		
		// Reduce area of research
		computeResearchArea()
		
		// Process each sum of distances in the searching area to find the lowest one
		// Initializing default value of min distance by using a random receiver's distance
		var minDistance: Float = 0.0
		for (_, receiver) in receivers { minDistance += receiver.distance } // Initialize defaut minimum distance value
		var emitterPosition: [Float]?
		
		for x in stride(from: minAreaPoint[0], to: maxAreaPoint[0], by: step) {
			for y in stride(from: minAreaPoint[1], to: maxAreaPoint[1], by: step) {
				for z in stride(from: minAreaPoint[2], to: maxAreaPoint[2], by: step) {
					
					// Process and sum distances to all Receivers
					var distance: Float = 0.0
					
					for (_, receiver) in receivers {
						distance += abs(sqrtf(pow(x - receiver.x!,2) + pow(y - receiver.y!,2) + pow(z - receiver.z!,2)) - receiver.distance)
					}
					
					// Keep the lowest distance
					if distance < minDistance {
						minDistance = distance
						emitterPosition = [x, y, z]
					}
					
				}
			}
		}
		
		return emitterPosition
//		var a = [Float]()
//		var b = [Float]()
		
//		var minDistance: Float
		
		// Iterate through all receiver pairs
//		for (ip1, r1) in receivers {
//			for (ip2, r2) in receivers {
//				guard ip1 != ip2 else { continue } // Skip iteration if the receivers are the same one
//
//				let dist = r1.distance - r2.distance
//				let x = (r2.x! - r1.x!) / dist
//				let y = (r2.y! - r1.y!) / dist
//				let z = (r2.z! - r1.z!) / dist
//				let d = sqrt(pow(r1.distance, 2) - pow(r2.distance, 2) - pow(r1.x!, 2) + pow(r2.x!, 2) - pow(r1.y!, 2) + pow(r2.y!, 2) - pow(r1.z!, 2) + pow(r2.z!, 2))
//
//				// Add to matrix A and vector B
//				a.append(SIMD3<Float>(x, y, z))
//				b.append(0.5 * d)
//			}
//		}
		
		
		// Convert A and B to matrices
//		var aMat = float3x3(a[0], a[1], a[2])
//		var bVec = SIMD3<Float>(b[0], b[1], b[2])
//
//		for i in 3..<a.count {
//			aMat += float3x3(a[i-2], a[i-1], a[i])
//			bVec += SIMD3<Float>(b[i], b[i-1], b[i-2])
//		}
		


		// Calculate pseudo-inverse of A
//		guard let aInv = aMat.pseudoInverse() else { return nil }
		
		// Calculate position of emitter
//		let x = (aInv * bMat)[0, 0]
//		let y = (aInv * bMat)[1, 0]
//		let z = (aInv * bMat)[2, 0]
//		let pos = aInv * bVec
		
		
//		return [0,0,0]
//		return [x, y, z]
	}
	
	/// Reduce the area where the Emitter could be by
	/// defining a min and a max point using Receivers's coordinates
	private mutating func computeResearchArea() {
		
		// Initializing default value of min and max area
		// point using a random receiver's coordinates
		let randomKey = receivers.randomElement()!.key // Get the key of a random receiver
		let randomReceiver = receivers[randomKey]! // Get the random receiver
		
		minAreaPoint[0] = randomReceiver.x!
		minAreaPoint[1] = randomReceiver.y!
		minAreaPoint[2] = randomReceiver.z!
		
		maxAreaPoint[0] = randomReceiver.x!
		maxAreaPoint[1] = randomReceiver.y!
		maxAreaPoint[2] = randomReceiver.z!
		
		for (_, receiver) in receivers {
			
			// Skip the iteration of the random receiver because its values are the default ones
			guard receiver != randomReceiver else { continue }
			
			if minAreaPoint[0] > receiver.x! {
				minAreaPoint[0] = receiver.x!
			}
			if minAreaPoint[1] > receiver.y! {
				minAreaPoint[1] = receiver.y!
			}
			if minAreaPoint[2] > receiver.z! {
				minAreaPoint[2] = receiver.z!
			}
			if maxAreaPoint[0] < receiver.x! {
				maxAreaPoint[0] = receiver.x!
			}
			if maxAreaPoint[1] < receiver.y! {
				maxAreaPoint[1] = receiver.y!
			}
			if maxAreaPoint[2] < receiver.z! {
				maxAreaPoint[2] = receiver.z!
			}
		}
	}
	
}
