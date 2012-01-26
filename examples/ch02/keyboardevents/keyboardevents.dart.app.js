//  ********** Library dart:core **************
//  ********** Natives dart:core **************
function $defProp(obj, prop, value) {
  Object.defineProperty(obj, prop,
      {value: value, enumerable: false, writable: true, configurable: true});
}
$defProp(Object.prototype, '$typeNameOf', function() {
  if ((typeof(window) != 'undefined' && window.constructor.name == 'DOMWindow')
      || typeof(process) != 'undefined') { // fast-path for Chrome and Node
    return this.constructor.name;
  }
  var str = Object.prototype.toString.call(this);
  str = str.substring(8, str.length - 1);
  if (str == 'Window') {
    str = 'DOMWindow';
  } else if (str == 'Document') {
    str = 'HTMLDocument';
  }
  return str;
});
function $throw(e) {
  // If e is not a value, we can use V8's captureStackTrace utility method.
  // TODO(jmesserly): capture the stack trace on other JS engines.
  if (e && (typeof e == 'object') && Error.captureStackTrace) {
    // TODO(jmesserly): this will clobber the e.stack property
    Error.captureStackTrace(e, $throw);
  }
  throw e;
}
$defProp(Object.prototype, '$index', function(i) {
  var proto = Object.getPrototypeOf(this);
  if (proto !== Object) {
    proto.$index = function(i) { return this[i]; }
  }
  return this[i];
});
$defProp(Array.prototype, '$index', function(index) {
  var i = index | 0;
  if (i !== index) {
    throw new IllegalArgumentException('index is not int');
  } else if (i < 0 || i >= this.length) {
    throw new IndexOutOfRangeException(index);
  }
  return this[i];
});
$defProp(String.prototype, '$index', function(i) {
  return this[i];
});
$defProp(Object.prototype, '$setindex', function(i, value) {
  var proto = Object.getPrototypeOf(this);
  if (proto !== Object) {
    proto.$setindex = function(i, value) { return this[i] = value; }
  }
  return this[i] = value;
});
$defProp(Array.prototype, '$setindex', function(index, value) {
  var i = index | 0;
  if (i !== index) {
    throw new IllegalArgumentException('index is not int');
  } else if (i < 0 || i >= this.length) {
    throw new IndexOutOfRangeException(index);
  }
  return this[i] = value;
});
function $wrap_call$1(fn) { return fn; }
function $add(x, y) {
  return ((typeof(x) == 'number' && typeof(y) == 'number') ||
          (typeof(x) == 'string'))
    ? x + y : x.$add(y);
}
function $eq(x, y) {
  if (x == null) return y == null;
  return (typeof(x) == 'number' && typeof(y) == 'number') ||
         (typeof(x) == 'boolean' && typeof(y) == 'boolean') ||
         (typeof(x) == 'string' && typeof(y) == 'string')
    ? x == y : x.$eq(y);
}
// TODO(jimhug): Should this or should it not match equals?
$defProp(Object.prototype, '$eq', function(other) {
  return this === other;
});
function $truncdiv(x, y) {
  if (typeof(x) == 'number' && typeof(y) == 'number') {
    if (y == 0) $throw(new IntegerDivisionByZeroException());
    var tmp = x / y;
    return (tmp < 0) ? Math.ceil(tmp) : Math.floor(tmp);
  } else {
    return x.$truncdiv(y);
  }
}
$defProp(Object.prototype, "get$typeName", Object.prototype.$typeNameOf);
// ********** Code for Object **************
$defProp(Object.prototype, "get$dynamic", function() {
  "use strict"; return this;
});
$defProp(Object.prototype, "noSuchMethod", function(name, args) {
  $throw(new NoSuchMethodException(this, name, args));
});
$defProp(Object.prototype, "addEventListener$3", function($0, $1, $2) {
  return this.noSuchMethod("addEventListener", [$0, $1, $2]);
});
// ********** Code for IndexOutOfRangeException **************
function IndexOutOfRangeException(_index) {
  this._index = _index;
}
IndexOutOfRangeException.prototype.is$IndexOutOfRangeException = function(){return true};
IndexOutOfRangeException.prototype.toString = function() {
  return ("IndexOutOfRangeException: " + this._index);
}
// ********** Code for NoSuchMethodException **************
function NoSuchMethodException(_receiver, _functionName, _arguments) {
  this._receiver = _receiver;
  this._functionName = _functionName;
  this._arguments = _arguments;
}
NoSuchMethodException.prototype.toString = function() {
  var sb = new StringBufferImpl("");
  for (var i = (0);
   i < this._arguments.get$length(); i++) {
    if (i > (0)) {
      sb.add(", ");
    }
    sb.add(this._arguments.$index(i));
  }
  sb.add("]");
  return $add(("NoSuchMethodException - receiver: '" + this._receiver + "' "), ("function name: '" + this._functionName + "' arguments: [" + sb + "]"));
}
// ********** Code for ClosureArgumentMismatchException **************
function ClosureArgumentMismatchException() {

}
ClosureArgumentMismatchException.prototype.toString = function() {
  return "Closure argument mismatch";
}
// ********** Code for IllegalArgumentException **************
function IllegalArgumentException(args) {
  this._args = args;
}
IllegalArgumentException.prototype.is$IllegalArgumentException = function(){return true};
IllegalArgumentException.prototype.toString = function() {
  return ("Illegal argument(s): " + this._args);
}
// ********** Code for NoMoreElementsException **************
function NoMoreElementsException() {

}
NoMoreElementsException.prototype.toString = function() {
  return "NoMoreElementsException";
}
// ********** Code for UnsupportedOperationException **************
function UnsupportedOperationException(_message) {
  this._message = _message;
}
UnsupportedOperationException.prototype.toString = function() {
  return ("UnsupportedOperationException: " + this._message);
}
// ********** Code for IntegerDivisionByZeroException **************
function IntegerDivisionByZeroException() {

}
IntegerDivisionByZeroException.prototype.is$IntegerDivisionByZeroException = function(){return true};
IntegerDivisionByZeroException.prototype.toString = function() {
  return "IntegerDivisionByZeroException";
}
// ********** Code for dart_core_Function **************
Function.prototype.to$call$0 = function() {
  this.call$0 = this._genStub(0);
  this.to$call$0 = function() { return this.call$0; };
  return this.call$0;
};
Function.prototype.call$0 = function() {
  return this.to$call$0()();
};
function to$call$0(f) { return f && f.to$call$0(); }
Function.prototype.to$call$1 = function() {
  this.call$1 = this._genStub(1);
  this.to$call$1 = function() { return this.call$1; };
  return this.call$1;
};
Function.prototype.call$1 = function($0) {
  return this.to$call$1()($0);
};
function to$call$1(f) { return f && f.to$call$1(); }
Function.prototype.to$call$2 = function() {
  this.call$2 = this._genStub(2);
  this.to$call$2 = function() { return this.call$2; };
  return this.call$2;
};
Function.prototype.call$2 = function($0, $1) {
  return this.to$call$2()($0, $1);
};
function to$call$2(f) { return f && f.to$call$2(); }
// ********** Code for top level **************
function dart_core_print(obj) {
  return _print(obj);
}
function _print(obj) {
  if (typeof console == 'object') {
    if (obj) obj = obj.toString();
    console.log(obj);
  } else {
    write(obj);
    write('\n');
  }
}
//  ********** Library dart:coreimpl **************
// ********** Code for ListFactory **************
ListFactory = Array;
$defProp(ListFactory.prototype, "get$length", function() { return this.length; });
$defProp(ListFactory.prototype, "set$length", function(value) { return this.length = value; });
$defProp(ListFactory.prototype, "add", function(value) {
  this.push(value);
});
$defProp(ListFactory.prototype, "clear", function() {
  this.set$length((0));
});
$defProp(ListFactory.prototype, "iterator", function() {
  return new ListIterator(this);
});
// ********** Code for ListIterator **************
function ListIterator(array) {
  this._array = array;
  this._pos = (0);
}
ListIterator.prototype.hasNext = function() {
  return this._array.get$length() > this._pos;
}
ListIterator.prototype.next = function() {
  if (!this.hasNext()) {
    $throw(const$0001);
  }
  return this._array.$index(this._pos++);
}
// ********** Code for NumImplementation **************
NumImplementation = Number;
NumImplementation.prototype.hashCode = function() {
  'use strict'; return this & 0x1FFFFFFF;
}
// ********** Code for HashMapImplementation **************
function HashMapImplementation() {
  this._numberOfEntries = (0);
  this._numberOfDeleted = (0);
  this._loadLimit = HashMapImplementation._computeLoadLimit((8));
  this._keys = new Array((8));
  this._values = new Array((8));
}
HashMapImplementation._computeLoadLimit = function(capacity) {
  return $truncdiv((capacity * (3)), (4));
}
HashMapImplementation._firstProbe = function(hashCode, length) {
  return hashCode & (length - (1));
}
HashMapImplementation._nextProbe = function(currentProbe, numberOfProbes, length) {
  return (currentProbe + numberOfProbes) & (length - (1));
}
HashMapImplementation.prototype._probeForAdding = function(key) {
  var hash = HashMapImplementation._firstProbe(key.hashCode(), this._keys.get$length());
  var numberOfProbes = (1);
  var initialHash = hash;
  var insertionIndex = (-1);
  while (true) {
    var existingKey = this._keys.$index(hash);
    if (null == existingKey) {
      if (insertionIndex < (0)) return hash;
      return insertionIndex;
    }
    else if ($eq(existingKey, key)) {
      return hash;
    }
    else if ((insertionIndex < (0)) && ((null == const$0000 ? null == (existingKey) : const$0000 === existingKey))) {
      insertionIndex = hash;
    }
    hash = HashMapImplementation._nextProbe(hash, numberOfProbes++, this._keys.get$length());
  }
}
HashMapImplementation.prototype._probeForLookup = function(key) {
  var hash = HashMapImplementation._firstProbe(key.hashCode(), this._keys.get$length());
  var numberOfProbes = (1);
  var initialHash = hash;
  while (true) {
    var existingKey = this._keys.$index(hash);
    if (null == existingKey) return (-1);
    if ($eq(existingKey, key)) return hash;
    hash = HashMapImplementation._nextProbe(hash, numberOfProbes++, this._keys.get$length());
  }
}
HashMapImplementation.prototype._ensureCapacity = function() {
  var newNumberOfEntries = this._numberOfEntries + (1);
  if (newNumberOfEntries >= this._loadLimit) {
    this._grow(this._keys.get$length() * (2));
    return;
  }
  var capacity = this._keys.get$length();
  var numberOfFreeOrDeleted = capacity - newNumberOfEntries;
  var numberOfFree = numberOfFreeOrDeleted - this._numberOfDeleted;
  if (this._numberOfDeleted > numberOfFree) {
    this._grow(this._keys.get$length());
  }
}
HashMapImplementation._isPowerOfTwo = function(x) {
  return ((x & (x - (1))) == (0));
}
HashMapImplementation.prototype._grow = function(newCapacity) {
  var capacity = this._keys.get$length();
  this._loadLimit = HashMapImplementation._computeLoadLimit(newCapacity);
  var oldKeys = this._keys;
  var oldValues = this._values;
  this._keys = new Array(newCapacity);
  this._values = new Array(newCapacity);
  for (var i = (0);
   i < capacity; i++) {
    var key = oldKeys.$index(i);
    if (null == key || (null == key ? null == (const$0000) : key === const$0000)) {
      continue;
    }
    var value = oldValues.$index(i);
    var newIndex = this._probeForAdding(key);
    this._keys.$setindex(newIndex, key);
    this._values.$setindex(newIndex, value);
  }
  this._numberOfDeleted = (0);
}
HashMapImplementation.prototype.$setindex = function(key, value) {
  var $0;
  this._ensureCapacity();
  var index = this._probeForAdding(key);
  if ((null == this._keys.$index(index)) || ((($0 = this._keys.$index(index)) == null ? null == (const$0000) : $0 === const$0000))) {
    this._numberOfEntries++;
  }
  this._keys.$setindex(index, key);
  this._values.$setindex(index, value);
}
HashMapImplementation.prototype.putIfAbsent = function(key, ifAbsent) {
  var index = this._probeForLookup(key);
  if (index >= (0)) return this._values.$index(index);
  var value = ifAbsent();
  this.$setindex(key, value);
  return value;
}
// ********** Code for HashSetImplementation **************
function HashSetImplementation() {}
HashSetImplementation.prototype.iterator = function() {
  return new HashSetIterator(this);
}
// ********** Code for HashSetIterator **************
function HashSetIterator(set_) {
  this._entries = set_._backingMap._keys;
  this._nextValidIndex = (-1);
  this._advance();
}
HashSetIterator.prototype.hasNext = function() {
  var $0;
  if (this._nextValidIndex >= this._entries.get$length()) return false;
  if ((($0 = this._entries.$index(this._nextValidIndex)) == null ? null == (const$0000) : $0 === const$0000)) {
    this._advance();
  }
  return this._nextValidIndex < this._entries.get$length();
}
HashSetIterator.prototype.next = function() {
  if (!this.hasNext()) {
    $throw(const$0001);
  }
  var res = this._entries.$index(this._nextValidIndex);
  this._advance();
  return res;
}
HashSetIterator.prototype._advance = function() {
  var length = this._entries.get$length();
  var entry;
  var deletedKey = const$0000;
  do {
    if (++this._nextValidIndex >= length) break;
    entry = this._entries.$index(this._nextValidIndex);
  }
  while ((null == entry) || ((null == entry ? null == (deletedKey) : entry === deletedKey)))
}
// ********** Code for _DeletedKeySentinel **************
function _DeletedKeySentinel() {

}
// ********** Code for DoubleLinkedQueue **************
function DoubleLinkedQueue() {}
DoubleLinkedQueue.prototype.iterator = function() {
  return new _DoubleLinkedQueueIterator(this._sentinel);
}
// ********** Code for _DoubleLinkedQueueIterator **************
function _DoubleLinkedQueueIterator(_sentinel) {
  this._sentinel = _sentinel;
  this._currentEntry = this._sentinel;
}
_DoubleLinkedQueueIterator.prototype.hasNext = function() {
  var $0;
  return (($0 = this._currentEntry._next) == null ? null != (this._sentinel) : $0 !== this._sentinel);
}
_DoubleLinkedQueueIterator.prototype.next = function() {
  if (!this.hasNext()) {
    $throw(const$0001);
  }
  this._currentEntry = this._currentEntry._next;
  return this._currentEntry.get$element();
}
// ********** Code for StringBufferImpl **************
function StringBufferImpl(content) {
  this.clear();
  this.add(content);
}
StringBufferImpl.prototype.add = function(obj) {
  var str = obj.toString();
  if (null == str || str.isEmpty()) return this;
  this._buffer.add(str);
  this._length = this._length + str.length;
  return this;
}
StringBufferImpl.prototype.clear = function() {
  this._buffer = new Array();
  this._length = (0);
  return this;
}
StringBufferImpl.prototype.toString = function() {
  if (this._buffer.get$length() == (0)) return "";
  if (this._buffer.get$length() == (1)) return this._buffer.$index((0));
  var result = StringBase.concatAll(this._buffer);
  this._buffer.clear();
  this._buffer.add(result);
  return result;
}
// ********** Code for StringBase **************
function StringBase() {}
StringBase.join = function(strings, separator) {
  if (strings.get$length() == (0)) return "";
  var s = strings.$index((0));
  for (var i = (1);
   i < strings.get$length(); i++) {
    s = $add($add(s, separator), strings.$index(i));
  }
  return s;
}
StringBase.concatAll = function(strings) {
  return StringBase.join(strings, "");
}
// ********** Code for StringImplementation **************
StringImplementation = String;
StringImplementation.prototype.isEmpty = function() {
  return this.length == (0);
}
StringImplementation.prototype.hashCode = function() {
      'use strict';
      var hash = 0;
      for (var i = 0; i < this.length; i++) {
        hash = 0x1fffffff & (hash + this.charCodeAt(i));
        hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
        hash ^= hash >> 6;
      }

      hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
      hash ^= hash >> 11;
      return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
}
// ********** Code for _Worker **************
// ********** Code for _ArgumentMismatchException **************
/** Implements extends for Dart classes on JavaScript prototypes. */
function $inherits(child, parent) {
  if (child.prototype.__proto__) {
    child.prototype.__proto__ = parent.prototype;
  } else {
    function tmp() {};
    tmp.prototype = parent.prototype;
    child.prototype = new tmp();
    child.prototype.constructor = child;
  }
}
$inherits(_ArgumentMismatchException, ClosureArgumentMismatchException);
function _ArgumentMismatchException(_message) {
  this._dart_coreimpl_message = _message;
  ClosureArgumentMismatchException.call(this);
}
_ArgumentMismatchException.prototype.toString = function() {
  return ("Closure argument mismatch: " + this._dart_coreimpl_message);
}
// ********** Code for _FunctionImplementation **************
_FunctionImplementation = Function;
_FunctionImplementation.prototype._genStub = function(argsLength, names) {
      // Fast path #1: if no named arguments and arg count matches
      if (this.length == argsLength && !names) {
        return this;
      }

      var paramsNamed = this.$optional ? (this.$optional.length / 2) : 0;
      var paramsBare = this.length - paramsNamed;
      var argsNamed = names ? names.length : 0;
      var argsBare = argsLength - argsNamed;

      // Check we got the right number of arguments
      if (argsBare < paramsBare || argsLength > this.length ||
          argsNamed > paramsNamed) {
        return function() {
          $throw(new _ArgumentMismatchException(
            'Wrong number of arguments to function. Expected ' + paramsBare +
            ' positional arguments and at most ' + paramsNamed +
            ' named arguments, but got ' + argsBare +
            ' positional arguments and ' + argsNamed + ' named arguments.'));
        };
      }

      // First, fill in all of the default values
      var p = new Array(paramsBare);
      if (paramsNamed) {
        p = p.concat(this.$optional.slice(paramsNamed));
      }
      // Fill in positional args
      var a = new Array(argsLength);
      for (var i = 0; i < argsBare; i++) {
        p[i] = a[i] = '$' + i;
      }
      // Then overwrite with supplied values for optional args
      var lastParameterIndex;
      var namesInOrder = true;
      for (var i = 0; i < argsNamed; i++) {
        var name = names[i];
        a[i + argsBare] = name;
        var j = this.$optional.indexOf(name);
        if (j < 0 || j >= paramsNamed) {
          return function() {
            $throw(new _ArgumentMismatchException(
              'Named argument "' + name + '" was not expected by function.' +
              ' Did you forget to mark the function parameter [optional]?'));
          };
        } else if (lastParameterIndex && lastParameterIndex > j) {
          namesInOrder = false;
        }
        p[j + paramsBare] = name;
        lastParameterIndex = j;
      }

      if (this.length == argsLength && namesInOrder) {
        // Fast path #2: named arguments, but they're in order and all supplied.
        return this;
      }

      // Note: using Function instead of 'eval' to get a clean scope.
      // TODO(jmesserly): evaluate the performance of these stubs.
      var f = 'function(' + a.join(',') + '){return $f(' + p.join(',') + ');}';
      return new Function('$f', 'return ' + f + '').call(null, this);
    
}
// ********** Code for top level **************
//  ********** Library dom **************
// ********** Code for DOMTypeJs **************
function $dynamic(name) {
  var f = Object.prototype[name];
  if (f && f.methods) return f.methods;

  var methods = {};
  if (f) methods.Object = f;
  function $dynamicBind() {
    // Find the target method
    var obj = this;
    var tag = obj.$typeNameOf();
    var method = methods[tag];
    if (!method) {
      var table = $dynamicMetadata;
      for (var i = 0; i < table.length; i++) {
        var entry = table[i];
        if (entry.map.hasOwnProperty(tag)) {
          method = methods[entry.tag];
          if (method) break;
        }
      }
    }
    method = method || methods.Object;
    var proto = Object.getPrototypeOf(obj);
    if (!proto.hasOwnProperty(name)) {
      $defProp(proto, name, method);
    }

    return method.apply(this, Array.prototype.slice.call(arguments));
  };
  $dynamicBind.methods = methods;
  $defProp(Object.prototype, name, $dynamicBind);
  return methods;
}
if (typeof $dynamicMetadata == 'undefined') $dynamicMetadata = [];

