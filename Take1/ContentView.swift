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
    @State var dict = Dictionary(name: "")
    @State var showAddDictView = false
    
    var body: some View {
        ZStack {
            NavigationView{
                List {
                    ForEach(libr.dictionaties){ dic in
                        NavigationLink(
                            destination: DictionaryView(dict: $dict))
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
    
    var body: some View {
        ZStack {
            List {
                ForEach(dict.words){ wor in
                    Text(wor.name)
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
        }
    }
}


struct Layer1View_Previews: PreviewProvider {
    static var previews: some View {
        LibraryView()
    }
}
