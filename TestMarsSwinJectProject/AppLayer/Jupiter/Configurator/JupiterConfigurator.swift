//
//  JupiterConfigurator.swift
//  TestMarsSwinJectProject
//
//  Created by Mishel on 07/03/2021.
//  Copyright © 2021 Misha. All rights reserved.
//

import Swinject
import UIKit

final class JupiterConfigurator: NSObject, Assembly {

    // MARK: - Public Properties
    public var container: Container!

    func assemble(container: Container) {
        self.container = container
        configure(container: container)
    }
    
    private func configure(container: Container) {

        // Assembly View Layer
        container
            .register(JupiterViewProtocol.self) { _ in JupiterViewController() }
            .initCompleted { r, c in
                guard let view = c as? JupiterViewController else { return }
                view.presenter = r.resolve(JupiterPresenterProtocol.self)
            }

        // Assembly Router Layer
        container
            .register(JupiterRouterProtocol.self) { _ in JupiterRouter() }
            .initCompleted { _, c in
                guard let router = c as? JupiterRouter else { return }
                router.configurator = self
            }

        // Assembly Presenter Layer
        container
            .register(JupiterPresenterProtocol.self) { _ in JupiterPresenter() }
            .initCompleted { r, c in
                guard let presenter = c as? JupiterPresenter else { return }
                presenter.view = r.resolve(JupiterViewProtocol.self)
                presenter.router = r.resolve(JupiterRouterProtocol.self)
                presenter.interactor = r.resolve(JupiterInteractorProtocol.self)
            }

        // Assembly Interactor Layer
        container
            .register(JupiterInteractorProtocol.self) { _ in JupiterInteractor() }
            .initCompleted { r, c in
                guard let interactor = c as? JupiterInteractor else { return }
                interactor.presenter = r.resolve(JupiterPresenterProtocol.self)
            }
    }
}

// MARK: - ConfiguratorView
extension JupiterConfigurator: ConfiguratorView {
    func getView() -> UIViewController {
        container.resolveAsViewController(JupiterViewProtocol.self)
    }
}
