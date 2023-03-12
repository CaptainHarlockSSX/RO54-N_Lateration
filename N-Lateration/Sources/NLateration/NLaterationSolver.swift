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
	private var minAreaPoint: [Float] = []
	private var maxAreaPoint: [Float] = []
	
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
	mutating func solveEmitterPosition() throws -> [Float]? {
		
		// Ensure there is four or more receivers in the dictionnary to be able to solve the emitter position
		guard getReceiverCount() >= 4 else {fatalError("Not enough Receivers (\(getReceiverCount()) < 4) to find Emitter position.") }
		
		// Reduce area of research
		computeResearchArea()
		
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
