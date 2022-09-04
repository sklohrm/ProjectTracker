//
//  AwardsView.swift
//  ProjectTracker
//
//  Created by Spencer Lohrmann on 8/30/22.
//

import SwiftUI

struct AwardsView: View {
    static let tag: String? = "Awards"

    @EnvironmentObject var dataController: DataController
    @State private var selectedAward = Award.example
    @State private var showingAwardDetails = false

    var columns: [GridItem] { [GridItem(.adaptive(minimum: 100, maximum: 100))] }

    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(Award.allAwards) { award in
                        Button {
                            selectedAward = award
                            showingAwardDetails = true
                        } label: {
                            Image(systemName: award.image)
                                .resizable()
                                .scaledToFit()
                                .padding()
                                .frame(width: 100, height: 100)
                                .foregroundColor(color(for: award))
                        }
                        .accessibilityLabel(label(for: award))
                        .accessibilityHint(Text(award.description))
                    }
                }
            }
            .navigationTitle("Awards")
        }
        // If else logic on displayed button is here for adding extra funtionality to completed awards later.
        // May need to look into reimplementing the entire modifier.
        .alert(label(for: selectedAward), isPresented: $showingAwardDetails) { alertButton() } message: {
            Text("\(selectedAward.description)")
        }

    }

    func color(for award: Award) -> Color {
        dataController.hasEarned(award: award) ? Color(award.color) : Color.secondary.opacity(0.5)
    }

    func label(for award: Award) -> Text {
        Text(dataController.hasEarned(award: award) ? "Unlocked: \(award.name)" : "Locked")
    }

    func alertButton() -> Button<Text> {
        if dataController.hasEarned(award: selectedAward) {
            return Button("OK", role: .cancel) {}
        } else {
            return Button("OK", role: .cancel) {}
        }
    }
}

struct AwardsView_Previews: PreviewProvider {
    static var previews: some View {
        AwardsView()
    }
}
