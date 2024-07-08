import 'package:flutter/material.dart';

import 'data/local_resource/data_store.dart';
import 'data/remote_data/api_handler/base_api_client.dart';
import 'my_app.dart';

void main() async {
  await DataStore.instance.init();
  BaseApiClient();
  runApp(const MyApp());
}
