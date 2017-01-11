
//        

//
//  CWkWVCtrl.swift
//  app
//
//  Created by kk on 15/12/14.
//  Copyright © 2015年 上海酷屏信息技术有限公司. All rights reserved.
//
import UIKit
import WebKit
struct CWkWVCtrlDefaults {
    
    static let defaultTitle = "加载中..."
    
}
class CWkWVCtrl: BaseViewController, WKNavigationDelegate,UIGestureRecognizerDelegate,WKUIDelegate{
    
    static var chargeWV: CWkWVCtrl?
    
    var ucc: BlmUCC = BlmUCC()
    
    private var config: WKWebViewConfiguration = WKWebViewConfiguration()
    
    internal var webView: WKWebView?
    
    var openUrl: String?
//
//    private var closeToUrl: String?
//    var loadIndicator = WebLoadIndicator()
//    
//    var rldVW = ReloadView()
//    
//    var shareObject:ShareObject?
    
    private var isShowLogin = false
    
    var phoneList = ""
    
    required init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
        
    }
    
    init(url: String, pgTitle: String? = nil) {
        
        super.init()
        openUrl = url
        self.config.userContentController = self.ucc
        
        self.config.websiteDataStore = WKWebsiteDataStore.default()
        self.config.websiteDataStore.fetchDataRecords(ofTypes: WKWebsiteDataStore.allWebsiteDataTypes(), completionHandler: {_ in 
        })
     
        initHdl()
            
        self.webView = WKWebView(frame: CGRect.zero, configuration: self.config)
        
        self.webView?.navigationDelegate = self
        
        title = CWkWVCtrlDefaults.defaultTitle
        
        //如果有特别指定的标题，则使用指定的标题
        if pgTitle != nil && !pgTitle!.isEmpty {
            
            title = pgTitle
            
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)

    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    
        self.webView!.frame.size.height = view.bounds.size.height
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()

        if self.webView != nil{
        
            view.addSubview(self.webView!)
        
            self.webView!.frame.origin = CGPoint(x: 0, y: ScreenUtil.navTotalHeight)
            self.webView!.frame.size = CGSize(width: ScreenUtil.width, height: ScreenUtil.validHeight)
            self.webView!.navigationDelegate = self
            loadRequest()
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }

    
    func loadRequest() {
        
        if let url = openUrl {
            
            if url.isEmpty {
                
                return
                
            }
            if let str = url.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed){
                if let nsUrl = URL(string: str) {
                    let _ = self.webView?.load(URLRequest(url: nsUrl, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 5.0))
                    
                }
            }
        }
        
    }
    
    func getNewWV() {
        
        if let wv = self.webView {
            
            wv.removeFromSuperview()
            self.webView = WKWebView(frame: CGRect(x: 0, y: ScreenUtil.navTotalHeight, width: ScreenUtil.width, height: ScreenUtil.validHeight), configuration: self.config)
            
        }
        
        if let wv = self.webView {
            wv.navigationDelegate = self
//            view.insertSubview(wv, belowSubview: rldVW)
            
        }
        
    }
    
    // MARK: - 实现WKNavigationDelegate
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        
        let app = UIApplication.shared
        let reqUrl = navigationAction.request.url
        
        if let url = reqUrl {
            
            if (url.scheme == "tel" || url.scheme == "mailto") && app.canOpenURL(url) {
                
                app.openURL(url)
                decisionHandler(WKNavigationActionPolicy.cancel)
                
                return
            }
            else if url.scheme == "mbspay"{
                 app.openURL(url)
            }
            
        }
        decisionHandler(WKNavigationActionPolicy.allow)
        
    }
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        
//        let loadStateDel = loadIndicator as LoadStateDelegate
//        loadStateDel.standBy(inView: view, frame: CGRect(x: 0, y: CFakeNaviCtrlDefaults.statusNavHeight, width: ScreenUtil.width, height: ScreenUtil.height - CFakeNaviCtrlDefaults.statusNavHeight))
//        view.bringSubviewToFront(loadIndicator)
//        loadStateDel.loading()
        
    }
    
    func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
        
//        let loadStateDel = loadIndicator as LoadStateDelegate
//        view.bringSubviewToFront(loadIndicator)
//        loadStateDel.failed()
//        
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        
        if title == CWkWVCtrlDefaults.defaultTitle {
            
            title = webView.title
            
        }
        
//        let loadStateDel = loadIndicator as LoadStateDelegate
//        loadStateDel.success()
//
        self.config.websiteDataStore.fetchDataRecords(ofTypes: WKWebsiteDataStore.allWebsiteDataTypes(), completionHandler: {records in
            for record in records{
            }
            
        })
 
    }
    
    func webView(_ webView: WKWebView, runJavaScriptAlertPanelWithMessage message: String, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping () -> Void) {

        let ac = UIAlertController(title: webView.title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        ac.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.cancel, handler: { (a) -> Void in
            completionHandler()
        }))
    }
    
    // MARK: - JS互操作方法
    
    func initHdl(){
        self.ucc.openHdl = BlmOpen(opCb: {[weak self](url) in
            self?.openNewWindow(url: url)
        })
        self.ucc.getVersionHdl = BlmVersion(getVersionCb: {[weak self](cbName,version) in
            self?.getVersion(cbName: cbName, version: version)
        })
        
    }
    
    func openNewWindow(url: String) {
        
        let newCtrl = CWkWVCtrl(url: url)
        
        if let nav = self.navigationController {
            nav.pushViewController(newCtrl, animated: true)
            
        }
        
    }
    
    
    func getVersion(cbName: String, version: String){
        
        let js = "_tools.runCallback(\"\(cbName)\", \"\(version)\");"
        
        self.webView?.evaluateJavaScript(js, completionHandler: nil)
    }
    
    func reload() {
        
        loadRequest()
        
    }
}
