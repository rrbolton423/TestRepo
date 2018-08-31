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
        fetchURL(url: "https://orangevalleycaa.org/api/videos", param: ["category":"Dance","keyword":"ballet", "value": ["value1", "value2"], "address": ["street":"Lakeshore Dr", "city": "Mandeville"]])
    }

    func fetchURL(url : String, param : [String:Any]) {
        Alamofire.request(url, method: .post, parameters: param).responseString { (response) in
            print (response.value ?? "no value")
        }.responseJSON { (response) in
            print (response.value ?? "no value")
        }
    }
    
}

