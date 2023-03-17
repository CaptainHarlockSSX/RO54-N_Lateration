import Foundation
import PythonKit


struct PythonBridge {
    func coucou(){
        //let sys = Python.import("sys")
        print("coucou")
        let np = Python.import("numpy")
        let plt = Python.import("matplotlib.pyplot")

        let fig = plt.figure()
        let ax = fig.add_subplot(projection:"3d")

        // Make data
        let u = np.linspace(0, 2 * np.pi, 100)
        let v = np.linspace(0, np.pi, 100)

        let x0 = 0.2 * np.outer(np.cos(u), np.sin(v))+2
        let y0 = 0.2 * np.outer(np.sin(u), np.sin(v))+2.3
        let z0 = 0.2 * np.outer(np.ones(np.size(u)), np.cos(v))+2.3

        let x1 = 3 * np.outer(np.cos(u), np.sin(v))+0.5
        let y1 = 3 * np.outer(np.sin(u), np.sin(v))+0.5
        let z1 = 3 * np.outer(np.ones(np.size(u)), np.cos(v))+0.5

        let x2 = 3.9 * np.outer(np.cos(u), np.sin(v))+4
        let y2 = 3.9 * np.outer(np.sin(u), np.sin(v))
        let z2 = 3.9 * np.outer(np.ones(np.size(u)), np.cos(v))

        let x3 = 4.3 * np.outer(np.cos(u), np.sin(v))+4
        let y3 = 4.3 * np.outer(np.sin(u), np.sin(v))+5
        let z3 = 4.3 * np.outer(np.ones(np.size(u)), np.cos(v))+5

        let x4 = 2.5 * np.outer(np.cos(u), np.sin(v))+3
        let y4 = 2.5 * np.outer(np.sin(u), np.sin(v))+3
        let z4 = 2.5 * np.outer(np.ones(np.size(u)), np.cos(v))+3

        let xc1 = 0.1 * np.outer(np.cos(u), np.sin(v))+0.5
        let yc1 = 0.1 * np.outer(np.sin(u), np.sin(v))+0.5
        let zc1 = 0.1 * np.outer(np.ones(np.size(u)), np.cos(v))+0.5

        let xc2 = 0.1 * np.outer(np.cos(u), np.sin(v))+4
        let yc2 = 0.1 * np.outer(np.sin(u), np.sin(v))
        let zc2 = 0.1 * np.outer(np.ones(np.size(u)), np.cos(v))

        let xc3 = 0.1 * np.outer(np.cos(u), np.sin(v))+4
        let yc3 = 0.1 * np.outer(np.sin(u), np.sin(v))+5
        let zc3 = 0.1 * np.outer(np.ones(np.size(u)), np.cos(v))+5

        let xc4 = 0.1 * np.outer(np.cos(u), np.sin(v))+3
        let yc4 = 0.1 * np.outer(np.sin(u), np.sin(v))+3
        let zc4 = 0.1 * np.outer(np.ones(np.size(u)), np.cos(v))+3

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