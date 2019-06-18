//
//  ViewController.swift
//  CTranslate
//
//  Created by Александр Лебедько on 19/06/2019.
//  Copyright © 2019 Alexandr Lebedko. All rights reserved.
//

import UIKit
import Typist
import SVProgressHUD

fileprivate var TypistHandle = "uiviewcontroller.typist"


protocol IBindingViewController {
    associatedtype ViewModel
    func bind(to viewModel: ViewModel)
}

class ViewController: UIViewController {
    
    var typist: Typist {
        get {
            var r = objc_getAssociatedObject(self, &TypistHandle) as? Typist
            if r == nil {
                r = Typist()
                objc_setAssociatedObject(self, &TypistHandle, r, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            }
            return r!
        }
        set(newValue) {
            objc_setAssociatedObject(self, &TypistHandle, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    @IBOutlet weak var typistConstraint: NSLayoutConstraint?
    
    private var typistConstraintConstantInitial: CGFloat = 0.0

    init() {
        super.init(nibName: String(describing: type(of: self)), bundle: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.typist
            .on(event: .willShow, do: { [weak self] (opts) in
                guard let `self` = self else { return }
                self.typistConstraintConstantInitial = self.typistConstraint?.constant ?? 0
                self.typistConstraint?.constant = opts.endFrame.size.height
                self.view.layoutIfNeeded()
            })
            .on(event: .willHide, do: { [weak self] (opts) in
                guard let `self` = self else { return }
                self.typistConstraint?.constant = self.typistConstraintConstantInitial ?? 0
                self.view.layoutIfNeeded()
            })
            .start()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.typist.stop()
    }
    
    func setup() {
        
    }
    
    func bind(to viewModel: BaseViewModel) {
        viewModel.alertErrorMessageSignal.observeValues { [weak self] error in
            self?.showAlert(error: error)
        }
        
        viewModel.loadingSignal.observeValues { [weak self] isLoading in
            self?.showLoadingIndicator(isLoading)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func showAlert(error: BaseViewError) {
        let alert = UIAlertController(title: "Error", message: error.message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    func showLoadingIndicator(_ isLoading: Bool) {
        if isLoading {
            SVProgressHUD.show()
        } else {
            SVProgressHUD.dismiss()
        }
    }
}
