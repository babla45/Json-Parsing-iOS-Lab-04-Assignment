import SwiftUI

struct ContentView: View {
    private var people: [Person] = Person.allPeople
    
    var body: some View {
        NavigationView {
            List {
                ForEach(people, id: \.firstName) { person in
                    NavigationLink(destination: PersonDetailView(person: person)) {
                        Text("\(person.firstName) \(person.surname)")
                    }
                }
            }
            .navigationTitle("People")
        }
    }
}

struct PersonDetailView: View {
    let person: Person
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Name: \(person.firstName) \(person.surname)")
                .font(.headline)
            Text("Gender: \(person.gender)")
            Text("Age: \(person.age)")
            Text("Address: \(person.address.streetAddress), \(person.address.city), \(person.address.state), \(person.address.postalCode)")
            Text("Phone Numbers:")
            ForEach(person.phoneNumbers, id: \.number) { phone in
                Text("\(phone.type): \(phone.number)")
            }
            Spacer()
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
