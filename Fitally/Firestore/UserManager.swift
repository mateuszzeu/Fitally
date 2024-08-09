//
//  UserManager.swift
//  Fitally
//
//  Created by Mateusz Żełudziewicz on 07/08/2024.
//

import Foundation
import FirebaseFirestore

struct DBUser: Codable {
    let userId: String
    let email: String?
    let photoUrl: String?
    let dateCreated: Date?
    var optionSelected: Bool?
}


final class UserManager {
    
    static let shared = UserManager()
    private init() { }
    
    private let userCollection = Firestore.firestore().collection("users")
    
    private func userDocument(userId: String) -> DocumentReference {
        userCollection.document(userId)
    }
    
    func createNewUser(user: DBUser) async throws {
        try userDocument(userId: user.userId).setData(from: user, merge: false)
    }
    
    
    func createNewUser(auth: AuthDataResultModel) async throws {
        var userData: [String:Any] = [
            "userId" : auth.uid,
            "dateCreated" : Timestamp(),
            "optionSelected": false
        ]
        if let email = auth.email {
            userData["email"] = email
        }
        if let photoUrl = auth.photoUrl {
            userData["photoUrl"] = photoUrl
        }
        
        try await userDocument(userId: auth.uid).setData(userData, merge: false)
    }
    
    func getUser(userId: String) async throws -> DBUser {
        let snapshot = try await userDocument(userId: userId).getDocument()
        
        guard let data = snapshot.data(), let userId = data["userId"] as? String else {
            throw URLError(.badServerResponse)
        }
        
        let email = data["email"] as? String
        let photoUrl = data["photoUrl"] as? String
        let dateCreated = (data["dateCreated"] as? Timestamp)?.dateValue()
        let optionSelected = data["optionSelected"] as? Bool
        
        return DBUser(userId: userId, email: email, photoUrl: photoUrl, dateCreated: dateCreated, optionSelected: optionSelected)
    }
    
    func updateUserOption(user: DBUser) async throws {
            try userDocument(userId: user.userId).setData(from: user, merge: true)
        }
}
