import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(mopub_ios_sdk_lastgearTests.allTests),
    ]
}
#endif
