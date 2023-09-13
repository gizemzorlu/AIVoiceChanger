//
//  ApiHandler.swift
//  AIVoiceChanger
//
//  Created by Gizem Zorlu on 13.09.2023.
//

import Foundation
import Alamofire

public class ApiHandler{
    func authenticate(usernameOrEmail: String, password: String, completion: @escaping (Result<String, Error>) -> Void) {
        let loginURL = "https://api.fakeyou.com/login"
        let requestBody = [
          "username_or_email": "kamalmango7@gmail.com",
          "password": "Darwin@#23"
        ]
        AF.request(loginURL, method: .post, parameters: requestBody, encoder: JSONParameterEncoder.default).response { response in
          if let cookie = response.response?.allHeaderFields["Set-Cookie"] as? String,
            let sessionCookie = cookie.components(separatedBy: ";").first {
            completion(.success(sessionCookie))
          } else {
            completion(.failure(NSError(domain: "AuthenticationError", code: 0, userInfo: nil)))
          }
        }
      }

}
