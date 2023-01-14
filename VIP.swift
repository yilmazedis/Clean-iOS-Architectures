protocol ViewProtocol: AnyObject {
    func updateData(data: [String])
}

protocol InteractorProtocol {
    func fetchData()
}

protocol PresenterProtocol: AnyObject {
    func dataFetched(data: [String])
}

class ViewController: UIViewController, ViewProtocol {
    var interactor: InteractorProtocol?
    // var presenter: PresenterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        interactor?.fetchData()
    }

    func updateData(data: [String]) {
        // update the UI with the data
    }

    // user interaction methods
    @IBAction func buttonTapped(_ sender: UIButton) {
        interactor?.fetchData()
    }
}

class Interactor: InteractorProtocol {
    weak var presenter: PresenterProtocol?

    func fetchData() {
        // fetch data from an external service
        let data = ["item 1", "item 2", "item 3"]
        presenter?.dataFetched(data: data)
    }
}

class Presenter: PresenterProtocol {
    weak var view: ViewProtocol?

    func dataFetched(data: [String]) {
        view?.updateData(data: data)
    }
}
