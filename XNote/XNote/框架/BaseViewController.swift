//
//  BaseViewController.swift
//  XNote
//
//  Created by 高翔 on 2017/1/10.
//  Copyright © 2017年 高翔. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController{
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
