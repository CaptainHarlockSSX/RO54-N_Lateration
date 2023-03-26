import Foundation
import PythonKit


struct PythonBridge {
    func plot3DGraph(p1:[Float],d1:Float,p2:[Float],d2:Float,p3:[Float],d3:Float,p4:[Float],d4:Float,e:[Float]?){
        let np = Python.import("numpy")
        let plt = Python.import("matplotlib.pyplot")

        let fig = plt.figure()
        let ax = fig.add_subplot(projection:"3d")


        let pyP1 = np.array(p1)
        let pyD1 = PythonObject(d1)
        let pyP2 = np.array(p2)
        let pyD2 = PythonObject(d2)
        let pyP3 = np.array(p3)
        let pyD3 = PythonObject(d3)
        let pyP4 = np.array(p4)
        let pyD4 = PythonObject(d4)
        let pyE = np.array(e)

        // Make data
        let u = np.linspace(0, 2 * np.pi, 100)
        let v = np.linspace(0, np.pi, 100)

        let x0 = 0.2 * np.outer(np.cos(u), np.sin(v)) + pyE[0]
        let y0 = 0.2 * np.outer(np.sin(u), np.sin(v)) + pyE[1]
        let z0 = 0.2 * np.outer(np.ones(np.size(u)), np.cos(v)) + pyE[2]

        let x1 = pyD1 * np.outer(np.cos(u), np.sin(v)) + pyP1[0]
        let y1 = pyD1 * np.outer(np.sin(u), np.sin(v)) + pyP1[1]
        let z1 = pyD1 * np.outer(np.ones(np.size(u)), np.cos(v)) + pyP1[2]

        let x2 = pyD2 * np.outer(np.cos(u), np.sin(v)) + pyP2[0]
        let y2 = pyD2 * np.outer(np.sin(u), np.sin(v)) + pyP2[1]
        let z2 = pyD2 * np.outer(np.ones(np.size(u)), np.cos(v)) + pyP2[2]

        let x3 = pyD3 * np.outer(np.cos(u), np.sin(v)) + pyP3[0]
        let y3 = pyD3 * np.outer(np.sin(u), np.sin(v)) + pyP3[1]
        let z3 = pyD3 * np.outer(np.ones(np.size(u)), np.cos(v)) + pyP3[2]

        let x4 = pyD4 * np.outer(np.cos(u), np.sin(v)) + pyP4[0]
        let y4 = pyD4 * np.outer(np.sin(u), np.sin(v)) + pyP4[1]
        let z4 = pyD4 * np.outer(np.ones(np.size(u)), np.cos(v)) + pyP4[2]

        let xc1 = 0.1 * np.outer(np.cos(u), np.sin(v)) + pyP1[0]
        let yc1 = 0.1 * np.outer(np.sin(u), np.sin(v)) + pyP1[1]
        let zc1 = 0.1 * np.outer(np.ones(np.size(u)), np.cos(v)) + pyP1[2]

        let xc2 = 0.1 * np.outer(np.cos(u), np.sin(v)) + pyP2[0]
        let yc2 = 0.1 * np.outer(np.sin(u), np.sin(v)) + pyP2[1]
        let zc2 = 0.1 * np.outer(np.ones(np.size(u)), np.cos(v)) + pyP2[2]

        let xc3 = 0.1 * np.outer(np.cos(u), np.sin(v)) + pyP3[0]
        let yc3 = 0.1 * np.outer(np.sin(u), np.sin(v)) + pyP3[1]
        let zc3 = 0.1 * np.outer(np.ones(np.size(u)), np.cos(v)) + pyP3[2]

        let xc4 = 0.1 * np.outer(np.cos(u), np.sin(v)) + pyP4[0]
        let yc4 = 0.1 * np.outer(np.sin(u), np.sin(v)) + pyP4[1]
        let zc4 = 0.1 * np.outer(np.ones(np.size(u)), np.cos(v)) + pyP4[2]

        // Plot the surface

        ax.plot_surface(x1, y1, z1, alpha:0.2)
        ax.plot_surface(x2, y2, z2, alpha:0.2)
        ax.plot_surface(x3, y3, z3, alpha:0.2)
        ax.plot_surface(x4, y4, z4, alpha:0.2)
        ax.plot_surface(xc1, yc1, zc1, alpha:0.7)
        ax.plot_surface(xc2, yc2, zc2, alpha:0.7)
        ax.plot_surface(xc3, yc3, zc3, alpha:0.7)
        ax.plot_surface(xc4, yc4, zc4, alpha:0.7)
        ax.plot_surface(x0, y0, z0, alpha:0.7)

        // Set an equal aspect ratio
        ax.set_aspect("auto")

        plt.show()
    }
    
}