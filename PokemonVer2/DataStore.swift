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

    var allPass1  = ["1c48291", "2c53841", "3c27194"] // 09:00 - 09:14
    var allPass2  = ["1c17463", "2c82517", "3c39128"] // 09:15 - 09:29
    var allPass3  = ["1c76452", "2c50391", "3c72814"] // 09:30 - 09:44
    var allPass4  = ["1c14680", "2c91347", "3c68420"] // 09:45 - 09:59

    var allPass5  = ["1c31579", "2c28614", "3c74195"] // 10:00 - 10:14
    var allPass6  = ["1c52863", "2c10784", "3c65028"] // 10:15 - 10:29
    var allPass7  = ["1c49216", "2c83475", "3c35608"] // 10:30 - 10:44
    var allPass8  = ["1c74215", "2c50863", "3c89725"] // 10:45 - 10:59

    var allPass9  = ["1c16482", "2c97241", "3c63817"] // 11:00 - 11:14
    var allPass10 = ["1c28459", "2c71530", "3c46072"] // 11:15 - 11:29
    var allPass11 = ["1c72146", "2c19647", "3c87302"] // 11:30 - 11:44
    var allPass12 = ["1c40893", "2c95374", "3c28650"] // 11:45 - 11:59

    var allPass13 = ["1c81429", "2c59284", "3c34715"] // 12:00 - 12:14
    var allPass14 = ["1c76031", "2c16795", "3c62458"] // 12:15 - 12:29
    var allPass15 = ["1c45091", "2c53280", "3c28416"] // 12:30 - 12:44
    var allPass16 = ["1c74392", "2c39165", "3c90527"] // 12:45 - 12:59

    var allPass17 = ["1c61843", "2c27084", "3c84527"] // 13:00 - 13:14
    var allPass18 = ["1c71934", "2c28376", "3c61934"] // 13:15 - 13:29
    var allPass19 = ["1c10758", "2c95841", "3c42673"] // 13:30 - 13:44
    var allPass20 = ["1c53169", "2c87420", "3c36258"] // 13:45 - 13:59

    var allPass21 = ["1c27418", "2c56128", "3c94715"] // 14:00 - 14:14
    var allPass22 = ["1c78642", "2c59103", "3c31487"] // 14:15 - 14:29
    var allPass23 = ["1c67254", "2c48029", "3c15376"] // 14:30 - 14:44
    var allPass24 = ["1c82941", "2c63895", "3c48260"] // 14:45 - 14:59

    var allPass25 = ["1c13597", "2c24571", "3c87426"] // 15:00 - 15:14
    var allPass26 = ["1c56109", "2c19384", "3c70652"] // 15:15 - 15:29
    var allPass27 = ["1c42817", "2c95063", "3c49273"] // 15:30 - 15:44
    var allPass28 = ["1c70641", "2c82453", "3c15860"] // 15:45 - 15:59

    var allPass29 = ["1c62041", "2c84735", "3c50912"] // 16:00 - 16:14
    var allPass30 = ["1c31458", "2c97520", "3c68341"] // 16:15 - 16:29
    var allPass31 = ["1c73184", "2c25874", "3c69318"] // 16:30 - 16:44
    var allPass32 = ["1c90427", "2c31658", "3c27590"] // 16:45 - 16:59

    var allPass33 = ["1c68431", "2c14783", "3c56290"] // 17:00 - 17:14
    var allPass34 = ["1c83914", "2c58016", "3c91462"] // 17:15 - 17:29
    var allPass35 = ["1c34780", "2c34279", "3c79524"] // 17:30 - 17:44
    var allPass36 = ["1c46813", "2c15297", "3c62084"] // 17:45 - 17:59

    var allPass37 = ["1c48175", "2c90326", "3c84652"] // 18:00 - 18:14
    var allPass38 = ["1c52197", "2c86403", "3c21748"] // 18:15 - 18:29
    var allPass39 = ["1c93861", "2c70425", "3c38146"] // 18:30 - 18:44
    var allPass40 = ["1c59217", "2c14083", "3c76594"] // 18:45 - 18:59

    var allPass41 = ["1c16380", "2c70326", "3c41859"] // 19:00 - 19:14
    var allPass42 = ["1c75912", "2c48207", "3c89154"] // 19:15 - 19:29
    var allPass43 = ["1c62738", "2c35071", "3c97426"] // 19:30 - 19:44
    var allPass44 = ["1c51648", "2c26815", "3c74092"] // 19:45 - 19:59

    var allPass45 = ["1c85371", "2c19468", "3c60735"] // 20:00 - 20:14
    var allPass46 = ["1c47183", "2c98524", "3c36217"] // 20:15 - 20:29
    var allPass47 = ["1c72641", "2c15098", "3c81436"] // 20:30 - 20:44
    var allPass48 = ["1c53984", "2c29741", "3c68153"] // 20:45 - 20:59

    var allPass49 = ["1c90842", "2c31586", "3c74209"] // 21:00 - 21:14
    var allPass50 = ["1c18475", "2c65391", "3c82740"] // 21:15 - 21:29
    
    func updateAllPass(for date: Date = Date()) {
        let tokyoTimeZone = TimeZone(identifier: "Asia/Tokyo")!
        var calendar = Calendar(identifier: .gregorian)
        calendar.timeZone = tokyoTimeZone

        // Mốc bắt đầu: 09:00 ngày 19/07/2026 (JST)
        let startDate = calendar.date(from: DateComponents(
            timeZone: tokyoTimeZone,
            year: 2026,
            month: 7,
            day: 19,
            hour: 9,
            minute: 0,
            second: 0
        ))!

        let allPassList: [[String]] = [
            allPass1, allPass2, allPass3, allPass4, allPass5,
            allPass6, allPass7, allPass8, allPass9, allPass10,
            allPass11, allPass12, allPass13, allPass14, allPass15,
            allPass16, allPass17, allPass18, allPass19, allPass20,
            allPass21, allPass22, allPass23, allPass24, allPass25,
            allPass26, allPass27, allPass28, allPass29, allPass30,
            allPass31, allPass32, allPass33, allPass34, allPass35,
            allPass36, allPass37, allPass38, allPass39, allPass40,
            allPass41, allPass42, allPass43, allPass44, allPass45,
            allPass46, allPass47, allPass48, allPass49, allPass50
        ]

        // Trước 09:00 -> luôn dùng allPass1
        guard date >= startDate else {
            allPass = allPass1
            return
        }

        // Số phút đã trôi qua từ 09:00
        let minutes = calendar.dateComponents([.minute], from: startDate, to: date).minute ?? 0

        // Mỗi 15 phút đổi 1 lần
        let quarterIndex = minutes / 15

        // Không vượt quá allPass50
        let index = min(quarterIndex, allPassList.count - 1)

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

        if let index = allPass.firstIndex(of: pass) {
            allPass.remove(at: index)
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
