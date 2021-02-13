# MieContacts

MieContacts is a tool that provides a more SwiftUI-like way to allow a user to select contacts from the user's device.

## Table of Contents
1. [Restrictions](#restrictions)
2. [Implementation](#implementation)
3. [Assistance](#assistance)
    1. [Bug Reports](#bugs)
    2. [Pull Requests](#pr)
4. [Future](#futute)
5. [License](#license)

## Restrictions <a name="restrictions" />
This package is designed for iOS devices as it uses `UIImage` within the `Contact` class. Thus, the entirety of the package is constrained to being only available to iOS devices using iOS 14 or later.

If you have the knowledge and would like to assist, see [Assistance](#assistance) and [Future](#future) for more information for guidlines on how to help.

## Implementation <a name="implementation" />

The `ContactPicker` is the meat and potatoes of `MieContacts`. It is best presented as a sheet, but should be able to be presented in a `NavigationView` or other view **(this is untested as of 1.0.0)**. 

Setup is minimal with this package. The only requirements to using this package is that you ask the user permission to access the contacts on their device before displaying the `ContactPicker`. If you do not request permission, the `ContactPicker` will still display, but it will show an empty list as the initial fetch will fail.

**NOTE:** As per Apple's [Human Interface Guidelines](https://www.google.com/url?sa=t&rct=j&q=&esrc=s&source=web&cd=&cad=rja&uact=8&ved=2ahUKEwi0q8nC8ufuAhVCV80KHSYBC_UQFjAAegQIAhAD&url=https%3A%2F%2Fdeveloper.apple.com%2Fdesign%2Fhuman-interface-guidelines%2F&usg=AOvVaw1QqCgzAJ0ep7fzV3GvVn4g), it is suggested to only ask for permissions only when absolutely neccessary. 

## Assistance <a name="assistance" />
There are several ways that you can help with MieContacts, if you want. You can either submit a [Bug Report](#bugs) or a [Pull Request](#pr). 

### Bug Reporting <a name="bugs" />
When submitting a bug report, please open a new issue on [GitHub](https://github.com/Michaelcraun/MieContacts/issues). Be as descripitive as possible and (if possible) feel free to add any images or stack dumps you feel will be helpful.

### Pull Requests <a name="pr" />
If you are so inclined, you can also submit a [pull request](https://github.com/Michaelcraun/MieContacts/pulls). When you submit your pull request, please be sure to comment your code thoroughly. If there are no comments to your code or if it's not written cleanly, I won't even look at it... #sorrynotsorry

## Future <a name="future" />
There are several items that still need to be implemented in `MieContacts`. I've created a short list below of the things I plan on implementing in the future:
  • Flesh out and complete the `Contact.valueFor(key:)` function
  • Add option to view contact before selecting contact (if selecting a singular contact)
  • Make the nvigation buttons of `ContactPicker` dynamic
  • Add a way to filter the `ContactPicker`'s displayed contacts according to a specific key

## License <a name="license" />
MIT License

Copyright (c) 2021 MieTech LLC

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
