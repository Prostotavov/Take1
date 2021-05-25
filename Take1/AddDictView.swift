import SwiftUI

struct AddDictView: View {
    
    @Binding var showAddDictView: Bool
    @State var dict = Dictionary(name: "")
    @Binding var libr: Library
    
    var body: some View {
        ZStack {
            Color.white.opacity(0.1)
            VStack{
                ZStack{
                    RoundedRectangle(cornerRadius: 10)
                        .fill (Color(.systemBackground))
                        .shadow(radius: 10)
                        .frame(width: 300, height: 120)
                        .overlay(
                            VStack(alignment: .leading) {
                                
                                TextField("имя", text: $dict.name)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                
                                Spacer()
                                
                                HStack{
                                    Button(action: {
                                        showAddDictView = false
                                    }, label: {
                                        Text("Cancel")
                                    })
                                    Spacer()
                                    Button(action: {
                                        libr.dictionaties.append(dict)
                                        showAddDictView = false
                                    }, label: {
                                        Text("Save")
                                    })
                                    
                                }
                            }
                            .padding()
                        )
                }
            }
        }
    }
}

struct AddDictView_Previews: PreviewProvider {

    
    static var previews: some View {
        AddDictView(showAddDictView: .constant(true), libr: .constant(Library()))
    }
}
