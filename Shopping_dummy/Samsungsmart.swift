//
//  Samsungsmart.swift
//  Shopping_dummy
//
//  Created by JIJO G OOMMEN on 06/08/19.
//  Copyright © 2019 JIJO G OOMMEN. All rights reserved.
//

import UIKit

class Samsungsmart: UIViewController {
    
    var selecteditem : String!
    var selecteditemprice : String!
    var selectdimage : UIImage!
    var selectedName: String!
    var selectedPrice : String!
    
    @IBOutlet var selectedimage: UIImageView!
    @IBOutlet var namelabel: UILabel!
    @IBOutlet var pricelabel: UILabel!
    @IBOutlet var favbuttnoutlet: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        selectedimage.image = selectdimage
       namelabel.text = selecteditem
        pricelabel.text = selecteditemprice
        
       
        
    }
    

    @IBAction func favadd(_ sender: UIButton) {
        
        if sender.currentImage == UIImage(named: "favorite"){
            
            
            
            sender.setImage(UIImage(named: "star"),for: .normal)
            fav_name.append(selecteditem)
            fav_price.append(selecteditemprice)
            fav_image.append(selectdimage)
            
            name_userdef.set(fav_name, forKey: "favnames")
            price_userdef.set(fav_price, forKey: "favprices")
            
            
//            if fav_name.count > 1 {
//                favbuttnoutlet.isEnabled = false
//            }
            
            if fav_name.count > 1  && fav_price.count > 1 && fav_image.count > 1 {



            let ids = fav_name.firstIndex(of: selectedName)



            fav_name.remove(at: ids!)
            fav_price.remove(at: ids!)
            fav_image.remove(at: ids!)

            }
            
            
        }
        
        else {
             sender.setImage(UIImage(named: "favorite"), for: .normal)
           
         //   sender.setImage(UIImage(named: "Star"), for: .normal)
            
            let idx = fav_name.firstIndex(of: selectedName)
            
           
            fav_name.remove(at: idx!)
            fav_image.remove(at: idx!)
             fav_price.remove(at: idx!)
           
        }
        
        print("Samsungsmart :\(fav_name)")
        print("count :\(fav_name.count)")
        
    }
    

}
