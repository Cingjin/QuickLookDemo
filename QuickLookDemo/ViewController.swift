//
//  ViewController.swift
//  QuickLookDemo
//
//  Created by Anmo on 2020/1/21.
//  Copyright © 2020 com.Cingjin. All rights reserved.
//

import UIKit
import QuickLook

class ViewController: UIViewController,QLPreviewControllerDelegate,QLPreviewControllerDataSource {
    
    // 预览控制
    fileprivate var preViewController = QLPreviewController.init()
    // 文件路径
    fileprivate var filePath = Bundle.main.path(forResource: "test", ofType: ".docx")
    
    override func viewDidLoad() {
        super.viewDidLoad()

        preViewController.delegate = self
        preViewController.dataSource = self
        preViewController.view.frame = self.view.frame;
        self.view.addSubview(preViewController.view)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self .present(preViewController, animated: true) {
            
        }
    }
    
    // MARK: - QLPreviewControllerDelegate
    
    func numberOfPreviewItems(in controller: QLPreviewController) -> Int {
        return 1
    }
    
    func previewController(_ controller: QLPreviewController, previewItemAt index: Int) -> QLPreviewItem {
        return  URL.init(fileURLWithPath: filePath!) as QLPreviewItem
    }
    
    
}

