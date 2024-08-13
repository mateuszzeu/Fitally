//
//  ProfileView.swift
//  Fitally
//
//  Created by Mateusz Żełudziewicz on 16/07/2024.
//
import SwiftUI

@MainActor
final class ProfileViewModel: ObservableObject {
    
    @Published private(set) var user: DBUser? = nil
    
    func loadCurrentUser() async throws {
        let authDataResult = try AuthenticationManager.shared.getAuthenticatedUser()
        self.user = try await UserManager.shared.getUser(userId: authDataResult.uid)
    }
    
    func addExercise(exercise: Exercise) async throws {
        guard let userId = user?.userId else { return }
        try await UserManager.shared.addExercise(userId: userId, exercise: exercise)
        try await loadCurrentUser() // Reload user to update exercises
    }
}



struct ProfileView: View {
    
    @StateObject private var viewModel = ProfileViewModel()
    @Binding var showSignInView: Bool
    
    @State private var newExerciseName: String = ""
    @State private var newExerciseSets: String = ""
    @State private var newExerciseReps: String = ""
    @State private var newExerciseWeight: String = ""
    @State private var newExerciseInfo: String = ""
    
    var body: some View {
        List {
            if let user = viewModel.user {
                Text("UserId: \(user.userId)")
                
                Section(header: Text("Add New Exercise")) {
                    TextField("Exercise Name", text: $newExerciseName)
                    TextField("Sets", text: $newExerciseSets)
                    TextField("Reps", text: $newExerciseReps)
                    TextField("Weight", text: $newExerciseWeight)
                    TextField("Info (Optional)", text: $newExerciseInfo)
                    
                    Button("Add Exercise") {
                        Task {
                            let newExercise = Exercise(
                                name: newExerciseName,
                                sets: newExerciseSets,
                                reps: newExerciseReps,
                                weight: newExerciseWeight,
                                info: newExerciseInfo.isEmpty ? nil : newExerciseInfo
                            )
                            try await viewModel.addExercise(exercise: newExercise)
                            newExerciseName = ""
                            newExerciseSets = ""
                            newExerciseReps = ""
                            newExerciseWeight = ""
                            newExerciseInfo = ""
                        }
                    }
                }
                
                Section(header: Text("Exercises")) {
                    ForEach(user.exercises ?? []) { exercise in
                        VStack(alignment: .leading) {
                            Text(exercise.name)
                            HStack {
                                Text("Sets: \(exercise.sets)")
                                Text("Reps: \(exercise.reps)")
                                Text("Weight: \(exercise.weight)")
                            }
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                        }
                    }
                }
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
