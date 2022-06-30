//
//  ViewController.swift
//  PageControl
//
//  Created by Dongduk3 on 2022/06/28.
//

import UIKit

var images = ["01.png", "02.png", "03.png", "04.png", "05.png", "06.png"]

class PageController: UIViewController {

    @IBOutlet var imgView: UIImageView!
    @IBOutlet var pageControl: UIPageControl!
    
    @IBOutlet var pageNum: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        pageControl.numberOfPages = images.count
       
        pageControl.currentPage = 0
        
        pageControl.pageIndicatorTintColor = UIColor.green
        pageControl.currentPageIndicatorTintColor = UIColor.red
        
        imgView.image = UIImage(named: images[0])
        
        pageNum.text = "1";
    }

    @IBAction func pageChange(_ sender: UIPageControl) {
        imgView.image = UIImage(named: images[pageControl.currentPage])
        
        pageNum.text = String(pageControl.currentPage + 1)
        
        
    }
    
}

