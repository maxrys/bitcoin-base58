import Testing
import Foundation
@testable import Base58

let testData = [

    // empty

    "": (
        dataHex: "",
        dataBin: Data([
        ]),
        base58: ""
    ),

    // "0b11111111"

    "0xff": (
        dataHex: "ff",
        dataBin: Data([
            0b11111111,
        ]),
        base58: "5Q"
    ),

    "0xffffff": (
        dataHex: "ffffff",
        dataBin: Data([
            0b11111111,
            0b11111111,
            0b11111111,
        ]),
        base58: "2UzHL"
    ),

    "0xffffffffffffffffffff": (
        dataHex: "ffffffffffffffffffff",
        dataBin: Data([
            0b11111111,
            0b11111111,
            0b11111111,
            0b11111111,
            0b11111111,
            0b11111111,
            0b11111111,
            0b11111111,
            0b11111111,
            0b11111111,
        ]),
        base58: "FPBt6CHo3fovdL"
    ),

    // "0b00000000"

    "0x00": (
        dataHex: "00",
        dataBin: Data([
            0b00000000,
        ]),
        base58: "1"
    ),

    "0x000000": (
        dataHex: "000000",
        dataBin: Data([
            0b00000000,
            0b00000000,
            0b00000000,
        ]),
        base58: "111"
    ),

    "0x00000000000000000000": (
        dataHex: "00000000000000000000",
        dataBin: Data([
            0b00000000,
            0b00000000,
            0b00000000,
            0b00000000,
            0b00000000,
            0b00000000,
            0b00000000,
            0b00000000,
            0b00000000,
            0b00000000,
        ]),
        base58: "1111111111"
    ),

    // mix

    "0x000103070f1f3f7fff": (
        dataHex: "000103070f1f3f7fff",
        dataBin: Data([
            0b00000000,
            0b00000001,
            0b00000011,
            0b00000111,
            0b00001111,
            0b00011111,
            0b00111111,
            0b01111111,
            0b11111111,
        ]),
        base58: "1ApKyJRpCNz"
    ),

    "0xff7f3f1f0f07030100": (
        dataHex: "ff7f3f1f0f07030100",
        dataBin: Data([
            0b11111111,
            0b01111111,
            0b00111111,
            0b00011111,
            0b00001111,
            0b00000111,
            0b00000011,
            0b00000001,
            0b00000000,
        ]),
        base58: "4FdDE13pQKoZh"
    ),

    // all possible permutations between "0x00000000" and "0x11111111"
    // ┌────────────────────────────────────────┐
    // │             001 010 011 100 101 110 111│
    // ├────────────┬───┬───┬───┬───┬───┬───┬───┤
    // │ 0x00000000 │ - │ - │ - │ + │ + │ + │ + │
    // │ 0x11111111 ├───┼───┼───┼───┼───┼───┼───┤
    // │ 0x00000000 │ - │ + │ + │ - │ - │ + │ + │
    // │ 0x11111111 ├───┼───┼───┼───┼───┼───┼───┤
    // │ 0x00000000 │ + │ - │ + │ - │ + │ - │ + │
    // └────────────┴───┴───┴───┴───┴───┴───┴───┘

    "0x0fff0000": (
        dataHex: "0fff0000",
        dataBin: Data([
            0b00001111,
            0b11111111,
            0b00000000,
            0b00000000,
        ]),
        base58: "QiU2b"
    ),

    "0x0f0000ff": (
        dataHex: "0f0000ff",
        dataBin: Data([
            0b00001111,
            0b00000000,
            0b00000000,
            0b11111111,
        ]),
        base58: "PEpJa"
    ),

    "0x0f0000ff0000": (
        dataHex: "0f0000ff0000",
        dataBin: Data([
            0b00001111,
            0b00000000,
            0b00000000,
            0b11111111,
            0b00000000,
            0b00000000,
        ]),
        base58: "8UEde2ij"
    ),

    "0x00000fff": (
        dataHex: "00000fff",
        dataBin: Data([
            0b00000000,
            0b00000000,
            0b00001111,
            0b11111111,
        ]),
        base58: "112Dc"
    ),

    "0x00000fff0000": (
        dataHex: "00000fff0000",
        dataBin: Data([
            0b00000000,
            0b00000000,
            0b00001111,
            0b11111111,
            0b00000000,
            0b00000000,
        ]),
        base58: "11QiU2b"
    ),

    "0x00000f0000ff": (
        dataHex: "00000f0000ff",
        dataBin: Data([
            0b00000000,
            0b00000000,
            0b00001111,
            0b00000000,
            0b00000000,
            0b11111111,
        ]),
        base58: "11PEpJa"
    ),

    "0x00000f0000ff0000": (
        dataHex: "00000f0000ff0000",
        dataBin: Data([
            0b00000000,
            0b00000000,
            0b00001111,
            0b00000000,
            0b00000000,
            0b11111111,
            0b00000000,
            0b00000000,
        ]),
        base58: "118UEde2ij"
    ),

    // text / unicode

    "Hello, World!": (
        dataHex: "48656c6c6f2c20576f726c6421",
        dataBin: Data([
            0b01001000,
            0b01100101,
            0b01101100,
            0b01101100,
            0b01101111,
            0b00101100,
            0b00100000,
            0b01010111,
            0b01101111,
            0b01110010,
            0b01101100,
            0b01100100,
            0b00100001,
        ]),
        base58: "72k1xXWG59fYdzSNoA"
    ),

    "Здравствуй, Мир!": (
        dataHex: "d097d0b4d180d0b0d0b2d181d182d0b2d183d0b92c20d09cd0b8d18021",
        dataBin: Data([
            0b11010000,
            0b10010111,
            0b11010000,
            0b10110100,
            0b11010001,
            0b10000000,
            0b11010000,
            0b10110000,
            0b11010000,
            0b10110010,
            0b11010001,
            0b10000001,
            0b11010001,
            0b10000010,
            0b11010000,
            0b10110010,
            0b11010001,
            0b10000011,
            0b11010000,
            0b10111001,
            0b00101100,
            0b00100000,
            0b11010000,
            0b10011100,
            0b11010000,
            0b10111000,
            0b11010001,
            0b10000000,
            0b00100001,
        ]),
        base58: "AUEQAxvRPAzk7ry7g9VMA2XNsgsaLsmog6HfzhVa"
    ),

]

