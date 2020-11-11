//
//  GameScene.swift
//  Last Defense
//
//  Created by Tristan De Lange on 11/11/20.
//  Copyright © 2020 Tristan de Lange. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    var tempBool = true;
    var gameOver = true
    var spike = SKSpriteNode()
    var circle = SKSpriteNode()
    var barrier = SKSpriteNode()
    var startBtn = SKSpriteNode()
    var scoreLabel = SKLabelNode()
    var score = 0 {
        didSet {
            scoreLabel.text = score.description
        }
    }
    

    
    override func didMove(to view: SKView) {
        physicsWorld.contactDelegate = self
        self.backgroundColor = SKColor(hue: 0.5, saturation: 0.15, brightness: 0.10, alpha: 1)
        
        makeScoreLabel()
        standby()
    }
    
    func standby() {
            makeStartBtn()
            
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
       if gameOver == true {
                  for touch in touches {
                      let location = touch.location(in: self)
                      if startBtn.contains(location) {
                          startGame()
                      }
                  }
              } else {
                  //functionality for moving the spike
              }
        
    }

    
    
    override func update(_ currentTime: TimeInterval) {
        if !gameOver && tempBool {
            tempBool=false
            stopGame()
            
        }
    }
    
    
    func startGame() {
        score = 0
        gameOver = false
        startBtn.removeFromParent()
        
        spike = makeSpike()
        circle = makeCircle()
        barrier = makeBarrier(position: CGPoint(x: 10, y: 10))
    }
    
    func stopGame() {
        gameOver = true
        removeAllActions()
        
//        if let splat = SKEmitterNode(fileNamed: "splat") {
//            splat.position = wasp.position
//            wasp.removeFromParent()
//            addChild(splat)
//        }
        
//        run(sndSplat) { self.standby() }
        
    }
    
    
}
