import 'package:flutter_flux/flutter_flux.dart';

import 'package:hn_flutter/sdk/models/hn_item.dart';

final Action<HNItem> addHNItem = new Action();
final Action<int> showHideItem = new Action();
final Action<List<int>> setStorySort = new Action();
