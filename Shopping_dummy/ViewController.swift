//
//  ViewController.swift
//  Shopping_dummy
//
//  Created by JIJO G OOMMEN on 06/08/19.
//  Copyright © 2019 JIJO G OOMMEN. All rights reserved.
//

import UIKit

let name_userdef = UserDefaults.standard
let price_userdef = UserDefaults.standard
let image_userdef = UserDefaults.standard



var fav_name = [String]()
var fav_price = [String]()
var fav_image = [UIImage]()
var DataArray = NSMutableArray()
class ViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate {
    
    
    var prodname : String!
    var prodprice : String!
    
   
   
    
    var images = [#imageLiteral(resourceName: "tvtwo"),#imageLiteral(resourceName: "tvone"),#imageLiteral(resourceName: "tvfour"),#imageLiteral(resourceName: "sdfrg"),#imageLiteral(resourceName: "sdfrgg"),#imageLiteral(resourceName: "ddfrg")]
    
    var names = ["SAMSUNG SMART LED","HIER LED","LG OLED","SAMSUNG STYLE","LG SUPERCOOL","HIER EXCELLENT"]
    
    var prices = ["Rs.32000/-","Rs.28000/-","Rs.23000/-","Rs.18000/-","Rs.33000/-","Rs.65000/-"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        collectionview.delegate = self
        collectionview.dataSource = self
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "proDuctsid", for: indexPath)as! proDucts
        cell.imagevieW.image    = images[indexPath.row]
        cell.pro_name.text      = names[indexPath.row]
        cell.pro_price.text     = prices[indexPath.row]
        cell.buttonFav.tag      = indexPath.row
        prodname = cell.pro_name.text
        prodprice = cell.pro_price.text
        return cell
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Selected cell number: \(indexPath.row)")
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "Samsungsmartid")as! Samsungsmart
        
       vc.selecteditem = names[indexPath.row]
        vc.selecteditemprice = prices[indexPath.row]
        vc.selectdimage = images[indexPath.row]
        
    vc.selectedName = names[indexPath.row]
        vc.selectedPrice = prices[indexPath.row]
        
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    @IBAction func addToFav(_ sender: UIButton) {
     
        if sender.currentImage == UIImage(named: "favorite"){
            
           
           
            
            sender.setImage(UIImage(named: "star"),for: .normal)
            
            fav_name.append(names[sender.tag])
            fav_image.append(images[sender.tag])
            fav_price.append(prices[sender.tag])
            
            for i in fav_image
            {
                let data:NSData = NSData(data: i.pngData()!)
                DataArray.add(data)
            }
            
            print(fav_name.count)
            print(fav_image.count)
            
            print("NAME ARRAY  ::\(fav_name)")
            
           
            
        }
        
        else {
            sender.setImage(UIImage(named: "favorite"), for: .normal)
            
           
            
            let selectedName = names[sender.tag]
            let selectedPrice = prices[sender.tag]
            let selectedImage = images[sender.tag]
            let idx = fav_name.firstIndex(of: selectedName)
           // let idy = self.fav_image.firstIndex(of: selectedImage)
                    
                    fav_name.remove(at: idx!)
                    fav_image.remove(at: idx!)
                     fav_price.remove(at: idx!)
            
                
                print("REMOVED ::\(fav_name.count)")
               print("IMAGE COUNT ::\(fav_image.count)")
                
            }
            
            print("Final - \(fav_name)")
        
        name_userdef.set(fav_name, forKey: "favnames")
        price_userdef.set(fav_price, forKey: "favprices")
        image_userdef.set(DataArray, forKey: "favimages")
        
        
        }

        
     
    
    
    
    @IBOutlet var collectionview: UICollectionView!
    
}

