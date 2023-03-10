//
//  NLaterationSolver.swift
//  N-Lateration
//
//  Created by Nathan Rassié on 03/03/2023.
//

import Foundation


struct NLaterationSolver {
	private var receivers: [String: Receiver] = [:] // Dictionnary of Receivers [ipAdress: Receiver]
    private var emitter: Emitter
	
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
    func solveEmitterPosition() -> [Float]? {
		
		guard receivers.count >= 4 else { return nil } // No position to be solved if there is less than 4 receivers
		
		var a = [Float]()
		var b = [Float]()
		
//		var minDistance: Float
		
		// Iterate through all receiver pairs
		for (ip1, r1) in receivers {
			for (ip2, r2) in receivers {
				guard ip1 != ip2 else { continue } // Skip iteration if the receivers are the same one
				
				let dist = r1.distance - r2.distance
				let x = (r2.x! - r1.x!) / dist
				let y = (r2.y! - r1.y!) / dist
				let z = (r2.z! - r1.z!) / dist
				let d = sqrt(pow(r1.distance, 2) - pow(r2.distance, 2) - pow(r1.x!, 2) + pow(r2.x!, 2) - pow(r1.y!, 2) + pow(r2.y!, 2) - pow(r1.z!, 2) + pow(r2.z!, 2))
				
				// Add to matrix A and vector B
				a += [x, y, z]
				b.append(0.5 * d)
			}
		}
		
		
		// Convert A and B to matrices
//		let aMat = Matrix(rows: receivers.count * (receivers.count - 1), columns: 3, elements: a)
//		let bMat = Matrix(rows: receivers.count * (receivers.count - 1), columns: 1, elements: b)
		
		// Calculate pseudo-inverse of A
//		guard let aInv = aMat.pseudoInverse() else { return nil }
		
		// Calculate position of emitter
//		let x = (aInv * bMat)[0, 0]
//		let y = (aInv * bMat)[1, 0]
//		let z = (aInv * bMat)[2, 0]
		
		return [0,0,0]
//		return [x, y, z]
}

	
}
