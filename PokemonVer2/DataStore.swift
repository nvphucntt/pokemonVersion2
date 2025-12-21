//
//  DataStore.swift
//  Pokemon
//
//  Created by Van Phu on 8/11/25.
//
import Foundation

class DataStore {
    static let shared = DataStore()
    
    let listUserName: [String] = ["phudano1","phudano2","phudano3","phudano4", "phudano5", "phudano6"]
    var allPass: [String] = []
    
    let allPass1: [String] = ["123456","105734","672941","839205","294756","560184","918273","374650","826419","047392",
                              "591038","760294","138475","904682","257039","684120","390571","712846","465903","829174",
                              
                              "174029","580361","936742","401958","728346","095817","613204","847520","259683","364097",
                              "720581","184936","905472","438216","691750","257184","803469","974025","560938","129746",
                              
                              "840372","267594","915840","432019","708265","156938","384760","902157","671495","529084"]
    
    let allPass2: [String] = ["084693","743205","916372","250846","639018","485920","172603","860741","394257","518964",
                              
                              "947062","206385","381740","520974","769203","154869","603518","842097","297406","935182",
                              "480639","716028","259047","903584","167295","845036","620471","394860","581297","072645",
                              
                              "415720","639825","072193","984560","236741","750392","814609","597284","360958","128470",
                              "704965","859132","241570","903746","687214","450839","192685","578406","364902","820157"]
    
    let allPass3: [String] = ["196540","847361","503729","269845","731094","984275","605138","412960","758014","390627",
                              "826470","175398","942506","604217","318659","750284","469130","287905","593741","014862",
                              
                              "560748","237195","904163","681592","392804","745016","108659","259437","836920","470285",
                              "695310","812947","047528","934160","281759","560392","178046","403695","927814","654281",
                              
                              "371084","849275","026947","713690","598240","164837","902516","435780","287409","650931"]
    
    let allPass4: [String] = ["914528","378602","540197","861420","297658","036841","725904","418369","953072","684215",
                              
                              "529760","163895","804271","670594","218403","945127","397560","081946","756239","432085",
                              "695724","820936","174608","503819","261497","948570","730142","086395","459620","912784",
                              
                              "308496","574201","069583","841027","926750","437918","195264","782430","604159","350872",
                              "917046","286593","543708","760129","894365","021947","635284","478510","159036","802749"]
    
    let allPass5: [String] = [
        "734816","920574","615839","482067","359148","806421","147593","692840","518706","274965",
        
        // 11–20
        "830572","469815","157204","984731","325896","701458","648392","259714","906583","473160",
        
        // 21–30
        "814639","392705","568241","740982","126459","953817","284670","617305","895426","430981",
        
        // 31–40
        "761284","549037","208694","936175","374820","682459","105873","827346","491508","260937",
        
        // 41–50
        "708154","634972","819305","352746","947680","285914","463592","791028","150486","826593"
    ]
    
    let allPass6: [String] = [
        "570341","398264","614705","972830","247168","859406","306927","481750","693284","028175",
        
        // 61–70
        "754693","812407","365820","940268","187534","629705","503168","876429","241960","698315",
        
        // 71–80
        "430672","915806","764298","350914","289046","647805","801352","934167","526084","170948",
        
        // 81–90
        "492670","835214","618709","207456","943582","561398","784025","329860","856174","470293",
        
        // 91–100
        "602718","914360","758204","381695","026847","549812","730468","185296","864731","297540"
    ]
    
    
    
    var allPassInt: [Int] = [
        123456,105734,672941,839205,294756,560184,918273,374650,826419,47392,
        591038,760294,138475,904682,257039,684120,390571,712846,465903,829174,
        
        174029,580361,936742,401958,728346,95817,613204,847520,259683,364097,
        720581,184936,905472,438216,691750,257184,803469,974025,560938,129746,
        
        840372,267594,915840,432019,708265,156938,384760,902157,671495,529084,
        84693,743205,916372,250846,639018,485920,172603,860741,394257,518964,
        
        947062,206385,381740,520974,769203,154869,603518,842097,297406,935182,
        480639,716028,259047,903584,167295,845036,620471,394860,581297,72645,
        
        415720,639825,72193,984560,236741,750392,814609,597284,360958,128470,
        704965,859132,241570,903746,687214,450839,192685,578406,364902,820157,
        
        196540,847361,503729,269845,731094,984275,605138,412960,758014,390627,
        826470,175398,942506,604217,318659,750284,469130,287905,593741,14862,
        
        560748,237195,904163,681592,392804,745016,108659,259437,836920,470285,
        695310,812947,47528,934160,281759,560392,178046,403695,927814,654281,
        
        371084,849275,26947,713690,598240,164837,902516,435780,287409,650931,
        914528,378602,540197,861420,297658,36841,725904,418369,953072,684215,
        
        529760,163895,804271,670594,218403,945127,397560,81946,756239,432085,
        695724,820936,174608,503819,261497,948570,730142,86395,459620,912784,
        
        308496,574201,69583,841027,926750,437918,195264,782430,604159,350872,
        917046,286593,543708,760129,894365,21947,635284,478510,159036,802749,
        
        // 1–10
        734816,920574,615839,482067,359148,806421,147593,692840,518706,274965,
        
        // 11–20
        830572,469815,157204,984731,325896,701458,648392,259714,906583,473160,
        
        // 21–30
        814639,392705,568241,740982,126459,953817,284670,617305,895426,430981,
        
        // 31–40
        761284,549037,208694,936175,374820,682459,105873,827346,491508,260937,
        
        // 41–50
        708154,634972,819305,352746,947680,285914,463592,791028,150486,826593,
        
        // 51–60
        570341,398264,614705,972830,247168,859406,306927,481750,693284,28175,
        
        // 61–70
        754693,812407,365820,940268,187534,629705,503168,876429,241960,698315,
        
        // 71–80
        430672,915806,764298,350914,289046,647805,801352,934167,526084,170948,
        
        // 81–90
        492670,835214,618709,207456,943582,561398,784025,329860,856174,470293,
        
        // 91–100
        602718,914360,758204,381695,26847,549812,730468,185296,864731,297540
    ]
    
    
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
        let passes = ["12345678", "22222222", "88888888", "44444444"]
        
        // TimeZone Tokyo
        let tokyoTimeZone = TimeZone(identifier: "Asia/Tokyo")!
        var calendar = Calendar.current
        calendar.timeZone = tokyoTimeZone
        
        var startComponents = DateComponents()
        startComponents.year = 2025
        startComponents.month = 12
        startComponents.day = 21
        startComponents.hour = 0
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
        components.day = 12
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
