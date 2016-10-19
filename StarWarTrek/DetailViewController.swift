//
//  DetailViewController.swift
//  StarWarTrek
//
//  Created by Felicity Johnson on 10/19/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    
    @IBOutlet weak var starWarsImageView: UIImageView!
    @IBOutlet weak var starTrekImageView: UIImageView!
    
    var starWarsImage: UIImage!
    var starTrekImage: UIImage!
    
    var starWarsImagePosition: CGPoint!
    var starTrekImagePosition: CGPoint!
    
    var starWarsRect: CGRect!
    var starTrekRect: CGRect!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        starWarsImageView.image = starWarsImage
        starTrekImageView.image = starTrekImage
        
        setUpStarWarsPanGesture()
        setUpStarTrekPanGesture()
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func setUpStarWarsPanGesture() {
        
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(panFunc))
        starWarsImageView.addGestureRecognizer(panGesture)
        
    }
    
    
      func panFunc(sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: self.view)
        if let view = sender.view {
            view.center = CGPoint(x: view.center.x + translation.x,
                                  y: view.center.y + translation.y)
        }
        sender.setTranslation(CGPoint.zero, in: self.view)

        imageCollision()
    }
    
    
    func setUpStarTrekPanGesture() {
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(panFunc))
        starTrekImageView.addGestureRecognizer(panGesture)
        
    }
    
    func imageCollision() {
            if starTrekImageView.frame.intersects(starWarsImageView.frame) {
                view.backgroundColor = UIColor.getRandomColor()
            }

    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension UIColor {
    class func getRandomColor() -> UIColor {
        let red = Float(drand48())
        let green = Float(drand48())
        let blue = Float(drand48())
        
        return UIColor(colorLiteralRed: red, green: green, blue: blue, alpha: 1.0)
    }
    
    
    
}
