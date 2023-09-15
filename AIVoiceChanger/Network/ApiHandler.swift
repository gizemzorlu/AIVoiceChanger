import Foundation
import MapKit
import Alamofire


public class ApiHandler {
    
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
    
    static func sendTTS(message : String) {
        
        let url = URL(string: "https://api.fakeyou.com/tts/inference")!
        
        let headers = [
            "accept": "application/json",
            "content-type": "application/json"
        ]
        
        let parameters : [String: Any] = [
            "uuid_idempotency_token": UUID().uuidString,
            "tts_model_token": Globals.selectedVoiceUUID,
            "inference_text": message
        ]
        
        let postDATA = try? JSONSerialization.data(withJSONObject: parameters)
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        request.allHTTPHeaderFields = headers
        request.httpBody = postDATA! as Data
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                print(error)
                //                    completion(nil)
            } else if let data = data {
                let str = String(data: data, encoding: .utf8)
                print(str ?? "")
               
                    do {
                        if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                            if let inferenceJobToken = json["inference_job_token"] as? String {
                                print("inference_job_token: \(inferenceJobToken)")
                                // Şimdi inference_job_token_type'ı kullanabilirsiniz.
                                getTTSURL(result: inferenceJobToken)
                                
                                DispatchQueue.main.asyncAfter(deadline: .now()+5.0){  getTTSURL(result: inferenceJobToken)}
                            }
                        }
                    } catch {
                        print("JSON ayrıştırma hatası: \(error.localizedDescription)")
                    }

                //                    completion(str)
            } else {
                //                    completion(nil)
            }
        }
        
        task.resume()
    }
    
    
    static func getTTSURL(result: String) {
        let requestURLString = "https://api.fakeyou.com/tts/job/\(result)"
        
        func makeRequest() {
            let request = NSMutableURLRequest(url: NSURL(string: requestURLString)! as URL,
                                              cachePolicy: .useProtocolCachePolicy,
                                              timeoutInterval: 10.0)
            let headers = [
                "accept": "application/json",
            ]
            request.httpMethod = "GET"
            request.allHTTPHeaderFields = headers
            let session = URLSession.shared
            let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
                if let error = error {
                    print(error)
                    // Handle the error here
                } else {
                    let httpResponse = response as? HTTPURLResponse
                    if httpResponse!.statusCode == 200 {
                        if let jsonData = try? JSONSerialization.jsonObject(with: data!, options: []) as? [String: Any],
                           let state = jsonData["state"] as? [String: Any],
                           let status = state["status"] as? String {
                            if status == "complete_success" {
                                if let audioPath = state["maybe_public_bucket_wav_audio_path"] as? String {
                                    print("Audio path found: \(audioPath)")
                                    createPath(wav_audio_path: audioPath)
                                } else {
                                    print("Audio path not found:")
                                }
                            } else {
                                if let statusDescription = state["maybe_extra_status_description"] as? String {
                                    print("Status is not 'complete_success', status: \(status), description: \(statusDescription)")
                                } else {
                                    print("Status is not 'complete_success', status: \(status)")
                                }
                                
                                print("Retrying in 5 seconds...")
                                // Retry the request after a delay (e.g., 5 seconds)
                                DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
                                    makeRequest() // Retry the request
                                }
                            }
                        }
                    }
                }
            })

            dataTask.resume()
        }
        
        makeRequest() // Start the initial request
    }
    
    static func createPath(wav_audio_path : String) {
        Globals.resultVoiceURL = "\(Globals.voiceBaseURL)\(wav_audio_path)"
        print("Voice Last URL: \(Globals.resultVoiceURL)")
        
    }
  
        
    }
    
    
    
    
    
