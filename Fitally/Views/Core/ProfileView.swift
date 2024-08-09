import SwiftUI

@MainActor
final class ProfileViewModel: ObservableObject {
    
    @Published private(set) var user: DBUser? = nil
    
    func loadCurrentUser() async throws {
        let authDataResult = try AuthenticationManager.shared.getAuthenticatedUser()
        self.user = try await UserManager.shared.getUser(userId: authDataResult.uid)
    }
    
    func toggleOptionSelected() {
        guard let user else { return }
        let currentValue = user.optionSelected ?? false
        let updatedUser = DBUser(userId: user.userId, email: user.email, photoUrl: user.photoUrl, dateCreated: user.dateCreated, optionSelected: !currentValue)
        
        Task {
            do {
                try await UserManager.shared.updateUserOption(user: updatedUser)
                self.user = try await UserManager.shared.getUser(userId: user.userId)
                print("User option updated successfully")
            } catch {
                print("Failed to update user option: \(error)")
            }
        }
    }
}

struct ProfileView: View {
    
    @StateObject private var viewModel = ProfileViewModel()
    @Binding var showSignInView: Bool
    
    var body: some View {
        List {
            if let user = viewModel.user {
                Text("UserId: \(user.userId)")
                
                // Przycisk do zmiany opcji wybranej przez użytkownika
                Button(action: viewModel.toggleOptionSelected) {
                    Text("Option Selected: \((user.optionSelected ?? false).description.capitalized)")
                } // 🆕 Dodany przycisk do zmiany opcji
            }
        }
        .task {
            try? await viewModel.loadCurrentUser()
        }
        .navigationTitle("Profile")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                NavigationLink {
                    SettingsView(showSignInView: $showSignInView)
                } label: {
                    Image(systemName: "gear")
                        .font(.headline)
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        ProfileView(showSignInView: .constant(false))
    }
}
