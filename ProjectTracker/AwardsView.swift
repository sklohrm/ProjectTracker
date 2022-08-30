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
                                .foregroundColor(dataController.hasEarned(award: award) ? Color(award.color) : Color.secondary.opacity(0.5))
                        }

                    }
                }
            }
            .navigationTitle("Awards")
        }
        //If logic on displayed button is here for adding extra funtionality to completed awards later.
        //May need to look into reimplementing the entire modifier.
        .alert(dataController.hasEarned(award: selectedAward) ? "Unlocked: \(selectedAward.name)" : "Locked", isPresented: $showingAwardDetails) {
            if dataController.hasEarned(award: selectedAward){
                Button("OK", role: .cancel) {
                    //
                }

            } else {
                Button("OK", role: .cancel) {
                    //
                }
            }
        } message: {
            Text("\(selectedAward.description)")
        }
    }
}

struct AwardsView_Previews: PreviewProvider {
    static var previews: some View {
        AwardsView()
    }
}
