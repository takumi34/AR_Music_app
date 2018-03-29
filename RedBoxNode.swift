import UIKit
import SceneKit
import ARKit
class RedBoxNode: SCNNode{
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(hitTestResult: ARHitTestResult) {
        super.init()
        
        let box = SCNBox(width: 0.05, height: 0.05, length: 0.05, chamferRadius: 0.01)
        box.firstMaterial?.diffuse.contents = UIColor.red
        
        
        geometry = box
        
        let pos = hitTestResult.worldTransform.columns.3
        let y = pos.y + Float(box.height/2.0) + 0.3
        //ランダムで現れる
        position = SCNVector3(pos.x + Float(arc4random() % 3) * 0.1 , y, pos.z + Float(arc4random() % 3))
      
        let bodyShape = SCNPhysicsShape(geometry: geometry!, options: [:])
        physicsBody = SCNPhysicsBody(type: .dynamic, shape: bodyShape)
        physicsBody?.friction = 1.0
        physicsBody?.restitution = 0.2
        
        
        // 衝突
        physicsBody?.categoryBitMask = 3 
        physicsBody?.collisionBitMask = 3 //Int(Category.planeCategory.rawValue | Category.boxCategory.rawValue)
    }
}
