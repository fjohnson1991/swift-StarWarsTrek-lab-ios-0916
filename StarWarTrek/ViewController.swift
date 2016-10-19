//
//  ViewController.swift
//  StarWarTrek
//
//  Created by James Campagno on 10/17/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var starWarsOne: UIImageView!
    @IBOutlet weak var starWarsTwo: UIImageView!
    @IBOutlet weak var starWarsThree: UIImageView!
    @IBOutlet weak var starWarsFour: UIImageView!
    
    @IBOutlet weak var starTrekOne: UIImageView!
    @IBOutlet weak var starTrekTwo: UIImageView!
    @IBOutlet weak var starTrekThree: UIImageView!
    @IBOutlet weak var starTrekFour: UIImageView!
    
    var starWarsCharacter: UIImageView!
    var starTreckCharacter: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpStarWarsGestureRecognizer()
        setUpStarTrekGrestureRecognizer()
    }
    
    
    func setUpStarWarsGestureRecognizer() {
        let imageViews = [starWarsOne, starWarsTwo, starWarsThree, starWarsFour]
        
        for imageView in imageViews {
           
            let imageTap = UITapGestureRecognizer(target: self, action: #selector(starWarsCharacterChosen))
            imageView?.addGestureRecognizer(imageTap)

        }
        
    }
    
    func starWarsCharacterChosen(sender: UITapGestureRecognizer) {
        if starWarsCharacter != nil { starWarsCharacter.layer.borderWidth = 0.0 }
        let chosenImage = sender.view as! UIImageView
        chosenImage.layer.borderWidth = 2.0
        chosenImage.layer.borderColor = UIColor.green.cgColor
        starWarsCharacter = chosenImage
        checkForFight()
    }
    
    
    func setUpStarTrekGrestureRecognizer() {
        let imageViews = [starTrekOne, starTrekTwo, starTrekThree, starTrekFour]
        
        for imageview in imageViews {
            let gestureTap = UITapGestureRecognizer(target: self, action: #selector(starTrekCharacterChosen))
            imageview?.addGestureRecognizer(gestureTap)
        }
    }
    
    func starTrekCharacterChosen(sender: UITapGestureRecognizer) {

        if starTreckCharacter != nil { starTreckCharacter.layer.borderWidth = 0.0 }
        let characterChosen = sender.view as! UIImageView
        characterChosen.layer.borderWidth = 2.0
        characterChosen.layer.borderColor = UIColor.green.cgColor
        starTreckCharacter = characterChosen
        checkForFight()
    }
    
    func checkForFight() {
        if starWarsCharacter != nil && starTreckCharacter != nil {
            performSegue(withIdentifier: "showDetailSegue", sender: nil)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetailSegue" {
            if let dest = segue.destination as? DetailViewController {
                dest.starTrekImage = starTreckCharacter.image
                dest.starWarsImage = starWarsCharacter.image
            }
        }
        
    }
 
}


