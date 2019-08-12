//
//  FavouriteViewController.swift
//  Shopping_dummy
//
//  Created by JIJO G OOMMEN on 07/08/19.
//  Copyright © 2019 JIJO G OOMMEN. All rights reserved.
//

import UIKit



class FavouriteViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fav_names.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let fav = fav_tableview.dequeueReusableCell(withIdentifier: "FavouriteCellid")as! FavouriteCell
        fav.fav_name.text = fav_names[indexPath.row]
        fav.fav_price.text = fav_prcs[indexPath.row]
        fav.fav_image.image = imagearray[indexPath.row]
        return fav
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 300
    }
    
   
    
    
    
    
   var fav_names = [String]()
   var fav_prcs = [String]()
    var fav_images = NSArray()
   
    var imagearray = [UIImage]()
    
    
    @IBOutlet var fav_tableview: UITableView!
    
   
    
    
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fav_names = name_userdef.value(forKey: "favnames") as! [String]
        fav_prcs = price_userdef.value(forKey: "favprices")as! [String]
        fav_images = image_userdef.value(forKey: "favimages")as! NSArray
        
        
        
        for img in fav_images {
            let data:UIImage = UIImage(data: img as! Data)!
            self.imagearray.append(data)
        }
        print("CONVERTED TO IMAGES :\(imagearray.count)")
        
     // the image count may vary its due to user default used
        
        
        print(fav_names)
        
        self.fav_tableview.isEditing = true
        
        fav_tableview.beginUpdates()
        fav_tableview.endUpdates()
        
        view.endEditing(true)
        
    }
    
    
   
    
    

}
