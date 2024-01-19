# Ruby HashMap Project

## Project Overview
This project is a part of The Odin Project's Ruby curriculum, focusing on the implementation of a custom HashMap class. The goal is to understand the underlying mechanics of hash maps and to simulate the behavior of a typical hash map in Ruby.

## Objective
The main objective of this project is to create a functional hash map from scratch, thereby gaining a deeper understanding of data structures, hashing mechanisms, and key-value pair management in Ruby.

## Key Learning Points
- **Hashing Mechanism**: Understanding how values are hashed and stored in a hash map.
- **Handling Collisions**: Learning how to handle collisions that occur when different keys produce the same hash code.
- **Dynamic Resizing**: Implementing dynamic resizing to maintain the load factor and efficiency of the hash map.
- **Ruby Programming**: Enhancing Ruby coding skills, focusing on object-oriented programming and complex data structure implementation.

## Assignment Details
The assignment involves building the following methods in the `HashMap` class:

1. `#hash`: Takes a value and produces a hash code.
2. `#set`: Takes a key and a value, assigns the value to the key, overwriting any existing value.
3. `#get`: Takes a key and returns the value assigned to that key.
4. `#key?`: Takes a key and returns `true` if the key exists in the hash map, otherwise `false`.
5. `#remove`: Takes a key and removes the entry with that key from the hash map.
6. `#length`: Returns the number of stored keys in the hash map.
7. `#clear`: Removes all entries in the hash map.
8. `#keys`: Returns an array of all keys in the hash map.
9. `#values`: Returns an array of all values in the hash map.
10. `#entries`: Returns an array of all `key, value` pairs in the hash map.

### Additional Task
- Create a `HashSet` class that behaves similarly to `HashMap` but only contains keys without associated values.

## Getting Started
To start with this assignment, follow these steps:

1. **Setup**: Clone this repository and set up the Ruby development environment.
2. **Implementation**: Begin by implementing the `HashMap` class and its methods, ensuring proper handling of hashing and collision scenarios.
3. **Testing**: Test each method thoroughly to ensure correct functionality and efficient performance.
4. **Analysis**: Analyze the efficiency of your implementation and understand the practical applications and limitations of hash maps.

## Conclusion
This project is crucial for understanding how hash maps work under the hood. By implementing a hash map from scratch, I aim to solidify my understanding of this fundamental data structure, its applications, and its impact on data retrieval efficiency. This project is not just about coding a hash map but about embracing the intricacies of data structure design and manipulation in Ruby.