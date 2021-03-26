# Thread-Safe-Dictionary

## Why do we need this?
1. Dictionaries in Swift are not thread safe , they lead to wierd crashes which are very hard to debug.This class solves this problem by using a dictionary whose accesses are made thread safe by using a concurrent queue with a barrier.
2. It also conforms to the `Collection` Protocol and also has all the relevant `subscript` overrides which means you can use it just like a normal dictionary. 
3. The key now conforms to `Hashable` so now `ThreadSafeDictionary` can be used with any key that conforms to the `Hashable` protocol.


### Usage:

**1. Normal Dictionary Usage:**
```
let dict = [String: A]()
let value = dict["hello"]
print(value)
```
**2. ThreadSafeDictionary Usage**

```
let dict = ThreadSafeDictionary<String,A>()
let value = dict["hello"]
print(value)
```
where A is any custom class


you can even do a for each like a normal dictionary

```
dict.forEach { (key, value) in
            // your handling
}
```

So just by a single line change , you can enjoy benefits of thread safety and a swift implementation of a dictionary.
Guys this is being actively tested and used , will push commits if i face any issues , feel free to post issues if you find any.
Feels good to be back after a while
