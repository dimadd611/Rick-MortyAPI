
import SwiftUI

struct CharacterView: View {
    
    let characterId: String
    @ObservedObject var viewModel = CharacterViewModel()
    
    var body: some View {
        VStack {
            if viewModel.state == .loading {
                Spinner(style: .large)
            } else if viewModel.state == .error {
                Text("Error")
            } else if viewModel.state == .complete {
                RemoteImage(url:viewModel.character.image)
                    .clipShape(Circle())
                    .frame(width:250, height:250)
                    .overlay(
                        Circle().stroke(Color.orange, lineWidth: 4)
                    )
                    .shadow(radius: 10)
                Divider()
                Text("Name: \(viewModel.character.name)")
                Text("Status:\(viewModel.character.status)")
                Text("Species:\(viewModel.character.species)")
            }
        }
        .padding()
        .navigationBarTitle(Text(viewModel.character.name), displayMode: .inline)
        .onAppear {
            viewModel.setup(id: characterId)
        }
    }
}

