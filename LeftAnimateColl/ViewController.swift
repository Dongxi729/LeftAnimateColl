//
//  ViewController.swift
//  LeftAnimateColl
//
//  Created by 郑东喜 on 2018/3/1.
//  Copyright © 2018年 郑东喜. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let centerV = CustomCollect.init(["1","2","3","4","5","6","7","8"],["abc","abc","abc","abc","abc","abc","abc","abc"],
                                        CGRect.init(x: 0, y: 100, width: 200, height: 400),
                                        CGSize.init(width:200 / 2 - COMMON_MARGIN / 2 , height: 200 / 2 - COMMO	N_MARGIN))
        centerV.backgroundColor = UIColor.gray
        view.addSubview(centerV)
    }
}

