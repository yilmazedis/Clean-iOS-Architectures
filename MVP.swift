// The Model
class DataModel {
    var data: String = ""
}

// The View
protocol ViewDelegate: AnyObject {
    func updateView(data: String)
}

class ViewController: UIViewController, ViewDelegate {
    @IBOutlet weak var dataLabel: UILabel!
    var presenter: Presenter!

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = Presenter(view: self)
    }

    func updateView(data: String) {
        dataLabel.text = data
    }
}

// The Presenter
class Presenter {
    weak var view: ViewDelegate?
    var model = DataModel()

    init(view: ViewDelegate) {
        self.view = view
    }

    func loadData() {
        model.data = "Some data"
        view?.updateView(data: model.data)
    }
}
