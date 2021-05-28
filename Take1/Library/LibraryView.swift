import SwiftUI

import SwiftUI

struct Library {
    
    var name: String = "Library"
    var dictionaties = [Dictionary]()
}

struct Dictionary: Identifiable {
    
    var id = UUID()
    var name: String
    var words = [Word]()
}

struct Word: Identifiable {
    
    var id = UUID()
    var name: String
    var translate: String
    var analogy: String
    var shortAnalogy: String
}


struct LibraryView: View {
    
    @State var libr = Library()
    @State var showAddDictView = false
    
    var body: some View {
        ZStack {
            NavigationView {
                List {
                    ForEach(libr.dictionaties){ dic in
                        NavigationLink(
                            destination: DictionaryView(dict: $libr.dictionaties[libr.dictionaties.firstIndex(where: { $0.id == dic.id }) ?? 0])
                        ) {
                            Text(dic.name)
                            
                        }
                    }
                    .onDelete { (IndexSet) in
                        self.libr.dictionaties.remove(atOffsets: IndexSet)
                    }
                }
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        Text(libr.name)
                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(action: {
                            showAddDictView = true
                        }){
                            Image(systemName: "plus.circle.fill")
                                .font(.title)
                        }
                    }
                }
            }
            .blur(radius: showAddDictView ? 3.0 : 0)
            if showAddDictView {
                AddDictView(showAddDictView: $showAddDictView, libr: $libr)
            }
        }.ignoresSafeArea()
    }
}

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

struct LibraryView_Previews: PreviewProvider {
    static var previews: some View {
        LibraryView()
    }
}
