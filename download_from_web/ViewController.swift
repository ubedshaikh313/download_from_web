//
//  ViewController.swift
//  download_from_web
//
//  Created by Felix 05 on 30/12/19.
//  Copyright © 2019 felix. All rights reserved.
//

import UIKit
//https://wallpaperaccess.com/full/810254.jpg
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    @IBAction func btn2(_ sender: Any) {
        let queue = DispatchQueue(label: "", attributes: .concurrent)
        queue.async {
            self.downloadFromWeb()
        }
        
    }
    @IBAction func downloadbtn(_ sender: UIButton) {
        let operationQueue = OperationQueue()
        let operation1 : BlockOperation = BlockOperation(block: {
            
            let str = "https://www.setaswall.com/wp-content/uploads/2018/11/PUBG-Phone-Wallpaper-05-1080x2340-340x550.jpg"
            let url = URL(string: str)
            let session = URLSession(configuration: .default)
            let dataTask = session.dataTask(with: url!)
            { (data, respose, error) in
                guard let data = data
                    else
                {
                    return
                }
                let image = UIImage(data: data)
                self.indicator.stopAnimating()
                DispatchQueue.main.async {
                    self.imageview.image = image
                    
                }
            
                
            }
            dataTask.resume()
            
        })
        
        operationQueue.addOperation(operation1)
        
        
    }
    
    func downloadFromWeb(){
        let str = "https://wallpaperaccess.com/full/810254.jpg"
        let url = URL(string: str)
        let session = URLSession(configuration: .default)
        let dataTask = session.dataTask(with: url!)
        { (data, respose, error) in
            guard let data = data
                else
            {
                return
            }
            let image = UIImage(data: data)
            self.indicator.stopAnimating()
            self.imageview.image = image
            
        }
        dataTask.resume()
    }
    @IBOutlet weak var imageview: UIImageView!
    
    
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

