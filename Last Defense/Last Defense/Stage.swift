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
        circle.physicsBody?.isDynamic = true
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
        spike.physicsBody?.isDynamic = true
        spike.physicsBody?.allowsRotation = false
        
        
        addChild(spike)
        return spike
    }
    
    func makeBarrier(position: CGPoint) -> SKSpriteNode
    {
        let barrierTexture = SKTexture(imageNamed: "BasicBarrier")
        barrier = SKSpriteNode(texture: barrierTexture)
        barrier.name = "circle"
        barrier.zPosition = 10
        barrier.position = CGPoint(x: frame.width * 0.5, y: frame.height * 0.7)
        
        barrier.physicsBody = SKPhysicsBody(texture: barrierTexture, size: barrierTexture.size())
        barrier.physicsBody!.contactTestBitMask = barrier.physicsBody!.collisionBitMask
        barrier.physicsBody?.isDynamic = true
        barrier.physicsBody?.allowsRotation = false
        
        addChild(barrier)
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
    
    
    
}
