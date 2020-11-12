//
//  Stage.swift
//  Last Defense
//
//  Created by Tristan De Lange on 11/11/20.
//  Copyright © 2020 Tristan de Lange. All rights reserved.
//

import SpriteKit

extension GameScene
{
    
    func makeStartBtn() {
        startBtn = SKSpriteNode(imageNamed: "tapMe")
        startBtn.position = CGPoint(x: self.frame.width * 0.5, y: self.frame.height * 0.3)
        startBtn.zPosition = 10
        startBtn.setScale(0)
        startBtn.run(SKAction.scale(to: 1.0, duration: 0.7))
        self.addChild(startBtn)
    }
    
    func makeCircle() -> SKSpriteNode
    {
        let circleTexture = SKTexture(imageNamed: "BasicCircle")
        circle = SKSpriteNode(texture: circleTexture)
        circle.name = "circle"
        circle.zPosition = 10
        circle.position = CGPoint(x: frame.width * 0.5, y: frame.height * 0.5)
        
        circle.physicsBody = SKPhysicsBody(texture: circleTexture, size: circleTexture.size())
        circle.physicsBody!.contactTestBitMask = circle.physicsBody!.collisionBitMask
        circle.physicsBody?.isDynamic = false
        circle.physicsBody?.allowsRotation = false
        
        addChild(circle)
        return circle
    }
    
    func makeSpike() -> SKSpriteNode
    {
        let spikeTexture = SKTexture(imageNamed: "BasicSpike")
        spike = SKSpriteNode(texture: spikeTexture)
        spike.name = "spike"
        spike.zPosition = 10
        spike.position = CGPoint(x: frame.width * 0.65, y: frame.height * 0.5)
        
        spike.zRotation = (.pi/2)*(-1)
        
        spike.physicsBody = SKPhysicsBody(texture: spikeTexture, size: spikeTexture.size())
        spike.physicsBody!.contactTestBitMask = spike.physicsBody!.collisionBitMask
        spike.physicsBody?.isDynamic = false
        spike.physicsBody?.allowsRotation = false
        
        
        addChild(spike)
        return spike
    }
    
    func makeBarrier(position: Int) -> SKSpriteNode
    {
        let barrierTexture = SKTexture(imageNamed: "BasicBarrier")
        barrier = SKSpriteNode(texture: barrierTexture)
        barrier.name = "barrier"
        barrier.zPosition = 10
        barrier.position = CGPoint(x: frame.width * 0.5, y: frame.height * 0.7)
        
        barrier.physicsBody = SKPhysicsBody(texture: barrierTexture, size: barrierTexture.size())
        barrier.physicsBody!.contactTestBitMask = barrier.physicsBody!.collisionBitMask
        barrier.physicsBody?.isDynamic = true
        barrier.physicsBody?.allowsRotation = true
        
        addChild(barrier)
        
        
        let xdistance = self.frame.width/2
        let ydistance = self.frame.height/2
        var move: SKAction
        
        let eastPoint = CGPoint(x: frame.width * 0.95, y: frame.height * 0.5)//1
        let southPoint = CGPoint(x: frame.width * 0.5, y: frame.height * 0.05)//2
        let westPoint = CGPoint(x: frame.width * 0.05, y: frame.height * 0.5)//3
        let northPoint = CGPoint(x: frame.width * 0.5, y: frame.height * 0.95)//4
        
        switch position {
        case 1:
            barrier.position = northPoint
            barrier.zRotation = 0
            move = SKAction.moveBy(x: 0, y: -ydistance, duration: TimeInterval((0.004 * ydistance)))
            break
        case 2:
            barrier.position = eastPoint
            barrier.zRotation = (.pi/2)*(-1)
            move = SKAction.moveBy(x: -xdistance, y: 0, duration: TimeInterval((0.004 * ydistance )))
            break
        case 3:
            barrier.position = southPoint
            barrier.zRotation = .pi
            move = SKAction.moveBy(x: 0, y:ydistance, duration: TimeInterval((0.004 * ydistance)))
            break
        case 4:
            barrier.position = westPoint
            barrier.zRotation = (.pi/2)*(1)
            move = SKAction.moveBy(x: xdistance, y: 0, duration: TimeInterval((0.004 * ydistance)))
            break
        default:
            print("default")
            barrier.position = southPoint
            barrier.zRotation = .pi
            move = SKAction.moveBy(x: 0, y: 0, duration: TimeInterval((0.001 * ydistance)))
            
        }
        
        let anim = SKAction.animate(with: [
            SKTexture(imageNamed: "evilProjectile1"),
            SKTexture(imageNamed: "evilProjectile2"),
            SKTexture(imageNamed: "evilProjectile3"),
            SKTexture(imageNamed: "evilProjectile4"),
            SKTexture(imageNamed: "evilProjectile5"),
            SKTexture(imageNamed: "evilProjectile6")], timePerFrame: 0.1)
        let forever = SKAction.repeatForever(anim)
        
        
        barrier.run(forever)
        barrier.run(move)
        return barrier
    }
    
    func makeScoreLabel() {
        scoreLabel = SKLabelNode()
        scoreLabel.position = CGPoint(x: self.frame.width * 0.5, y: self.frame.height * 0.8)
        scoreLabel.fontName = "Marker Felt Wide"
        scoreLabel.fontColor = UIColor.systemYellow
        scoreLabel.fontSize = 94
        scoreLabel.zPosition = 10
        addChild(scoreLabel)
    }
    
    func makeHighScoreLabel()
    {
        hsLabel = SKLabelNode()
        hsLabel.position = CGPoint(x: self.frame.width * 0.5, y: self.frame.height * 0.6)
        hsLabel.fontName = "Marker Felt Wide"
        hsLabel.fontColor = UIColor.systemYellow
        hsLabel.fontSize = 94
        hsLabel.zPosition = 10
        hsLabel.text = "High Score: " + String(highscore.load())
        addChild(hsLabel)
    
    }
    
}
