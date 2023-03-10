@main
public struct NLateration {
    public private(set) var text = "Hello, World!"

    public static func main() {
	
		// Test to try if the package is working
		let receiver = Receiver(x: 2.0, y: 3.0, z: 1.0, distance: 2.4, ipAdress: "192.168.0.0")
		print(receiver.ipAdress)
    }
}
