//
//  ViewController.swift
//  UIImage
//
//  Created by Palliboina on 29/03/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var commentBtn: UIButton!
    
    @IBOutlet weak var imageView: UIImageView!
    var family: UIImage!
    var teddy: UIImage!
    var currentActive: Bool = false
    
    
    @IBAction func changePicture(_ sender: UIButton) {
        if currentActive {
            imageView.image = teddy
        }else{
            imageView.image = family
        }
        currentActive.toggle()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        /*if let image = UIImage(named: "family") {
            view.backgroundColor = UIColor(patternImage: image)
        }*/
        
        family = UIImage(named: "family")
        teddy = UIImage(named: "teddy")
        
        let thumbnail = family.preparingThumbnail(of: CGSize(width: 100, height: 100))  //initial thumbnail image
        imageView.contentMode = .top
        imageView.image = thumbnail
        
        let configSize = UIImage.SymbolConfiguration(pointSize: 20, weight: .regular)
        
        let configColors = UIImage.SymbolConfiguration(paletteColors: [.systemRed,.white])
        
        let config = configSize.applying(configColors)
        
        commentBtn.configurationUpdateHandler = { button in
            var btnConfig = button.configuration
            btnConfig?.title = "Add Comment"
            btnConfig?.image = UIImage(systemName: "bell.circle.fill",withConfiguration: config)
            btnConfig?.imagePadding = 15
            button.configuration = btnConfig
        }
        
    }


}

