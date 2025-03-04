//
//  ViewModel.swift
//  SweetSan
//
//  Created by 박성근 on 3/4/25.
//

protocol ViewModel {
  associatedtype Action
  associatedtype State

  var state: State { get }

  func action(
    _ action: Action
  )
}
