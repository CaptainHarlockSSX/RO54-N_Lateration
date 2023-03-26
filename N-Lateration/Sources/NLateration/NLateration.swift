@main
public struct NLateration {
    public static func main() {

		// Create some receivers and the emitter to geolocalize
		let receiver1 = Receiver(x: 0.5, y: 0.5, z: 0.5, distance: 3, ipAdress: "192.168.0.0")
		let receiver2 = Receiver(x: 4.0, y: 0.0, z: 0.0, distance: 2, ipAdress: "192.168.0.1")
		let receiver3 = Receiver(x: 4.0, y: 5.0, z: 5.0, distance: 4.2, ipAdress: "192.168.0.6")
		let receiver4 = Receiver(x: 3.0, y: 3.0, z: 3.0, distance: 2.5, ipAdress: "192.168.0.2")
		let emitter1 = Emitter(name: "iPhone 14", ipAdress: "25.0.0.0")
		
		// Load the n-lateration solver
		var nLateration = NLaterationSolver(emitter: emitter1)
		nLateration.add(receiver:receiver1,withIpAdress:receiver1.ipAdress)
		nLateration.add(receiver:receiver2,withIpAdress:receiver2.ipAdress)
		nLateration.add(receiver:receiver3,withIpAdress:receiver3.ipAdress)
		nLateration.add(receiver:receiver4,withIpAdress:receiver4.ipAdress)
		
		// Solve emitter's position
		let emitterPosition = nLateration.solveEmitterPosition()
		if (emitterPosition != nil) {
			print("✅ The emitter coordinates are \(emitterPosition!), solved with \(nLateration.getReceiverCount()) receivers.")
			
			// Load PythonBridge
			var errorState = false
			guard let pyBridge = Optional(PythonBridge()) else {
				errorState = true
				print ("There is probably an error in your python/pip install")
				return
			}
			if (!errorState){
				pyBridge.plot3DGraph(p1:[receiver1.x!,receiver1.y!,receiver1.z!],d1:receiver1.distance,
									p2:[receiver2.x!,receiver2.y!,receiver2.z!],d2:receiver2.distance,
									p3:[receiver3.x!,receiver3.y!,receiver3.z!],d3:receiver3.distance,
									p4:[receiver4.x!,receiver4.y!,receiver4.z!],d4:receiver4.distance,
									e:emitterPosition)
			}
		} else {
			print("❌ Failed to solve emitter position with \(nLateration.getReceiverCount()) receivers. Ensure you have at least 4 Receivers with their position and distance loaded in the N-Lateration solver.")
		}

    }
}
