//
//  DictionaryView.swift
//  Take1
//
//  Created by MacBook Pro on 16.06.21.
//

import Foundation
import SwiftUI

struct DictionaryView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @Binding var dict: Dictionary
    @State var showAddWordView = false
    @State var showEditWordView = false
    @State var index = 0
    
    var body: some View {
        ZStack {
            NavigationView {
                List {
                    ForEach(dict.words){ wor in
                        
                        Button(action:{
                            showEditWordView = true
                            index = dict.words.firstIndex(where: {
                                $0.id == wor.id
                            }) ?? 0
                        }) {
                            HStack(alignment: .top) {
                                VStack(alignment: .leading) {
                                    Text(wor.name).font(.headline)
                                    Text(wor.translate)
                                }
                                Spacer()
                                Text(wor.shortAnalogy)
                            }
                        }
                    }
                    .onDelete { (IndexSet) in
                        self.dict.words.remove(atOffsets: IndexSet)
                    }
                }
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        Text(dict.name)
                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(action: {
                                showAddWordView = true
                        }) {
                            Image(systemName: "plus.circle.fill")
                                .font(.title)
                        }
                    }
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button(action: {
                            presentationMode.wrappedValue.dismiss()
                        }) {
                            HStack{
                                Image(systemName: "chevron.left")
                                    .font(.custom("", fixedSize: 24))
                                    .offset(x: 5)
                                Text("Back")
                            }
                            .offset(x: -11)
                        }
                    }
                }
            }
            .blur(radius: showAddWordView || showEditWordView ? 3.0 : 0)
            .navigationBarHidden(true)
            if showAddWordView {
                AddWordView(showAddWordView: $showAddWordView, dict: $dict)
            }
            if showEditWordView {
                EditWordView(showEditWordView: $showEditWordView, dict: $dict, index: index)
            }
        }
    }
}

struct DictionaryView_Previews: PreviewProvider {
    static var dict = Dictionary(name: "Test")
    static var previews: some View {
        DictionaryView(dict: .constant(dict))
    }
}
