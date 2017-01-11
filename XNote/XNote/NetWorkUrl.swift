//
//  NetWorkUrl.swift
//  XNote
//
//  Created by 高翔 on 2017/1/4.
//  Copyright © 2017年 高翔. All rights reserved.
//

import Foundation

enum ServerHost : String {
    case Develop = "http://dev.api.boluomeet.com"
    case Offical    = "https://stg.api.boluomeet.com"
    var webDevelop:String{
        switch self {
        case .Offical:
            return "http://web.boluomeet.com"
            
        default:
            return "http://dev.web.boluomeet.com"
        }
    }
}

// URL地址

enum BLMURL : String {
    
    /// 我的订单URL
    case WebOrder = "/webview/order/list.html"
    
    /// 红包URL
    case WebCoupon = "/webview/boluoquan/index.html"
    
    /// 菠萝米URL
    case WebBoluome = "/webview/wv_null_tips.html"
    
    /// 消息URL
    //    case Message = "/webview/wv_null_tips.html"
    
    /// 外卖URL
    case WebTakeOut = "/waimai/storeInfo.html?restaurant_id="
    
    /// 火车票URL
    case WebTrainTicket = "/trainTicket/explain.html"
    
    /// 常见问题URL
    case WebFAQ = "/static/qa.html"
    
    /// 新版介绍URL
    case WebWhatsNew = "/webview/wv_new.html"
    
    /// 关于我们URL
    case WebAbout = "/info/about"
    
    // MARK: - USER
    case GetAuthCode = "/sms/auth_code"
    case Login = "/auth/login"
    case RefreshToken = "/auth/refresh"
    
    // MARK: - 广告
    case GetAdvertisements = "/app/v1/boot/advertisements"
    
    case GetPopingAdvertisement = "/app/v1/poping_advertisement"
    
    // MARK: - 首页
    case GetBanner = "/app/v2/main/banner_activities"
    case GetCategories = "/app/v2/main/service_categories"
    case GetCombination = "/app/v2/main/combination_activities"
    case GetProviderList = "/app/v2/main/brands"
    case GetServiceActivity = "/app/v1/main/service_activities"
    
    // MARK: - 订单
    case GetOrderList = "/order/v1/list"
    case QueryOrder = "/order/queryOrderById"
    case QueryOrderForPay = "/order/queryOrderLiteById"
    case UpdateOrder = "/order/update_status"
    case cancelOrder = "/order/cancel"
    case removeOrder = "/order/remove"
    
    // 全部
    case GetCategory = "/app/v2/categories_brands"
    case GetListCategory = "/app/list"
    // MARK: - 红包
    case QueryPromotions = "/order/query_promotions"
    case QueryEffectivePromotions = "/order/query_effective_promotions"
    case GetCouponList = "/user/get_coupon_list"
    case GetCouponCount = "/user/get_coupon_num"
    case getCouponWeb = "/coupon"
    case CouponWebUrl = "/coupon/selection"
    
    // MARK: - 身份信息
    case SaveIdentity = "/user/info/identity/"
    case GetIdentities = "/user/info/identities/"
    
    // MARK: - 飞机票
    case QueryAirport = "/jipiao/queryAirport"
    case QueryFlightSchedule = "/jipiao/v3/flights"
    case QueryFlightPrice = "/jipiao/v3/price"
    case JiPiaoSaveOrder = "/jipiao/v3/order"
    case QueryInsurance = "/jipiao/queryInsurance"
    case QueryMinPriceDaily = "/jipiao/v3/minPriceDaily"
    case QueryFlightStopInfo = "/jipiao/v3/stops"
    //    case CancelOrder = "/jipiao/cancelOrder"
    
    // MARK: - 专车
    case GetService = "/zhuanche/v3/service"
    case NearBy = "/zhuanche/nearby"
    case CountCost = "/zhuanche/countCost"
    case CountCostByCarType = "/zhuanche/countCostByCarType"
    case ZhuanCheSaveOrder = "/zhuanche/v2/saveOrder"
    //    case ZhuanCheCancelOrder = "/zhuanche/cancelOrder"
    case ZhuancheSettle = "/zhuanche/settle"
    case GetZhuanchePaidIng = "/zhuanche/ing"
    case SetComment = "/zhuanche/comment"
    case CarAddress = "/user/info/v1/address"
    
