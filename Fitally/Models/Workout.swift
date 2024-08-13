//
//  WorkoutView.swift
//  Fitally
//
//  Created by Mateusz Żełudziewicz on 16/07/2024.
//

import Foundation
import SwiftUI

struct Exercise: Codable, Identifiable {
    var id = UUID()
    var name: String
    var sets: String
    var reps: String
    var weight: String
    var info: String?
    
    init(name: String, sets: String, reps: String, weight: String, info: String? = nil) {
        self.name = name
        self.sets = sets
        self.reps = reps
        self.weight = weight
        self.info = info
    }
}

struct WorkoutDay: Identifiable {
    let id = UUID()
    var name: String
    var date: Date
    var exercises: [Exercise]
}

let workoutDaysData: [WorkoutDay] = [
    WorkoutDay(name: "Pull", date: Date(), exercises: [
        Exercise(name: "Narciarz", sets: "2/2", reps: "15", weight: "12.5", info: "Kocham Lizuneczke"),
        Exercise(name: "Podciągnie podchwytem", sets: "3/3", reps: "9/10", weight: "5"),
        Exercise(name: "Wiosłowanie T-bar💥", sets: "4/4", reps: "9/10", weight: "68"),
        Exercise(name: "Chest supported single arm lat pulldown", sets: "3/3", reps: "11/12", weight: "19.3"),
        Exercise(name: "Przyciągnie drążka wyciągu poziom", sets: "3/3", reps: "10/10", weight: "59"),
        Exercise(name: "Facepull rotation", sets: "3/3", reps: "11/12", weight: "21.6"),
        Exercise(name: "Uginanie przedramion siedząc na ławce skośnej", sets: "3/3", reps: "12/12", weight: "10"),
        Exercise(name: "Allahy", sets: "3/3", reps: "14/15", weight: "37.4")
    ]),
    WorkoutDay(name: "Push", date: Date(), exercises: [
        Exercise(name: "Pompki na podpórkach", sets: "2/2", reps: "15", weight: ""),
        Exercise(name: "Wyciskanie sztangi leżąc💥", sets: "2/2 + 1", reps: "8/10 + 5/7", weight: "70 + 75"),
        Exercise(name: "Rozpiętki z hantlami na ławce skośnej💥", sets: "4/4", reps: "12/12", weight: "14"),
        Exercise(name: "Wyciskanie na hammerze skośnym", sets: "3/3 + BACK (-10kg)", reps: "12/12 + 15", weight: "72 + 63"),
        Exercise(name: "Wznosy hantli bokiem 💥", sets: "2/2 + 2/2", reps: "10/12 + 6/8", weight: "9 + 12"),
        Exercise(name: "Wznosy bokiem z wyciągu jednorącz", sets: "2/2", reps: "15/15", weight: "5.7"),
        Exercise(name: "Prostowanie przedramion z wyciągu górnego", sets: "4/4 + BACK (-sztabka)", reps: "10/12 +", weight: "17 + 14.7 (W)"),
        Exercise(name: "Wznosy nóg do klatki w zwisie na drążku", sets: "3/3", reps: "MAX [14,12,11]", weight: "")
    ]),
    WorkoutDay(name: "Legs", date: Date(), exercises: [
        Exercise(name: "Martwy / Przysiad 💥", sets: "3/3", reps: "8/10", weight: "70 || 80[z]"),
        Exercise(name: "Wykroki / RDL 💥", sets: "3/3", reps: "10/12", weight: "9 || 60"),
        Exercise(name: "Wypychanie nóg na suwnicy", sets: "2/2 + 1", reps: "10/12 + 6/8", weight: "100W + 140W"),
        Exercise(name: "Uginanie nóg na maszynie", sets: "3/3", reps: "10/12", weight: "50W"),
        Exercise(name: "Wyprosty nóg na maszynie", sets: "2/2 + DROP", reps: "10/12", weight: "50W + 41W"),
        Exercise(name: "Wspięcia palców stojąc", sets: "4/4", reps: "10/11", weight: "50W"),
        Exercise(name: "Allahy", sets: "3/3", reps: "10/12", weight: "37.4W"),
        Exercise(name: "Dead bug", sets: "3/3", reps: "13/15", weight: "")
    ]),
    WorkoutDay(name: "Góra", date: Date(), exercises: [
        Exercise(name: "Wiosłowanie w opadzie tułowia💥", sets: "3/3 + 1", reps: "9/10 + 6/7", weight: "55 + 65"),
        Exercise(name: "Ściągnie drążka do klatki nachwytem💥", sets: "2/2", reps: "11/12", weight: "59"),
        Exercise(name: "Wyciskanie hantli na ławce skośnej💥", sets: "2/2 + 1", reps: "9/10 + 6/7", weight: "28 + 30"),
        Exercise(name: "Rozpiętki na butterfly", sets: "3/3", reps: "12/12", weight: "93"),
        Exercise(name: "Dipy", sets: "2/2", reps: "MAX [12,12]", weight: "-"),
        Exercise(name: "Wznosy hantli bokiem siedząc", sets: "4/4", reps: "10/12", weight: "8"),
        Exercise(name: "Uginanie przedramion ze sztangą", sets: "3/3", reps: "9/10", weight: "30"),
        Exercise(name: "Uginanie przedramion z hantlami", sets: "2/2", reps: "12/12", weight: "12"),
        Exercise(name: "Francuskie ze sztangą łamaną", sets: "3/3 + 1", reps: "10/12 + 6/8", weight: "25 + 30")
    ])
]
