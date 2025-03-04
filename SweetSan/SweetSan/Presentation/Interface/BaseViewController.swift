//
//  BaseViewController.swift
//  SweetSan
//
//  Created by 박성근 on 3/4/25.
//

import Combine
import UIKit

import SnapKit

class BaseViewController<T: ViewModel>: UIViewController {
  // MARK: - Properties
  var cancellable: Set<AnyCancellable> = []
  let viewModel: T
  
  private let backgroundImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.image = .none // TODO: 메인 백그라운드 설정 시 변경
    imageView.contentMode = .scaleAspectFill
    return imageView
  }()
    
  // MARK: - Initializer
  init(viewModel: T) {
    self.viewModel = viewModel
    super.init(nibName: nil, bundle: nil)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: - LifeCycle
  public override func viewDidLoad() {
    super.viewDidLoad()
    
    setupViews()
    setupLayoutConstraints()
    bindAction()
    bindState()
  }
  
  // MARK: - Methods
  func setupViews() {
    view.addSubview(backgroundImageView)
  }
  
  func setupLayoutConstraints() {
    backgroundImageView.snp.makeConstraints {
      $0.edges.equalToSuperview()
    }
  }
  
  func bindAction() {}
  func bindState() {}
}
