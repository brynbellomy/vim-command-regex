// Generated by CoffeeScript 1.7.1
(function() {
  var countAndMotion, countAndOperator, directActionCommand, doubleOperator, match, motion, number, operator;

  number = /[0-9]+/;

  operator = /c|d|y|!|=|>|</;

  doubleOperator = /gg|yy|dd|>>|<</;

  directActionCommand = /A|a|C|I|i|J|K|D|m|O|o|P|p|m|R|r|S|s|U|u|V|v|X|x|Y|:|\.|~/;

  motion = /h|l|0|\$|\^|g_|\||(?:\'|`)(?:[a-z])|(?:f|F|t|T)(?:.)|;|,|k|j|\+|-|_|(?:[1-9]+[0-9]*|)G|e|E|w|W|b|B|ge|gE|\(|\)|\{|\}|\]\]|\]\[|\[\[|\[\]|(?:\?|\/)(?:\S+)\n/;

  countAndOperator = RegExp("(" + number.source + ")(" + operator.source + ")");

  countAndMotion = RegExp("(" + number.source + ")(" + motion.source + ")");

  match = exports.match = function(string) {
    var cam, cao, dac, dop, m;
    dac = directActionCommand.exec(string);
    if (dac != null) {
      return {
        type: 'directActionCommand',
        count: 1,
        chars: dac[0]
      };
    }
    dop = doubleOperator.exec(string);
    if (dop != null) {
      return {
        type: 'operator',
        count: 1,
        chars: dop[0]
      };
    }
    cao = countAndOperator.exec(string);
    if (cao != null) {
      return {
        type: 'operator',
        count: cao[1],
        chars: cao[2]
      };
    }
    cam = countAndMotion.exec(string);
    if (cam != null) {
      return {
        type: 'motion',
        count: cam[1],
        chars: cam[2]
      };
    }
    m = motion.exec(string);
    if (m != null) {
      return {
        type: 'motion',
        count: 1,
        chars: m[0]
      };
    }
  };

}).call(this);
