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

    var allPass1  = ["10c48291", "10c53841", "10c27194", "30c17463", "50c82517", "100c39128", "200c76452"] // 18h - 19h59 ngày 17/7
    var allPass2  = ["10c91347", "10c68420", "10c31579", "30c28614", "50c74195", "100c52863", "200c10784"] // 20h - 21h59 ngày 17/7
    var allPass3  = ["10c35608", "10c74215", "10c50863", "30c89725", "50c16482", "100c97241", "200c63817"] // 22h - 23h59 ngày 17/7
    var allPass4  = ["10c72146", "10c19647", "10c87302", "30c40893", "50c95374", "100c28650", "200c81429"] // 0h  - 1h59  ngày 18/7
    var allPass5  = ["10c16795", "10c62458", "10c45091", "30c53280", "50c28416", "100c74392", "200c39165"] // 2h  - 3h59  ngày 18/7
    var allPass6  = ["10c84527", "10c71934", "10c28376", "30c61934", "50c10758", "100c95841", "200c42673"] // 4h  - 5h59  ngày 18/7
    var allPass7  = ["10c27418", "10c56128", "10c94715", "30c78642", "50c59103", "100c31487", "200c67254"] // 6h  - 7h59  ngày 18/7
    var allPass8  = ["10c63895", "10c48260", "10c13597", "30c24571", "50c87426", "100c56109", "200c19384"] // 8h  - 9h59  ngày 18/7
    var allPass9  = ["10c49273", "10c70641", "10c82453", "30c15860", "50c62041", "100c84735", "200c50912"] // 10h - 11h59 ngày 18/7
    var allPass10 = ["10c73184", "10c25874", "10c69318", "30c90427", "50c31658", "100c27590", "200c68431"] // 12h - 13h59 ngày 18/7
    var allPass11 = ["10c58016", "10c91462", "10c34780", "30c34279", "50c79524", "100c46813", "200c15297"] // 14h - 15h59 ngày 18/7
    var allPass12 = ["10c84652", "10c52197", "10c86403", "30c21748", "50c93861", "100c70425", "200c38146"] // 16h - 17h59 ngày 18/7
    var allPass13 = ["10c16380", "10c70326", "10c41859", "30c75912", "50c48207", "100c89154", "200c62738"] // 18h - 19h59 ngày 18/7
    var allPass14 = ["10c90461", "10c28614", "10c95730", "30c52837", "50c17429", "100c36580", "200c74215"] // 20h - 21h59 ngày 18/7
    var allPass15 = ["10c28754", "10c64087", "10c17592", "30c61395", "50c85041", "100c92673", "200c41806"] // 22h - 23h59 ngày 18/7
    var allPass16 = ["10c75139", "10c82416", "10c59370", "30c48026", "50c39284", "100c15867", "200c83520"] // 0h  - 1h59  ngày 19/7
    var allPass17 = ["10c62948", "10c34725", "10c91648", "30c17583", "50c76410", "100c54392", "200c28174"] // 2h  - 3h59  ngày 19/7
    var allPass18 = ["10c31876", "10c58103", "10c76294", "30c84251", "50c20694", "100c67518", "200c93042"] // 4h  - 5h59  ngày 19/7
    var allPass19 = ["10c58724", "10c43971", "10c82506", "30c26149", "50c91463", "100c48275", "200c15780"] // 6h  - 7h59  ngày 19/7
    var allPass20 = ["10c90315", "10c27048", "10c69421", "30c73428", "50c16842", "100c85039", "200c62147"] // 8h  - 9h59  ngày 19/7
    var allPass21 = ["10c27681", "10c54837", "10c71392", "30c59104", "50c74318", "100c32965", "200c87450"] // 10h - 11h59 ngày 19/7
    var allPass22 = ["10c64827", "10c86254", "10c30417", "30c18395", "50c92570", "100c41682", "200c53719"] // 12h - 13h59 ngày 19/7
    var allPass23 = ["10c81453", "10c47928", "10c65013", "30c67240", "50c30187", "100c75826", "200c19463"] // 14h - 15h59 ngày 19/7
    var allPass24 = ["10c35904", "10c73580", "10c14269", "30c92816", "50c64075", "100c28741", "200c86152"] // 16h - 17h59 ngày 19/7
    var allPass25 = ["10c74269", "10c68157", "10c29483", "30c51483", "50c17824", "100c93560", "200c42618"] // 18h - 20h59 ngày 19/7
    
    func updateAllPass(for date: Date = Date()) {
        let tokyoTimeZone = TimeZone(identifier: "Asia/Tokyo")!
        var calendar = Calendar(identifier: .gregorian)
        calendar.timeZone = tokyoTimeZone

        let startDate = calendar.date(from: DateComponents(
            timeZone: tokyoTimeZone,
            year: 2026, month: 7, day: 17,
            hour: 18, minute: 0, second: 0
        ))!

        let endDate = calendar.date(from: DateComponents(
            timeZone: tokyoTimeZone,
            year: 2026, month: 7, day: 19,
            hour: 21, minute: 0, second: 0
        ))!

        let allPassList: [[String]] = [
            allPass1, allPass2, allPass3, allPass4, allPass5,
            allPass6, allPass7, allPass8, allPass9, allPass10,
            allPass11, allPass12, allPass13, allPass14, allPass15,
            allPass16, allPass17, allPass18, allPass19, allPass20,
            allPass21, allPass22, allPass23, allPass24, allPass25
        ]

        // Ngoài thời gian hiệu lực
        guard date >= startDate && date < endDate else {
            allPass = ["9283902189038210830218093"]
            return
        }

        // Số giờ đã trôi qua từ startDate
        let hours = calendar.dateComponents([.hour], from: startDate, to: date).hour ?? 0

        // Mỗi 2 tiếng đổi 1 lần
        let index = hours / 2

        // Giới hạn trong 0...24
        let safeIndex = min(index, allPassList.count - 1)

        allPass = allPassList[safeIndex]
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
        if pass.hasPrefix("10c") {
            return 10
        } else if pass.hasPrefix("30c") {
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
