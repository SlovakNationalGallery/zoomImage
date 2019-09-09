//
//  ViewController.swift
//  zoomImage
//
//  Created by Igor Rjabinin on 05/09/2019.
//  Copyright © 2019 Igor Rjabinin. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {

    
    @IBOutlet weak var scrollView: UIScrollView!
    
    var imageView = UIImageView()
    
    override func viewDidLoad() {
        let image = UIImage(named: "fulla")
        
        super.viewDidLoad()
        scrollView.delegate = self
        
//        imageView.frame = CGRect(x:0, y:0, width: scrollView.frame.size.width, height:  scrollView.frame.size.height)
        imageView.image = image
        
        imageView.isUserInteractionEnabled = true
        
        imageView.contentMode = UIView.ContentMode.center
        
        imageView.frame = CGRect(x:0, y:0, width: image!.size.width, height:  image!.size.height)
        
        scrollView.addSubview(imageView)
        
        scrollView.contentSize = image!.size
        
        let scrollViewFrame = scrollView.frame
        let scaleWidth = scrollViewFrame.size.width / scrollView.contentSize.width
        let scaleHeight = scrollViewFrame.size.height / scrollView.contentSize.height
        let minScale = min(scaleWidth, scaleHeight)
        
        scrollView.minimumZoomScale = minScale
        scrollView.maximumZoomScale = 1
        scrollView.zoomScale = minScale
        
        centerScrollViewContent()

    }
    
    func centerScrollViewContent() {
        let boundsSize = scrollView.bounds.size
        var contentsFrame = imageView.frame
        
        if contentsFrame.size.width < boundsSize.width {
            contentsFrame.origin.x = (boundsSize.width - contentsFrame.size.width) / 2
        } else {
            contentsFrame.origin.x = 0
        }

        if contentsFrame.size.height < boundsSize.height {
            contentsFrame.origin.y = (boundsSize.height - contentsFrame.size.height) / 2
        } else {
            contentsFrame.origin.y = 0
        }
        
        imageView.frame = contentsFrame
        
    }
    
    func scrollViewDidZoom(_ scrollView: UIScrollView) {
        centerScrollViewContent()
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
           return imageView
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }


}

