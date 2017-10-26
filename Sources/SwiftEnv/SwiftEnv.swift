//MIT License
//
//Copyright (c) 2017 Manny Guerrero
//
//Permission is hereby granted, free of charge, to any person obtaining a copy
//of this software and associated documentation files (the "Software"), to deal
//in the Software without restriction, including without limitation the rights
//to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//copies of the Software, and to permit persons to whom the Software is
//furnished to do so, subject to the following conditions:
//
//The above copyright notice and this permission notice shall be included in all
//copies or substantial portions of the Software.
//
//THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//SOFTWARE.

#if os(Linux)
    import Glibc
#else
    import Darwin
#endif

import SwiftEnv_C

/// A class that provides an easy interface for reading and setting environment variables in both OSX and
/// Linux.
public class SwiftEnv {
    
    // MARK: - Initializers
    
    /// Initializes an instance of `SwiftEnv`.
    public init() {}
}


// MARK: - Public Instance Methods
public extension SwiftEnv {
    
    /// Retrieves an environment variable.
    ///
    /// - Parameter variableName: A `String` representing the name of the environment variable.
    /// - Returns: A `String` representing the value of the environment variable.
    func valueForEnvironmentVariable(_ variableName: String) -> String? {
        guard let pointer = getenv(variableName) else { return nil }
        return String(validatingUTF8: pointer)
    }
    
    /// Sets a value for an environment variable.
    ///
    /// - Parameters:
    ///   - name: A `String` representing the name of a environment variable.
    ///   - value: A `String` representing the value to set.
    ///   - overwrite: A `Bool` indicating if the value should be overwritten for an existing environment
    ///                variable. Defaults to `true`.
    func setValueForEnvironmentVariable(_ name: String, value: String, overwrite: Bool = true) {
        setenv(name, value, overwrite ? 1 : 0)
    }
    
    /// Removes the value for an environment variable.
    ///
    /// - Parameter variableName: A `String` representing the name of a environment variable.
    func removeValueForEnvironmentVariable(_ variableName: String) {
        unsetenv(variableName)
    }
}


// MARK: - Custom Subscript
public extension SwiftEnv {
    subscript(key: String) -> String? {
        get {
            return valueForEnvironmentVariable(key)
        }
        set(newValue) {
            if let value = newValue {
                setValueForEnvironmentVariable(key, value: value)
            } else {
                removeValueForEnvironmentVariable(key)
            }
        }
    }
}
