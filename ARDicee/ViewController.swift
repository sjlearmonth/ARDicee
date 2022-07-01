//
//  ViewController.swift
//  ARDicee
//
//  Created by Stephen Learmonth on 01/07/2022.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self
        
        let cube = SCNBox(width: 0.1, height: 0.1, length: 0.1, chamferRadius: 0.01)
        
        let sphere = SCNSphere(radius: 0.05)
        
        let shape = SCNTorus(ringRadius: 0.18, pipeRadius: 0.08)
        
        let cubeMaterial = SCNMaterial()
        
        cubeMaterial.diffuse.contents = UIColor.red
        
        let sphereMaterial = SCNMaterial()
        
        sphereMaterial.diffuse.contents = UIColor.green
        
        let shapeMaterial = SCNMaterial()
        
        shapeMaterial.diffuse.contents = UIColor.blue

        cube.materials = [cubeMaterial]
        
        sphere.materials = [sphereMaterial]
        
        shape.materials = [shapeMaterial]
        
        let cubeNode = SCNNode()
        
        cubeNode.position = SCNVector3(0, 0.1, -0.5)
        
        cubeNode.geometry = cube
        
        let sphereNode = SCNNode()
        
        sphereNode.position = SCNVector3(-0.1, 0.2, -0.15)
        
        sphereNode.geometry = sphere
        
        let shapeNode = SCNNode()
        
        shapeNode.position = SCNVector3(0.16, -0.19, -0.6)
        
        shapeNode.geometry = shape

        sceneView.scene.rootNode.addChildNode(cubeNode)
        
        sceneView.scene.rootNode.addChildNode(sphereNode)
        
        sceneView.scene.rootNode.addChildNode(shapeNode)
        
        sceneView.autoenablesDefaultLighting = true
        
//        // Create a new scene
//        let scene = SCNScene(named: "art.scnassets/ship.scn")!
//
//        // Set the scene to the view
//        sceneView.scene = scene
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()

        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }

}
