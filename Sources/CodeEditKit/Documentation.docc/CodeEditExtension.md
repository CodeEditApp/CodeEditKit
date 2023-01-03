# ``CodeEditKit/CodeEditExtension``

@Metadata {
    @DocumentationExtension(mergeBehavior: append)
}

The mother of all extensions.

## Overview

All extensions supported by CodeEdit are defined as a ``CodeEditExtension``.
This protocol provides basic information about the extension, such as the ``description``, name and ``entitlements``.

This type is the entrypoint of your extension, so it should be marked with `@main`.

Additional extensions can be defined by extending the struct that implements ``CodeEditExtension``.

## Example

```swift
@main
final class ExampleExtension: CodeEditExtension {
    var description: String = "test"

    var entitlements: [Entitlement] = [.currentfile]
}

// Add a Settings Pane
extension ExampleExtension: SettingsExtension {
    var settings: some View {
        SettingsView()
    }
}

// The Settings View
struct SettingsView: View {
    @State var enabled = false
    var body: some View {
        Toggle("Enabled", isOn: $enabled)
    }
}
```

> Info: ``CodeEditExtension`` Conforms to ObservableObject and is automatically injected into the environment of each View. This way, it's possible to have shared state between different UI extensions by observing the object in a View.
> ```swift
>   struct AView: View {
>       @EnvironmentObject var main: ExampleExtension
>   }
> ```



## Topics

### <!--@START_MENU_TOKEN@-->Group<!--@END_MENU_TOKEN@-->

- <!--@START_MENU_TOKEN@-->``Symbol``<!--@END_MENU_TOKEN@-->
