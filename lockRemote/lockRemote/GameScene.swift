//
//  GameScene.swift
//  lockRemote
//
//  Created by danlin jiang on 6/4/19.
//  Copyright © 2019 danlin jiang. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    var entities = [GKEntity]()
    var graphs = [String : GKGraph]()
    
    private var lastUpdateTime : TimeInterval = 0
    private var offlabel : SKLabelNode?
    private var onlabel : SKLabelNode?
    private var spinnyNode : SKShapeNode?
    private var currLabel : SKLabelNode!
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    
    override func sceneDidLoad() {

        self.currLabel = self.offlabel
        self.lastUpdateTime = 0
        
        // Get label node from scene and store it for use later
        self.offlabel = self.childNode(withName: "//offLabel") as? SKLabelNode
        self.onlabel = self.childNode(withName: "//onLabel") as? SKLabelNode

        if let label = self.offlabel {
            label.alpha = 0.0
            label.run(SKAction.fadeIn(withDuration: 2.0))
            currLabel = offlabel
        }

        if let label = self.onlabel {
            label.alpha = 0.0
            label.run(SKAction.hide())
        }
        
        // Create shape node to use during mouse interaction
        let w = (self.size.width + self.size.height) * 0.05
        self.spinnyNode = SKShapeNode.init(rectOf: CGSize.init(width: w, height: w), cornerRadius: w * 0.3)
        
        if let spinnyNode = self.spinnyNode {
            spinnyNode.lineWidth = 2.5
            
            spinnyNode.run(SKAction.repeatForever(SKAction.rotate(byAngle: CGFloat(Double.pi), duration: 1)))
            spinnyNode.run(SKAction.sequence([SKAction.wait(forDuration: 0.5),
                                              SKAction.fadeOut(withDuration: 0.5),
                                              SKAction.removeFromParent()]))
        }
    }
    
    
    func touchDown(atPoint pos : CGPoint) {
        if let n = self.spinnyNode?.copy() as! SKShapeNode? {
            n.position = pos
            n.strokeColor = SKColor.green
            self.addChild(n)
            //sleep(1)
        }
    }
    
    func touchMoved(toPoint pos : CGPoint) {
        if let n = self.spinnyNode?.copy() as! SKShapeNode? {
            n.position = pos
            n.strokeColor = SKColor.blue
            self.addChild(n)
            //sleep(1)
                
        }
}
    
    func touchUp(atPoint pos : CGPoint) {
        if let n = self.spinnyNode?.copy() as! SKShapeNode? {
            n.position = pos
            n.strokeColor = SKColor.red
            self.addChild(n)
           // sleep(1)
        }
    }
    /*
    func delay(time: Double, closure:()->()) {
        
        DispatchQueue.main.asyncAfter(deadline: .now() + time) { // Change `2.0` to the desired number of seconds.
            // Code you want to be delayed
        }
        
    }*/
    func switchLabel(){
        //switch label
            if self.currLabel == onlabel {
                self.currLabel.run(SKAction.hide())
                self.currLabel = offlabel
                self.currLabel.run(SKAction.unhide())
                currLabel.run(SKAction.init(named: "Pulse")!, withKey: "fadeInOut")
                UIApplication.shared.beginIgnoringInteractionEvents()
                DispatchQueue.main.asyncAfter(deadline: .now() + 1)  {
                    UIApplication.shared.endIgnoringInteractionEvents()
                }
            } else {
                self.currLabel.run(SKAction.hide())
                self.currLabel = onlabel
                self.currLabel.run(SKAction.unhide())
                currLabel.run(SKAction.init(named: "Pulse")!, withKey: "fadeInOut")
                UIApplication.shared.beginIgnoringInteractionEvents()
                DispatchQueue.main.asyncAfter(deadline: .now() + 1)  {
                    UIApplication.shared.endIgnoringInteractionEvents()
                }
            }
         
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if currLabel == self.offlabel {
            currLabel.run(SKAction.init(named: "Pulse")!, withKey: "fadeInOut")
            self.offlabel = self.childNode(withName: "//offLabel") as? SKLabelNode
        } else {
            currLabel.run(SKAction.init(named: "Pulse")!, withKey: "fadeInOut")
            self.onlabel = self.childNode(withName: "//onLabel") as? SKLabelNode
        }
        
        for t in touches {
            self.touchDown(atPoint: t.location(in: self))
        }
        switchLabel()
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches {
            self.touchMoved(toPoint: t.location(in: self))
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches {
            self.touchUp(atPoint: t.location(in: self))
        }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches {
            self.touchUp(atPoint: t.location(in: self))
        }
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        
        // Initialize _lastUpdateTime if it has not already been
        if (self.lastUpdateTime == 0) {
            self.lastUpdateTime = currentTime
        }
        
        // Calculate time since last update
        let dt = currentTime - self.lastUpdateTime
        
        // Update entities
        for entity in self.entities {
            entity.update(deltaTime: dt)
        }
        
        self.lastUpdateTime = currentTime
        
    }
}
