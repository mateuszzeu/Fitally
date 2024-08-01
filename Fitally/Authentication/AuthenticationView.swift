//
//  AuthenticationView.swift
//  Fitally
//
//  Created by Mateusz Żełudziewicz on 06/08/2024.
//

import SwiftUI

struct AuthenticationView: View {
    var body: some View {
        VStack {
            
            NavigationLink {
                SignInEmailView()
            } label: {
                Text("Sign In With Email")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(10)
            }
        }
        .padding()
        .navigationTitle("Sign In")
    }
}

#Preview {
    NavigationStack {
        AuthenticationView()
    }
}
