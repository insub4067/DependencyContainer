# 📦 DependencyContainer

## ✔️ Example
```swift
struct ContentView: View {
    
    let container: Container
    var a_service: A_Serviceable { container.resolve() }
    var b_service: B_Serviceable { container.resolve() }
    
    init(container: Container = .live) {
        self.container = container
    }
    
    var body: some View {
        Button("Fetch A Service") {
            a_service.fetch()
        }
        Button("Fetch B Service") {
            b_service.fetch()
        }
    }
}

extension Container {
    static let live = Container()
        .register { A_Service() as A_Serviceable }
        .register { B_Service() as B_Serviceable }
}
```
```swift
protocol A_Serviceable {
    func fetch()
}

protocol B_Serviceable {
    func fetch()
}

struct A_Service: A_Serviceable {
    func fetch() {
        print("A Fetch")
    }
}

struct B_Service: B_Serviceable {
    func fetch() {
        print("B Fetch")
    }
}
```
