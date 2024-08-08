//
//  WorkoutView.swift
//  Fitally
//
//  Created by Mateusz Żełudziewicz on 16/07/2024.
//

import SwiftUI

struct WorkoutView: View {
    @Binding var workoutDays: [WorkoutDay]

    var body: some View {
        NavigationView {
                ScrollView {
                    VStack {
                        ForEach($workoutDays) { $workoutDay in
                            VStack(alignment: .leading, spacing: 8) {
                                HStack {
                                    TextField("Day", text: $workoutDay.name)
                                        .font(.headline)
                                        .padding(.bottom, 4)
                                    
                                    DatePicker("", selection: $workoutDay.date, displayedComponents: .date)
                                        .datePickerStyle(CompactDatePickerStyle())
                                        .padding(.bottom, 8)
                                }
                                
                                ForEach($workoutDay.exercises) { $exercise in
                                    ExerciseView(exercise: exercise)
                                }
                            }
                            .padding()
                            .background(Color.white)
                            .cornerRadius(13)
                            .shadow(radius: 4)
                            .padding(.horizontal)
                        }
                    }
                }
                .navigationTitle("Workouts")
        }
    }
}

struct WorkoutView_Previews: PreviewProvider {
    @State static var workoutDays: [WorkoutDay] = workoutDaysData
    static var previews: some View {
        WorkoutView(workoutDays: $workoutDays)
    }
}
