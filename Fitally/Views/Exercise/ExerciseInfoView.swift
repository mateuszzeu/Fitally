//
//  ExerciseInfoView.swift
//  Fitally
//
//  Created by Mateusz Żełudziewicz on 17/07/2024.
//

import SwiftUI

struct ExerciseInfoView: View {
    @State var exercise: Exercise
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            if let info = exercise.info, !info.isEmpty {
                Text(info)
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.bottom, 4)
            } else {
                Text("No info")
            }
        }
    }
}

#Preview {
    ExerciseInfoView(exercise: Exercise(name: "Test", sets: "4/4", reps: "12/14", weight: "40", info: "Infoo"))
}
