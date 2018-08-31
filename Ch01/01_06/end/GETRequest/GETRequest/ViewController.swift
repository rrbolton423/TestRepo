//
//  ViewController.swift
//  GETRequest
//
//  Created by Bear Cahill on 9/18/17.
//  Copyright © 2017 Bear Cahill. All rights reserved.
//

import UIKit

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
        fetchURL(url: "https://media.licdn.com/mpr/mpr/shrink_200_200/AAEAAQAAAAAAAANyAAAAJGRlZTNlZDQwLTk4YTItNDA1MS04MzBjLWJmNGQ5M2RmZGUxYw.png")
    }

    func fetchURL(url : String) {
        if let urlToServer = URL.init(string: url) {
//            let task = URLSession.shared.dataTask(with: urlToServer, completionHandler: { (data, response, error) in
            let task = URLSession.shared.downloadTask(with: urlToServer, completionHandler: { (fileURL, response, error) in
                if error != nil || fileURL == nil {
                    // handle error
                }
                else if let data = try? Data.init(contentsOf: fileURL!) {
                    let img = UIImage.init(data: data)
                    let iv = UIImageView.init(frame: self.view.frame)
                    iv.image = img
                    iv.contentMode = .scaleAspectFit
                    DispatchQueue.main.async {
                        self.view.addSubview(iv)
                    }
                }
            })
            task.resume()
        }
        
    }

}

