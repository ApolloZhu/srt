//
//  Sequence+Extensions.swift
//  srt
//
//  Created by Apollo Zhu on 7/9/17.
//  Copyright © 2017-2019 ApolloZhu. MIT License.
//

import Foundation

extension Sequence {
    /// Returns an array containing the non-`nil` results of calling the given
    /// transformation with each element of this sequence.
    ///
    /// Use this method to receive an array of nonoptional values when your
    /// transformation produces an optional value.
    ///
    /// In this example, note the difference in the result of using `map` and
    /// `filterOutNil` with a transformation that returns an optional `Int` value.
    ///
    ///     let possibleNumbers = ["1", "2", "three", "///4///", "5"]
    ///
    ///     let mapped: [Int?] = possibleNumbers.map { str in Int(str) }
    ///     // [1, 2, nil, nil, 5]
    ///
    ///     let flatMapped: [Int] = filterOutNil { str in Int(str) }
    ///     // [1, 2, 5]
    ///
    /// - Parameter transform: A closure that accepts an element of this
    ///   sequence as its argument and returns an optional value.
    /// - Returns: An array of the non-`nil` results of calling `transform`
    ///   with each element of the sequence.
    ///
    /// - Complexity: O(*m* + *n*), where *m* is the length of this sequence
    ///   and *n* is the length of the result.
    public func filterOutNil<ElementOfResult>(
        _ transform: (Self.Element) throws -> ElementOfResult?
    ) rethrows -> [ElementOfResult] {
        #if swift(>=4.1)
        return try compactMap(transform)
        #else
        return try flatMap(transform)
        #endif
    }
}
