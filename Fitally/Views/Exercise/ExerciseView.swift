//
//  ExerciseView.swift
//  Fitally
//
//  Created by Mateusz Żełudziewicz on 17/07/2024.
//

import SwiftUI

struct ExerciseView: View {
    @State var exercise: Exercise
    @State private var showExerciseInfo = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            HStack {
                Text(exercise.name)
                    .font(.subheadline)
                
                Spacer()
                Button(action: {
                    showExerciseInfo = true
                }) {
                    Image(systemName: "info.circle.fill")
                        .foregroundColor(.primary)
                }
            }
            
            HStack {
                Text("S:")
                TextField("Sets", text: $exercise.sets)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(width: 50)
                
                Text("R:")
                TextField("Reps", text: $exercise.reps)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(width: 80)
                
                Text("W:")
                TextField("Weight", text: $exercise.weight)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(width: 80)
            }
            .font(.caption)
            .foregroundColor(.secondary)
        }
        .padding()
        .background(Color.gray.opacity(0.1))
        .cornerRadius(8)
        .sheet(isPresented: $showExerciseInfo) {
            ExerciseInfoView(exercise: exercise)
        }
    }
}

#Preview {
    ExerciseView(exercise: Exercise(name: "Testowe", sets: "4/4", reps: "11/12", weight: "40"))
}
