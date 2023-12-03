# 📦 DependencyContainer

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
![Static Badge](https://img.shields.io/badge/Swift-5.4-orange)

## What is DependencyContainer
> Designed to ensure multiple objects rely on a single container to manage all dependencies.

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
        
    static let fake = Container()
        .register { FakeA_Serivce() as A_Serviceable }
        .register { FakeB_Serivce() as B_Serviceable }
}
```
```swift
protocol A_Serviceable {
    func fetch()
}

protocol B_Serviceable {
    func fetch()
}
```
```swift

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
```swift
struct FakeA_Serivce: A_Serviceable {
    func fetch() -> String {
        "Fake A Fetch"
    }
}

struct FakeB_Serivce: B_Serviceable {
    func fetch() -> String {
        "Fake B Fetch"
    }
}
```
