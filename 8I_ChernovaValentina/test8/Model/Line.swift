import SpriteKit

class Line: SKShapeNode {
    //определяем, как оно будет отрисовываться
    convenience init(position: CGPoint, width: Int) {
        self.init()
        
        //линия отступа до поворотников
        
        self.position = position
        path = UIBezierPath(rect: CGRect(x: 0, y: 0, width: width, height: 1)).cgPath
        fillColor = UIColor(red: 120.0/255.0, green: 185.0/255.0, blue: 186.0/255.0, alpha: 1)
        lineWidth = 0
        
        self.physicsBody = SKPhysicsBody(edgeFrom: CGPoint(x:0, y:0), to: CGPoint(x:width, y:0))
        self.physicsBody?.categoryBitMask = CollisionCategories.EdgeBody
        
    }
}
