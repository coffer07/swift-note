
var boluome = {};

boluome.ios = true;

boluome.bridge = function(name) {

  var args = new Array(arguments.length - 1);

  for (var i = 0; i < args.length; i++) {

    args[i] = arguments[i + 1];

  }

  window.webkit.messageHandlers[name].postMessage(args);

};

boluome.currentUser = function(cbName) {

  boluome.bridge("currentUser", cbName);

};

boluome.login = function() {

  boluome.bridge("login");

};

boluome.open = function(url) {

  boluome.bridge("open", url);

};

boluome.openDataView = function(url) {
    
    boluome.bridge("openDataView", url);
    
};

boluome.setCouponId = function(couponId) {
    
    boluome.bridge("setCouponId", couponId);
    
};

boluome.close = function() {

  boluome.bridge("close");

};

boluome.closeAndRun = function(js) {

  boluome.bridge("closeAndRun", js);

};

boluome.toast = function(msg) {

  boluome.bridge("toast", msg);

};

boluome.pay = function(chg) {

  boluome.bridge("pay", chg);

};

boluome.getLocation = function(cbName) {

  boluome.bridge("getLocation", cbName);

};

boluome.reload = function() {

  boluome.bridge("reload");

};

boluome.confirm = function(msg, okTitle, okCb, cancelTitle, cancelCb) {
    
  boluome.bridge("confirm", msg, okTitle, okCb, cancelTitle, cancelCb);
    
};

boluome.alert = function(msg, cb) {
  
  boluome.bridge("alert", msg, cb);
    
};

boluome.goRestaurant = function(msg){
    
    boluome.bridge("goRestaurant", msg);
};

boluome.againFood = function(restaurantJson, cartJson){
    
    boluome.bridge("againFood", restaurantJson, cartJson);
};

boluome.payNow = function(orderId, orderType){
    
    boluome.bridge("payNow", orderId, orderType);
    
};

boluome.openService = function(pack, supplier, extras, url){
    
    boluome.bridge("openService", pack, supplier, extras, url);
};

boluome.share = function(platform,imageUrl,title,content,url){
    boluome.bridge("webShareButtonClick",platform,imageUrl,title,content,url)
};

boluome.showShare = function(platform,imageUrl,title,content,url){
    boluome.bridge("showShare",platform,imageUrl,title,content,url)
};

boluome.getVersion = function(cbName){
    
    boluome.bridge("getVersion", cbName)
};

boluome.goMap = function(title, name, lag, lng){
    boluome.bridge("goMap",title, name, lag, lng)
};

boluome.setTitle = function(name){
    boluome.bridge("setTitle",name)
}

boluome.payResult = function(orderId,orderType,status){
    boluome.bridge("payResult",orderId,orderType,status)
}

boluome.scanCode = function(){
    boluome.bridge("scanCode")
}

boluome.showTels = function(content){
    boluome.bridge("showTels",content)
}

boluome.showPay = function(orderId, orderType,channel,orderPrice){
    boluome.bridge("showPay",orderId, orderType,channel,orderPrice)
}

boluome.seatSuccess = function(seat, price,orderId,phone){
    boluome.bridge("seatSuccess",seat,price,orderId,phone)
}
