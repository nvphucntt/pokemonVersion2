//
//  DataStore.swift
//  Pokemon
//
//  Created by Van Phu on 8/11/25.
//

import Foundation

class DataStore {
    static let shared = DataStore()

    var isUsedCoupon: Bool = false

    var allPass:   [String] = []
    var allPass1:  [String] = ["30c22331", "50c33287", "100c77545", "200c89754"] // 12h ngày 17/7
    var allPass2:  [String] = ["30c66778", "50c99808", "100c98767", "200c66778"] // 18h ngày 17/7
    var allPass3:  [String] = ["30c86576", "50c12324", "100c01663", "200c54323"] // 0h  ngày 18/7
    var allPass4:  [String] = ["30c22442", "50c12321", "100c33445", "200c56653"] // 6h  ngày 18/7
    var allPass5:  [String] = ["30c85847", "50c57575", "100c89097", "200c27262"] // 12h ngày 18/7
    var allPass6:  [String] = ["30c48192", "50c73015", "100c56248", "200c91837"] // 18h ngày 18/7
    var allPass7:  [String] = ["30c27584", "50c64029", "100c78136", "200c40395"] // 0h  ngày 19/7
    var allPass8:  [String] = ["30c91753", "50c28461", "100c65390", "200c14728"] // 6h  ngày 19/7
    var allPass9:  [String] = ["30c53814", "50c89247", "100c31675", "200c76084"] // 12h ngày 19/7
    var allPass10: [String] = ["30c16483", "50c50726", "100c94851", "200c23569"] // 16h ngày 29/7
    enum BundleId {
        case debug
    }

    static let USER_DEFAULT_DEBUG = (Bundle.main.bundleIdentifier ?? "com.au.app5g.work") + ".debug"

    private var userDefaults = UserDefaultsAccessor()
    var debugUserDefaults = UserDefaultsAccessor(userDefaults: UserDefaults(suiteName: USER_DEFAULT_DEBUG)!)

    // MARK: - Login

    var isLogin: Bool {
        userDefaults.get(key: .isLogin, type: Bool.self) ?? false
    }

    func update(isLogin: Bool) {
        userDefaults.set(key: .isLogin, value: isLogin)
    }

    // MARK: - Count Password

    var countPassword: Int {
        userDefaults.get(key: .countPassword, type: Int.self) ?? 0
    }

    func update(countPassword: Int) {
        userDefaults.set(key: .countPassword, value: countPassword)
    }

    // MARK: - Max Count

    var maxCount: Int {
        userDefaults.get(key: .maxCount, type: Int.self) ?? 0
    }

    func update(maxCount: Int) {
        userDefaults.set(key: .maxCount, value: maxCount)
    }

    // MARK: - Device

    var currentDevice: IPhoneScreenType = .other

    // MARK: - Update All Pass

    func updateAllPass(for date: Date = Date()) {
        let tokyoTimeZone = TimeZone(identifier: "Asia/Tokyo")!
        var calendar = Calendar(identifier: .gregorian)
        calendar.timeZone = tokyoTimeZone

        func makeDate(_ year: Int, _ month: Int, _ day: Int,
                      _ hour: Int, _ minute: Int = 0, _ second: Int = 0) -> Date {
            calendar.date(from: DateComponents(
                timeZone: tokyoTimeZone,
                year: year,
                month: month,
                day: day,
                hour: hour,
                minute: minute,
                second: second
            ))!
        }

        let t1  = makeDate(2026, 7, 17, 12) // allPass1
        let t2  = makeDate(2026, 7, 17, 18) // allPass2
        let t3  = makeDate(2026, 7, 18, 0)  // allPass3
        let t4  = makeDate(2026, 7, 18, 6)  // allPass4
        let t5  = makeDate(2026, 7, 18, 12) // allPass5
        let t6  = makeDate(2026, 7, 18, 18) // allPass6
        let t7  = makeDate(2026, 7, 19, 0)  // allPass7
        let t8  = makeDate(2026, 7, 19, 6)  // allPass8
        let t9  = makeDate(2026, 7, 19, 12) // allPass9
        let t10 = makeDate(2026, 7, 19, 16) // allPass10
        let t11 = makeDate(2026, 7, 19, 21) // hết hiệu lực

        switch date {
        case t1..<t2:
            allPass = allPass1

        case t2..<t3:
            allPass = allPass2

        case t3..<t4:
            allPass = allPass3

        case t4..<t5:
            allPass = allPass4

        case t5..<t6:
            allPass = allPass5

        case t6..<t7:
            allPass = allPass6

        case t7..<t8:
            allPass = allPass7

        case t8..<t9:
            allPass = allPass8

        case t9..<t10:
            allPass = allPass9

        case t10..<t11:
            allPass = allPass10

        default:
            allPass = ["9283902189038210830218093"]
        }
    }

    // MARK: - Event Date

    func isAfterEventDate() -> Bool {
        let tokyoTimeZone = TimeZone(identifier: "Asia/Tokyo")!
        var calendar = Calendar.current
        calendar.timeZone = tokyoTimeZone

        let components = DateComponents(
            year: 2026,
            month: 7,
            day: 19,
            hour: 21,
            minute: 0,
            second: 0
        )

        guard let targetDate = calendar.date(from: components) else {
            return false
        }

        return Date() >= targetDate
    }

    // MARK: - Check Pass

    func checkPass(pass: String) -> Bool {
        updateAllPass(for: Date())

        if allPass.contains(pass) {
            update(maxCount: getValue(from: pass))
            return true
        }

        return false
    }

    // MARK: - Get Value From Pass

    func getValue(from pass: String) -> Int {
        if pass.hasPrefix("30c") {
            return 30
        } else if pass.hasPrefix("50c") {
            return 50
        } else if pass.hasPrefix("100c") {
            return 100
        } else if pass.hasPrefix("200c") {
            return 200
        }

        return 0
    }
}

// MARK: - UserDefaultsAccessor

extension DataStore {
    class UserDefaultsAccessor {

        enum UserDefaultKey: String {
            case isLogin
            case countPassword
            case maxCount
        }

        let userDefaults: UserDefaults

        init(userDefaults: UserDefaults = .standard) {
            self.userDefaults = userDefaults
        }

        func set<T>(key: UserDefaultKey, value: T) {
            userDefaults.set(value, forKey: key.rawValue)
        }

        func setData<T: Codable>(key: UserDefaultKey, data: T) {
            guard let value = try? JSONEncoder().encode(data) else { return }
            userDefaults.set(value, forKey: key.rawValue)
        }

        func get<T>(key: UserDefaultKey, type: T.Type) -> T? {
            userDefaults.object(forKey: key.rawValue) as? T
        }

        func getData<T: Codable>(key: UserDefaultKey, type: T.Type) -> T? {
            guard
                let data = userDefaults.object(forKey: key.rawValue) as? Data,
                let value = try? JSONDecoder().decode(T.self, from: data)
            else {
                return nil
            }

            return value
        }

        func remove(key: UserDefaultKey) {
            userDefaults.removeObject(forKey: key.rawValue)
        }
    }
}
