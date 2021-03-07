//
//  JupiterViewController.swift
//  TestMarsSwinJectProject
//
//  Created by Mishel on 07/03/2021.
//  Copyright © 2021 Misha. All rights reserved.
//

import UIKit

final class JupiterViewController: UIViewController, JupiterViewProtocol {

    // MARK: - Public Properties

    var presenter: JupiterPresenterFromViewProtocol!

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
        view.backgroundColor = .yellow
    }

}
