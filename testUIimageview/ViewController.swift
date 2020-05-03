//
//  ViewController.swift
//  testUIimageview
//
//  Created by junior on 4/30/20.
//  Copyright © 2020 junior. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var img: UIImageView!
    // @IBOutlet weak var button: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // utilizanod la extension del button
       // button.efectos()
    }
    
    
    @IBAction func buttonClick(_ sender: Any) {
        // cargando imagen
             let url = "https://d2lnr5mha7bycj.cloudfront.net/itemimage/image/12215-eaac44d114cb00be4e3ecc26e0cf39be.jpg"
             guard let imageUrl: URL = URL(string: url)  else {
                 return
             }
             
             img.loadImge(withUrl: imageUrl)
    }
    
}
extension UIImageView {
    func loadImge(withUrl url: URL) {
           DispatchQueue.global().async { [weak self] in
               if let imageData = try? Data(contentsOf: url) {
                   if let image = UIImage(data: imageData) {
                       DispatchQueue.main.async {
                           self?.image = image
                       }
                   }
               }
           }
       }
}


