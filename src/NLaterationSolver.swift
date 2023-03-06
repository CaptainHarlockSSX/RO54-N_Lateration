//
//  NLaterationSolver.swift
//  N-Lateration
//
//  Created by Nathan Rassié on 03/03/2023.
//

import Foundation

struct NLaterationSolver {
    var receivers: [Receiver] = []
    var emitter: Emitter

    func NLaterationSolver(emitter,receivers){

    }
    func calculateEmitterPosition(){

    }
    func addReceiver(receiver:Receiver){
        receivers.append(receiver)
    }
    func removeReceiver(receivers, num:int){
        receivers.remove(at:num)
    }
    func getReceiverCount(receivers) --> int {
        return receivers.count
    }
    func solveEmitterPosition(receiver){

    }
}