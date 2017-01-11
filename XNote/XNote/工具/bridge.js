
var boluome = {};

boluome.ios = true;

boluome.bridge = function(name) {

  var args = new Array(arguments.length - 1);

  for (var i = 0; i < args.length; i++) {

    args[i] = arguments[i + 1];

  }

  window.webkit.messageHandlers[name].postMessage(args);

};

boluome.open = function(url) {

  boluome.bridge("open", url);

};

boluome.getVersion = function(cbName){
    
    boluome.bridge("getVersion", cbName)
};

