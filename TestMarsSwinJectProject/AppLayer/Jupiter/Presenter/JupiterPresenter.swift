//
//  JupiterPresenter.swift
//  TestMarsSwinJectProject
//
//  Created by Mishel on 07/03/2021.
//  Copyright © 2021 Misha. All rights reserved.
//

import Foundation

final class JupiterPresenter: JupiterPresenterFromViewProtocol {

    // MARK: - Public Properties

    weak var view: JupiterViewProtocol!
    var interactor: JupiterInteractorProtocol!
    var router: JupiterRouterProtocol!

    // MARK: - Protocol Implementation

    func viewDidLoad() {

    }

}

// MARK: - JupiterPresenterFromInteractorProtocol Implementation
extension JupiterPresenter: JupiterPresenterFromInteractorProtocol {}
