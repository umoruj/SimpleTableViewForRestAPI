//
//  ProductViewController.swift
//  unisportAPP
//
//  Created by Umoru Joseph on 7/14/16.
//  Copyright © 2016 Umoru Joseph. All rights reserved.
//

import UIKit

class ProductViewController: UIViewController {
    
    @IBOutlet weak var webView: UIWebView!
    var webSite: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let address = webSite {
            let webURL = NSURL(string: address)
            let urlRequest = NSURLRequest(URL: webURL!)
            webView.loadRequest(urlRequest)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