    // MARK: - 火车
    case getHuoCheSchedule = "/huoche/schedule"
    case getHuoCheTicket = "/huoche/ticket"
    case getHuoCheStops = "/huoche/stops"
    case getHuoCheCity = "/huoche/city"
    case HuocheSave = "/huoche/v3/saveOrder"
    case getHuoCheExplain = "/static/explain/huoche.html"
    case QueryTrainInsurance = "/huoche/v3/insurance"
    // MARK: - 支付
    case GetCharge = "/pay/getCharge"
    
    // MARK: - 个人中心
    case SetUserInfo = "/user/info/center"
    case ContactsList = "/user/info/contacts"
    ///get 获取最忧地址  post 添加联系人 delete 删除联系人
    case AddContact = "/user/info/contact"
    
    // MARK: - 城市
    case CityList = "/common/v1/cities"
    case AreaList = "/common/v1/areas"
    
    // MARK: - 电影
    case HotMovieList = "/dianying/v1/showingfilms"
    case ComingMovieList = "/dianying/v1/comingfilms"
    case MovieDetail = "/dianying/v1/film"
    case CinemaList = "/dianying/v2/cinemas"
    case RegionList = "/dianying/v1/regions"
    case MoviePlan = "/dianying/v2/cinemafilm"
    case MoviePlanByMovie = "/dianying/v2/shows"
    case SeatsInfo = "/dianying/v1/seats"
    case MovieSeatLink = "/dianying/v1/seatlink"
    case MovieChooseSeatInfo = "/dianying/v1/chosenseatinfo"
    case CreateMovieOrder = "/dianying/v2/order/save"
    case CinemaPlans = "/dianying/v1/cinemaPlans"
    
    // MARK: - 外卖
    case RestaurantList = "/waimai/v1/restaurants"
    case RestaurantCategory = "/waimai/v1/restaurant/categories"
    case RestaurantMenu = "/waimai/v1/restaurant/menus"
    case CreateCart = "/waimai/v1/cart"
    case CreateTakeOutOrder = "/waimai/v2/order"
    case getBusinessPingLun = "/info/waimai/restaurant"
    case getRestaurantMainCategory = "/waimai/v2/categories"
    case RestaurantOneMoreOrder = "/waimai/v2/order/encore"
    
    // MARK: - 余额
    case ChargeCardList = "/balance/list"
    case QueryBalance = "/balance/count"
    case CreateOrUpdateBalanceAccount = "/balance/account"
    case CheckBalanceAccount = "/balance/account/exists"
    case CreateChargeOrder = "/balance/order/save"
    case PayUseBalance = "/balance/pay"
    case dealBalance = "/balance/deal"
    case balanceHistory = "/balance/detail"
    case balanceExplain = "/static/explain/balance.html"
    // MARK: - app
    case AppVersion = "/app/ver"
    case BrandsList = "/app/v2/category/brands"
    
    // MARK: - 生鲜
    //    case FruitArea = "/shengxian/v1/area"
    case FruitCategories = "/shengxian/v1/commodity/categories"
    case FruitCommodities = "/shengxian/v1/commodities"
    case FruitCommodityCode = "/shengxian/v1/commodity"
    case FruitSearch = "/shengxian/v1/commodity/search"
    case FruitCommodityId = "/shengxian/v1/commodity/status"
    case FruitFreight = "/shengxian/v1/freight"
    case FruitOrder = "/shengxian/v2/order"
    case FruitStatus = "/shengxian/v1/order/status"
    case FruitGetDetail = "/info/shengxian"
    
    // MARK: - 星巴克
    case StarbucksNearbyCoffer = "/coffee/v1/nearbyCoffee"
    case StarbucksDeliverTime = "/coffee/v1/validDeliverTime"
    case StarbucksDeliverFee = "/coffee/v1/deliverFee"
    case StarbucksOrder = "/coffee/v1/order"
    
    
    // MARK: -
    var urlString:String{
        return serverHost.rawValue + self.rawValue
    }
    
}
