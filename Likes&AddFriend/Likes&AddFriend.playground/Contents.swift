import UIKit
import PlaygroundSupport

class TriangleView : UIView {
    
    var color: UIColor = .red
    var firstPointX: CGFloat = 0
    var firstPointY: CGFloat = 0
    var secondPointX: CGFloat = 0.5
    var secondPointY: CGFloat = 1
    var thirdPointX: CGFloat = 1
    var thirdPointY: CGFloat = 0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func draw(_ rect: CGRect) {
        let aPath = UIBezierPath()
        aPath.move(to: CGPoint(x: self.firstPointX * rect.width, y: self.firstPointY * rect.height))
        aPath.addLine(to: CGPoint(x: self.secondPointX * rect.width, y: self.secondPointY * rect.height))
        aPath.addLine(to: CGPoint(x: self.thirdPointX * rect.width, y: self.thirdPointY * rect.height))
        aPath.close()
        self.color.set()
        self.backgroundColor = .clear
        aPath.fill()
    }
}

class MyViewController : UIViewController {
    override func loadView() {
        let view = UIView()
        view.backgroundColor = .white

        let bgView = UIView(frame: CGRect(x: 50, y: 150, width: 150, height: 50))
        bgView.layer.cornerRadius = 5
        bgView.backgroundColor = .red
        view.addSubview(bgView)

        let favView = UIView(frame: CGRect(x: 0, y: 12, width: 25, height: 25))
        let imageView = UIImageView(image: UIImage(named: "icHeartFilled"))
        imageView.frame = CGRect(x: 0, y: 0, width: 50, height: 25)
        imageView.contentMode = .scaleAspectFit
        favView.addSubview(imageView)

        let favCountLbl = UILabel(frame: CGRect(x: imageView.frame.maxX, y: 3, width: 25, height: 25))
        favCountLbl.text = "240"
        favCountLbl.textColor = .white
        favCountLbl.font = UIFont.boldSystemFont(ofSize: 15)
        favCountLbl.sizeToFit()

        favView.addSubview(favCountLbl)
        bgView.addSubview(favView)

        print(bgView.frame)
        bgView.frame = CGRect(x: 50, y: 150, width: favCountLbl.frame.maxX+15, height: 50)
        
        let triangle = TriangleView(frame: CGRect(x: 40+bgView.frame.width/2, y: bgView.frame.maxY, width: 25 , height: 15))
        view.addSubview(triangle)

        self.view = view
    }
}


PlaygroundPage.current.liveView = MyViewController()


