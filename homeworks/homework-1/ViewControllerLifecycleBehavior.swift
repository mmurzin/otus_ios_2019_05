import UIKit

protocol ViewControllerLifecycleBehavior {
    func afterLoading(_ viewController: UIViewController)
    
    func beforeAppearing(_ viewController: UIViewController)
    
    func afterAppearing(_ viewController: UIViewController)
    
    func beforeDisappearing(_ viewController: UIViewController)
    
    func afterDisappearing(_ viewController: UIViewController)
    
    func beforeLayingOutSubviews(_ viewController: UIViewController)
    
    func afterLayingOutSubviews(_ viewController: UIViewController)
}

extension ViewControllerLifecycleBehavior {
    func afterLoading(_ viewController: UIViewController) {}
    
    func beforeAppearing(_ viewController: UIViewController) {}
    
    func afterAppearing(_ viewController: UIViewController) {}
    
    func beforeDisappearing(_ viewController: UIViewController) {}
    
    func afterDisappearing(_ viewController: UIViewController) {}
    
    func beforeLayingOutSubviews(_ viewController: UIViewController) {}
    
    func afterLayingOutSubviews(_ viewController: UIViewController) {}
}

struct HideNavigationBarBehavior: ViewControllerLifecycleBehavior {
    func beforeAppearing(_ viewController: UIViewController) {
        viewController.navigationController?.setNavigationBarHidden(true, animated: true)
        print("HideNavigationBarBehavior \(#function)")
    }
    
    func beforeDisappearing(_ viewController: UIViewController) {
        viewController.navigationController?.setNavigationBarHidden(false, animated: true)
        print("HideNavigationBarBehavior \(#function)")
    }
}

extension UIViewController {
    /*
     Add behaviors to be hooked into this view controller’s lifecycle.
     
     This method requires the view controller’s view to be loaded, so it’s best to call
     in `viewDidLoad` to avoid it being loaded prematurely.
     
     - parameter behaviors: Behaviors to be added.
     */
    func addBehaviors(behaviors: [ViewControllerLifecycleBehavior]) {
        let behaviorViewController = LifecycleBehaviorViewController(behaviors: behaviors)
        
        addChild(behaviorViewController)
        view.addSubview(behaviorViewController.view)
        behaviorViewController.didMove(toParent: self)
    }
    
    private final class LifecycleBehaviorViewController: UIViewController {
        private let behaviors: [ViewControllerLifecycleBehavior]
        
        // MARK: - Initialization
        
        init(behaviors: [ViewControllerLifecycleBehavior]) {
            self.behaviors = behaviors
            
            super.init(nibName: nil, bundle: nil)
        }
        
        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        // MARK: - UIViewController
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            view.isHidden = true
            
            applyBehaviors { behavior, viewController in
                behavior.afterLoading(viewController)
            }
        }
        
        override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            
            applyBehaviors { behavior, viewController in
                behavior.beforeAppearing(viewController)
            }
        }
        
        override func viewDidAppear(_ animated: Bool) {
            super.viewDidAppear(animated)
            
            applyBehaviors { behavior, viewController in
                behavior.afterAppearing(viewController)
            }
        }
        
        override func viewWillDisappear(_ animated: Bool) {
            super.viewWillDisappear(animated)
            
            applyBehaviors { behavior, viewController in
                behavior.beforeDisappearing(viewController)
            }
        }
        
        override func viewDidDisappear(_ animated: Bool) {
            super.viewDidDisappear(animated)
            
            applyBehaviors { behavior, viewController in
                behavior.afterDisappearing(viewController)
            }
        }
        
        override func viewWillLayoutSubviews() {
            super.viewWillLayoutSubviews()
            
            applyBehaviors { behavior, viewController in
                behavior.beforeLayingOutSubviews(viewController)
            }
        }
        
        override func viewDidLayoutSubviews() {
            super.viewDidLayoutSubviews()
            
            applyBehaviors { behavior, viewController in
                behavior.afterLayingOutSubviews(viewController)
            }
        }
        
        // MARK: - Private
        
        private func applyBehaviors(body: (_ behavior: ViewControllerLifecycleBehavior, _ viewController: UIViewController) -> ()) {
            guard let parentViewController = parent else { return }
            
            for behavior in behaviors {
                body(behavior, parentViewController)
            }
        }
    }
}
