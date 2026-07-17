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
    
    var allPass: [String] = ["123456","105734","672941","839205","294756","560184","918273","374650","826419","047392"]
    enum BundleId {
        case Debug
    }
    
    static let USER_DEFAULT_DEBUG = (Bundle.main.bundleIdentifier ?? "com.au.app5g.work") + ".debug"
    
    
    private var userDefaults = UserDefaultsAccessor()
    var debugUserDefaults = UserDefaultsAccessor(userDefaults: UserDefaults.init(suiteName: USER_DEFAULT_DEBUG)!)
    
    var isComplete: Bool = false
    
    var isLogin: Bool
    {
        return userDefaults.get(key: .isLogin, type: Bool.self) ?? false
    }
    
    func update(isLogin: Bool) {
        userDefaults.set(key: .isLogin, value: isLogin)
    }
    
    var userName: String
    {
        return userDefaults.get(key: .userName, type: String.self) ?? ""
    }
    
    func update(userName: String) {
        userDefaults.set(key: .userName, value: userName)
    }
    
    var countPassword: Int
    {
        return userDefaults.get(key: .countPassword, type: Int.self) ?? 0
    }
    
    func update(countPassword: Int) {
        userDefaults.set(key: .countPassword, value: countPassword)
    }
    
    var lastLoginDate: Date?
    {
        return userDefaults.get(key: .lastLoginDate, type: Date.self)
    }
    
    func update(lastLoginDate: Date) {
        userDefaults.set(key: .lastLoginDate, value: lastLoginDate)
    }
    
    func update(usedPassList: [String]) {
        userDefaults.set(key: .usedPass, value: usedPassList)
    }
    
    func getListUsedPass() -> [String] {
        return userDefaults.get(key: .usedPass, type: [String].self) ?? []
    }
    
    func removeLoginDate() {
        userDefaults.remove(key: .lastLoginDate)
    }
    
    var currentDevice: IPhoneScreenType = .other
    
    func checkIfOver24hTokyo() -> Bool {
        guard let lastLogin = DataStore.shared.lastLoginDate else {
            return true
        }
        
        let tokyoTimeZone = TimeZone(identifier: "Asia/Tokyo")!
        var calendar = Calendar.current
        calendar.timeZone = tokyoTimeZone
        
        let now = Date()
        let interval = now.timeIntervalSince(lastLogin)
        
        if interval >= 24 * 60 * 60 {
            return true
        } else {
            return false
        }
    }
    
    func currentPass(for date: Date = Date()) -> String {
        let passes = ["123456", "324522", "398264","614705","972830","247168", "947680","285914","463592","791028","150486","826593"]
        
        // TimeZone Tokyo
        let tokyoTimeZone = TimeZone(identifier: "Asia/Tokyo")!
        var calendar = Calendar.current
        calendar.timeZone = tokyoTimeZone
        
        var startComponents = DateComponents()
        startComponents.year = 2026
        startComponents.month = 1
        startComponents.day = 9
        startComponents.hour = 10
        startComponents.minute = 0
        startComponents.second = 0
        startComponents.timeZone = tokyoTimeZone
        
        guard let startDate = calendar.date(from: startComponents) else {
            return passes.first ?? ""
        }
        
        if date < startDate {
            return passes.first ?? ""
        }
        
        let hoursPassed = calendar.dateComponents([.hour], from: startDate, to: date).hour ?? 0
        
        let index = min(hoursPassed, passes.count - 1)
        return passes[index]
    }
    
    func isAfterEventDate() -> Bool {
        var components = DateComponents()
        components.year = 2026
        components.month = 01
        components.day = 10
        components.hour = 0
        components.minute = 0
        components.second = 1
        let tokyoTimeZone = TimeZone(identifier: "Asia/Tokyo")!
        var calendar = Calendar.current
        calendar.timeZone = tokyoTimeZone
        
        guard let targetDate = calendar.date(from: components) else {
            return false
        }
        
        return Date() >= targetDate
    }
    
    func checkPass(
        pass: String
    ) -> Bool {
        var usedPass = self.getListUsedPass()
        if usedPass.contains(pass) {
            return false
        } else if self.allPass.contains(pass) {
            usedPass.append(pass)
            self.update(usedPassList: usedPass)
            return true
        }
        return false
    }
}

class UserDefaultsAccessor {
    
    enum UserDefaultKey: String {
        case isLogin
        case lastLoginDate
        case countPassword
        case usedPass
        case userName
    }
    
    let userDefaults: UserDefaults
    
    init(userDefaults: UserDefaults = .standard) {
        self.userDefaults = userDefaults
    }
    
    func set<T>(key: UserDefaultKey, value: T) {
        userDefaults.set(value, forKey: key.rawValue)
    }
    
    func setData<T: Codable>(key: UserDefaultKey, data: T) {
        guard let value = try? JSONEncoder().encode(data) else {
            return
        }
        userDefaults.set(value, forKey: key.rawValue)
    }
    
    func get<T>(key: UserDefaultKey, type: T.Type) -> T? {
        return userDefaults.object(forKey: key.rawValue) as? T
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
