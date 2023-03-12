@main
public struct NLateration {
    public static func main() {
	
		// Test to try if the package is working
		let receiver1 = Receiver(x: 2.0, y: 3.0, z: 1.0, distance: 2.4, ipAdress: "192.168.0.0")
		let emitter = Emitter(ipAdress: "25.0.0.0")
		
		var nLateration = NLaterationSolver(receivers: ["Receiver 1" : receiver1], emitter: emitter)
		nLateration.add(receiver: receiver1, withIpAdress: "192.1.1.1")
		
		let emitterPosition = try! nLateration.solveEmitterPosition()
		
		print("The emitter coordinates are \(String(describing: emitterPosition)), solved with \(nLateration.getReceiverCount()) receivers.")
    }
}
