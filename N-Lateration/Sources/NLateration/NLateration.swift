@main
public struct NLateration {
    public static func main() {
	
		// Test to try if the package is working
		let receiver1 = Receiver(x: 2.0, y: 3.0, z: 1.0, distance: 2.4, ipAdress: "192.168.0.0")
		let receiver2 = Receiver(x: 4.0, y: 5.0, z: 6.0, distance: 3.4, ipAdress: "192.168.0.1")
		let receiver3 = Receiver(x: 7.0, y: 1.0, z: 6.0, distance: 5.2, ipAdress: "192.168.0.6")
		let receiver4 = Receiver(x: 3.0, y: 4.0, z: 1.0, distance: 1.4, ipAdress: "192.168.0.2")
		let emitter1 = Emitter(ipAdress: "25.0.0.0")
		
		var nLateration = NLaterationSolver(emitter: emitter1)
		nLateration.add(receiver:receiver1,withIpAdress:receiver1.ipAdress)
		nLateration.add(receiver:receiver2,withIpAdress:receiver2.ipAdress)
		nLateration.add(receiver:receiver3,withIpAdress:receiver3.ipAdress)
		nLateration.add(receiver:receiver4,withIpAdress:receiver4.ipAdress)
		
		try! nLateration.solveEmitterPosition()
		//let emitterPosition = try! nLateration.solveEmitterPosition()
		
		//print("The emitter coordinates are \(String(describing: emitterPosition)), solved with \(nLateration.getReceiverCount()) receivers.")
    }
}
