import SwiftUI

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



struct LibraryView_Previews: PreviewProvider {
    static var previews: some View {
        LibraryView()
    }
}
