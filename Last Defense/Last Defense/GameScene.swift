//
//  GameScene.swift
//  Last Defense
//
//  Created by Tristan De Lange on 11/11/20.
//  Copyright © 2020 Tristan de Lange. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    
    let highscore = HighScore()
    var hsLabel = SKLabelNode()
    var loseFlag = false;
    var timer = 0;
    var gameOver = true;
    var spikePos = 1
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
    
    func randomNum() -> Int
    {
        let x = Int.random(in: 1...4)
        return x
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
            for touch in touches
            {
                let location = touch.location(in: self)
                if startBtn.contains(location)&&(!startBtn.isHidden)
                {
                    startGame()
                    startBtn.isHidden = true
                }
                else if(location.x < self.frame.width/2)
                {
                    leftTap()
                }
                else {
                    rightTap()
                }
            }
            
    }
    
    

    func rightTap()
    {
        
        let eastPoint = CGPoint(x: frame.width * 0.65, y: frame.height * 0.5) //1
        let southPoint = CGPoint(x: frame.width * 0.5, y: frame.height * 0.40) //2
        let westPoint = CGPoint(x: frame.width * 0.35, y: frame.height * 0.5) //3
        let northPoint = CGPoint(x: frame.width * 0.5, y: frame.height * 0.60)//4
        
        
        
        switch spikePos {
        case 1:
            spike.position = southPoint
            spikePos=2
            spike.zRotation = .pi
            break
        case 2:
            spike.position = westPoint
            spikePos=3
            spike.zRotation = (.pi/2)*(1)
            break
        case 3:
            spike.position = northPoint
            spikePos=4
            spike.zRotation = 0
            break
        case 4:
            spike.position = eastPoint
            spikePos=1
            spike.zRotation = (.pi/2)*(-1)
            
            break
        default:
            print("default")
            spike.position = southPoint
            spikePos=2
            spike.zRotation = .pi
           
        }
    }
    
    
    func leftTap()
    {
        
        let eastPoint = CGPoint(x: frame.width * 0.65, y: frame.height * 0.5)//1
        let southPoint = CGPoint(x: frame.width * 0.5, y: frame.height * 0.40)//2
        let westPoint = CGPoint(x: frame.width * 0.35, y: frame.height * 0.5)//3
        let northPoint = CGPoint(x: frame.width * 0.5, y: frame.height * 0.60)//4
        
        switch spikePos {
        case 1:
            spike.position = northPoint
            spikePos=4
            spike.zRotation = 0
            break
        case 2:
            spike.position = eastPoint
            spikePos=1
            spike.zRotation = (.pi/2)*(-1)
            break
        case 3:
            spike.position = southPoint
            spikePos=2
            spike.zRotation = .pi
            break
        case 4:
            spike.position = westPoint
            spikePos=3
            spike.zRotation = (.pi/2)*(1)
            break
        default:
            print("default")
            spike.position = southPoint
            spike.zRotation = .pi
            spikePos=2
        }
        
    }
    
    override func update(_ currentTime: TimeInterval) {
        
        
//        if ((!gameOver)&&(loseFlag)) {
//            loseFlag=false
//            stopGame()
//
//        }
        
        timer = timer+1
        if  ((timer >= 150) && (!gameOver))
        {
            timer=0
            barrier = makeBarrier(position: randomNum())
            
        }
    }
    
    
    func startGame() {
        
        hsLabel.removeFromParent()
        score = 0
        gameOver = false
        startBtn.removeFromParent()
        
        spike = makeSpike()
        circle = makeCircle()
        
    }
    
    func stopGame() {
        gameOver = true
        removeAllActions()
        spike.removeFromParent()
        circle.removeFromParent()
        barrier.removeFromParent()
        
        startBtn.isHidden = false
        makeStartBtn()
        highscore.save(data: score)
        makeHighScoreLabel()
        
    }
}
    
extension GameScene: SKPhysicsContactDelegate {
        
    func didBegin(_ contact: SKPhysicsContact) {
        if contact.bodyA.node?.name == "circle" || contact.bodyB.node?.name == "circle" {
            
            stopGame()
        } else
        if contact.bodyA.node?.name == "barrier" || contact.bodyB.node?.name == "barrier" {
            if contact.bodyA.node ==  spike {
                contact.bodyB.node?.removeFromParent()
            } else {
                contact.bodyA.node?.removeFromParent()
            }
            
            score += 1
        }
    }
    
}
    

