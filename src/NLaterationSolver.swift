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
		
		if(getReceiverCount() < 4) {return nil}
		
		return [0.0, 0.0, 0.0]
    }
	
}
