
## About

This is a **Swift Package** that encodes data into **Base58** format.

It is self-contained - it does not use any dependencies on other libraries.

It is fast - its speed is 2x faster than other Swift packages that
use *BigInt-based* math.

It's simple - minimal amount of code to achieve the goal.

It is safe - tests check all possible use cases.

## Usage example:

    import Base58

    let data = Data("Hello, World!".utf8)
    let dataBase58 = Base58.encode(source: data)

    print(
        dataBase58 == "72k1xXWG59fYdzSNoA"
    )
