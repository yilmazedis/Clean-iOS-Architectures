// The Model
class DataModel {
    var data: String = ""
}

// The ViewModel
class ViewModel {
    var model: DataModel
    var data: String {
        return model.data
    }

    init(model: DataModel) {
        self.model = model
    }

    func loadData() {
        model.data = "Some data"
    }
}

// The View
class ViewController: UIViewController {
    @IBOutlet weak var dataLabel: UILabel!
    var viewModel: ViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        let model = DataModel()
        viewModel = ViewModel(model: model)
        viewModel.loadData()
        dataLabel.text = viewModel.data
    }
}
