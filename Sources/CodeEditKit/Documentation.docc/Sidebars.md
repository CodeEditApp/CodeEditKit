# ``CodeEditKit/SidebarExtension``

@Metadata {
    @DocumentationExtension(mergeBehavior: append)
}

Navigator & Inspector UI Extensions

## Overview

The ``SidebarExtension`` protocol takes care of Navigator and Inspector extensions. These extensions are added to the tabbar of each sidebar, and can be selected by the user.

## Example

```swift
@main
final class SidebarExtensionExample: CodeEditExtension {
    var description: String = ""

    var entitlements: [Entitlement] = []
}

extension SidebarExtensionExample: SidebarExtension {
    var sidebars: some Sidebar {
        Inspector(id: "umbrellaInspector") {
            Form {
                Text("Hello, world!")
            }
            .formStyle(.grouped)
        }
        .help("Umbrella Inspector")
        .icon("umbrella")

        Navigator(id: "carrotNavigator") {
            Form {
                Text("Hello, world!")
            }
            .formStyle(.grouped)
        }
        .help("Carrot Navigator")
        .icon("carrot")
    }
}

```

## Topics

### Sidebar Modifiers

- ``Sidebar/help(_:)``
- ``Sidebar/icon(_:)``
- ``Sidebar/description(_:)``
- ``Sidebar/title(_:)``
