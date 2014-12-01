//
//  ViewController.swift
//  swiftWebBrowser
//
//  Created by Jian Chen on 14/11/25.
//  Copyright (c) 2014年 forall.com.cn. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIWebViewDelegate, UITextFieldDelegate {
    
    @IBOutlet var webView:UIWebView!
    @IBOutlet var textField:UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let myURL = NSURL(string:"http://cnn.com")
        let request = NSURLRequest(URL: myURL!)
        webView.loadRequest(request)
        //
        
        
    }
    
    func webViewDidStartLoad(webView: UIWebView) {
        UIApplication.sharedApplication().networkActivityIndicatorVisible = true
    }
    
    
    func webViewDidFinishLoad(webView: UIWebView) {
        UIApplication.sharedApplication().networkActivityIndicatorVisible = false
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @IBAction func textDone() {
        let typedURL = textField.text
        if(typedURL.isEmpty) {
            return
        }
        let newURL = NSURL(string: typedURL)
        let request = NSURLRequest(URL: newURL!)
        webView.loadRequest(request)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

