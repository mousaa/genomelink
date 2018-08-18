//
//  LoginViewController.swift
//  genomelinks
//
//  Created by Ivan Yung on 2018-08-14.
//  Copyright © 2018 Ahmed Mousa. All rights reserved.
//

import UIKit
import OAuthSwift

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

//        UIApplication.shared.open(URL(string: "http://127.0.0.1:5000/")!)
//                let oauthswift = OAuth2Swift(
//                    consumerKey: "uz8Z3mO5QIyq6hqTbDUlaBQdGDuUIgzSgngWiPHJ",
//                    consumerSecret: "y9wXPM5TsZBhkRwwFm5huwjdRYaA6PRC3KBBIrP9OcKj27uRHFrbVaVdqbxU4MyHoxVgYM1hdNdtfcdsIU6sctBQIuCwlzrFXJZPHHndM5PB47t9ZaJApYHNvPW04fle",        // No secret required
//                    authorizeUrl:   "https://genomelink.io/oauth/authorize",
//                    responseType:   "code"
//                )
//                oauthswift.allowMissingStateCheck = true
//                //2
//                oauthswift.authorizeURLHandler = SafariURLHandler(viewController: self, oauthSwift: oauthswift)
//
//                //
//                //3
//                oauthswift.authorize(withCallbackURL: URL(string: "http://127.0.0.1:5000/callback"), scope: "report:eye-color+report:beard-thickness+report:morning-person", state: "", success: {
//                    (credential, response, parameters) in
//                        print("response")
//                    },
//                    failure: {
//                        (error) in
//                        print(error)
//                    })
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
