import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app/app.dart';

void main() {
  // As Its Name, this line makes sure that the app
  // Is initialized successfully and we can add codes
  // like what we did in SystemChrome line
  // And make operations like: calling API, backend
  // Or even calling local data
  WidgetsFlutterBinding.ensureInitialized();
  // To Remove Lower Buttons of Mobile (Back, Home, Show Opened Apps)
  // And Remove statusBar that has (Clock, notification, battery ...etc)
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  //
  // The MaterialApp Class MUST called here only and not implemented
  // So when we use Hot Reload it reloads all the app from MaterialApp
  runApp(const MyCalculator());
}
