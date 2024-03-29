# Project Setup

## Overview

To start developing extensions, you first need to configure your project.

## Steps

This is a WIP, and should be explained better.

1. Create a new Xcode project. As the template, choose "App" (make sure you select the macOS tab, not the multiplatform tab)
2. Once created, go to File -> New -> Target. In the macOS tab, choose "Generic Extension". Enter a name, enable the checkbox for UI support, and leave the other things default. Click "activate" on the popup.
3. In the folder of your new extension, a new "Info" plist file should have been created. In it, replace the value of EXExtensionPointIdentifier with "codeedit.extension" (no quotation marks)
4. Next, add CodeEditKit as a dependency. If you have CodeEditKit as a local package, first make sure no other Xcode projects that also rely on that package are opened. Otherwise, Xcode won't find the package.
5. Go to the project configuration, select the target with the name of your extension, and go to the general tab. There, add CodeEditKit to the "Frameworks and Libraries" section.
6. Now, go to the main swift file in the extension folder. Remove all autogenerated code, we won't need it. Instead, import CodeEditKit and follow the steps for ``CodeEditExtension``.
7. Lastly, press run! The extension will compile and Xcode will ask which app to start. Choose CodeEdit. To prevent this popup from always showing, you can edit the extension scheme to always choose CodeEdit.

## Topics

### <!--@START_MENU_TOKEN@-->Group<!--@END_MENU_TOKEN@-->

- <!--@START_MENU_TOKEN@-->``Symbol``<!--@END_MENU_TOKEN@-->
