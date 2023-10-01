import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uiapi_design_thiran/src/models/datamodels.dart';

import '../services/repo.dart';

final gitDataProvider = FutureProvider<DataModel>((ref) async {
  return await ref.watch(dataProvider).getUserDetail();
});
