protocol Coordinator {
    var navigationController: UINavigationController { get set }
    func start()
}

protocol LoginCoordinatorDelegate: AnyObject {
    func loginDidSucceed()
}

class LoginCoordinator: Coordinator, LoginViewControllerDelegate  {
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let viewModel = LoginViewModel()
        let viewController = LoginViewController(viewModel: viewModel)
        viewController.delegate = self
        navigationController.pushViewController(viewController, animated: true)
    }
  
    func loginDidSucceed() {
        delegate?.loginDidSucceed()
    }
}
