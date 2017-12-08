import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert' show JSON;

import 'package:hn_flutter/sdk/hn_config.dart';
import 'package:hn_flutter/sdk/models/hn_item.dart';

class HNStoryService {
  HNConfig _config = new HNConfig();

  getChildComments (HNItem item) async {
    item.kids.map((child) => http.get('${this._config.url}/item/$child')
      .then((res) => JSON.decode(res.body))
      .then((List<int> body) => body.sublist(0, 5))
      .then((List<int> body) => Future.wait(body.map((itemId) => this.getItemByID(itemId)).toList()))
    );
  }

  Future<HNItem> getItemByID (int id) => http.get('${this._config.url}/item/$id.json')
    .then((res) => JSON.decode(res.body))
    .then((item) => new HNItem.fromMap(item));
}