






import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {
    
    let tapLoc : CGPoint = CGPointZero 

    @IBOutlet var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sceneView.showsStatistics = true
        sceneView.delegate = self
        sceneView.scene = SCNScene()
        sceneView.debugOptions = .showWireframe
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
   
        let configuration = ARWorldTrackingConfiguration()
        configuration.planeDetection = .horizontal
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        sceneView.session.pause()
    }
    
    
    @IBAction func tapSceneView(_ sender: UITapGestureRecognizer) {
    
        let tapLoc = sender.location(in: sceneView)
      
        let hitTestResult = sceneView.hitTest(tapLoc, types: .existingPlaneUsingExtent)
        
        if let result = hitTestResult.first {
            //赤か青の箱がランダムで落ちてくる
            var x : Int = arc4random()%2
            switch x{
                case 0:
                     let boxNode = RedBoxNode(hitTestResult: result)
                     sceneView.scene.rootNode.addChildNode(boxNode)
                case 1:
                     let boxNode = BlueBoxNode(hitTestResult: result)
                     sceneView.scene.rootNode.addChildNode(boxNode)
                default:
                    break
            }  
        }
        // 繰り返し落ちてくる
        Timer.scheduledTimer(
            timeInterval: 1,
            target: self,
            selecter: #selecter(self.setupbox),
            userInfo: nil,
            repeats: true
        )    
    }
    @objc func setupbox(){
        let tapLoc = sender.location(in: sceneView)
      
        let hitTestResult = sceneView.hitTest(tapLoc, types: .existingPlaneUsingExtent)
        
        if let result = hitTestResult.first {
            var x : Int = arc4random()%2
            switch x{
                case 0:
                     let boxNode = RedBoxNode(hitTestResult: result!)
                     sceneView.scene.rootNode.addChildNode(boxNode)
                case 1:
                     let boxNode = BlueBoxNode(hitTestResult: result!)
                     sceneView.scene.rootNode.addChildNode(boxNode)
                default:
                    break
            }  

    }
    
    

    func renderer(_ renderer: SCNSceneRenderer, didAdd node: SCNNode, for anchor: ARAnchor) {
       
        guard let planeAnchor = anchor as? ARPlaneAnchor else {
            return
        }
       
        node.addChildNode(Plane1_Node(anchor: planeAnchor))
        node.addChildNode(Plane2_Node(anchor: planeAnchor))
    }
    
   
