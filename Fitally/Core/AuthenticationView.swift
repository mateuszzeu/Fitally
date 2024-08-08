//
//  AuthenticationView.swift
//  Fitally
//
//  Created by Mateusz Żełudziewicz on 06/08/2024.
//

import SwiftUI

struct AuthenticationView: View {
    
    @Binding var showSignInView: Bool
    
    var body: some View {
        VStack {
            
            NavigationLink {
                SignInEmailView(showSigInView: $showSignInView)
            } label: {
                Text("Sign Up With Email")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(10)
            }
        }
        .padding()
        .navigationTitle("Sign Up")
    }
}

#Preview {
    NavigationStack {
        AuthenticationView(showSignInView: .constant(false))
    }
}
