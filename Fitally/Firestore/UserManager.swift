//
//  UserManager.swift
//  Fitally
//
//  Created by Mateusz Żełudziewicz on 07/08/2024.
//

import Foundation
import FirebaseFirestore

struct DBUser {
    let userId: String
    let email: String?
    let photoUrl: String?
    let dateCreated: Date?
}


final class UserManager {
    
    static let shared = UserManager()
    private init() { }
    
    
    func createNewUser(auth: AuthDataResultModel) async throws {
        var userData: [String:Any] = [
            "userId" : auth.uid,
            "dateCreated" : Timestamp(),
        ]
        if let email = auth.email {
            userData["email"] = email
        }
        if let photoUrl = auth.photoUrl {
            userData["photoUrl"] = photoUrl
        }
        
        try await Firestore.firestore().collection("users").document(auth.uid).setData(userData, merge: false)
    }
    
    func getUser(userId: String) async throws -> DBUser {
        let snapshot = try await Firestore.firestore().collection("users").document(userId).getDocument()
        
        guard let data = snapshot.data(), let userId = data["userId"] as? String else {
            throw URLError(.badServerResponse)
        }
        
        let email = data["email"] as? String
        let photoUrl = data["photoUrl"] as? String
        let dateCreated = data["dateCreated"] as? Date
        
        return DBUser(userId: userId, email: email, photoUrl: photoUrl, dateCreated: dateCreated)
    }
}
