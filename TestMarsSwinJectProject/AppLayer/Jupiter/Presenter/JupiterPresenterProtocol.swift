//
//  JupiterPresenterProtocol.swift
//  TestMarsSwinJectProject
//
//  Created by Mishel on 07/03/2021.
//  Copyright © 2021 Misha. All rights reserved.
//

import Foundation

protocol JupiterPresenterFromViewProtocol: class {
    func viewDidLoad()
}

protocol JupiterPresenterFromInteractorProtocol: class {}

typealias JupiterPresenterProtocol 
    = JupiterPresenterFromViewProtocol & JupiterPresenterFromInteractorProtocol
