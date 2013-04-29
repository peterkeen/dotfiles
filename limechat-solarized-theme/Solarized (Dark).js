(function() {
  var SolarizedDark;

  String.prototype.startsWith = function(str) {
    return this.indexOf(str) === 0;
  };

  String.prototype.includes = function(str) {
    return this.indexOf(str) >= 0;
  };

  SolarizedDark = (function() {

    function SolarizedDark() {
      this.initializeVars();
      this.createTopicNode();
      this.addListeners();
    }

    SolarizedDark.prototype.initializeVars = function() {
      this.hideEvents = false;
      this.doc = document;
      this.body = document.body;
      this.topic = null;
      return this.marker = null;
    };

    SolarizedDark.prototype.createTopicNode = function() {
      var _this = this;
      this.topic = this.getNode('topic');
      if (this.topic === null) {
        if (this.bodyAttribute('type') === 'channel' || this.bodyAttribute('type') === 'talk') {
          this.topic = this.doc.createElement('div');
          this.topic.id = 'topic';
          this.body.appendChild(this.topic);
          this.topic.onclick = function() {
            return _this.toggleEvents();
          };
        }
        if (this.bodyAttribute('type') === "talk") {
          return this.setTopic('Private Channel');
        }
      }
    };

    SolarizedDark.prototype.addListeners = function() {
      var processNode,
        _this = this;
      processNode = function(ev) {
        var node;
        node = ev.target;
        if (node.id === 'mark' && _this.marker !== node && _this.marker !== null) {
          return _this.marker.parentNode.removeChild(_this.marker);
        } else if (node.className && node.className.includes('line') && node.getAttribute("nick") === "*offlinemarker") {
          if (_this.marker !== null) {
            _this.marker.parentNode.removeChild(_this.marker);
          }
          _this.marker = _this.doc.createElement('hr');
          _this.marker.id = 'mark';
          return node.parentNode.replaceChild(_this.marker, node);
        } else if (_this.bodyAttribute('type') === 'channel') {
          _this.checkTimestamp(node);
          _this.checkTopic(node);
          return _this.checkEvent(node);
        }
      };
      return this.doc.addEventListener("DOMNodeInserted", processNode, false);
    };

    SolarizedDark.prototype.checkTimestamp = function(node) {
      var curr_time_node, prev_time_node;
      prev_time_node = node.previousSibling.firstChild;
      curr_time_node = node.firstChild;
      if (prev_time_node.className.includes('time') && curr_time_node.className.includes('time')) {
        if (prev_time_node.innerHTML === curr_time_node.innerHTML) {
          return curr_time_node.className += ' duptime';
        }
      }
    };

    SolarizedDark.prototype.checkTopic = function(node) {
      var message_node;
      message_node = node.lastChild;
      if (node.className.includes('event')) {
        if (message_node.innerText.startsWith('Topic')) {
          message_node.setAttribute('type', 'topic');
        }
        if (message_node.getAttribute('type') === 'topic') {
          return this.setTopic(message_node.innerText.match(/opic: (.*)$/)[1]);
        }
      }
    };

    SolarizedDark.prototype.checkEvent = function(node) {
      if (node.className.includes('event') && this.hideEvents) {
        return node.style.display = 'none';
      }
    };

    SolarizedDark.prototype.toggleEvents = function() {
      var node, _i, _j, _len, _len2, _ref, _ref2, _results, _results2;
      this.hideEvents = !this.hideEvents;
      if (this.hideEvents) {
        _ref = this.body.childNodes;
        _results = [];
        for (_i = 0, _len = _ref.length; _i < _len; _i++) {
          node = _ref[_i];
          _results.push(node.className.includes('event') ? node.style.display = 'none' : void 0);
        }
        return _results;
      } else {
        _ref2 = this.body.childNodes;
        _results2 = [];
        for (_j = 0, _len2 = _ref2.length; _j < _len2; _j++) {
          node = _ref2[_j];
          _results2.push(node.style.display = 'block');
        }
        return _results2;
      }
    };

    SolarizedDark.prototype.setTopic = function(topic) {
      return this.topic.innerText = topic;
    };

    SolarizedDark.prototype.bodyAttribute = function(attr) {
      return this.body.getAttribute(attr);
    };

    SolarizedDark.prototype.getNode = function(id) {
      return this.doc.getElementById(id);
    };

    return SolarizedDark;

  })();

  new SolarizedDark;

}).call(this);
