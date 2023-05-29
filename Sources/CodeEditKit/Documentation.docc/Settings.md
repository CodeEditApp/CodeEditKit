# Settings

<!--@START_MENU_TOKEN@-->Summary<!--@END_MENU_TOKEN@-->

## Overview

The ``SettingsExtension`` allows an extension to provide additional settings to the settings window of CodeEdit.
Extension-specific settings can be configured this way.

``SettingsExtension`` expects a SwiftUI View and doesn't take care of the storage of settings. Therefore, you are responsible for storing your extensions' settings in an appropriate manner.

## Example

```swift
@main
final class SettingsExampleExtension: CodeEditExtension {

    var description: String = ""

    var entitlements: [Entitlement] = [.currentfile]

}

extension SettingsExampleExtension: SettingsExtension {
    var settings: some View {
        SettingsView()
    }
}

struct SettingsView: View {
    @AppStorage("appstoragekey") var appstoragekey = false

    var body: some View {
        Toggle("App Storage Key", isOn: $appstoragekey)
    }
}
```

## Topics

### <!--@START_MENU_TOKEN@-->Group<!--@END_MENU_TOKEN@-->

- <!--@START_MENU_TOKEN@-->``Symbol``<!--@END_MENU_TOKEN@-->
