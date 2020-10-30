//
//  ThreadSafeDictionary.swift
//
//  Created by Shashank on 29/10/20.
//

class ThreadSafeDictionary<T>: Collection {

    private var dictionary: [String: T]
    private let concurrentQueue = DispatchQueue(label: "Dictionary Barrier Queue",
                                                attributes: .concurrent)
    var startIndex: Dictionary<String, T>.Index {
        return self.dictionary.startIndex
    }

    var endIndex: Dictionary<String, T>.Index {
        return self.dictionary.endIndex
    }

    init(dict: [String: T] = [String: T]()) {
        self.dictionary = dict
    }
    // this is because it is an apple protocol method
    // swiftlint:disable identifier_name
    func index(after i: Dictionary<String, T>.Index) -> Dictionary<String, T>.Index {
        return self.dictionary.index(after: i)
    }
    // swiftlint:enable identifier_name

    subscript(key: String) -> T? {
        set(newValue) {
            self.concurrentQueue.async(flags: .barrier) {[weak self] in
                self?.dictionary[key] = newValue
            }
        }
        get {
            self.concurrentQueue.sync {
                return self.dictionary[key]
            }
        }
    }

    // has implicity get
    subscript(index: Dictionary<String, T>.Index) -> Dictionary<String, T>.Element {
        self.concurrentQueue.sync {
            return self.dictionary[index]
        }
    }

    func removeAll() {
        self.concurrentQueue.async(flags: .barrier) {[weak self] in
            self?.dictionary.removeAll()
        }
    }

}
