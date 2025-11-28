# AntigravityLoader
AntigravityLoader is a lightweight, customizable circular progress loader for iOS using CAShapeLayer and Core Animation. It offers smooth animated progress, with control over colors, line width, and duration. Easily added to any UIView or storyboard via @IBInspectable, supporting seamless dynamic progress updates.


 ## Requirements

 ### iOS 12.0+
 ### Xcode 13

 ## Installation

 ###### AntigravityLoader is also available through CocoaPods. To install it, simply add the following line to your Podfile:
 ###### pod 'AntigravityLoader', '~> 1.0.0'

 ## Usage
 ###### 1. Change the class of a view from UIView to AntigravityLoader and make outlet of view and access setUp Method.

 ```swift
 import AntigravityLoader
   
  @IBOutlet weak var antigravityLoader:AntigravityLoader
  
  override func viewDidLoad() {
         super.viewDidLoad()
         // Do any additional setup after loading the view.
         setUpProgressView()
     }
     
     func setUpProgressView(){
         antigravityLoader.setProgress(toProgress: 0.5)
         
         DispatchQueue.main.asyncAfter(deadline: .now()+1.0, execute: {
             antigravityLoader.setProgress(toProgress: 0.8)
         })
         
         DispatchQueue.main.asyncAfter(deadline: .now()+2.0, execute: {
             antigravityLoader.setProgress(toProgress: 0.9)
         })
         
         DispatchQueue.main.asyncAfter(deadline: .now()+5.0, execute: {
             antigravityLoader.setProgress(toProgress: 1)
         })
        
     }
    ```

    ###### 2. Programmatically

 ```Swift
 class ViewController: UIViewController {

     override func viewDidLoad() {
         super.viewDidLoad()
         // Do any additional setup after loading the view.
         
         
     }
     
     override func viewDidAppear(_ animated: Bool) {
         super.viewDidAppear(animated)
         setUpProgressView()
     }
     
     func setUpProgressView(){
         let progressView = AntigravityLoader(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
         progressView.setProgress(toProgress: 0.5)
         progressView.center = self.view.center
         self.view.addSubview(progressView)
         
         DispatchQueue.main.asyncAfter(deadline: .now()+1.0, execute: {
             progressView.setProgress(toProgress: 0.8)
         })
         
         DispatchQueue.main.asyncAfter(deadline: .now()+2.0, execute: {
             progressView.setProgress(toProgress: 0.9)
         })
         
         DispatchQueue.main.asyncAfter(deadline: .now()+5.0, execute: {
             progressView.setProgress(toProgress: 1)
         })
        
     }
 }
 ```

 ## Documentation

 ###### Full documentation is available on CocoaDocs.


 ## Author

 ###### Rekha Dhindwal, Rekhadhindwal2025@gmail.com

 ## License

 ###### AntigravityLoader is available under the MIT license. See the LICENSE file for more info.