let testDataOverflowExpected0 = "1111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111"
let testDataOverflowExpected1 = "FUp6g1DihcdcroasfnSeVQkm6pUrvb6ikUiAAcachBJtw1uG2GheauAJjki25EJJ6gZ9cSNdQRfujrjc1V9iPmoSJwDWCoePjJCUmkAcje8WRpQ3acQATbrr4yzrUK1PSfYGfZ8d8yW66quEKSDutHGEDgT3PAkqstwGGNDJD5hJK7SB85rp8GeTrMemETo5PbD648dYW1fmJ9GLFEqmZHe9sMMy5ozzBcvGq21RwoWaA6gcekNxb4GeVYp6w67RKW8rYMThUBpKCevpNbQF9KsAhxPs8JYDwUSn2zhGn2LPCXokatoFy7vqmCpN5wWGk1XbT8jprBrhRsbYDCxTEsUELrsvyP2CX8sr3TNdut9SbhvWZiYcBQMB8ERmc98nVDy3TK135PpuVN15vkm3DgvRayFYL2ZcMedfQuqXwCxjHsudwLzefWuVfEfcWgkiSmR8iNbk6JJcioTVJTHmkkZ8DzrVckNFrTPmJWgzKHKZg6QoGupLHb2fY2oqDn3BY2Pi794mvWsfJEphoQbQptpwZpbszj34mJdawLyT9Z7rwCXChxYSqUi7ezs9ktDE1SNNTdC7LDGv3rqkonFRCsYowJd4eWf4oW14zVCNqYiWX3i3UKj56u5sjDYMPfDEWGpxzxy5PpYAPAnNLYFQyRbZxHzHNbNTB3VziyRBVZQSJGofgV5sB7S2fMjvbGRK1DqGkzXmcSeX3EKWdRoZPZF9YSVCFY3BGRgTPCmyk8AwNJfMFHDiZpSmfyurinRwggp4NhJ2KkHieS2npKFomLYa414rYhUAHJtG8GkSVJ3E5RAh1kDFdvNG4ntb1zkRAruwhDqaJpFdMhu7psKo7jYjCAGhK6Wx7XCZw5sERys5PPqAQbvADnsyWWReZd8ruwjqviX9HE4mJa4DTK7ov3JojKh9sxUPZcqUreYHDYFccKY9aUR8DLG8GShjfzmpuDrNA8QTErzdFTzWUhWMHPc4E62vJQzcGiT8pg8YR9ga15oaW2KY6SzrXcWxVBpiq3W6BVSp5bpoHMRxAfV7vDhfoddpxdPuTr2gtMX18gZPrZ4u7mzJbL8dRJJdWsQkNYVud7Uf1oB7hmkkgHYvUtu228MaGRDZBB7URAEqtB5aXFXc6nxar6TD5nBGxwCnBJoZXcy3HtRux5fgFJNHuCUk9NjHkQu561vPDYP23qyPtAE8DUvHfcreTNo2hsPRZTjuPXb7zWhPBZZbZxvJSiS3z1JxTMBdjx9mVFLHJq3XQ6e5tBUjCdrYtmpwpEioZcH27NbwFQUETYdUSLVWAycdDuyqHiC2XhsVSogJ91CBbu3xgVRE4uRe8JCESVLpi64p9Hs3wD3mrFBbrAnmTt"

@Test("Functionality")
func testFunctionality() {
    for test in testData {
        let (_, dataBin, expected) = test.value
        let received = Base58.encode(source: dataBin)
        print("item '\(test.key)'")
        #expect(expected == received)
    }
}

@Test("Overflow", arguments: [1000])
func testOverflow(bytesCount: Int) {
    let data0 = Data(repeating: 0x00, count: bytesCount)
    let data1 = Data(repeating: 0xff, count: bytesCount)
    let received0 = Base58.encode(source: data0)
    let received1 = Base58.encode(source: data1)
    print("item 0"); #expect(testDataOverflowExpected0 == received0)
    print("item 1"); #expect(testDataOverflowExpected1 == received1)
}

@Test("Speed", arguments: [7000])
func speedTest(itemsCount: Int) {
    let bytesMinCount: Int = 25
    let bytesMaxCount: Int = 25
    for i in 0..<10 {
        for _ in 0..<itemsCount/10 {
            var data = Data()
            for _ in 0..<Int.random(in: bytesMinCount...bytesMaxCount) {
                data.append(
                    UInt8.random(in: 0...0xff)
                )
            }
            let _ = Base58.encode(source: data)
        }
        print(
            "phase \(i) was done"
        )
    }
    print(
        "test for \(itemsCount) iterations was completed"
    )
}
