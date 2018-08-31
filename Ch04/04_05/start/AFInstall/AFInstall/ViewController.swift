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
        uploadImg(url: "https://orangevalleycaa.org/api/upload.php")
    }

    func uploadImg(url : String) {
        if let img = UIImage.init(named: "OVCAA-transparent.png") {
            if let data = UIImageJPEGRepresentation(img, 0.5) {
                Alamofire.upload(multipartFormData: { (multipartFormData) in
                    multipartFormData.append("bear".data(using: .utf8)!, withName: "username")
                    multipartFormData.append(data, withName: "fileToUpload")
                }, to: url, encodingCompletion: { (encodingResult) in
                    switch encodingResult {
                    case .failure(let error):
                        debugPrint(error)
                    case .success(let req, let streaming, let fileURL):
                        req.responseJSON(completionHandler: { (response) in
                            debugPrint(response)
                        })
                        req.uploadProgress(closure: { (progress) in
                            print("\(progress.fractionCompleted)")
                        })
                    }
                })
            }
        }
    }
}

