import SwiftUI


struct ContentView: View {
    
    @State var selection = 1
    
    var body: some View {
        TabView(selection: $selection) {
            ChallengesView()
                .tabItem {
                    Image(systemName: "flag.circle")
                    Text("Challenges")
                }
                .tag(0)
            LibraryView()
                .tabItem {
                    Image(systemName: "book.circle")
                    Text("Library")
                    
                }
                .tag(1)
            AccountView()
                .tabItem {
                    Image(systemName: "person.circle")
                    Text("Account")
                }
                .tag(2)
        }
    }
}


struct Layer1View_Previews: PreviewProvider {
    static var previews: some View {
         ContentView()
    }
}
