//
//  SignInWithGoogle.swift
//  DogGram
//
//  Created by Anna Stavro on 11.11.21.
//

import Foundation
import Firebase
import SwiftUI
import GoogleSignIn
import FirebaseAuth


class SignInWithGoogle: NSObject {
    
    static let instance = SignInWithGoogle()
    var onboardingView: OnboardingView!
    func startSignInWithGoogleFlow(view: OnboardingView) {
        self.onboardingView = view
        
        
    guard let clientID = FirebaseApp.app()?.options.clientID else { return }

    // Create Google Sign In configuration object.
    let config = GIDConfiguration(clientID: clientID)
        

    // Start the sign in flow!
        let signInVC = UIApplication.shared.windows.first!.rootViewController!
    GIDSignIn.sharedInstance.signIn(with: config, presenting: signInVC) { [unowned self] user, error in

      if let error = error {
        // ...
        return
      }

        
       
      guard
        let authentication = user?.authentication,
        let idToken = authentication.idToken
      else {
        return
      }

      let credential = GoogleAuthProvider.credential(withIDToken: idToken,
                                                     accessToken: authentication.accessToken)
        Auth.auth().signIn(with: credential) { result, error in
        if let error = error {
            
        print(error.localizedDescription)
            
           
            
            
//            self.onboardingView.connectToFirerbase(name: fullName, email: email, provider: "google", credential: credential)
        }
        }
    }
    }
    
    }
      // ...
//        Auth.auth().signIn(with: credential) { authResult, error in
//            if let error = error {
//              let authError = error as NSError
//              if isMFAEnabled, authError.code == AuthErrorCode.secondFactorRequired.rawValue {
//                // The user is a multi-factor user. Second factor challenge is required.
//                let resolver = authError
//                  .userInfo[AuthErrorUserInfoMultiFactorResolverKey] as! MultiFactorResolver
//                var displayNameString = ""
//                for tmpFactorInfo in resolver.hints {
//                  displayNameString += tmpFactorInfo.displayName ?? ""
//                  displayNameString += " "
//                }
//                self.showTextInputPrompt(
//                  withMessage: "Select factor to sign in\n\(displayNameString)",
//                  completionBlock: { userPressedOK, displayName in
//                    var selectedHint: PhoneMultiFactorInfo?
//                    for tmpFactorInfo in resolver.hints {
//                      if displayName == tmpFactorInfo.displayName {
//                        selectedHint = tmpFactorInfo as? PhoneMultiFactorInfo
//                      }
//                    }
//                    PhoneAuthProvider.provider()
//                      .verifyPhoneNumber(with: selectedHint!, uiDelegate: nil,
//                                         multiFactorSession: resolver
//                                           .session) { verificationID, error in
//                        if error != nil {
//                          print(
//                            "Multi factor start sign in failed. Error: \(error.debugDescription)"
//                          )
//                        } else {
//                          self.showTextInputPrompt(
//                            withMessage: "Verification code for \(selectedHint?.displayName ?? "")",
//                            completionBlock: { userPressedOK, verificationCode in
//                              let credential: PhoneAuthCredential? = PhoneAuthProvider.provider()
//                                .credential(withVerificationID: verificationID!,
//                                            verificationCode: verificationCode!)
//                              let assertion: MultiFactorAssertion? = PhoneMultiFactorGenerator
//                                .assertion(with: credential!)
//                              resolver.resolveSignIn(with: assertion!) { authResult, error in
//                                if error != nil {
//                                  print(
//                                    "Multi factor finanlize sign in failed. Error: \(error.debugDescription)"
//                                  )
//                                } else {
//                                  self.navigationController?.popViewController(animated: true)
//                                }
//                              }
//                            }
//                          )
//                        }
//                      }
//                  }
//                )
//              } else {
//                self.showMessagePrompt(error.localizedDescription)
//                return
//              }
              // ...
            //  return
           // }
            // User is signed in
            // ...
      //  }
    
    
    
    
    
//    
//
//    static let instance = SignInWithGoogle()
//    var onboardingView: OnboardingView!
//    func startSignInWithGoogleFlow(view: OnboardingView) {
//        self.onboardingView = view
//            
//            GIDSignIn.sharedInstance.delegate = self
//            GIDSignIn.sharedInstance()?.presentingViewController = UIApplication.shared.windows.first?.rootViewController
//            GIDSignIn.sharedInstance()?.presentingViewController.modalPresentationStyle = .fullScreen
//            GIDSignIn.sharedInstance().signIn()
//        }
//    
//    
//        
//        func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error?) {
//            // ...
//            if let error = error {
//                // ...
//                return
//            }
//            
//            guard let authentication = user.authentication else { return }
//            let credential = GoogleAuthProvider.credential(withIDToken: authentication.accessToken)
//            // ...
//        }
//        func sign(_ signIn: GIDSignIn, didDisconnectWith user: GIDGoogleUser!, withError error: Error!) {
//            // Perform any operations when the user disponnects from app here.
//            //...
//                
//                
                
         //   }

