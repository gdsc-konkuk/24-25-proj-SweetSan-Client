//
//  Logger.swift
//  SweetSan
//
//  Created by 박성근 on 3/4/25.
//

import os

public enum Logger {
  public static func log(message: String) {
    os_log("\(message)")
  }
}
