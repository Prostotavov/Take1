import SwiftUI

struct EditWordView: View {
    
    @Binding var showEditWordView: Bool
    @State var word = Word(name: "", translate: "", analogy: "", shortAnalogy: "")
    @Binding var dict: Dictionary
    var index: Int 
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .fill (Color(.systemBackground))
                .shadow(radius: 10)
                .frame(width: 300, height: 240)
                .overlay(
                    VStack(alignment: .leading) {
                        
                        TextField("слово", text: $word.name)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        TextField("перевод", text: $word.translate)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        TextField("аналогия", text: $word.analogy)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        TextField("подсказка", text: $word.shortAnalogy)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        
                        Spacer()
                        
                        HStack {
                            Button(action: {
                                showEditWordView = false
                            }, label: {
                                Text("Cancel")
                            })
                            Spacer()
                            Button(action: {
                                dict.words[index] = word
                                showEditWordView = false
                            }, label: {
                                Text("Save")
                            })
                        }
                    }
                    .padding()
                )
        }
        .onAppear() {
            if index != -1 {
                word = dict.words[index]
            }
        }
    }
}

struct EditWordView_Previews: PreviewProvider {
    static var previews: some View {
        EditWordView(showEditWordView: .constant(true), dict: .constant(Dictionary(name: "")), index: -1)
    }
}
