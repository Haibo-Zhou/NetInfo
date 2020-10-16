# Overview
NetInfo is an interview takeHome test I received recently, it is an iOS app and is written in Swift5.


#### Requirements: 
iOS 12+, as Apple's `Network` framework is a newer one than `Reachability`, which requires iOS >= 12.

#### Libary & Framework used:
- UIKit
- Network
- [SwiftSocket](https://github.com/swiftsocket/SwiftSocket)

  
#### What is supported:
- Utilize `Network` framework to get gateway(router)'s IP address.
- Utilize `SwiftSocket` to get all open ports of current server IP address，support user to input port range.
- User interface is created in `UIKit`.
- Involve `auto-layout` to adopt all iPhones type.
- Used MVC as design pattern.
- Supported on Dark Mode.
- All images/icons are using Apple's built-in SF Symbol 2.0.


#### Screenshots:
![Alt Text](https://img9.doubanio.com/view/photo/l/uBK3sndLDGO4hBgIpNRxYA/46200905/x2623106626.jpg)
![Alt Text](https://img9.doubanio.com/view/photo/l/ahQhP3-ucVdBQ_xDo2uODQ/46200905/x2623106625.jpg)
![Alt Text](https://img9.doubanio.com/view/photo/l/kzvdx8VuwxbR9-J7atDgjA/46200905/x2623106624.jpg)

#### Note:
- Only `Gateway Info` & `Port Scan` is functional now. Other functions in the tableView are just placeholder.
