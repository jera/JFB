<img src="https://github.com/vitormesquita/JFB/blob/develop/Assets/img_logo_jera1.png">

# J.F.B (Jera Form Builder)

*JFB* is Jera's way to create forms quickly and easily. 

We are using [**Eureka's**](https://github.com/xmartlabs/Eureka) enginee and [**Material**](https://github.com/CosmicMind/Material) components to concept good and beautiful forms.

## Requirements 

- Xcode 9.0+
- Swift 4.0+

## Installation

### Pod

JFB is available through [CocoaPods](http://cocoapods.org). To install following line at Podfile

```ruby
pod 'JFB'
```

### Carthage

*Coming soon*

### Manually

If you don't use any dependency managers, you can use JFB in your project manually just adding the files which contains [JFB Classes](https://github.com/vitormesquita/JFB/tree/master/Source)

You will need to add JFB's dependecies libraries as well:

- [Eureka](https://github.com/xmartlabs/Eureka)
- [Material](https://github.com/CosmicMind/Material)

## Concept

JFB helps you create forms with Material components (other layouts soon), and all concepts of a form like validations, masks ...

<!--We are using Eureka enginee, don't need to know about it, but if you want I think that it's a great knowledge.-->

Basically with a few code's line you can create a form just manipulating the result (to send to API for example)

### FormBuilderViewController

**FormBuilderViewController** is the `UIViewController` that build all fields and create a submit button by default.

To create it you will need pass an Array of **JField** and it's **FormBuilderDelegate** must by be implemented to receive form values as a Dictionary.

#### JField 

It's a protocol that all fields will implement.

**Fields List**

- **JTextField**
- **JDateField**
- **JTimeField**
- (Coming soon others)

By default *JField* needs these attributes:

- **id**: It's the dictionary Key that you'll receive value from form.
- **placeholder**: It's the field's placeholder
- **validations**: Set field's validation.  

## Usage

### How to create a form 

Set your field an Array and call `FormBuilderViewController` passing your fields and delegate

```swift
import JFB

class ViewController: UIViewController {
	
	let loginFormFields: [JField] = [
        JTextField(id: "email", type: .email, placeholder: "E-mail", validations: [.required, .email]),
        JTextField(id: "password", type: .password, placeholder: "Password", validations: [.required,
                                                                                        .minLength(6)])
    ]
    
    lazy var formViewController: FormBuilderViewController = { 
    	return FormBuilderViewController(fields: loginFormFields, delegate: self) 
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    	formViewController.submitText = .white
    	formViewController.submitBackgroundColor = .blue
        formViewController.submitText = "LOGIN"
    }
        
    @IBAction func action(_ sender: Any) {
        let nv = UINavigationController(rootViewController: formViewController)
        present(nv, animated: true)
    }
}

extension ViewController: FormBuilderDelegate {
    
    func formReceivedValues(_ values: [String: Any]) {
        print(values)
    }
}
```
![Photo](https://github.com/vitormesquita/JFB/blob/develop/Assets/example_1.gif)

## Customize

Of course form's layout always needs to be configured. So for this we provide some attributes to configure form layout as you want.

```swift
/// Color to apply at all input tint color and navigation accessory view
open var tintColor: UIColor = Color.blue.base

/// Text to show on submit button
open var submitText: String?

/// Submit button's text color
open var submitTextColor: UIColor

/// Submit button's background color
open var submitBackgroundColor: UIColor

/// Submit button's background color when was disable
open var submitDisableColor: UIColor

/// Submit button's click callback color
open var submitPulseColor: UIColor
```

If you want more customization please let we now, submit an issue explaning what kind of customization you need.

## Author

Vitor Mesquita, vitor.mesquita09@gmail.com

## License

JFB is available under the MIT license. See the LICENSE file for more info.