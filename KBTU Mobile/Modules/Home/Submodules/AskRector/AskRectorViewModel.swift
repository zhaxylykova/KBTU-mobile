//
//  AskRectorViewModel.swift
//  KBTU Mobile
//
//  Created by Olzhas Seilkhanov on 25.04.2023.
//

import UIKit
import Firebase

final class AskRectorViewModel: ObservableObject {
    private let fromEmail = "kbtu.mobile@gmail.com"
    private let fromName = "KBTU Mobile App"
    private let toEmail = "kbtu.mobile@gmail.com"
    
    func configureAndSendEmail(subject: String, typeOfAppeal: String, body: String) {
        let smtpSession = self.createSMTPSession()
        let messageBuilder = self.createMessage(subject: subject, typeOfAppeal: typeOfAppeal, body: body)
        
        self.sendSMTPMessage(with: smtpSession, and: messageBuilder)
    }
    
    private func createSMTPSession() -> MCOSMTPSession {
        let smtpSession = MCOSMTPSession()
        smtpSession.hostname = "smtp.gmail.com"
        smtpSession.port = 465
        smtpSession.username = self.fromEmail
        smtpSession.password = "nfhqlkefdcugboer"
        smtpSession.connectionType = .TLS
        smtpSession.authType = .saslPlain
        smtpSession.isCheckCertificateEnabled = false
        smtpSession.timeout = 60
        return smtpSession
    }
    
    private func createMessage(subject: String, typeOfAppeal: String, body: String) -> MCOMessageBuilder {
        let builder = MCOMessageBuilder()
        builder.header.from = MCOAddress(displayName: self.fromName, mailbox: self.fromEmail)
        builder.header.to = [MCOAddress(mailbox: self.toEmail)!]
        builder.header.subject = "\(subject) - Type: \(typeOfAppeal)"
        builder.textBody = "\(body)\nFrom: \(Auth.auth().currentUser?.displayName ?? "") - \(Auth.auth().currentUser?.email ?? "")"
        return builder
    }
    
    private func sendSMTPMessage(with smtpSession: MCOSMTPSession, and builder: MCOMessageBuilder) {
        smtpSession.connectionLogger = { connectionID, type, data in
            print("DEBUG PRINT:", connectionID!)
            print("DEBUG PRINT:", type)
            print("DEBUG PRINT:", data!)
            
            if data != nil {
                if let string = NSString(data: data!, encoding: String.Encoding.utf8.rawValue) {
                    NSLog("Connectionlogger: \(string)")
                }
            }
        }
        
        let builderData = builder.data()
        
        smtpSession.sendOperation(with: builderData).start { error in
            if error != nil {
                NSLog("Error sending email: \(String(describing: error))")
            } else {
                NSLog("Email sent!")
            }
        }
    }
}
