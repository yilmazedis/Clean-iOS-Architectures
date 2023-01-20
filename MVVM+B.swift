//  SimpleBinding can be used to wrap a value and provide a way for the view to observe changes to the value.

class SimpleBinding<T> {
    var value: T {
        didSet {
            self.observer?(value)
        }
    }

    private var observer: ((T) -> Void)?

    init(_ value: T) {
        self.value = value
    }

    func bind(observer: @escaping (T) -> Void) {
        self.observer = observer
    }
}

class MyViewModel {
    var name = SimpleBinding("")
    var age = SimpleBinding(0)

    init(model: MyModel) {
        self.name.value = model.name
        self.age.value = model.age
    }

    func updateName(_ name: String) {
        self.name.value = name
    }
}

/*

In this example, SimpleBinding class wraps a value of any type T and it has a property observer of type ((T) -> Void). This property is of type ((T) -> Void) which is a closure that accepts a value of type T and returns nothing, it is used to notify the observer of any change to the wrapped value.

The MyViewModel class has two properties name and age of type SimpleBinding<String> and SimpleBinding<Int> respectively. The initializer of MyViewModel takes a model object and assigns the values of the model's properties to the SimpleBinding properties.

The MyViewModel class also has a method updateName that allows the view to update the name property of the view model, which in turn updates the corresponding property in the model.

Now the view can bind to the properties of the view model and observe the changes, for example,

*/


let viewModel = MyViewModel(model: myModel)
viewModel.name.bind { newValue in
    print("Name is now: \(newValue)")
}

/*

In this example, the view binds to the name property of the view model using the bind method and provides a closure that is called whenever the value of name changes.

This way the view can observe changes to the value without knowing the implementation details of the view model.

*/


class MyViewController: UIViewController {
    var viewModel = MyViewModel(model: MyModel())

    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel.name.bind { [weak self] newValue in
            self?.nameLabel.text = newValue
        }

        viewModel.age.bind { [weak self] newValue in
            self?.ageLabel.text = String(newValue)
        }
    }

    @IBAction func nameTextFieldChanged(_ sender: UITextField) {
        viewModel.updateName(sender.text ?? "")
    }
}


// ----------
// Here's an example of how you could update the SimpleBinding class to allow for multiple observers:

class SimpleBinding<T> {
    var value: T {
        didSet {
            self.observers.forEach { $0(value) }
        }
    }

    private var observers: [(T) -> Void] = []

    init(_ value: T) {
        self.value = value
    }

    func bind(observer: @escaping (T) -> Void) {
        self.observers.append(observer)
    }
}

/*

In this example, instead of having a single observer property, the SimpleBinding class has an array of observers observers property. When the value of the binding is changed, the didSet observer will call all the observer closures in the array, passing in the new value.

The bind method is updated to append the observer closure to the observers array.

Now, multiple observers can be added to the same property of the view model, for example:

*/

let viewModel = MyViewModel(model: myModel)
viewModel.name.bind { newValue in
    print("Name is now: \(newValue)")
}

viewModel.name.bind { newValue in
    print("Name has changed: \(newValue)")
}

