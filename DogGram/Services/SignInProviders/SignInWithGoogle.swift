//
//  SignInWithGoogle.swift
//  DogGram
//
//  Created by Anna Stavro on 11.11.21.
//

import Foundation
import SwiftUI
import GoogleSignIn
import FirebaseAuth

class SignInWithGoogle: NSObject, GIDSignInDelegate {
    
    static let instance = SignInWithGoogle()
    var onboardingView: OnboardingView!
    func startSignInWithGoogleFlow(view: OnboardingView) {
        self.onboardingView = view
            
            GIDSignIn.sharedInstance().delegate = self
            GIDSignIn.sharedInstance()?.presentingViewController = UIApplication.shared.windows.first?.rootViewController
            GIDSignIn.sharedInstance()?.presentingViewController.modalPresentationStyle = .fullScreen
            GIDSignIn.sharedInstance().signIn()
        }
        
        func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error?) {
            // ...
            if let error = error {
                // ...
                return
            }
            
            guard let authentication = user.authentication else { return }
            let credential = GoogleAuthProvider.credential(withIDToken: authentication.accessToken)
            // ...
        }
        func sign(_ signIn: GIDSignIn, didDisconnectWith user: GIDGoogleUser!, withError error: Error!) {
            // Perform any operations when the user disponnects from app here.
            //...
                
                
                
            }
        }
        
    
