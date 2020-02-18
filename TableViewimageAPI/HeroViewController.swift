//
//  HeroViewController.swift
//  TableViewimageAPI
//
//  Created by Proshenjit kumar on 17/2/20.
//  Copyright © 2020 Proshenjit kumar. All rights reserved.
//

import UIKit

extension UIImageView {
    func downloaded(from url: URL, contentMode mode: UIView.ContentMode = .scaleAspectFit) {  // for swift 4.2 syntax just use ===> mode: UIView.ContentMode
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() {
                self.image = image
            }
        }.resume()
    }
    func downloaded(from link: String, contentMode mode: UIView.ContentMode = .scaleAspectFit) {  // for swift 4.2 syntax just use ===> mode: UIView.ContentMode
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
    }
}

class HeroViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
   
    
    @IBOutlet weak var namelbl: UILabel!
    @IBOutlet weak var attributelbl: UILabel!
    
    @IBOutlet weak var attacklbl: UILabel!
    
    @IBOutlet weak var legslbl: UILabel!
    var hero:HeroStats?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        namelbl.text = hero?.localized_name
        attributelbl.text = hero?.primary_attr
        attacklbl.text = hero?.attack_type
        legslbl.text = "\((hero?.legs)!)"
        
        let urlString = "https://api.opendota.com"+(hero?.img)!
        let url = URL(string: urlString)
        
        imageView.downloaded(from: url!)
    }
    

  

}
