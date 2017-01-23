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
        debugLog("viewDidLoad: " + self.getNameDescription())
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        debugLog("viewWillAppear: " + self.getNameDescription())
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        debugLog("viewDidAppear: " + self.getNameDescription())
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        debugLog("viewWillDisappear: " + self.getNameDescription())
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        debugLog("viewDidDisappear: " + self.getNameDescription())
    }
    
    deinit {
        debugLog("deinit: " + self.getNameDescription())
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        debugLog("didReceiveMemoryWarning: " + self.getNameDescription())
        
    }
    
}
