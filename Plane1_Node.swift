import UIKit
import SceneKit
import ARKit


class Plane1_Node: SCNNode {
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(anchor: ARPlaneAnchor) {
        super.init()
        
        let planeHight:Float = 0.01
        let plane = SCNBox(width: CGFloat(anchor.extent.x), height: CGFloat(planeHight), length: CGFloat(anchor.extent.z), chamferRadius: 0.0)
       
        plane.firstMaterial?.diffuse.contents = UIColor.yellow.withAlphaComponent(0.5)
      
        plane.widthSegmentCount = 10
        plane.heightSegmentCount = 1
        plane.lengthSegmentCount = 10
        
        geometry = plane
       
        position = SCNVector3Make(anchor.center.x, -planeHight, anchor.center.z)
        // 物理ボディ
        let bodyShape = SCNPhysicsShape(geometry: geometry!, options: [:])
        physicsBody = SCNPhysicsBody(type: .static, shape: bodyShape)
        physicsBody?.friction = 3.0 
        physicsBody?.restitution = 0.2 
        // 衝突
        physicsBody?.categoryBitMask = 3
        physicsBody?.collisionBitMask = 3 
    }
}

