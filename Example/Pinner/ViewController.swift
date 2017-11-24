//
//  ViewController.swift
//  Pinner
//
//  Created by DenisLitvin on 10/28/2017.
//  Copyright (c) 2017 DenisLitvin. All rights reserved.
//

import UIKit
import Pinner

class ViewController: UIViewController {

    let canvasView: UIView = {
        let view = UIView()
        view.layer.borderColor = UIColor.red.cgColor
        view.layer.borderWidth = 5
        return view
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .blue
        setupView()
    }

    private func setupView() {
        view.addSubview(canvasView)
        self.fillSafeArea(with: canvasView)
    }

}

