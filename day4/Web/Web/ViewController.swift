//
//  ViewController.swift
//  Web
//
//  Created by Dongduk3 on 2022/06/27.
//

import UIKit
import WebKit

//액티비티 인디케이터 구현하기
class ViewController: UIViewController , WKNavigationDelegate{

    @IBOutlet var txtUrl: UITextField!
    @IBOutlet var myWebView: WKWebView!
    @IBOutlet var myActivityIndicator: UIActivityIndicatorView!
    
    func loadWebPage(_ url: String) {
        let myUrl = URL(string: url)
        let myRequest = URLRequest(url: myUrl!)
        
        //액티비티 인디케이터 구현하기
        myWebView.navigationDelegate = self
        myWebView.load(myRequest)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        loadWebPage("http://www.naver.com")
    }
    
    //액티비티 인디케이터 구현하기
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        myActivityIndicator.startAnimating()
        myActivityIndicator.isHidden=false
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        myActivityIndicator.stopAnimating()
        myActivityIndicator.isHidden=true
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        myActivityIndicator.stopAnimating()
        myActivityIndicator.isHidden=true
    }
    
    func checkUrl(_ url: String) -> String {
        var strUrl = url
        let flag = strUrl.hasPrefix("http://")
        
        if !flag {
            strUrl = "http://" + strUrl
        }
        
        return strUrl
    }
    
    @IBAction func btnGotoUrl(_ sender: UIButton) {
        let myUrl = checkUrl(txtUrl.text!)
        txtUrl.text=myUrl
        loadWebPage(myUrl)
    }
    
    @IBAction func btnGoSite1(_ sender: UIButton) {
        loadWebPage("http://fallinmac.tistory.com")
    }
    
    @IBAction func btnGoSite2(_ sender: UIButton) {
        loadWebPage("http://blog.2sam.net")
    }
    
    @IBAction func btnLoadHtmlString(_ sender: UIButton) {
        let htmlString = "<p><a href=\"http://2sam.net\">2sam</a>으로 이동</p>"
        
        myWebView.loadHTMLString(htmlString, baseURL: nil)
    }
    
    @IBAction func btnLoadHtmlFile(_ sender: UIButton) {
    }
    
    
    @IBAction func btnStop(_ sender: UIBarButtonItem) {
        myWebView.stopLoading()
    }
    
    @IBAction func btnReload(_ sender: UIBarButtonItem) {
        myWebView.reload()
    }
    
    @IBAction func btnGoBack(_ sender: UIBarButtonItem) {
        myWebView.goBack()
    }
    
    @IBAction func btnGoForward(_ sender: UIBarButtonItem) {
        myWebView.goForward()
    }
}

