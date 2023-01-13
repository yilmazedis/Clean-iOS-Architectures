# Clean-iOS-Architectures

## MVP vs MVVM
MVP (Model-View-Presenter) and MVVM (Model-View-ViewModel) are both architectural patterns for designing the structure of a software application, particularly for building user interfaces. However, there are some key differences between the two:

MVP focuses on separating the logic of the user interface from the actual user interface components. In MVP, the presenter acts as a bridge between the model and the view, handling the logic of the user interface and updating the view accordingly.

MVVM, on the other hand, is designed to support the separation of concerns and testability. In MVVM, the ViewModel acts as a bridge between the model and the view, handling the logic of the user interface and updating the view accordingly, similar to MVP. The ViewModel also communicates with the model, but it exposes data to the view via properties and commands, and it also exposes events the view can bind to, which makes it more testable.

MVP is more suitable for the traditional event-driven UI like WinForms, WPF and Silverlight, while MVVM is more suitable for a data-driven UI like Xamarin, UWP and Angular.

As you can see, the MVVM implementation is a bit more concise and it's easy to see that the ViewModel is decoupled from the View, which makes it more testable. Note: the above codes are just an example, it may not run as is because it's missing some part of the code such as imports and dependencies,  also you may need to adjust the example to fit your use case.

In summary, MVVM is an extension of MVP that is designed to provide better support for testability and separation of concerns, while MVP is primarily focused on separating the logic of the user interface from the actual user interface components.
