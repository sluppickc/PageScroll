//
//  ViewController.swift
//  PageScroll
//
//  Created by Chris Sluppick on 1/9/17.
//  Copyright © 2017 Chris Sluppick. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    
//  Second scrollView added in order to fix dead touch areas to left and right of original scroll view
    @IBOutlet weak var panGestureRecognizer: UIScrollView!
    
    
    
    var images = [UIImageView]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
//  Frame size data not avaialable in view did load.  But in viewDIdAppear it is avaialable
    override func viewDidAppear(_ animated: Bool) {
        
        var contentWidth: CGFloat = 0.0
        
        let scrollWidth = scrollView.frame.size.width
        
        for x in 0...2 {
            let image = UIImage(named: "icon\(x).png")
            let imageView = UIImageView(image: image)
            images.append(imageView)
            
            //          adjusting the position of the scroll view items so they appear offscreen but will snap into place when swiped
            var newX: CGFloat = 0.0
            
            
            //          get the screen position and this will move each sequential item in the for loop off the screen the exact amount we need
            newX = scrollWidth / 2 + scrollWidth * CGFloat(x)
            contentWidth += newX
            
            
            //          Add subviews
            scrollView.addSubview(imageView)
            
            //          set frame of imageView
            imageView.frame = CGRect(x: newX - 75, y: (scrollView.frame.size.height / 2) - 75 /*to get half of the icons height*/, width: 150, height: 150)
            
        }
        
        
//      removes cropping of items in scrollview
        scrollView.clipsToBounds = false
        
//       Added a second scrollView over the existing that solves the dead touch areas on each side of original scroll view which happens in order to show the next and previous objects in the scrollView
        panGestureRecognizer.addGestureRecognizer(scrollView.panGestureRecognizer)
        
        scrollView.contentSize = CGSize(width: contentWidth, height: view.frame.size.height)
        
//      color change just to see the boundries of the scrollView
//        scrollView.backgroundColor = UIColor.purple

        
        
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