function $dynamicSetMetadata(inputTable) {
  // TODO: Deal with light isolates.
  var table = [];
  for (var i = 0; i < inputTable.length; i++) {
    var tag = inputTable[i][0];
    var tags = inputTable[i][1];
    var map = {};
    var tagNames = tags.split('|');
    for (var j = 0; j < tagNames.length; j++) {
      map[tagNames[j]] = true;
    }
    table.push({tag: tag, tags: tags, map: map});
  }
  $dynamicMetadata = table;
}
$dynamic("get$dartObjectLocalStorage").DOMType = function() { return this.dartObjectLocalStorage; };
$dynamic("set$dartObjectLocalStorage").DOMType = function(value) { return this.dartObjectLocalStorage = value; };
// ********** Code for AbstractWorkerJs **************
$dynamic("addEventListener$3").AbstractWorker = function($0, $1, $2) {
  return this.addEventListener($0, $wrap_call$1(to$call$1($1)), $2);
};
// ********** Code for ArrayBufferJs **************
// ********** Code for ArrayBufferViewJs **************
// ********** Code for NodeJs **************
$dynamic("addEventListener$3").Node = function($0, $1, $2) {
  return this.addEventListener($0, $wrap_call$1(to$call$1($1)), $2);
};
// ********** Code for AttrJs **************
// ********** Code for AudioBufferJs **************
// ********** Code for AudioNodeJs **************
// ********** Code for AudioSourceNodeJs **************
// ********** Code for AudioBufferSourceNodeJs **************
// ********** Code for AudioChannelMergerJs **************
// ********** Code for AudioChannelSplitterJs **************
// ********** Code for AudioContextJs **************
// ********** Code for AudioDestinationNodeJs **************
// ********** Code for AudioParamJs **************
// ********** Code for AudioGainJs **************
// ********** Code for AudioGainNodeJs **************
// ********** Code for AudioListenerJs **************
// ********** Code for AudioPannerNodeJs **************
// ********** Code for EventJs **************
$dynamic("get$type").Event = function() {
  return this.type;
}
// ********** Code for AudioProcessingEventJs **************
// ********** Code for BarInfoJs **************
// ********** Code for BeforeLoadEventJs **************
// ********** Code for BiquadFilterNodeJs **************
$dynamic("get$type").BiquadFilterNode = function() {
  return this.type;
}
// ********** Code for BlobJs **************
$dynamic("get$type").Blob = function() {
  return this.type;
}
// ********** Code for CharacterDataJs **************
// ********** Code for TextJs **************
// ********** Code for CDATASectionJs **************
// ********** Code for CSSRuleJs **************
$dynamic("get$type").CSSRule = function() {
  return this.type;
}
// ********** Code for CSSCharsetRuleJs **************
// ********** Code for CSSFontFaceRuleJs **************
// ********** Code for CSSImportRuleJs **************
// ********** Code for CSSMediaRuleJs **************
// ********** Code for CSSPageRuleJs **************
// ********** Code for CSSValueJs **************
// ********** Code for CSSPrimitiveValueJs **************
// ********** Code for CSSRuleListJs **************
// ********** Code for CSSStyleDeclarationJs **************
// ********** Code for CSSStyleRuleJs **************
// ********** Code for StyleSheetJs **************
$dynamic("get$type").StyleSheet = function() {
  return this.type;
}
// ********** Code for CSSStyleSheetJs **************
// ********** Code for CSSUnknownRuleJs **************
// ********** Code for CSSValueListJs **************
// ********** Code for CanvasGradientJs **************
// ********** Code for CanvasPatternJs **************
// ********** Code for CanvasPixelArrayJs **************
$dynamic("get$length").CanvasPixelArray = function() {
  return this.length;
}
$dynamic("$index").CanvasPixelArray = function(index) {
  return this[index];
}
$dynamic("$setindex").CanvasPixelArray = function(index, value) {
  this[index] = value
}
$dynamic("iterator").CanvasPixelArray = function() {
  return new dom__FixedSizeListIterator_int(this);
}
$dynamic("add").CanvasPixelArray = function(value) {
  $throw(new UnsupportedOperationException("Cannot add to immutable List."));
}
// ********** Code for CanvasRenderingContextJs **************
// ********** Code for CanvasRenderingContext2DJs **************
// ********** Code for ClientRectJs **************
// ********** Code for ClientRectListJs **************
// ********** Code for ClipboardJs **************
// ********** Code for CloseEventJs **************
// ********** Code for CommentJs **************
// ********** Code for UIEventJs **************
// ********** Code for CompositionEventJs **************
// ********** Code for ConsoleJs **************
ConsoleJs = (typeof console == 'undefined' ? {} : console);
ConsoleJs.get$dartObjectLocalStorage = function() { return this.dartObjectLocalStorage; };
ConsoleJs.set$dartObjectLocalStorage = function(value) { return this.dartObjectLocalStorage = value; };
// ********** Code for ConvolverNodeJs **************
// ********** Code for CoordinatesJs **************
// ********** Code for CounterJs **************
// ********** Code for CryptoJs **************
// ********** Code for CustomEventJs **************
// ********** Code for DOMApplicationCacheJs **************
$dynamic("addEventListener$3").DOMApplicationCache = function($0, $1, $2) {
  return this.addEventListener($0, $wrap_call$1(to$call$1($1)), $2);
};
// ********** Code for DOMExceptionJs **************
// ********** Code for DOMFileSystemJs **************
// ********** Code for DOMFileSystemSyncJs **************
// ********** Code for DOMFormDataJs **************
// ********** Code for DOMImplementationJs **************
// ********** Code for DOMMimeTypeJs **************
$dynamic("get$type").DOMMimeType = function() {
  return this.type;
}
// ********** Code for DOMMimeTypeArrayJs **************
// ********** Code for DOMParserJs **************
// ********** Code for DOMPluginJs **************
// ********** Code for DOMPluginArrayJs **************
// ********** Code for DOMSelectionJs **************
$dynamic("get$type").DOMSelection = function() {
  return this.type;
}
// ********** Code for DOMTokenListJs **************
// ********** Code for DOMSettableTokenListJs **************
// ********** Code for DOMURLJs **************
// ********** Code for DOMWindowJs **************
$dynamic("addEventListener$3").DOMWindow = function($0, $1, $2) {
  return this.addEventListener($0, $wrap_call$1(to$call$1($1)), $2);
};
// ********** Code for DataTransferItemJs **************
$dynamic("get$type").DataTransferItem = function() {
  return this.type;
}
// ********** Code for DataTransferItemListJs **************
// ********** Code for DataViewJs **************
// ********** Code for DatabaseJs **************
// ********** Code for DatabaseSyncJs **************
// ********** Code for WorkerContextJs **************
$dynamic("addEventListener$3").WorkerContext = function($0, $1, $2) {
  return this.addEventListener($0, $wrap_call$1(to$call$1($1)), $2);
};
// ********** Code for DedicatedWorkerContextJs **************
// ********** Code for DelayNodeJs **************
// ********** Code for DeviceMotionEventJs **************
// ********** Code for DeviceOrientationEventJs **************
// ********** Code for EntryJs **************
// ********** Code for DirectoryEntryJs **************
// ********** Code for EntrySyncJs **************
// ********** Code for DirectoryEntrySyncJs **************
// ********** Code for DirectoryReaderJs **************
// ********** Code for DirectoryReaderSyncJs **************
// ********** Code for DocumentJs **************
$dynamic("get$defaultView").Document = function() {
  return this.defaultView;
}
$dynamic("get$documentElement").Document = function() {
  return this.documentElement;
}
// ********** Code for DocumentFragmentJs **************
// ********** Code for DocumentTypeJs **************
// ********** Code for DynamicsCompressorNodeJs **************
// ********** Code for ElementJs **************
// ********** Code for ElementTimeControlJs **************
// ********** Code for ElementTraversalJs **************
// ********** Code for EntityJs **************
// ********** Code for EntityReferenceJs **************
// ********** Code for EntryArrayJs **************
// ********** Code for EntryArraySyncJs **************
// ********** Code for ErrorEventJs **************
// ********** Code for EventExceptionJs **************
// ********** Code for EventSourceJs **************
$dynamic("addEventListener$3").EventSource = function($0, $1, $2) {
  return this.addEventListener($0, $wrap_call$1(to$call$1($1)), $2);
};
// ********** Code for EventTargetJs **************
$dynamic("addEventListener$3").EventTarget = function($0, $1, $2) {
  return this.addEventListener($0, $wrap_call$1(to$call$1($1)), $2);
};
// ********** Code for FileJs **************
// ********** Code for FileEntryJs **************
// ********** Code for FileEntrySyncJs **************
// ********** Code for FileErrorJs **************
// ********** Code for FileExceptionJs **************
// ********** Code for FileListJs **************
// ********** Code for FileReaderJs **************
$dynamic("addEventListener$3").FileReader = function($0, $1, $2) {
  return this.addEventListener($0, $wrap_call$1(to$call$1($1)), $2);
};
// ********** Code for FileReaderSyncJs **************
// ********** Code for FileWriterJs **************
// ********** Code for FileWriterSyncJs **************
// ********** Code for Float32ArrayJs **************
var Float32ArrayJs = {};
$dynamic("get$length").Float32Array = function() {
  return this.length;
}
$dynamic("$index").Float32Array = function(index) {
  return this[index];
}
$dynamic("$setindex").Float32Array = function(index, value) {
  this[index] = value
}
$dynamic("iterator").Float32Array = function() {
  return new dom__FixedSizeListIterator_num(this);
}
$dynamic("add").Float32Array = function(value) {
  $throw(new UnsupportedOperationException("Cannot add to immutable List."));
}
// ********** Code for Float64ArrayJs **************
var Float64ArrayJs = {};
$dynamic("get$length").Float64Array = function() {
  return this.length;
}
$dynamic("$index").Float64Array = function(index) {
  return this[index];
}
$dynamic("$setindex").Float64Array = function(index, value) {
  this[index] = value
}
$dynamic("iterator").Float64Array = function() {
  return new dom__FixedSizeListIterator_num(this);
}
$dynamic("add").Float64Array = function(value) {
  $throw(new UnsupportedOperationException("Cannot add to immutable List."));
}
// ********** Code for GeolocationJs **************
// ********** Code for GeopositionJs **************
// ********** Code for HTMLAllCollectionJs **************
// ********** Code for HTMLElementJs **************
// ********** Code for HTMLAnchorElementJs **************
$dynamic("get$type").HTMLAnchorElement = function() {
  return this.type;
}
// ********** Code for HTMLAppletElementJs **************
// ********** Code for HTMLAreaElementJs **************
// ********** Code for HTMLMediaElementJs **************
// ********** Code for HTMLAudioElementJs **************
// ********** Code for HTMLBRElementJs **************
// ********** Code for HTMLBaseElementJs **************
// ********** Code for HTMLBaseFontElementJs **************
// ********** Code for HTMLBodyElementJs **************
// ********** Code for HTMLButtonElementJs **************
$dynamic("get$type").HTMLButtonElement = function() {
  return this.type;
}
// ********** Code for HTMLCanvasElementJs **************
// ********** Code for HTMLCollectionJs **************
$dynamic("get$length").HTMLCollection = function() {
  return this.length;
}
$dynamic("$index").HTMLCollection = function(index) {
  return this[index];
}
$dynamic("$setindex").HTMLCollection = function(index, value) {
  $throw(new UnsupportedOperationException("Cannot assign element of immutable List."));
}
$dynamic("iterator").HTMLCollection = function() {
  return new dom__FixedSizeListIterator_dom_Node(this);
}
$dynamic("add").HTMLCollection = function(value) {
  $throw(new UnsupportedOperationException("Cannot add to immutable List."));
}
// ********** Code for HTMLDListElementJs **************
// ********** Code for HTMLDataListElementJs **************
// ********** Code for HTMLDetailsElementJs **************
// ********** Code for HTMLDirectoryElementJs **************
// ********** Code for HTMLDivElementJs **************
// ********** Code for HTMLDocumentJs **************
// ********** Code for HTMLEmbedElementJs **************
$dynamic("get$type").HTMLEmbedElement = function() {
  return this.type;
}
// ********** Code for HTMLFieldSetElementJs **************
// ********** Code for HTMLFontElementJs **************
// ********** Code for HTMLFormElementJs **************
// ********** Code for HTMLFrameElementJs **************
// ********** Code for HTMLFrameSetElementJs **************
// ********** Code for HTMLHRElementJs **************
// ********** Code for HTMLHeadElementJs **************
// ********** Code for HTMLHeadingElementJs **************
// ********** Code for HTMLHtmlElementJs **************
// ********** Code for HTMLIFrameElementJs **************
// ********** Code for HTMLImageElementJs **************
// ********** Code for HTMLInputElementJs **************
$dynamic("get$type").HTMLInputElement = function() {
  return this.type;
}
// ********** Code for HTMLIsIndexElementJs **************
// ********** Code for HTMLKeygenElementJs **************
$dynamic("get$type").HTMLKeygenElement = function() {
  return this.type;
}
// ********** Code for HTMLLIElementJs **************
$dynamic("get$type").HTMLLIElement = function() {
  return this.type;
}
// ********** Code for HTMLLabelElementJs **************
// ********** Code for HTMLLegendElementJs **************
// ********** Code for HTMLLinkElementJs **************
$dynamic("get$type").HTMLLinkElement = function() {
  return this.type;
}
// ********** Code for HTMLMapElementJs **************
// ********** Code for HTMLMarqueeElementJs **************
// ********** Code for HTMLMenuElementJs **************
// ********** Code for HTMLMetaElementJs **************
// ********** Code for HTMLMeterElementJs **************
// ********** Code for HTMLModElementJs **************
// ********** Code for HTMLOListElementJs **************
$dynamic("get$type").HTMLOListElement = function() {
  return this.type;
}
// ********** Code for HTMLObjectElementJs **************
$dynamic("get$type").HTMLObjectElement = function() {
  return this.type;
}
// ********** Code for HTMLOptGroupElementJs **************
// ********** Code for HTMLOptionElementJs **************
// ********** Code for HTMLOptionsCollectionJs **************
$dynamic("get$length").HTMLOptionsCollection = function() {
  return this.length;
}
// ********** Code for HTMLOutputElementJs **************
$dynamic("get$type").HTMLOutputElement = function() {
  return this.type;
}
// ********** Code for HTMLParagraphElementJs **************
// ********** Code for HTMLParamElementJs **************
$dynamic("get$type").HTMLParamElement = function() {
  return this.type;
}
// ********** Code for HTMLPreElementJs **************
// ********** Code for HTMLProgressElementJs **************
// ********** Code for HTMLPropertiesCollectionJs **************
$dynamic("get$length").HTMLPropertiesCollection = function() {
  return this.length;
}
// ********** Code for HTMLQuoteElementJs **************
// ********** Code for HTMLScriptElementJs **************
$dynamic("get$type").HTMLScriptElement = function() {
  return this.type;
}
// ********** Code for HTMLSelectElementJs **************
$dynamic("get$type").HTMLSelectElement = function() {
  return this.type;
}
// ********** Code for HTMLSourceElementJs **************
$dynamic("get$type").HTMLSourceElement = function() {
  return this.type;
}
// ********** Code for HTMLSpanElementJs **************
// ********** Code for HTMLStyleElementJs **************
$dynamic("get$type").HTMLStyleElement = function() {
  return this.type;
}
// ********** Code for HTMLTableCaptionElementJs **************
// ********** Code for HTMLTableCellElementJs **************
// ********** Code for HTMLTableColElementJs **************
// ********** Code for HTMLTableElementJs **************
// ********** Code for HTMLTableRowElementJs **************
// ********** Code for HTMLTableSectionElementJs **************
// ********** Code for HTMLTextAreaElementJs **************
$dynamic("get$type").HTMLTextAreaElement = function() {
  return this.type;
}
// ********** Code for HTMLTitleElementJs **************
// ********** Code for HTMLTrackElementJs **************
// ********** Code for HTMLUListElementJs **************
$dynamic("get$type").HTMLUListElement = function() {
  return this.type;
}
// ********** Code for HTMLUnknownElementJs **************
// ********** Code for HTMLVideoElementJs **************
// ********** Code for HashChangeEventJs **************
// ********** Code for HighPass2FilterNodeJs **************
// ********** Code for HistoryJs **************
// ********** Code for IDBAnyJs **************
// ********** Code for IDBCursorJs **************
// ********** Code for IDBCursorWithValueJs **************
// ********** Code for IDBDatabaseJs **************
$dynamic("addEventListener$3").IDBDatabase = function($0, $1, $2) {
  return this.addEventListener($0, $wrap_call$1(to$call$1($1)), $2);
};
// ********** Code for IDBDatabaseErrorJs **************
// ********** Code for IDBDatabaseExceptionJs **************
// ********** Code for IDBFactoryJs **************
// ********** Code for IDBIndexJs **************
// ********** Code for IDBKeyJs **************
// ********** Code for IDBKeyRangeJs **************
// ********** Code for IDBObjectStoreJs **************
// ********** Code for IDBRequestJs **************
$dynamic("addEventListener$3").IDBRequest = function($0, $1, $2) {
  return this.addEventListener($0, $wrap_call$1(to$call$1($1)), $2);
};
// ********** Code for IDBTransactionJs **************
$dynamic("addEventListener$3").IDBTransaction = function($0, $1, $2) {
  return this.addEventListener($0, $wrap_call$1(to$call$1($1)), $2);
};
// ********** Code for IDBVersionChangeEventJs **************
// ********** Code for IDBVersionChangeRequestJs **************
// ********** Code for ImageDataJs **************
// ********** Code for InjectedScriptHostJs **************
$dynamic("get$type").InjectedScriptHost = function() {
  return this.type.bind(this);
}
// ********** Code for InspectorFrontendHostJs **************
// ********** Code for Int16ArrayJs **************
var Int16ArrayJs = {};
$dynamic("get$length").Int16Array = function() {
  return this.length;
}
$dynamic("$index").Int16Array = function(index) {
  return this[index];
}
$dynamic("$setindex").Int16Array = function(index, value) {
  this[index] = value
}
$dynamic("iterator").Int16Array = function() {
  return new dom__FixedSizeListIterator_int(this);
}
$dynamic("add").Int16Array = function(value) {
  $throw(new UnsupportedOperationException("Cannot add to immutable List."));
}
// ********** Code for Int32ArrayJs **************
var Int32ArrayJs = {};
$dynamic("get$length").Int32Array = function() {
  return this.length;
}
$dynamic("$index").Int32Array = function(index) {
  return this[index];
}
$dynamic("$setindex").Int32Array = function(index, value) {
  this[index] = value
}
$dynamic("iterator").Int32Array = function() {
  return new dom__FixedSizeListIterator_int(this);
}
$dynamic("add").Int32Array = function(value) {
  $throw(new UnsupportedOperationException("Cannot add to immutable List."));
}
// ********** Code for Int8ArrayJs **************
var Int8ArrayJs = {};
$dynamic("get$length").Int8Array = function() {
  return this.length;
}
$dynamic("$index").Int8Array = function(index) {
  return this[index];
}
$dynamic("$setindex").Int8Array = function(index, value) {
  this[index] = value
}
$dynamic("iterator").Int8Array = function() {
  return new dom__FixedSizeListIterator_int(this);
}
$dynamic("add").Int8Array = function(value) {
  $throw(new UnsupportedOperationException("Cannot add to immutable List."));
}
// ********** Code for JavaScriptAudioNodeJs **************
// ********** Code for JavaScriptCallFrameJs **************
$dynamic("get$type").JavaScriptCallFrame = function() {
  return this.type;
}
// ********** Code for KeyboardEventJs **************
// ********** Code for LocationJs **************
// ********** Code for LowPass2FilterNodeJs **************
// ********** Code for MediaControllerJs **************
$dynamic("addEventListener$3").MediaController = function($0, $1, $2) {
  return this.addEventListener($0, $wrap_call$1(to$call$1($1)), $2);
};
// ********** Code for MediaElementAudioSourceNodeJs **************
// ********** Code for MediaErrorJs **************
// ********** Code for MediaListJs **************
$dynamic("get$length").MediaList = function() {
  return this.length;
}
$dynamic("$index").MediaList = function(index) {
  return this[index];
}
$dynamic("$setindex").MediaList = function(index, value) {
  $throw(new UnsupportedOperationException("Cannot assign element of immutable List."));
}
$dynamic("iterator").MediaList = function() {
  return new dom__FixedSizeListIterator_dart_core_String(this);
}
$dynamic("add").MediaList = function(value) {
  $throw(new UnsupportedOperationException("Cannot add to immutable List."));
}
// ********** Code for MediaQueryListJs **************
// ********** Code for MediaQueryListListenerJs **************
// ********** Code for MemoryInfoJs **************
// ********** Code for MessageChannelJs **************
// ********** Code for MessageEventJs **************
// ********** Code for MessagePortJs **************
$dynamic("addEventListener$3").MessagePort = function($0, $1, $2) {
  return this.addEventListener($0, $wrap_call$1(to$call$1($1)), $2);
};
// ********** Code for MetadataJs **************
// ********** Code for MouseEventJs **************
// ********** Code for MutationCallbackJs **************
// ********** Code for MutationEventJs **************
// ********** Code for MutationRecordJs **************
$dynamic("get$type").MutationRecord = function() {
  return this.type;
}
// ********** Code for NamedNodeMapJs **************
$dynamic("get$length").NamedNodeMap = function() {
  return this.length;
}
$dynamic("$index").NamedNodeMap = function(index) {
  return this[index];
}
$dynamic("$setindex").NamedNodeMap = function(index, value) {
  $throw(new UnsupportedOperationException("Cannot assign element of immutable List."));
}
$dynamic("iterator").NamedNodeMap = function() {
  return new dom__FixedSizeListIterator_dom_Node(this);
}
$dynamic("add").NamedNodeMap = function(value) {
  $throw(new UnsupportedOperationException("Cannot add to immutable List."));
}
// ********** Code for NavigatorJs **************
// ********** Code for NodeFilterJs **************
// ********** Code for NodeIteratorJs **************
// ********** Code for NodeListJs **************
$dynamic("get$length").NodeList = function() {
  return this.length;
}
$dynamic("$index").NodeList = function(index) {
  return this[index];
}
$dynamic("$setindex").NodeList = function(index, value) {
  $throw(new UnsupportedOperationException("Cannot assign element of immutable List."));
}
$dynamic("iterator").NodeList = function() {
  return new dom__FixedSizeListIterator_dom_Node(this);
}
$dynamic("add").NodeList = function(value) {
  $throw(new UnsupportedOperationException("Cannot add to immutable List."));
}
// ********** Code for NodeSelectorJs **************
// ********** Code for NotationJs **************
// ********** Code for NotificationJs **************
$dynamic("addEventListener$3").Notification = function($0, $1, $2) {
  return this.addEventListener($0, $wrap_call$1(to$call$1($1)), $2);
};
// ********** Code for NotificationCenterJs **************
// ********** Code for OESStandardDerivativesJs **************
// ********** Code for OESTextureFloatJs **************
// ********** Code for OESVertexArrayObjectJs **************
// ********** Code for OfflineAudioCompletionEventJs **************
// ********** Code for OperationNotAllowedExceptionJs **************
// ********** Code for OverflowEventJs **************
// ********** Code for PageTransitionEventJs **************
// ********** Code for PerformanceJs **************
// ********** Code for PerformanceNavigationJs **************
$dynamic("get$type").PerformanceNavigation = function() {
  return this.type;
}
// ********** Code for PerformanceTimingJs **************
// ********** Code for PointerLockJs **************
// ********** Code for PopStateEventJs **************
// ********** Code for PositionErrorJs **************
// ********** Code for ProcessingInstructionJs **************
// ********** Code for ProgressEventJs **************
// ********** Code for RGBColorJs **************
// ********** Code for RangeJs **************
// ********** Code for RangeExceptionJs **************
// ********** Code for RealtimeAnalyserNodeJs **************
// ********** Code for RectJs **************
// ********** Code for SQLErrorJs **************
// ********** Code for SQLExceptionJs **************
// ********** Code for SQLResultSetJs **************
// ********** Code for SQLResultSetRowListJs **************
// ********** Code for SQLTransactionJs **************
// ********** Code for SQLTransactionSyncJs **************
// ********** Code for SVGElementJs **************
// ********** Code for SVGAElementJs **************
// ********** Code for SVGAltGlyphDefElementJs **************
// ********** Code for SVGTextContentElementJs **************
// ********** Code for SVGTextPositioningElementJs **************
// ********** Code for SVGAltGlyphElementJs **************
// ********** Code for SVGAltGlyphItemElementJs **************
// ********** Code for SVGAngleJs **************
// ********** Code for SVGAnimationElementJs **************
// ********** Code for SVGAnimateColorElementJs **************
// ********** Code for SVGAnimateElementJs **************
// ********** Code for SVGAnimateMotionElementJs **************
// ********** Code for SVGAnimateTransformElementJs **************
// ********** Code for SVGAnimatedAngleJs **************
// ********** Code for SVGAnimatedBooleanJs **************
// ********** Code for SVGAnimatedEnumerationJs **************
// ********** Code for SVGAnimatedIntegerJs **************
// ********** Code for SVGAnimatedLengthJs **************
// ********** Code for SVGAnimatedLengthListJs **************
// ********** Code for SVGAnimatedNumberJs **************
// ********** Code for SVGAnimatedNumberListJs **************
// ********** Code for SVGAnimatedPreserveAspectRatioJs **************
// ********** Code for SVGAnimatedRectJs **************
// ********** Code for SVGAnimatedStringJs **************
// ********** Code for SVGAnimatedTransformListJs **************
// ********** Code for SVGCircleElementJs **************
// ********** Code for SVGClipPathElementJs **************
// ********** Code for SVGColorJs **************
// ********** Code for SVGComponentTransferFunctionElementJs **************
$dynamic("get$type").SVGComponentTransferFunctionElement = function() {
  return this.type;
}
// ********** Code for SVGCursorElementJs **************
// ********** Code for SVGDefsElementJs **************
// ********** Code for SVGDescElementJs **************
// ********** Code for SVGDocumentJs **************
$dynamic("get$rootElement").SVGDocument = function() {
  return this.rootElement;
}
// ********** Code for SVGElementInstanceJs **************
$dynamic("addEventListener$3").SVGElementInstance = function($0, $1, $2) {
  return this.addEventListener($0, $wrap_call$1(to$call$1($1)), $2);
};
// ********** Code for SVGElementInstanceListJs **************
// ********** Code for SVGEllipseElementJs **************
// ********** Code for SVGExceptionJs **************
// ********** Code for SVGExternalResourcesRequiredJs **************
// ********** Code for SVGFEBlendElementJs **************
// ********** Code for SVGFEColorMatrixElementJs **************
$dynamic("get$type").SVGFEColorMatrixElement = function() {
  return this.type;
}
// ********** Code for SVGFEComponentTransferElementJs **************
// ********** Code for SVGFECompositeElementJs **************
// ********** Code for SVGFEConvolveMatrixElementJs **************
// ********** Code for SVGFEDiffuseLightingElementJs **************
// ********** Code for SVGFEDisplacementMapElementJs **************
// ********** Code for SVGFEDistantLightElementJs **************
// ********** Code for SVGFEDropShadowElementJs **************
// ********** Code for SVGFEFloodElementJs **************
// ********** Code for SVGFEFuncAElementJs **************
// ********** Code for SVGFEFuncBElementJs **************
// ********** Code for SVGFEFuncGElementJs **************
// ********** Code for SVGFEFuncRElementJs **************
// ********** Code for SVGFEGaussianBlurElementJs **************
// ********** Code for SVGFEImageElementJs **************
// ********** Code for SVGFEMergeElementJs **************
// ********** Code for SVGFEMergeNodeElementJs **************
// ********** Code for SVGFEMorphologyElementJs **************
// ********** Code for SVGFEOffsetElementJs **************
// ********** Code for SVGFEPointLightElementJs **************
// ********** Code for SVGFESpecularLightingElementJs **************
// ********** Code for SVGFESpotLightElementJs **************
// ********** Code for SVGFETileElementJs **************
// ********** Code for SVGFETurbulenceElementJs **************
$dynamic("get$type").SVGFETurbulenceElement = function() {
  return this.type;
}
// ********** Code for SVGFilterElementJs **************
// ********** Code for SVGStylableJs **************
// ********** Code for SVGFilterPrimitiveStandardAttributesJs **************
// ********** Code for SVGFitToViewBoxJs **************
// ********** Code for SVGFontElementJs **************
// ********** Code for SVGFontFaceElementJs **************
// ********** Code for SVGFontFaceFormatElementJs **************
// ********** Code for SVGFontFaceNameElementJs **************
// ********** Code for SVGFontFaceSrcElementJs **************
// ********** Code for SVGFontFaceUriElementJs **************
// ********** Code for SVGForeignObjectElementJs **************
// ********** Code for SVGGElementJs **************
// ********** Code for SVGGlyphElementJs **************
// ********** Code for SVGGlyphRefElementJs **************
// ********** Code for SVGGradientElementJs **************
// ********** Code for SVGHKernElementJs **************
// ********** Code for SVGImageElementJs **************
// ********** Code for SVGLangSpaceJs **************
// ********** Code for SVGLengthJs **************
// ********** Code for SVGLengthListJs **************
// ********** Code for SVGLineElementJs **************
// ********** Code for SVGLinearGradientElementJs **************
// ********** Code for SVGLocatableJs **************
// ********** Code for SVGMPathElementJs **************
// ********** Code for SVGMarkerElementJs **************
// ********** Code for SVGMaskElementJs **************
// ********** Code for SVGMatrixJs **************
// ********** Code for SVGMetadataElementJs **************
// ********** Code for SVGMissingGlyphElementJs **************
// ********** Code for SVGNumberJs **************
// ********** Code for SVGNumberListJs **************
// ********** Code for SVGPaintJs **************
// ********** Code for SVGPathElementJs **************
// ********** Code for SVGPathSegJs **************
// ********** Code for SVGPathSegArcAbsJs **************
// ********** Code for SVGPathSegArcRelJs **************
// ********** Code for SVGPathSegClosePathJs **************
// ********** Code for SVGPathSegCurvetoCubicAbsJs **************
// ********** Code for SVGPathSegCurvetoCubicRelJs **************
// ********** Code for SVGPathSegCurvetoCubicSmoothAbsJs **************
// ********** Code for SVGPathSegCurvetoCubicSmoothRelJs **************
// ********** Code for SVGPathSegCurvetoQuadraticAbsJs **************
// ********** Code for SVGPathSegCurvetoQuadraticRelJs **************
// ********** Code for SVGPathSegCurvetoQuadraticSmoothAbsJs **************
// ********** Code for SVGPathSegCurvetoQuadraticSmoothRelJs **************
// ********** Code for SVGPathSegLinetoAbsJs **************
// ********** Code for SVGPathSegLinetoHorizontalAbsJs **************
// ********** Code for SVGPathSegLinetoHorizontalRelJs **************
// ********** Code for SVGPathSegLinetoRelJs **************
// ********** Code for SVGPathSegLinetoVerticalAbsJs **************
// ********** Code for SVGPathSegLinetoVerticalRelJs **************
// ********** Code for SVGPathSegListJs **************
// ********** Code for SVGPathSegMovetoAbsJs **************
// ********** Code for SVGPathSegMovetoRelJs **************
// ********** Code for SVGPatternElementJs **************
// ********** Code for SVGPointJs **************
// ********** Code for SVGPointListJs **************
// ********** Code for SVGPolygonElementJs **************
// ********** Code for SVGPolylineElementJs **************
// ********** Code for SVGPreserveAspectRatioJs **************
// ********** Code for SVGRadialGradientElementJs **************
// ********** Code for SVGRectJs **************
// ********** Code for SVGRectElementJs **************
// ********** Code for SVGRenderingIntentJs **************
// ********** Code for SVGSVGElementJs **************
// ********** Code for SVGScriptElementJs **************
$dynamic("get$type").SVGScriptElement = function() {
  return this.type;
}
// ********** Code for SVGSetElementJs **************
// ********** Code for SVGStopElementJs **************
// ********** Code for SVGStringListJs **************
// ********** Code for SVGStyleElementJs **************
$dynamic("get$type").SVGStyleElement = function() {
  return this.type;
}
// ********** Code for SVGSwitchElementJs **************
// ********** Code for SVGSymbolElementJs **************
// ********** Code for SVGTRefElementJs **************
// ********** Code for SVGTSpanElementJs **************
// ********** Code for SVGTestsJs **************
// ********** Code for SVGTextElementJs **************
// ********** Code for SVGTextPathElementJs **************
// ********** Code for SVGTitleElementJs **************
// ********** Code for SVGTransformJs **************
$dynamic("get$type").SVGTransform = function() {
  return this.type;
}
// ********** Code for SVGTransformListJs **************
// ********** Code for SVGTransformableJs **************
// ********** Code for SVGURIReferenceJs **************
// ********** Code for SVGUnitTypesJs **************
// ********** Code for SVGUseElementJs **************
// ********** Code for SVGVKernElementJs **************
// ********** Code for SVGViewElementJs **************
// ********** Code for SVGZoomAndPanJs **************
// ********** Code for SVGViewSpecJs **************
// ********** Code for SVGZoomEventJs **************
// ********** Code for ScreenJs **************
// ********** Code for ScriptProfileJs **************
// ********** Code for ScriptProfileNodeJs **************
// ********** Code for SharedWorkerJs **************
// ********** Code for SharedWorkerContextJs **************
// ********** Code for SpeechInputEventJs **************
// ********** Code for SpeechInputResultJs **************
// ********** Code for SpeechInputResultListJs **************
// ********** Code for StorageJs **************
$dynamic("get$dartObjectLocalStorage").Storage = function() {
      if (this === window.localStorage)
        return window._dartLocalStorageLocalStorage;
      else if (this === window.sessionStorage)
        return window._dartSessionStorageLocalStorage;
      else
        throw new UnsupportedOperationException('Cannot dartObjectLocalStorage for unknown Storage object.');
}
$dynamic("set$dartObjectLocalStorage").Storage = function(value) {
      if (this === window.localStorage)
        window._dartLocalStorageLocalStorage = value;
      else if (this === window.sessionStorage)
        window._dartSessionStorageLocalStorage = value;
      else
        throw new UnsupportedOperationException('Cannot dartObjectLocalStorage for unknown Storage object.');
}
// ********** Code for StorageEventJs **************
// ********** Code for StorageInfoJs **************
// ********** Code for StyleMediaJs **************
$dynamic("get$type").StyleMedia = function() {
  return this.type;
}
// ********** Code for StyleSheetListJs **************
$dynamic("get$length").StyleSheetList = function() {
  return this.length;
}
$dynamic("$index").StyleSheetList = function(index) {
  return this[index];
}
$dynamic("$setindex").StyleSheetList = function(index, value) {
  $throw(new UnsupportedOperationException("Cannot assign element of immutable List."));
}
$dynamic("iterator").StyleSheetList = function() {
  return new dom__FixedSizeListIterator_dom_StyleSheet(this);
}
$dynamic("add").StyleSheetList = function(value) {
  $throw(new UnsupportedOperationException("Cannot add to immutable List."));
}
// ********** Code for TextEventJs **************
// ********** Code for TextMetricsJs **************
// ********** Code for TextTrackJs **************
$dynamic("addEventListener$3").TextTrack = function($0, $1, $2) {
  return this.addEventListener($0, $wrap_call$1(to$call$1($1)), $2);
};
// ********** Code for TextTrackCueJs **************
$dynamic("addEventListener$3").TextTrackCue = function($0, $1, $2) {
  return this.addEventListener($0, $wrap_call$1(to$call$1($1)), $2);
};
// ********** Code for TextTrackCueListJs **************
// ********** Code for TextTrackListJs **************
$dynamic("addEventListener$3").TextTrackList = function($0, $1, $2) {
  return this.addEventListener($0, $wrap_call$1(to$call$1($1)), $2);
};
// ********** Code for TimeRangesJs **************
// ********** Code for TouchJs **************
// ********** Code for TouchEventJs **************
// ********** Code for TouchListJs **************
$dynamic("get$length").TouchList = function() {
  return this.length;
}
$dynamic("$index").TouchList = function(index) {
  return this[index];
}
$dynamic("$setindex").TouchList = function(index, value) {
  $throw(new UnsupportedOperationException("Cannot assign element of immutable List."));
}
$dynamic("iterator").TouchList = function() {
  return new dom__FixedSizeListIterator_dom_Touch(this);
}
$dynamic("add").TouchList = function(value) {
  $throw(new UnsupportedOperationException("Cannot add to immutable List."));
}
// ********** Code for TrackEventJs **************
// ********** Code for TreeWalkerJs **************
// ********** Code for Uint16ArrayJs **************
var Uint16ArrayJs = {};
$dynamic("get$length").Uint16Array = function() {
  return this.length;
}
$dynamic("$index").Uint16Array = function(index) {
  return this[index];
}
$dynamic("$setindex").Uint16Array = function(index, value) {
  this[index] = value
}
$dynamic("iterator").Uint16Array = function() {
  return new dom__FixedSizeListIterator_int(this);
}
$dynamic("add").Uint16Array = function(value) {
  $throw(new UnsupportedOperationException("Cannot add to immutable List."));
}
// ********** Code for Uint32ArrayJs **************
var Uint32ArrayJs = {};
$dynamic("get$length").Uint32Array = function() {
  return this.length;
}
$dynamic("$index").Uint32Array = function(index) {
  return this[index];
}
$dynamic("$setindex").Uint32Array = function(index, value) {
  this[index] = value
}
$dynamic("iterator").Uint32Array = function() {
  return new dom__FixedSizeListIterator_int(this);
}
$dynamic("add").Uint32Array = function(value) {
  $throw(new UnsupportedOperationException("Cannot add to immutable List."));
}
// ********** Code for Uint8ArrayJs **************
var Uint8ArrayJs = {};
$dynamic("get$length").Uint8Array = function() {
  return this.length;
}
$dynamic("$index").Uint8Array = function(index) {
  return this[index];
}
$dynamic("$setindex").Uint8Array = function(index, value) {
  this[index] = value
}
$dynamic("iterator").Uint8Array = function() {
  return new dom__FixedSizeListIterator_int(this);
}
$dynamic("add").Uint8Array = function(value) {
  $throw(new UnsupportedOperationException("Cannot add to immutable List."));
}
// ********** Code for ValidityStateJs **************
// ********** Code for WaveShaperNodeJs **************
// ********** Code for WebGLActiveInfoJs **************
$dynamic("get$type").WebGLActiveInfo = function() {
  return this.type;
}
// ********** Code for WebGLBufferJs **************
// ********** Code for WebGLCompressedTexturesJs **************
// ********** Code for WebGLContextAttributesJs **************
// ********** Code for WebGLContextEventJs **************
// ********** Code for WebGLDebugRendererInfoJs **************
// ********** Code for WebGLDebugShadersJs **************
// ********** Code for WebGLFramebufferJs **************
// ********** Code for WebGLLoseContextJs **************
// ********** Code for WebGLProgramJs **************
// ********** Code for WebGLRenderbufferJs **************
// ********** Code for WebGLRenderingContextJs **************
// ********** Code for WebGLShaderJs **************
// ********** Code for WebGLTextureJs **************
// ********** Code for WebGLUniformLocationJs **************
// ********** Code for WebGLVertexArrayObjectOESJs **************
// ********** Code for WebKitAnimationJs **************
// ********** Code for WebKitAnimationEventJs **************
// ********** Code for WebKitAnimationListJs **************
// ********** Code for WebKitBlobBuilderJs **************
// ********** Code for WebKitCSSFilterValueJs **************
// ********** Code for WebKitCSSKeyframeRuleJs **************
// ********** Code for WebKitCSSKeyframesRuleJs **************
// ********** Code for WebKitCSSMatrixJs **************
// ********** Code for WebKitCSSTransformValueJs **************
// ********** Code for WebKitMutationObserverJs **************
// ********** Code for WebKitNamedFlowJs **************
// ********** Code for WebKitPointJs **************
// ********** Code for WebKitTransitionEventJs **************
// ********** Code for WebSocketJs **************
$dynamic("addEventListener$3").WebSocket = function($0, $1, $2) {
  return this.addEventListener($0, $wrap_call$1(to$call$1($1)), $2);
};
// ********** Code for WheelEventJs **************
// ********** Code for WorkerJs **************
// ********** Code for WorkerLocationJs **************
// ********** Code for WorkerNavigatorJs **************
// ********** Code for XMLHttpRequestJs **************
$dynamic("addEventListener$3").XMLHttpRequest = function($0, $1, $2) {
  return this.addEventListener($0, $wrap_call$1(to$call$1($1)), $2);
};
// ********** Code for XMLHttpRequestExceptionJs **************
// ********** Code for XMLHttpRequestProgressEventJs **************
// ********** Code for XMLHttpRequestUploadJs **************
$dynamic("addEventListener$3").XMLHttpRequestUpload = function($0, $1, $2) {
  return this.addEventListener($0, $wrap_call$1(to$call$1($1)), $2);
};
// ********** Code for XMLSerializerJs **************
// ********** Code for XPathEvaluatorJs **************
// ********** Code for XPathExceptionJs **************
// ********** Code for XPathExpressionJs **************
// ********** Code for XPathNSResolverJs **************
// ********** Code for XPathResultJs **************
// ********** Code for XSLTProcessorJs **************
// ********** Code for dom__Collections **************
function dom__Collections() {}
// ********** Code for _AudioContextFactoryProvider **************
function _AudioContextFactoryProvider() {}
// ********** Code for _FileReaderFactoryProvider **************
function _FileReaderFactoryProvider() {}
// ********** Code for _TypedArrayFactoryProvider **************
function _TypedArrayFactoryProvider() {}
// ********** Code for _WebKitCSSMatrixFactoryProvider **************
function _WebKitCSSMatrixFactoryProvider() {}
// ********** Code for _WebKitPointFactoryProvider **************
function _WebKitPointFactoryProvider() {}
// ********** Code for _WebSocketFactoryProvider **************
function _WebSocketFactoryProvider() {}
// ********** Code for _XMLHttpRequestFactoryProvider **************
function _XMLHttpRequestFactoryProvider() {}
// ********** Code for dom__VariableSizeListIterator **************
function dom__VariableSizeListIterator() {}
dom__VariableSizeListIterator.prototype.hasNext = function() {
  return this._dom_array.get$length() > this._dom_pos;
}
dom__VariableSizeListIterator.prototype.next = function() {
  if (!this.hasNext()) {
    $throw(const$0001);
  }
  return this._dom_array.$index(this._dom_pos++);
}
// ********** Code for dom__FixedSizeListIterator **************
$inherits(dom__FixedSizeListIterator, dom__VariableSizeListIterator);
function dom__FixedSizeListIterator() {}
dom__FixedSizeListIterator.prototype.hasNext = function() {
  return this._dom_length > this._dom_pos;
}
// ********** Code for dom__VariableSizeListIterator_dom_Node **************
$inherits(dom__VariableSizeListIterator_dom_Node, dom__VariableSizeListIterator);
function dom__VariableSizeListIterator_dom_Node(array) {
  this._dom_array = array;
  this._dom_pos = (0);
}
// ********** Code for dom__FixedSizeListIterator_dom_Node **************
$inherits(dom__FixedSizeListIterator_dom_Node, dom__FixedSizeListIterator);
function dom__FixedSizeListIterator_dom_Node(array) {
  this._dom_length = array.get$length();
  dom__VariableSizeListIterator_dom_Node.call(this, array);
}
// ********** Code for dom__VariableSizeListIterator_dart_core_String **************
$inherits(dom__VariableSizeListIterator_dart_core_String, dom__VariableSizeListIterator);
function dom__VariableSizeListIterator_dart_core_String(array) {
  this._dom_array = array;
  this._dom_pos = (0);
}
// ********** Code for dom__FixedSizeListIterator_dart_core_String **************
$inherits(dom__FixedSizeListIterator_dart_core_String, dom__FixedSizeListIterator);
function dom__FixedSizeListIterator_dart_core_String(array) {
  this._dom_length = array.get$length();
  dom__VariableSizeListIterator_dart_core_String.call(this, array);
}
// ********** Code for dom__VariableSizeListIterator_dom_StyleSheet **************
$inherits(dom__VariableSizeListIterator_dom_StyleSheet, dom__VariableSizeListIterator);
function dom__VariableSizeListIterator_dom_StyleSheet(array) {
  this._dom_array = array;
  this._dom_pos = (0);
}
// ********** Code for dom__FixedSizeListIterator_dom_StyleSheet **************
$inherits(dom__FixedSizeListIterator_dom_StyleSheet, dom__FixedSizeListIterator);
function dom__FixedSizeListIterator_dom_StyleSheet(array) {
  this._dom_length = array.get$length();
  dom__VariableSizeListIterator_dom_StyleSheet.call(this, array);
}
// ********** Code for dom__VariableSizeListIterator_dom_Touch **************
$inherits(dom__VariableSizeListIterator_dom_Touch, dom__VariableSizeListIterator);
function dom__VariableSizeListIterator_dom_Touch(array) {
  this._dom_array = array;
  this._dom_pos = (0);
}
// ********** Code for dom__FixedSizeListIterator_dom_Touch **************
$inherits(dom__FixedSizeListIterator_dom_Touch, dom__FixedSizeListIterator);
function dom__FixedSizeListIterator_dom_Touch(array) {
  this._dom_length = array.get$length();
  dom__VariableSizeListIterator_dom_Touch.call(this, array);
}
// ********** Code for dom__VariableSizeListIterator_int **************
$inherits(dom__VariableSizeListIterator_int, dom__VariableSizeListIterator);
function dom__VariableSizeListIterator_int(array) {
  this._dom_array = array;
  this._dom_pos = (0);
}
// ********** Code for dom__FixedSizeListIterator_int **************
$inherits(dom__FixedSizeListIterator_int, dom__FixedSizeListIterator);
function dom__FixedSizeListIterator_int(array) {
  this._dom_length = array.get$length();
  dom__VariableSizeListIterator_int.call(this, array);
}
// ********** Code for dom__VariableSizeListIterator_num **************
$inherits(dom__VariableSizeListIterator_num, dom__VariableSizeListIterator);
function dom__VariableSizeListIterator_num(array) {
  this._dom_array = array;
  this._dom_pos = (0);
}
// ********** Code for dom__FixedSizeListIterator_num **************
$inherits(dom__FixedSizeListIterator_num, dom__FixedSizeListIterator);
function dom__FixedSizeListIterator_num(array) {
  this._dom_length = array.get$length();
  dom__VariableSizeListIterator_num.call(this, array);
}
// ********** Code for _Lists **************
function _Lists() {}
// ********** Code for top level **************
function get$window() {
  return window;
}
function get$document() {
  return window.document;
}
//  ********** Library htmlimpl **************
// ********** Code for DOMWrapperBase **************
DOMWrapperBase._wrap$ctor = function(_ptr) {
  this._ptr = _ptr;
  this._ptr.set$dartObjectLocalStorage(this);
}
DOMWrapperBase._wrap$ctor.prototype = DOMWrapperBase.prototype;
function DOMWrapperBase() {}
// ********** Code for EventWrappingImplementation **************
$inherits(EventWrappingImplementation, DOMWrapperBase);
EventWrappingImplementation._wrap$ctor = function(ptr) {
  DOMWrapperBase._wrap$ctor.call(this, ptr);
}
EventWrappingImplementation._wrap$ctor.prototype = EventWrappingImplementation.prototype;
function EventWrappingImplementation() {}
EventWrappingImplementation.prototype.get$type = function() {
  return this._ptr.get$type();
}
// ********** Code for AudioProcessingEventWrappingImplementation **************
$inherits(AudioProcessingEventWrappingImplementation, EventWrappingImplementation);
AudioProcessingEventWrappingImplementation._wrap$ctor = function(ptr) {
  EventWrappingImplementation._wrap$ctor.call(this, ptr);
}
AudioProcessingEventWrappingImplementation._wrap$ctor.prototype = AudioProcessingEventWrappingImplementation.prototype;
function AudioProcessingEventWrappingImplementation() {}
// ********** Code for IDBVersionChangeEventWrappingImplementation **************
$inherits(IDBVersionChangeEventWrappingImplementation, EventWrappingImplementation);
IDBVersionChangeEventWrappingImplementation._wrap$ctor = function(ptr) {
  EventWrappingImplementation._wrap$ctor.call(this, ptr);
}
IDBVersionChangeEventWrappingImplementation._wrap$ctor.prototype = IDBVersionChangeEventWrappingImplementation.prototype;
function IDBVersionChangeEventWrappingImplementation() {}
// ********** Code for OfflineAudioCompletionEventWrappingImplementation **************
$inherits(OfflineAudioCompletionEventWrappingImplementation, EventWrappingImplementation);
OfflineAudioCompletionEventWrappingImplementation._wrap$ctor = function(ptr) {
  EventWrappingImplementation._wrap$ctor.call(this, ptr);
}
OfflineAudioCompletionEventWrappingImplementation._wrap$ctor.prototype = OfflineAudioCompletionEventWrappingImplementation.prototype;
function OfflineAudioCompletionEventWrappingImplementation() {}
// ********** Code for UIEventWrappingImplementation **************
$inherits(UIEventWrappingImplementation, EventWrappingImplementation);
UIEventWrappingImplementation._wrap$ctor = function(ptr) {
  EventWrappingImplementation._wrap$ctor.call(this, ptr);
}
UIEventWrappingImplementation._wrap$ctor.prototype = UIEventWrappingImplementation.prototype;
function UIEventWrappingImplementation() {}
// ********** Code for SVGZoomEventWrappingImplementation **************
$inherits(SVGZoomEventWrappingImplementation, UIEventWrappingImplementation);
SVGZoomEventWrappingImplementation._wrap$ctor = function(ptr) {
  UIEventWrappingImplementation._wrap$ctor.call(this, ptr);
}
SVGZoomEventWrappingImplementation._wrap$ctor.prototype = SVGZoomEventWrappingImplementation.prototype;
function SVGZoomEventWrappingImplementation() {}
// ********** Code for SpeechInputEventWrappingImplementation **************
$inherits(SpeechInputEventWrappingImplementation, EventWrappingImplementation);
SpeechInputEventWrappingImplementation._wrap$ctor = function(ptr) {
  EventWrappingImplementation._wrap$ctor.call(this, ptr);
}
SpeechInputEventWrappingImplementation._wrap$ctor.prototype = SpeechInputEventWrappingImplementation.prototype;
function SpeechInputEventWrappingImplementation() {}
// ********** Code for WebGLContextEventWrappingImplementation **************
$inherits(WebGLContextEventWrappingImplementation, EventWrappingImplementation);
WebGLContextEventWrappingImplementation._wrap$ctor = function(ptr) {
  EventWrappingImplementation._wrap$ctor.call(this, ptr);
}
WebGLContextEventWrappingImplementation._wrap$ctor.prototype = WebGLContextEventWrappingImplementation.prototype;
function WebGLContextEventWrappingImplementation() {}
// ********** Code for LevelDom **************
function LevelDom() {}
LevelDom.wrapDocument = function(raw) {
  if (null == raw) {
    return null;
  }
  if (null != raw.get$dartObjectLocalStorage()) {
    return raw.get$dartObjectLocalStorage();
  }
  switch (raw.get$typeName()) {
    case "HTMLDocument":

      return new DocumentWrappingImplementation._wrap$ctor(raw, raw.get$documentElement());

    case "SVGDocument":

      return new SVGDocumentWrappingImplementation._wrap$ctor(raw);

    default:

      $throw(new UnsupportedOperationException($add("Unknown type:", raw.toString())));

  }
}
LevelDom.wrapEvent = function(raw) {
  if (null == raw) {
    return null;
  }
  if (null != raw.get$dartObjectLocalStorage()) {
    return raw.get$dartObjectLocalStorage();
  }
  switch (raw.get$typeName()) {
    case "WebKitAnimationEvent":

      return new AnimationEventWrappingImplementation._wrap$ctor(raw);

    case "AudioProcessingEvent":

      return new AudioProcessingEventWrappingImplementation._wrap$ctor(raw);

    case "BeforeLoadEvent":

      return new BeforeLoadEventWrappingImplementation._wrap$ctor(raw);

    case "CloseEvent":

      return new CloseEventWrappingImplementation._wrap$ctor(raw);

    case "CompositionEvent":

      return new CompositionEventWrappingImplementation._wrap$ctor(raw);

    case "CustomEvent":

      return new CustomEventWrappingImplementation._wrap$ctor(raw);

    case "DeviceMotionEvent":

      return new DeviceMotionEventWrappingImplementation._wrap$ctor(raw);

    case "DeviceOrientationEvent":

      return new DeviceOrientationEventWrappingImplementation._wrap$ctor(raw);

    case "ErrorEvent":

      return new ErrorEventWrappingImplementation._wrap$ctor(raw);

    case "Event":

      return new EventWrappingImplementation._wrap$ctor(raw);

    case "HashChangeEvent":

      return new HashChangeEventWrappingImplementation._wrap$ctor(raw);

    case "IDBVersionChangeEvent":

      return new IDBVersionChangeEventWrappingImplementation._wrap$ctor(raw);

    case "KeyboardEvent":

      return new KeyboardEventWrappingImplementation._wrap$ctor(raw);

    case "MessageEvent":

      return new MessageEventWrappingImplementation._wrap$ctor(raw);

    case "MouseEvent":

      return new MouseEventWrappingImplementation._wrap$ctor(raw);

    case "MutationEvent":

      return new MutationEventWrappingImplementation._wrap$ctor(raw);

    case "OfflineAudioCompletionEvent":

      return new OfflineAudioCompletionEventWrappingImplementation._wrap$ctor(raw);

    case "OverflowEvent":

      return new OverflowEventWrappingImplementation._wrap$ctor(raw);

    case "PageTransitionEvent":

      return new PageTransitionEventWrappingImplementation._wrap$ctor(raw);

    case "PopStateEvent":

      return new PopStateEventWrappingImplementation._wrap$ctor(raw);

    case "ProgressEvent":

      return new ProgressEventWrappingImplementation._wrap$ctor(raw);

    case "SVGZoomEvent":

      return new SVGZoomEventWrappingImplementation._wrap$ctor(raw);

    case "SpeechInputEvent":

      return new SpeechInputEventWrappingImplementation._wrap$ctor(raw);

    case "StorageEvent":

      return new StorageEventWrappingImplementation._wrap$ctor(raw);

    case "TextEvent":

      return new TextEventWrappingImplementation._wrap$ctor(raw);

    case "TouchEvent":

      return new TouchEventWrappingImplementation._wrap$ctor(raw);

    case "WebKitTransitionEvent":

      return new TransitionEventWrappingImplementation._wrap$ctor(raw);

    case "UIEvent":

      return new UIEventWrappingImplementation._wrap$ctor(raw);

    case "WebGLContextEvent":

      return new WebGLContextEventWrappingImplementation._wrap$ctor(raw);

    case "WheelEvent":

      return new WheelEventWrappingImplementation._wrap$ctor(raw);

    case "XMLHttpRequestProgressEvent":

      return new XMLHttpRequestProgressEventWrappingImplementation._wrap$ctor(raw);

    default:

      $throw(new UnsupportedOperationException($add("Unknown type:", raw.toString())));

  }
}
LevelDom.wrapWindow = function(raw) {
  return null == raw ? null : null != raw.get$dartObjectLocalStorage() ? raw.get$dartObjectLocalStorage() : new WindowWrappingImplementation._wrap$ctor(raw);
}
LevelDom.initialize = function() {
  $globals.secretWindow = LevelDom.wrapWindow(get$window());
  $globals.secretDocument = LevelDom.wrapDocument(get$document());
}
// ********** Code for AnimationEventWrappingImplementation **************
$inherits(AnimationEventWrappingImplementation, EventWrappingImplementation);
AnimationEventWrappingImplementation._wrap$ctor = function(ptr) {
  EventWrappingImplementation._wrap$ctor.call(this, ptr);
}
AnimationEventWrappingImplementation._wrap$ctor.prototype = AnimationEventWrappingImplementation.prototype;
function AnimationEventWrappingImplementation() {}
// ********** Code for BeforeLoadEventWrappingImplementation **************
$inherits(BeforeLoadEventWrappingImplementation, EventWrappingImplementation);
BeforeLoadEventWrappingImplementation._wrap$ctor = function(ptr) {
  EventWrappingImplementation._wrap$ctor.call(this, ptr);
}
BeforeLoadEventWrappingImplementation._wrap$ctor.prototype = BeforeLoadEventWrappingImplementation.prototype;
function BeforeLoadEventWrappingImplementation() {}
// ********** Code for CloseEventWrappingImplementation **************
$inherits(CloseEventWrappingImplementation, EventWrappingImplementation);
CloseEventWrappingImplementation._wrap$ctor = function(ptr) {
  EventWrappingImplementation._wrap$ctor.call(this, ptr);
}
CloseEventWrappingImplementation._wrap$ctor.prototype = CloseEventWrappingImplementation.prototype;
function CloseEventWrappingImplementation() {}
// ********** Code for CompositionEventWrappingImplementation **************
$inherits(CompositionEventWrappingImplementation, UIEventWrappingImplementation);
CompositionEventWrappingImplementation._wrap$ctor = function(ptr) {
  UIEventWrappingImplementation._wrap$ctor.call(this, ptr);
}
CompositionEventWrappingImplementation._wrap$ctor.prototype = CompositionEventWrappingImplementation.prototype;
function CompositionEventWrappingImplementation() {}
// ********** Code for CustomEventWrappingImplementation **************
$inherits(CustomEventWrappingImplementation, EventWrappingImplementation);
CustomEventWrappingImplementation._wrap$ctor = function(ptr) {
  EventWrappingImplementation._wrap$ctor.call(this, ptr);
}
CustomEventWrappingImplementation._wrap$ctor.prototype = CustomEventWrappingImplementation.prototype;
function CustomEventWrappingImplementation() {}
// ********** Code for DeviceMotionEventWrappingImplementation **************
$inherits(DeviceMotionEventWrappingImplementation, EventWrappingImplementation);
DeviceMotionEventWrappingImplementation._wrap$ctor = function(ptr) {
  EventWrappingImplementation._wrap$ctor.call(this, ptr);
}
DeviceMotionEventWrappingImplementation._wrap$ctor.prototype = DeviceMotionEventWrappingImplementation.prototype;
function DeviceMotionEventWrappingImplementation() {}
// ********** Code for DeviceOrientationEventWrappingImplementation **************
$inherits(DeviceOrientationEventWrappingImplementation, EventWrappingImplementation);
DeviceOrientationEventWrappingImplementation._wrap$ctor = function(ptr) {
  EventWrappingImplementation._wrap$ctor.call(this, ptr);
}
DeviceOrientationEventWrappingImplementation._wrap$ctor.prototype = DeviceOrientationEventWrappingImplementation.prototype;
function DeviceOrientationEventWrappingImplementation() {}
// ********** Code for EventTargetWrappingImplementation **************
$inherits(EventTargetWrappingImplementation, DOMWrapperBase);
EventTargetWrappingImplementation._wrap$ctor = function(ptr) {
  DOMWrapperBase._wrap$ctor.call(this, ptr);
}
EventTargetWrappingImplementation._wrap$ctor.prototype = EventTargetWrappingImplementation.prototype;
function EventTargetWrappingImplementation() {}
// ********** Code for NodeWrappingImplementation **************
$inherits(NodeWrappingImplementation, EventTargetWrappingImplementation);
NodeWrappingImplementation._wrap$ctor = function(ptr) {
  EventTargetWrappingImplementation._wrap$ctor.call(this, ptr);
}
NodeWrappingImplementation._wrap$ctor.prototype = NodeWrappingImplementation.prototype;
function NodeWrappingImplementation() {}
// ********** Code for ElementWrappingImplementation **************
$inherits(ElementWrappingImplementation, NodeWrappingImplementation);
ElementWrappingImplementation._wrap$ctor = function(ptr) {
  NodeWrappingImplementation._wrap$ctor.call(this, ptr);
}
ElementWrappingImplementation._wrap$ctor.prototype = ElementWrappingImplementation.prototype;
function ElementWrappingImplementation() {}
// ********** Code for DocumentWrappingImplementation **************
$inherits(DocumentWrappingImplementation, ElementWrappingImplementation);
DocumentWrappingImplementation._wrap$ctor = function(_documentPtr, ptr) {
  this._documentPtr = _documentPtr;
  ElementWrappingImplementation._wrap$ctor.call(this, ptr);
  this._documentPtr.get$dynamic().set$dartObjectLocalStorage(this);
}
DocumentWrappingImplementation._wrap$ctor.prototype = DocumentWrappingImplementation.prototype;
function DocumentWrappingImplementation() {}
DocumentWrappingImplementation.prototype.get$window = function() {
  return LevelDom.wrapWindow(this._documentPtr.get$defaultView());
}
// ********** Code for ErrorEventWrappingImplementation **************
$inherits(ErrorEventWrappingImplementation, EventWrappingImplementation);
ErrorEventWrappingImplementation._wrap$ctor = function(ptr) {
  EventWrappingImplementation._wrap$ctor.call(this, ptr);
}
ErrorEventWrappingImplementation._wrap$ctor.prototype = ErrorEventWrappingImplementation.prototype;
function ErrorEventWrappingImplementation() {}
// ********** Code for EventsImplementation **************
EventsImplementation._wrap$ctor = function(_ptr) {
  this._ptr = _ptr;
  this._listenerMap = new HashMapImplementation();
}
EventsImplementation._wrap$ctor.prototype = EventsImplementation.prototype;
function EventsImplementation() {}
EventsImplementation.prototype._get = function(type) {
  var $this = this; // closure support
  return this._listenerMap.putIfAbsent(type, (function () {
    return new EventListenerListImplementation($this._ptr, type);
  })
  );
}
// ********** Code for _EventListenerWrapper **************
function _EventListenerWrapper(raw, wrapped, useCapture) {
  this.wrapped = wrapped;
  this.useCapture = useCapture;
  this.raw = raw;
}
// ********** Code for EventListenerListImplementation **************
function EventListenerListImplementation(_ptr, _type) {
  this._ptr = _ptr;
  this._type = _type;
  this._wrappers = new Array();
}
EventListenerListImplementation.prototype.add = function(listener, useCapture) {
  this._add(listener, useCapture);
  return this;
}
EventListenerListImplementation.prototype._add = function(listener, useCapture) {
  this._ptr.addEventListener$3(this._type, this._findOrAddWrapper(listener, useCapture), useCapture);
}
EventListenerListImplementation.prototype._findOrAddWrapper = function(listener, useCapture) {
  var $0;
  if (null == this._wrappers) {
    this._wrappers = [];
  }
  else {
    var $$list = this._wrappers;
    for (var $$i = $$list.iterator(); $$i.hasNext(); ) {
      var wrapper = $$i.next();
      if ((($0 = wrapper.raw) == null ? null == (listener) : $0 === listener) && $eq(wrapper.useCapture, useCapture)) {
        return wrapper.wrapped;
      }
    }
  }
  var wrapped = (function (e) {
    listener(LevelDom.wrapEvent(e));
  })
  ;
  this._wrappers.add(new _EventListenerWrapper(listener, wrapped, useCapture));
  return wrapped;
}
// ********** Code for HashChangeEventWrappingImplementation **************
$inherits(HashChangeEventWrappingImplementation, EventWrappingImplementation);
HashChangeEventWrappingImplementation._wrap$ctor = function(ptr) {
  EventWrappingImplementation._wrap$ctor.call(this, ptr);
}
HashChangeEventWrappingImplementation._wrap$ctor.prototype = HashChangeEventWrappingImplementation.prototype;
function HashChangeEventWrappingImplementation() {}
// ********** Code for KeyboardEventWrappingImplementation **************
$inherits(KeyboardEventWrappingImplementation, UIEventWrappingImplementation);
KeyboardEventWrappingImplementation._wrap$ctor = function(ptr) {
  UIEventWrappingImplementation._wrap$ctor.call(this, ptr);
}
KeyboardEventWrappingImplementation._wrap$ctor.prototype = KeyboardEventWrappingImplementation.prototype;
function KeyboardEventWrappingImplementation() {}
// ********** Code for MessageEventWrappingImplementation **************
$inherits(MessageEventWrappingImplementation, EventWrappingImplementation);
MessageEventWrappingImplementation._wrap$ctor = function(ptr) {
  EventWrappingImplementation._wrap$ctor.call(this, ptr);
}
MessageEventWrappingImplementation._wrap$ctor.prototype = MessageEventWrappingImplementation.prototype;
function MessageEventWrappingImplementation() {}
// ********** Code for MouseEventWrappingImplementation **************
$inherits(MouseEventWrappingImplementation, UIEventWrappingImplementation);
MouseEventWrappingImplementation._wrap$ctor = function(ptr) {
  UIEventWrappingImplementation._wrap$ctor.call(this, ptr);
}
MouseEventWrappingImplementation._wrap$ctor.prototype = MouseEventWrappingImplementation.prototype;
function MouseEventWrappingImplementation() {}
// ********** Code for MutationEventWrappingImplementation **************
$inherits(MutationEventWrappingImplementation, EventWrappingImplementation);
MutationEventWrappingImplementation._wrap$ctor = function(ptr) {
  EventWrappingImplementation._wrap$ctor.call(this, ptr);
}
MutationEventWrappingImplementation._wrap$ctor.prototype = MutationEventWrappingImplementation.prototype;
function MutationEventWrappingImplementation() {}
// ********** Code for _ListWrapper **************
function _ListWrapper() {}
_ListWrapper.prototype.iterator = function() {
  return this._list.iterator();
}
_ListWrapper.prototype.get$length = function() {
  return this._list.get$length();
}
_ListWrapper.prototype.$index = function(index) {
  return this._list.$index(index);
}
_ListWrapper.prototype.$setindex = function(index, value) {
  this._list.$setindex(index, value);
}
_ListWrapper.prototype.add = function(value) {
  return this._list.add(value);
}
_ListWrapper.prototype.clear = function() {
  return this._list.clear();
}
// ********** Code for OverflowEventWrappingImplementation **************
$inherits(OverflowEventWrappingImplementation, EventWrappingImplementation);
OverflowEventWrappingImplementation._wrap$ctor = function(ptr) {
  EventWrappingImplementation._wrap$ctor.call(this, ptr);
}
OverflowEventWrappingImplementation._wrap$ctor.prototype = OverflowEventWrappingImplementation.prototype;
function OverflowEventWrappingImplementation() {}
// ********** Code for PageTransitionEventWrappingImplementation **************
$inherits(PageTransitionEventWrappingImplementation, EventWrappingImplementation);
PageTransitionEventWrappingImplementation._wrap$ctor = function(ptr) {
  EventWrappingImplementation._wrap$ctor.call(this, ptr);
}
PageTransitionEventWrappingImplementation._wrap$ctor.prototype = PageTransitionEventWrappingImplementation.prototype;
function PageTransitionEventWrappingImplementation() {}
// ********** Code for PopStateEventWrappingImplementation **************
$inherits(PopStateEventWrappingImplementation, EventWrappingImplementation);
PopStateEventWrappingImplementation._wrap$ctor = function(ptr) {
  EventWrappingImplementation._wrap$ctor.call(this, ptr);
}
PopStateEventWrappingImplementation._wrap$ctor.prototype = PopStateEventWrappingImplementation.prototype;
function PopStateEventWrappingImplementation() {}
// ********** Code for ProgressEventWrappingImplementation **************
$inherits(ProgressEventWrappingImplementation, EventWrappingImplementation);
ProgressEventWrappingImplementation._wrap$ctor = function(ptr) {
  EventWrappingImplementation._wrap$ctor.call(this, ptr);
}
ProgressEventWrappingImplementation._wrap$ctor.prototype = ProgressEventWrappingImplementation.prototype;
function ProgressEventWrappingImplementation() {}
// ********** Code for StorageEventWrappingImplementation **************
$inherits(StorageEventWrappingImplementation, EventWrappingImplementation);
StorageEventWrappingImplementation._wrap$ctor = function(ptr) {
  EventWrappingImplementation._wrap$ctor.call(this, ptr);
}
StorageEventWrappingImplementation._wrap$ctor.prototype = StorageEventWrappingImplementation.prototype;
function StorageEventWrappingImplementation() {}
// ********** Code for SVGDocumentWrappingImplementation **************
$inherits(SVGDocumentWrappingImplementation, DocumentWrappingImplementation);
SVGDocumentWrappingImplementation._wrap$ctor = function(ptr) {
  DocumentWrappingImplementation._wrap$ctor.call(this, ptr, ptr.get$rootElement());
}
SVGDocumentWrappingImplementation._wrap$ctor.prototype = SVGDocumentWrappingImplementation.prototype;
function SVGDocumentWrappingImplementation() {}
// ********** Code for TextEventWrappingImplementation **************
$inherits(TextEventWrappingImplementation, UIEventWrappingImplementation);
TextEventWrappingImplementation._wrap$ctor = function(ptr) {
  UIEventWrappingImplementation._wrap$ctor.call(this, ptr);
}
TextEventWrappingImplementation._wrap$ctor.prototype = TextEventWrappingImplementation.prototype;
function TextEventWrappingImplementation() {}
// ********** Code for TouchEventWrappingImplementation **************
$inherits(TouchEventWrappingImplementation, UIEventWrappingImplementation);
TouchEventWrappingImplementation._wrap$ctor = function(ptr) {
  UIEventWrappingImplementation._wrap$ctor.call(this, ptr);
}
TouchEventWrappingImplementation._wrap$ctor.prototype = TouchEventWrappingImplementation.prototype;
function TouchEventWrappingImplementation() {}
// ********** Code for TransitionEventWrappingImplementation **************
$inherits(TransitionEventWrappingImplementation, EventWrappingImplementation);
TransitionEventWrappingImplementation._wrap$ctor = function(ptr) {
  EventWrappingImplementation._wrap$ctor.call(this, ptr);
}
TransitionEventWrappingImplementation._wrap$ctor.prototype = TransitionEventWrappingImplementation.prototype;
function TransitionEventWrappingImplementation() {}
// ********** Code for WheelEventWrappingImplementation **************
$inherits(WheelEventWrappingImplementation, UIEventWrappingImplementation);
WheelEventWrappingImplementation._wrap$ctor = function(ptr) {
  UIEventWrappingImplementation._wrap$ctor.call(this, ptr);
}
WheelEventWrappingImplementation._wrap$ctor.prototype = WheelEventWrappingImplementation.prototype;
function WheelEventWrappingImplementation() {}
// ********** Code for WindowEventsImplementation **************
$inherits(WindowEventsImplementation, EventsImplementation);
WindowEventsImplementation._wrap$ctor = function(_ptr) {
  EventsImplementation._wrap$ctor.call(this, _ptr);
}
WindowEventsImplementation._wrap$ctor.prototype = WindowEventsImplementation.prototype;
function WindowEventsImplementation() {}
WindowEventsImplementation.prototype.get$keyDown = function() {
  return this._get("keydown");
}
WindowEventsImplementation.prototype.get$keyUp = function() {
  return this._get("keyup");
}
// ********** Code for WindowWrappingImplementation **************
$inherits(WindowWrappingImplementation, EventTargetWrappingImplementation);
WindowWrappingImplementation._wrap$ctor = function(ptr) {
  EventTargetWrappingImplementation._wrap$ctor.call(this, ptr);
}
WindowWrappingImplementation._wrap$ctor.prototype = WindowWrappingImplementation.prototype;
function WindowWrappingImplementation() {}
WindowWrappingImplementation.prototype.get$on = function() {
  if (null == this._on) {
    this._on = new WindowEventsImplementation._wrap$ctor(this._ptr);
  }
  return this._on;
}
// ********** Code for XMLHttpRequestProgressEventWrappingImplementation **************
$inherits(XMLHttpRequestProgressEventWrappingImplementation, ProgressEventWrappingImplementation);
XMLHttpRequestProgressEventWrappingImplementation._wrap$ctor = function(ptr) {
  ProgressEventWrappingImplementation._wrap$ctor.call(this, ptr);
}
XMLHttpRequestProgressEventWrappingImplementation._wrap$ctor.prototype = XMLHttpRequestProgressEventWrappingImplementation.prototype;
function XMLHttpRequestProgressEventWrappingImplementation() {}
// ********** Code for top level **************
var _pendingRequests;
var _pendingMeasurementFrameCallbacks;
//  ********** Library html **************
// ********** Code for top level **************
var secretWindow;
var secretDocument;
function html_get$document() {
  if (null == $globals.secretWindow) {
    LevelDom.initialize();
  }
  return $globals.secretDocument;
}
//  ********** Library keyboardevents **************
// ********** Code for keyboardevents **************
function keyboardevents() {

}
keyboardevents.prototype.run = function() {
  function onKeyboardEvent(e) {
    dart_core_print(("" + e.get$type()));
  }
  ;
  html_get$document().get$window().get$on().get$keyDown().add(onKeyboardEvent, false);
  html_get$document().get$window().get$on().get$keyUp().add(onKeyboardEvent, false);
}
// ********** Code for top level **************
function main() {
  new keyboardevents().run();
}
// 79 dynamic types.
// 501 types
// 41 !leaf
(function(){
  var v0/*Document*/ = 'Document|HTMLDocument|SVGDocument';
  var v1/*HTMLInputElement*/ = 'HTMLInputElement|HTMLIsIndexElement';
  var v2/*SVGComponentTransferFunctionElement*/ = 'SVGComponentTransferFunctionElement|SVGFEFuncAElement|SVGFEFuncBElement|SVGFEFuncGElement|SVGFEFuncRElement';
  var v3/*AbstractWorker*/ = 'AbstractWorker|SharedWorker|Worker';
  var v4/*Blob*/ = 'Blob|File';
  var v5/*CSSRule*/ = 'CSSRule|CSSCharsetRule|CSSFontFaceRule|CSSImportRule|CSSMediaRule|CSSPageRule|CSSStyleRule|CSSUnknownRule|WebKitCSSKeyframeRule|WebKitCSSKeyframesRule';
  var v6/*Event*/ = 'Event|AudioProcessingEvent|BeforeLoadEvent|CloseEvent|CustomEvent|DeviceMotionEvent|DeviceOrientationEvent|ErrorEvent|HashChangeEvent|IDBVersionChangeEvent|MessageEvent|MutationEvent|OfflineAudioCompletionEvent|OverflowEvent|PageTransitionEvent|PopStateEvent|ProgressEvent|XMLHttpRequestProgressEvent|SpeechInputEvent|StorageEvent|TrackEvent|UIEvent|CompositionEvent|KeyboardEvent|MouseEvent|SVGZoomEvent|TextEvent|TouchEvent|WheelEvent|WebGLContextEvent|WebKitAnimationEvent|WebKitTransitionEvent';
  var v7/*HTMLCollection*/ = 'HTMLCollection|HTMLOptionsCollection|HTMLPropertiesCollection';
  var v8/*IDBRequest*/ = 'IDBRequest|IDBVersionChangeRequest';
  var v9/*Node*/ = [v0/*Document*/,v1/*HTMLInputElement*/,v2/*SVGComponentTransferFunctionElement*/,'Node|Attr|CharacterData|Comment|Text|CDATASection|DocumentFragment|DocumentType|Element|HTMLElement|HTMLAnchorElement|HTMLAppletElement|HTMLAreaElement|HTMLBRElement|HTMLBaseElement|HTMLBaseFontElement|HTMLBodyElement|HTMLButtonElement|HTMLCanvasElement|HTMLDListElement|HTMLDataListElement|HTMLDetailsElement|HTMLDirectoryElement|HTMLDivElement|HTMLEmbedElement|HTMLFieldSetElement|HTMLFontElement|HTMLFormElement|HTMLFrameElement|HTMLFrameSetElement|HTMLHRElement|HTMLHeadElement|HTMLHeadingElement|HTMLHtmlElement|HTMLIFrameElement|HTMLImageElement|HTMLKeygenElement|HTMLLIElement|HTMLLabelElement|HTMLLegendElement|HTMLLinkElement|HTMLMapElement|HTMLMarqueeElement|HTMLMediaElement|HTMLAudioElement|HTMLVideoElement|HTMLMenuElement|HTMLMetaElement|HTMLMeterElement|HTMLModElement|HTMLOListElement|HTMLObjectElement|HTMLOptGroupElement|HTMLOptionElement|HTMLOutputElement|HTMLParagraphElement|HTMLParamElement|HTMLPreElement|HTMLProgressElement|HTMLQuoteElement|HTMLScriptElement|HTMLSelectElement|HTMLSourceElement|HTMLSpanElement|HTMLStyleElement|HTMLTableCaptionElement|HTMLTableCellElement|HTMLTableColElement|HTMLTableElement|HTMLTableRowElement|HTMLTableSectionElement|HTMLTextAreaElement|HTMLTitleElement|HTMLTrackElement|HTMLUListElement|HTMLUnknownElement|SVGElement|SVGAElement|SVGAltGlyphDefElement|SVGAltGlyphItemElement|SVGAnimationElement|SVGAnimateColorElement|SVGAnimateElement|SVGAnimateMotionElement|SVGAnimateTransformElement|SVGSetElement|SVGCircleElement|SVGClipPathElement|SVGCursorElement|SVGDefsElement|SVGDescElement|SVGEllipseElement|SVGFEBlendElement|SVGFEColorMatrixElement|SVGFEComponentTransferElement|SVGFECompositeElement|SVGFEConvolveMatrixElement|SVGFEDiffuseLightingElement|SVGFEDisplacementMapElement|SVGFEDistantLightElement|SVGFEDropShadowElement|SVGFEFloodElement|SVGFEGaussianBlurElement|SVGFEImageElement|SVGFEMergeElement|SVGFEMergeNodeElement|SVGFEMorphologyElement|SVGFEOffsetElement|SVGFEPointLightElement|SVGFESpecularLightingElement|SVGFESpotLightElement|SVGFETileElement|SVGFETurbulenceElement|SVGFilterElement|SVGFontElement|SVGFontFaceElement|SVGFontFaceFormatElement|SVGFontFaceNameElement|SVGFontFaceSrcElement|SVGFontFaceUriElement|SVGForeignObjectElement|SVGGElement|SVGGlyphElement|SVGGlyphRefElement|SVGGradientElement|SVGLinearGradientElement|SVGRadialGradientElement|SVGHKernElement|SVGImageElement|SVGLineElement|SVGMPathElement|SVGMarkerElement|SVGMaskElement|SVGMetadataElement|SVGMissingGlyphElement|SVGPathElement|SVGPatternElement|SVGPolygonElement|SVGPolylineElement|SVGRectElement|SVGSVGElement|SVGScriptElement|SVGStopElement|SVGStyleElement|SVGSwitchElement|SVGSymbolElement|SVGTextContentElement|SVGTextPathElement|SVGTextPositioningElement|SVGAltGlyphElement|SVGTRefElement|SVGTSpanElement|SVGTextElement|SVGTitleElement|SVGUseElement|SVGVKernElement|SVGViewElement|Entity|EntityReference|Notation|ProcessingInstruction'].join('|');
  var v10/*StyleSheet*/ = 'StyleSheet|CSSStyleSheet';
  var v11/*WorkerContext*/ = 'WorkerContext|DedicatedWorkerContext|SharedWorkerContext';
  var table = [
    // [dynamic-dispatch-tag, tags of classes implementing dynamic-dispatch-tag]
    ['AbstractWorker', v3/*AbstractWorker*/]
    , ['Blob', v4/*Blob*/]
    , ['CSSRule', v5/*CSSRule*/]
    , ['Document', v0/*Document*/]
    , ['Event', v6/*Event*/]
    , ['HTMLCollection', v7/*HTMLCollection*/]
    , ['HTMLInputElement', v1/*HTMLInputElement*/]
    , ['IDBRequest', v8/*IDBRequest*/]
    , ['SVGComponentTransferFunctionElement', v2/*SVGComponentTransferFunctionElement*/]
    , ['Node', v9/*Node*/]
    , ['StyleSheet', v10/*StyleSheet*/]
    , ['WorkerContext', v11/*WorkerContext*/]
    , ['DOMType', [v3/*AbstractWorker*/,v4/*Blob*/,v5/*CSSRule*/,v6/*Event*/,v7/*HTMLCollection*/,v8/*IDBRequest*/,v9/*Node*/,v10/*StyleSheet*/,v11/*WorkerContext*/,'DOMType|ArrayBuffer|ArrayBufferView|DataView|Float32Array|Float64Array|Int16Array|Int32Array|Int8Array|Uint16Array|Uint32Array|Uint8Array|AudioBuffer|AudioContext|AudioListener|AudioNode|AudioChannelMerger|AudioChannelSplitter|AudioDestinationNode|AudioGainNode|AudioPannerNode|AudioSourceNode|AudioBufferSourceNode|MediaElementAudioSourceNode|BiquadFilterNode|ConvolverNode|DelayNode|DynamicsCompressorNode|HighPass2FilterNode|JavaScriptAudioNode|LowPass2FilterNode|RealtimeAnalyserNode|WaveShaperNode|AudioParam|AudioGain|BarInfo|CSSRuleList|CSSStyleDeclaration|CSSValue|CSSPrimitiveValue|CSSValueList|WebKitCSSFilterValue|WebKitCSSTransformValue|SVGColor|SVGPaint|CanvasGradient|CanvasPattern|CanvasPixelArray|CanvasRenderingContext|CanvasRenderingContext2D|WebGLRenderingContext|ClientRect|ClientRectList|Clipboard|Coordinates|Counter|Crypto|DOMApplicationCache|DOMException|DOMFileSystem|DOMFileSystemSync|DOMFormData|DOMImplementation|DOMMimeType|DOMMimeTypeArray|DOMParser|DOMPlugin|DOMPluginArray|DOMSelection|DOMTokenList|DOMSettableTokenList|DOMURL|DOMWindow|DataTransferItem|DataTransferItemList|Database|DatabaseSync|DirectoryReader|DirectoryReaderSync|ElementTimeControl|ElementTraversal|Entry|DirectoryEntry|FileEntry|EntryArray|EntryArraySync|EntrySync|DirectoryEntrySync|FileEntrySync|EventException|EventSource|EventTarget|FileError|FileException|FileList|FileReader|FileReaderSync|FileWriter|FileWriterSync|Geolocation|Geoposition|HTMLAllCollection|History|IDBAny|IDBCursor|IDBCursorWithValue|IDBDatabase|IDBDatabaseError|IDBDatabaseException|IDBFactory|IDBIndex|IDBKey|IDBKeyRange|IDBObjectStore|IDBTransaction|ImageData|InjectedScriptHost|InspectorFrontendHost|JavaScriptCallFrame|Location|MediaController|MediaError|MediaList|MediaQueryList|MediaQueryListListener|MemoryInfo|MessageChannel|MessagePort|Metadata|MutationCallback|MutationRecord|NamedNodeMap|Navigator|NodeFilter|NodeIterator|NodeList|NodeSelector|Notification|NotificationCenter|OESStandardDerivatives|OESTextureFloat|OESVertexArrayObject|OperationNotAllowedException|Performance|PerformanceNavigation|PerformanceTiming|PointerLock|PositionError|RGBColor|Range|RangeException|Rect|SQLError|SQLException|SQLResultSet|SQLResultSetRowList|SQLTransaction|SQLTransactionSync|SVGAngle|SVGAnimatedAngle|SVGAnimatedBoolean|SVGAnimatedEnumeration|SVGAnimatedInteger|SVGAnimatedLength|SVGAnimatedLengthList|SVGAnimatedNumber|SVGAnimatedNumberList|SVGAnimatedPreserveAspectRatio|SVGAnimatedRect|SVGAnimatedString|SVGAnimatedTransformList|SVGElementInstance|SVGElementInstanceList|SVGException|SVGExternalResourcesRequired|SVGFitToViewBox|SVGLangSpace|SVGLength|SVGLengthList|SVGLocatable|SVGTransformable|SVGMatrix|SVGNumber|SVGNumberList|SVGPathSeg|SVGPathSegArcAbs|SVGPathSegArcRel|SVGPathSegClosePath|SVGPathSegCurvetoCubicAbs|SVGPathSegCurvetoCubicRel|SVGPathSegCurvetoCubicSmoothAbs|SVGPathSegCurvetoCubicSmoothRel|SVGPathSegCurvetoQuadraticAbs|SVGPathSegCurvetoQuadraticRel|SVGPathSegCurvetoQuadraticSmoothAbs|SVGPathSegCurvetoQuadraticSmoothRel|SVGPathSegLinetoAbs|SVGPathSegLinetoHorizontalAbs|SVGPathSegLinetoHorizontalRel|SVGPathSegLinetoRel|SVGPathSegLinetoVerticalAbs|SVGPathSegLinetoVerticalRel|SVGPathSegMovetoAbs|SVGPathSegMovetoRel|SVGPathSegList|SVGPoint|SVGPointList|SVGPreserveAspectRatio|SVGRect|SVGRenderingIntent|SVGStringList|SVGStylable|SVGFilterPrimitiveStandardAttributes|SVGTests|SVGTransform|SVGTransformList|SVGURIReference|SVGUnitTypes|SVGZoomAndPan|SVGViewSpec|Screen|ScriptProfile|ScriptProfileNode|SpeechInputResult|SpeechInputResultList|Storage|StorageInfo|StyleMedia|StyleSheetList|TextMetrics|TextTrack|TextTrackCue|TextTrackCueList|TextTrackList|TimeRanges|Touch|TouchList|TreeWalker|ValidityState|WebGLActiveInfo|WebGLBuffer|WebGLCompressedTextures|WebGLContextAttributes|WebGLDebugRendererInfo|WebGLDebugShaders|WebGLFramebuffer|WebGLLoseContext|WebGLProgram|WebGLRenderbuffer|WebGLShader|WebGLTexture|WebGLUniformLocation|WebGLVertexArrayObjectOES|WebKitAnimation|WebKitAnimationList|WebKitBlobBuilder|WebKitCSSMatrix|WebKitMutationObserver|WebKitNamedFlow|WebKitPoint|WebSocket|WorkerLocation|WorkerNavigator|XMLHttpRequest|XMLHttpRequestException|XMLHttpRequestUpload|XMLSerializer|XPathEvaluator|XPathException|XPathExpression|XPathNSResolver|XPathResult|XSLTProcessor'].join('|')]
  ];
  $dynamicSetMetadata(table);
})();
//  ********** Globals **************
function $static_init(){
}
var const$0000 = Object.create(_DeletedKeySentinel.prototype, {});
var const$0001 = Object.create(NoMoreElementsException.prototype, {});
var $globals = {};
$static_init();
main();
