//
//  DataStore.swift
//  Pokemon
//
//  Created by Van Phu on 8/11/25.
//

import Foundation

class DataStore {
    static let shared = DataStore()

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
    
    var isUsedCoupon: Bool {
        userDefaults.get(key: .isUsedCoupon, type: Bool.self) ?? false
    }

    func update(isUsedCoupon: Bool) {
        userDefaults.set(key: .isUsedCoupon, value: isUsedCoupon)
    }

    // MARK: - Count Password

    var countPassword: Int {
        userDefaults.get(key: .countPassword, type: Int.self) ?? 0
    }

    func update(countPassword: Int) {
        userDefaults.set(key: .countPassword, value: countPassword)
    }

    // MARK: - Device

    var currentDevice: IPhoneScreenType = .other

    // MARK: - Update All Pass

    var allPass1  = ["1c48291", "1c53841", "1c27194", "1c17463", "1c82517", "1c39128", "1c76452", "1c50391", "1c72814", "1c14680"] // trước 9h sáng

    var allPass2  = ["1c91347", "1c68420", "1c31579", "1c28614", "1c74195", "1c52863", "1c10784", "1c65028", "1c49216", "1c83475"] // Từ 9h -> 9h59

    var allPass3  = ["1c35608", "1c74215", "1c50863", "1c89725", "1c16482", "1c97241", "1c63817", "1c28459", "1c71530", "1c46072"] // Từ 10h -> 10h59

    var allPass4  = ["1c72146", "1c19647", "1c87302", "1c40893", "1c95374", "1c28650", "1c81429", "1c59284", "1c34715", "1c76031"] // Từ 11h -> 11h59

    var allPass5  = ["1c16795", "1c62458", "1c45091", "1c53280", "1c28416", "1c74392", "1c39165", "1c90527", "1c61843", "1c27084"] // Từ 12h -> 12h59

    var allPass6  = ["1c84527", "1c71934", "1c28376", "1c61934", "1c10758", "1c95841", "1c42673", "1c53169", "1c87420", "1c36258"] // Từ 13h -> 13h59

    var allPass7  = ["1c27418", "1c56128", "1c94715", "1c78642", "1c59103", "1c31487", "1c67254", "1c48029", "1c15376", "1c82941"] // Từ 14h -> 14h59

    var allPass8  = ["1c63895", "1c48260", "1c13597", "1c24571", "1c87426", "1c56109", "1c19384", "1c70652", "1c42817", "1c95063"] // Từ 15h -> 15h59

    var allPass9  = ["1c49273", "1c70641", "1c82453", "1c15860", "1c62041", "1c84735", "1c50912", "1c31458", "1c97520", "1c68341"] // Từ 16h -> 16h59

    var allPass10 = ["1c73184", "1c25874", "1c69318", "1c90427", "1c31658", "1c27590", "1c68431", "1c14783", "1c56290", "1c83914"] // Từ 17h -> 17h59

    var allPass11 = ["1c58016", "1c91462", "1c34780", "1c34279", "1c79524", "1c46813", "1c15297", "1c62084", "1c48175", "1c90326"] // Từ 18h -> 18h59

    var allPass12 = ["1c84652", "1c52197", "1c86403", "1c21748", "1c93861", "1c70425", "1c38146", "1c59217", "1c14083", "1c76594"] // Từ 19h -> 19h59

    var allPass13 = ["1c16380", "1c70326", "1c41859", "1c75912", "1c48207", "1c89154", "1c62738", "1c35071", "1c97426", "1c51648"] // Từ 20h -> 20h59
    
    func updateAllPass(for date: Date = Date()) {
        let tokyoTimeZone = TimeZone(identifier: "Asia/Tokyo")!
        var calendar = Calendar(identifier: .gregorian)
        calendar.timeZone = tokyoTimeZone

        // Mốc bắt đầu đổi pass: 19/07/2026 09:00 JST
        let startDate = calendar.date(from: DateComponents(
            timeZone: tokyoTimeZone,
            year: 2026, month: 7, day: 19,
            hour: 9, minute: 0, second: 0
        ))!

        let allPassList: [[String]] = [
            allPass1, allPass2, allPass3, allPass4, allPass5,
            allPass6, allPass7, allPass8, allPass9, allPass10,
            allPass11, allPass12, allPass13
        ]

        // Trước 09:00 ngày 19/07/2026 -> luôn dùng allPass1
        guard date >= startDate else {
            allPass = allPass1
            return
        }

        // Số giờ đã trôi qua kể từ 09:00
        let hours = calendar.dateComponents([.hour], from: startDate, to: date).hour ?? 0

        // 09:00 - 09:59 -> allPass1
        // 10:00 - 10:59 -> allPass2
        // 11:00 - 11:59 -> allPass3 ...
        let index = min(hours, allPassList.count - 1)

        allPass = allPassList[index]
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
            return true
        }
        return false
    }
}

// MARK: - UserDefaultsAccessor

extension DataStore {
    class UserDefaultsAccessor {

        enum UserDefaultKey: String {
            case isLogin
            case countPassword
            case isUsedCoupon
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
