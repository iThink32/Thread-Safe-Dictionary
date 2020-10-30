# Thread-Safe-Dictionary

## Why do we need this?
Dictionaries in Swift are not thread safe , they lead to wierd crashes which are very hard to debug , this class solves this problem.
This class contains a dictionary whose accesses are made thread safe by using a concurrent queue with barriers.
It also conforms to the `Collection` Protocol and also has all the relevant `subscript` overrides which means you can use it just like a normal dictionary. 


### Usage:

**1. Normal Dictionary Usage:**
```
let dict = [String: A]()
let value = dict["hello"]
print(value)
```
**2. ThreadSafeDictionary Usage**

```
let dict = ThreadSafeDictionary<A>()
let value = dict["hello"]
print(value)
```

you can even do a for each like a normal dictionary

```
dict.forEach { (key, value) in
            // your handling
}
```

So just by a single line change , you can enjoy benefits of thread safety and a swift implementation of a dictionary.
Guys this is being actively tested and used , will push commits if i face any issues , feel free to post issues if you find any.
