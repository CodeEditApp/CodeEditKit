# ``CodeEditKit``

CodeEditKit is a dynamic library which is shared between CodeEdit and it's extensions. It allows them to communicate with and understand one another.

## Overview

Extensions are an essential part of CodeEdit. They can extend the languages CodeEdit supports, add custom actions and behaviors, and even provide custom views of certain data.

CodeEditKit aims to provide an easy and straightforward API to implement these extensions, with modern technologies like Swift, SwiftUI and ExtensionKit.

### Extension Types

There are lots of extension types you can use to extend the functionality of CodeEdit.

#### General Extensions
- <doc:Commands>
- <doc:Themes>

#### Language Extensions
- <doc:Snippets>
- <doc:LanguageServers>

#### UI Extensions
- <doc:Sidebars>
- <doc:ToolbarItems>
- <doc:Settings>

### Getting Started
First, have a look at ``CodeEditExtension``. This is the base protocol that will define the main structure of your extension.
All extensions that you'll add will extend (:p) this type.

Next, try adding an extension to your newly created type. A good first recommendation is the <doc:Settings> extension, as you'll likely need this later.
