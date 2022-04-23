import SwiftUI
import ARKit
import RealityKit
import FocusEntity
import Combine



struct RealityKitView: UIViewRepresentable {
    @State var name: String
    
    let coachingOverlay = ARCoachingOverlayView()
    
    func makeUIView(context: Context) -> ARView {
        let view = ARView()
        
        // Start AR session
        let session = view.session
        let config = ARWorldTrackingConfiguration()
        config.planeDetection = [.horizontal]
        session.run(config)
        
        
        // Add coaching overlay
        coachingOverlay.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        coachingOverlay.session = session
        coachingOverlay.goal = .horizontalPlane
        view.addSubview(coachingOverlay)
        
        
        // Handle ARSession events via delegate
        context.coordinator.view = view
        session.delegate = context.coordinator
        context.coordinator.name = name
        
        
        
        // Handle taps
        view.addGestureRecognizer(
            UITapGestureRecognizer(
                target: context.coordinator,
                action: #selector(Coordinator.handleTap)
            )
        )
        
        
        return view
    }
    func makeCoordinator() -> Coordinator {
        Coordinator()
    }
    
    
    func updateUIView(_ view: ARView, context: Context) {
    }
    
    class Coordinator: NSObject, ARSessionDelegate {
        
        weak var view: ARView?
        var name: String?
        
        var focusEntity: FocusEntity?
        var added: Bool = false
        
        func session(_ session: ARSession, didAdd anchors: [ARAnchor]) {
            guard let view = self.view else { return }
            debugPrint("Anchors added to the scene: ", anchors)
            
            if !self.added{
                
                self.focusEntity = FocusEntity(on: view, style: .classic(color: .yellow))
                
            }
            
        }
        
        @objc func handleTap(_ sender: UITapGestureRecognizer? = nil) {
            guard let view = self.view, let focusEntity = self.focusEntity else { return }
            
            // Create a new anchor to add content to
            let anchor = AnchorEntity()
            view.scene.anchors.append(anchor)
            
            // Add Davids
            let scene = try! ModelEntity.loadModel(named: name!)
            
#if !targetEnvironment(simulator)
            
            scene.position = focusEntity.position
            self.focusEntity?.isEnabled = false
            
            anchor.addChild(scene)
            self.added = true
            print(scene.position)
            
#endif
            self.view = nil
            
        }
    }
}




struct ContentView: View {
    @State var name: String
    var body: some View {
        RealityKitView(name: name)
            .ignoresSafeArea()
    }
    
    
}
