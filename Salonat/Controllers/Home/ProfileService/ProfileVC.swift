//
//  ProfileVC.swift
//  Salonat
//
//  Created by salman on 10/26/18.
//  Copyright © 2018 salman. All rights reserved.
//

import UIKit
import AACarousel
import Kingfisher


class ProfileVC: UIViewController,AACarouselDelegate {
    var salondata:salonsModel?

    @IBOutlet weak var BUCart: UIBarButtonItem!
    
    @IBOutlet weak var carouselView: AACarousel!
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var BUMenu: UIBarButtonItem!
    @IBOutlet weak var segment: UISegmentedControl!
    
    var titleArray = [String]()
    var window: UIWindow?
    var container: ContainerViewController!

    override func viewDidLoad() {
        super.viewDidLoad()
        print(salondata as Any)
        //BUCart.bad
        
        //
        container!.segueIdentifierReceivedFromParent("service")
        //

        BUMenu.setFAIcon(icon: .FANavicon, iconSize: 30)
//        BUCart.addBadge(number: 4, withOffset: CGPoint.zero, andColor: .red, andFilled: false)
        BUCart.setFAIcon(icon: .FAShoppingCart, iconSize: 30)

        


        carouselView.addSubview(stackView)
        //        carouselView.superview?.bringSubviewToFront(stackView)
        
        UINavigationBar.appearance().backgroundColor = UIColor.green

        let pathArray = ["http://www.gettyimages.ca/gi-resources/images/Embed/new/embed2.jpg",
                         "https://ak.picdn.net/assets/cms/97e1dd3f8a3ecb81356fe754a1a113f31b6dbfd4-stock-photo-photo-of-a-common-kingfisher-alcedo-atthis-adult-male-perched-on-a-lichen-covered-branch-107647640.jpg",
                         "https://imgct2.aeplcdn.com/img/800x600/car-data/big/honda-amaze-image-12749.png",
                         "http://www.conversion-uplift.co.uk/wp-content/uploads/2016/09/Lamborghini-Huracan-Image-672x372.jpg"]
        titleArray = ["picture 1","picture 2","picture 3","picture 4"]
        carouselView.delegate = self
        carouselView.setCarouselData(paths: pathArray,  describedTitle: titleArray, isAutoScroll: true, timer: 5.0, defaultImage: "defaultImage")
        //optional methods
        carouselView.setCarouselOpaque(layer: false, describedTitle: false, pageIndicator: false)
        carouselView.setCarouselLayout(displayStyle: 0, pageIndicatorPositon: 2, pageIndicatorColor: nil, describedTitleColor: .clear, layerColor: .clear)

        // Do any additional setup after loading the view.
    }
    
  
    //require method
    func downloadImages(_ url: String, _ index: Int) {
        
        //here is download images area
        let imageView = UIImageView()
        imageView.kf.setImage(with: URL(string: url)!, placeholder: UIImage.init(named: "defaultImage"), options: [.transition(.fade(0))], progressBlock: nil, completionHandler: { (downloadImage, error, cacheType, url) in
            self.carouselView.images[index] = downloadImage!
        })
    }
    
    //optional method (interaction for touch image)
    func didSelectCarouselView(_ view: AACarousel ,_ index: Int) {
        
        let alert = UIAlertView.init(title:"Alert" , message: titleArray[index], delegate: self, cancelButtonTitle: "OK")
        alert.show()
        
        //startAutoScroll()
        //stopAutoScroll()
    }
    
    //optional method (show first image faster during downloading of all images)
    func callBackFirstDisplayView(_ imageView: UIImageView, _ url: [String], _ index: Int) {
        
        imageView.kf.setImage(with: URL(string: url[index]), placeholder: UIImage.init(named: "defaultImage"), options: [.transition(.fade(1))], progressBlock: nil, completionHandler: nil)
        
    }
    
    func startAutoScroll() {
        //optional method
        carouselView.startScrollImageView()
        
    }
    
    func stopAutoScroll() {
        //optional method
        carouselView.stopScrollImageView()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "container"{
            container = (segue.destination as! ContainerViewController)
            //For adding animation to the transition of containerviews you can use container's object property
            // animationDurationWithOptions and pass in the time duration and transition animation option as a tuple
            // Animations that can be used
            // .transitionFlipFromLeft, .transitionFlipFromRight, .transitionCurlUp
            // .transitionCurlDown, .transitionCrossDissolve, .transitionFlipFromTop
            container.animationDurationWithOptions = (0.5, .transitionCrossDissolve)
        }
    }
    @IBAction func segmentControl(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            
            
            container!.segueIdentifierReceivedFromParent("service")
            
        } else if sender.selectedSegmentIndex == 1{
            
            container!.segueIdentifierReceivedFromParent("location")
            let controller = container.currentViewController as? ProfileLocationVC
            controller?.delegate = self as LocationViewDelegate
            
            
        } else {
            container!.segueIdentifierReceivedFromParent("customer")
            let controller = container.currentViewController as? ProfileCustomerVC
            controller?.delegate = self as CustomerViewDelegate
            
        }
        
    }
    
    
    
}
extension ProfileVC: LocationViewDelegate,CustomerViewDelegate{

    func sendToThirdViewController() {
        container.segueIdentifierReceivedFromParent("third")
    }


}

