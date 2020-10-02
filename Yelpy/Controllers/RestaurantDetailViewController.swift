//
//  DetailViewController.swift
//  Yelpy
//
//  Created by Memo on 5/26/20.
//  Copyright © 2020 memo. All rights reserved.
//

import UIKit
import AlamofireImage
import Lottie
import SkeletonView

class RestaurantDetailViewController: UIViewController {

    // ––––– TODO: Configure outlets
    // NOTE: Make sure to set images to "Content Mode: Aspect Fill" on the
    @IBOutlet weak var headerImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var starImage: UIImageView!
    @IBOutlet weak var reviewsLabel: UILabel!
    
    // Initialize restaurant variable
    var r: Restaurant!
    var animationView: AnimationView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startAnimations()
        
        configureOutlets()
        Timer.scheduledTimer(timeInterval: 4, target: self, selector: #selector(self.stopAnimations), userInfo: nil, repeats: false)
    }

    // ––––– Lab 4 TODO: Call animation functions to start
    func startAnimations(){
        animationView = .init(name: "4762-food-carousel")
        
        animationView!.frame = CGRect(x: 10, y: view.frame.height*1/4, width: 400, height: 400)
        
        animationView!.contentMode = .scaleAspectFit
        view.addSubview(animationView!)
        
        animationView!.loopMode = .loop
        animationView!.animationSpeed = 5
        animationView!.play()
    }
    
    // ––––– Lab 4 TODO: Call animation functions to stop
    @objc func stopAnimations() {
        animationView?.stop()
        view.subviews.last?.removeFromSuperview()
    }
    
    // ––––– TODO: Configure outlets :)
    func configureOutlets() {
        nameLabel.text = r.name
        reviewsLabel.text = String(r.reviews)
        starImage.image = Stars.dict[r.rating]!
        headerImage.af.setImage(withURL: r.imageURL!)
        
        // Extra: Add tint opacity to image to make text stand out
        let tintView = UIView()
        tintView.backgroundColor = UIColor(white: 0, alpha: 0.3) //change to your liking
        tintView.frame = CGRect(x: 0, y: 0, width: headerImage.frame.width, height: headerImage.frame.height)

        headerImage.addSubview(tintView)
    }


}
