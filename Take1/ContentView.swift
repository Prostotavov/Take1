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
            NavigationView{
                List {
                    ForEach(libr.dictionaties){ dic in
                        NavigationLink(
                            destination: DictionaryView(dict: $libr.dictionaties[libr.dictionaties.firstIndex(where: { $0.id == dic.id }) ?? 0]))
                        {
                            Text(dic.name)
                            
                        }
                    }
                }
                .toolbar {
                    ToolbarItem(placement: .principal){
                        Text(libr.name)
                    }
                    ToolbarItem(placement: .navigationBarTrailing){
                        Button(action: {
                            showAddDictView = true
                            
                        }){
                            Image(systemName: "plus.circle.fill")
                                .font(.title)
                            
                        }
                    }
                }
            }
            if showAddDictView {
                AddDictView(showAddDictView: $showAddDictView, libr: $libr)
            }
        }
    }
}

struct DictionaryView: View {
    

    @Binding var dict: Dictionary
    @State var word = Word(name: "", translate: "", analogy: "", shortAnalogy: "")
    @State var showAddWordView = false
    @State var showEditWordView = false
    @State var wordIndex = 0;

    
    var body: some View {
        ZStack {
            List {
                ForEach(dict.words){ wor in
                    Button(action:{
                        showEditWordView = true
                    }){
                        HStack(alignment: .top){
                            VStack(alignment: .leading){
                                Text(wor.name).font(.headline)
                                Text(wor.translate)
                            }
                            Spacer()
                            Text(wor.shortAnalogy)
                        }
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .principal){
                    Text(dict.name)
                }
                ToolbarItem(placement: .navigationBarTrailing){
                    Button(action: {
                        showAddWordView = true
                    }){
                        Image(systemName: "plus.circle.fill")
                            .font(.title)
                    }
                }
            }
            if showAddWordView {
                AddWordView(showAddWordView: $showAddWordView, dict: $dict)
            }
            if showEditWordView {
                EditWordView(showEditWordView: $showEditWordView, dict: $dict)
            }
        }

    }
}


struct Layer1View_Previews: PreviewProvider {
    static var previews: some View {
        LibraryView()
    }
}
