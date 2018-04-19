## Fields

### JTextField

JTextField is simple field that can be applied some configs to increase it power.

```swift
public init(id: String,
                type: TextFieldType,
                placeholder: String? = nil,
                validations: [ValidationType] = []) { 
					...
				}
```

- **type**: Set type of field, set field config and mask if needed.
	- 	email
	-  password
	-  text
	-  name
	-  phone
	-  cpf
	
-

### JDateField

JDateField is a field that `inputView` is `UIDatePicker` just with date (days, months and years)

```swift
init(id: String,
         placeholder: String? = nil,
         validations: [ValidationType] = [],
         minDate: Date? = nil,
         maxDate: Date? = nil,
         displayFormat: String = "dd/MM/yyyy") {
         	...
         }
```

- **minDate**: Minimum date to set on `UIDatePicker`.
- **maxDate**: Maximum date to set on `UIDatePicker`.
- **displayFormat**: It's a format that value will be showed in field. (Need be a valid format)

-

### JTimeField

JTimeField is a field that `inputView` is `UIDatePicker` just with time (hours and minutes)

```swift
init(id: String,
         placeholder: String? = nil,
         validations: [ValidationType] = [],
         minInterval: Int? = nil) {
         	...
         }
```

- **minInterval**: Interval in minutes.