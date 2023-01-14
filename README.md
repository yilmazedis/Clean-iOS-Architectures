# Clean-iOS-Architectures

## MVP vs MVVM
MVP (Model-View-Presenter) and MVVM (Model-View-ViewModel) are both architectural patterns for designing the structure of a software application, particularly for building user interfaces. However, there are some key differences between the two:

MVP focuses on separating the logic of the user interface from the actual user interface components. In MVP, the presenter acts as a bridge between the model and the view, handling the logic of the user interface and updating the view accordingly.

MVVM, on the other hand, is designed to support the separation of concerns and testability. In MVVM, the ViewModel acts as a bridge between the model and the view, handling the logic of the user interface and updating the view accordingly, similar to MVP. The ViewModel also communicates with the model, but it exposes data to the view via properties and commands, and it also exposes events the view can bind to, which makes it more testable.

As you can see, the MVVM implementation is a bit more concise and it's easy to see that the ViewModel is decoupled from the View, which makes it more testable. Note: the above codes are just an example, it may not run as is because it's missing some part of the code such as imports and dependencies,  also you may need to adjust the example to fit your use case.

In summary, MVVM is an extension of MVP that is designed to provide better support for testability and separation of concerns, while MVP is primarily focused on separating the logic of the user interface from the actual user interface components.

## VIP
In this example, the ViewController class conforms to the ViewProtocol and is responsible for displaying the data to the user and handling user interactions. It also has properties for the InteractorProtocol and PresenterProtocol to communicate with them.

The Interactor class conforms to the InteractorProtocol and is responsible for handling the business logic and fetching data from an external service. It communicates with the Presenter class through the PresenterProtocol property.

The Presenter class conforms to the PresenterProtocol and is responsible for formatting the data received from the interactor and sending it back to the view to be displayed to the user.

When the view loads, it calls the fetchData method on the interactor, and the interactor fetches the data from an external service and sends it to the presenter. The presenter then formats the data and sends it back to the view.

Note: 
In the example I provided, the ViewController class has a property presenter: PresenterProtocol? because it needs to communicate with the Presenter class. The presenter is responsible for formatting the data received from the interactor and sending it back to the view to be displayed to the user.

The ViewController class, being the view, is responsible for displaying the data to the user and handling user interactions. To accomplish this, it needs to receive the formatted data from the presenter. The presenter property allows the ViewController to communicate with the Presenter class and receive the formatted data.

It's worth noting that, in some cases, the Presenter may not be necessary and the Interactor can send the data directly to the View. Also, it's important to keep in mind that, the VIP pattern is flexible and it can be change to fit the project requirements.
