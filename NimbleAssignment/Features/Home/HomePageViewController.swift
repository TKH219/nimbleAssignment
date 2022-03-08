//
//  HomePageViewController.swift
//  NimbleAssignment
//
//  Created by Trần Khánh Hà on 03/03/2022.
//

import SnapKit
import UIKit

enum Step: CaseIterable {
    case step1
    case step2
    case step3
    
    var index: Int {
        switch self {
        case .step1:
            return 0
        case .step2:
            return 1
        case .step3:
            return 2
        }
    }
}

class HomePageViewController : UIPageViewController {
    
    private var pageController: UIPageViewController?
    private var steps: [Step] = Step.allCases
    private var currentIndex: Int =  0 {
        didSet
        {
            self.pageControl.currentPage = self.currentIndex
            if(self.currentIndex >= Step.step3.index) {
//                self.nextButton.setTitle("onbooading_button_title_step_4", for: .normal)
                
            }
            else {
//                    self.nextButton.setTitle("onbooading_button_title_step_1_2_3", for: .normal)
            }
        }
    }
    
    
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    lazy var pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        
        pageControl.numberOfPages = Step.allCases.count
        pageControl.currentPage = self.currentIndex
        pageControl.pageIndicatorTintColor = .gray
        pageControl.currentPageIndicatorTintColor = .white
        
        return pageControl
    }()
    
    lazy var nextButton: RoundedButton = {
        let button = RoundedButton(imageString: "circle_button")
        button.addTarget(self, action: #selector(onTapNextButton), for: .touchUpInside)
        return button
    }()
    
    lazy var profileButton: RoundedButton = {
        let button = RoundedButton(imageString: "user_profile")
        button.addTarget(self, action: #selector(onTapUserProfileButton), for: .touchUpInside)
        return button
    }()
    
    lazy var dateTimeTitle: TitleLabel = {
        var titleString = Date().string(usingFormat: EEEE_MMMM_D).uppercased()
        let label = TitleLabel(titleString: titleString)
        label.font = Font.bold.size(13)
        return label
    }()
    
    lazy var todayTitle: TitleLabel = {
        let label = TitleLabel(titleString: "Today")
        label.font = Font.bold.size(34)
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.setupPageController()
    }
    
    func setupPageController() {
        self.pageController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        self.pageController?.dataSource = self
        self.pageController?.delegate = self
        self.pageController?.view.frame = CGRect(x: 0,y: 0,width: frameScreen.width,height: frameScreen.height)
        self.addChild(self.pageController!)
        self.view.addSubview(self.pageController!.view)
        
        let initialVC = HomeViewController(with: steps[0])
        
        self.pageController?.setViewControllers([initialVC], direction: .forward, animated: true, completion: nil)
        
        self.view.addSubview(pageControl)
        self.view.addSubview(nextButton)
        self.view.addSubview(dateTimeTitle)
        self.view.addSubview(todayTitle)
        self.view.addSubview(profileButton)
        
        setConstraints()
        
        self.pageController?.didMove(toParent: self)
    }
    
    func setConstraints() {
        dateTimeTitle.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(60)
            make.left.equalToSuperview().offset(20)
        }
        
        todayTitle.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(20)
            make.top.equalTo(dateTimeTitle.snp.bottom).offset(4)
        }
        
        profileButton.snp.makeConstraints { make in
            make.width.height.equalTo(36)
            make.centerY.equalTo(todayTitle)
            make.right.equalToSuperview().offset(-20)
        }
        
        nextButton.snp.makeConstraints { make in
            make.width.height.equalTo(56)
            make.right.equalToSuperview().offset(-20)
            make.bottom.equalToSuperview().offset(-54)
        }
        
        pageControl.snp.makeConstraints{ (make) -> Void in
//            make.left.equalToSuperview().offset(20)
            make.bottom.equalTo(nextButton.snp.top).offset(-96)
        }
    }
    
    @objc func onTapNextButton(sender: UIButton!) {
        
        if (self.currentIndex == Step.step3.index) {
            self.currentIndex = 0
        } else {
            self.currentIndex += 1
        }
        
        let vc = HomeViewController(with: steps[self.currentIndex])
        self.pageController?.setViewControllers([vc], direction: .forward, animated: true, completion: nil)
    }
    
    @objc func onTapUserProfileButton(sender: UIButton!) {
        
    }
}


extension HomePageViewController: UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    
    func pageViewController(_ pageViewController: UIPageViewController, willTransitionTo pendingViewControllers: [UIViewController]) {
        let nextStep = (pendingViewControllers[0] as? HomeViewController)?.step
        self.currentIndex = nextStep?.index ?? 0
    }
    
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController:  UIViewController) -> UIViewController? {
        guard let currentVC = viewController as? HomeViewController else {
            return nil
        }
        
        var index = currentVC.step.index
        
        
        if index == 0 {
            index = Step.allCases.count - 1
        } else {
            index -= 1
        }
        
        let vc: HomeViewController = HomeViewController(with: steps[index])
        
        return vc
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController:  UIViewController) -> UIViewController? {
        guard let currentVC = viewController as? HomeViewController else {
            return nil
        }
        
        var index = currentVC.step.index
        
        if index >= Step.step3.index {
            index = 0
        } else {
            index += 1
        }
        
        let vc: HomeViewController = HomeViewController(with: steps[index])
        
        return vc
    }
    
}
