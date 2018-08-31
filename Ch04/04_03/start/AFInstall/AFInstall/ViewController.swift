//
//  ViewController.swift
//  AFInstall
//
//  Created by Bear Cahill on 9/18/17.
//  Copyright © 2017 Bear Cahill. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        fetchURL(url: "https://www.nasa.gov/images/content/734337main_G306_color_large.jpg")
    }

    func fetchURL(url : String) {
        
        let destination : DownloadRequest.DownloadFileDestination = {_,_ in
            let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
            let fileURL = documentsURL.appendingPathComponent("icon.png")
            return (fileURL, [.removePreviousFile, .createIntermediateDirectories])
        }
        
        Alamofire.download(url, to: destination).responseData { (response) in
            if let data = response.value {
                let img = UIImage.init(data: data)
                let iv = UIImageView.init(frame: self.view.frame)
                iv.image = img
                iv.contentMode = .scaleAspectFit
                DispatchQueue.main.async {
                    self.view.addSubview(iv)
                }
            }
            }.downloadProgress { (progress) in
                print("\(progress.fractionCompleted)")
        }
    }
    
}

