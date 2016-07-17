//
//  ShopTableViewController.swift
//  unisportAPP
//
//  Created by Umoru Joseph on 7/13/16.
//  Copyright © 2016 Umoru Joseph. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON


class ShopTableViewController: UITableViewController {
    
    var productList = [NSDictionary]()

    override func viewDidLoad() {
        super.viewDidLoad()

        getProductListData()
    }
    
    func getProductListData(){
        Alamofire.request(.GET, "https://www.unisport.dk/api/sample/").responseJSON { (response) in
            if let JSON22 = response.result.value{
                let data = JSON22["products"]
                
                for d in data as! [AnyObject]{
                    var prodList = [String:String]()
                    prodList["currency"] = d["currency"] as? String
                    prodList["delivery"] = d["delivery"] as? String
                    prodList["image"] = d["image"] as? String
                    prodList["name"] = d["name"] as? String
                    prodList["price"] = d["price"] as? String
                    prodList["price_old"] = d["price_old"] as? String
                    prodList["sizes"] = d["sizes"] as? String
                    prodList["url"] = d["url"] as? String
                    self.productList.append(prodList)
                    
                }
                self.tableView.reloadData()
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productList.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCellWithIdentifier("ShopTableCell", forIndexPath: indexPath) as! ShopTableViewCell
        
        let row = indexPath.row
        let picURL = String(productList[row]["image"]!)
        let url = NSURL(string: picURL)
        let data = NSData(contentsOfURL: url!)
        
        cell.productCurrency.text = String(productList[row]["currency"]!)
        cell.productName.text = String(productList[row]["name"]!)
        cell.productPriceOld.text = String(productList[row]["price_old"]!)
        cell.productPrice.text = String(productList[row]["price"]!)
        cell.productSizes.text = String(productList[row]["sizes"]!)
        cell.productDeliveryDate.text = String(productList[row]["delivery"]!)
        cell.productImage.image = UIImage(data: data!)
        return cell
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "ShowProductViewController" {
            let detailViewController = segue.destinationViewController
                as! ProductViewController
            
            let myIndexPath = self.tableView.indexPathForSelectedRow!
            let row = myIndexPath.row
            detailViewController.webSite = String(productList[row]["url"]!)
        }
    }

}

