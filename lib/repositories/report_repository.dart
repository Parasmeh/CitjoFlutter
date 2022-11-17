// Dart Imports
import 'dart:async';

// Amplify Imports
import 'package:amplify_flutter/amplify_flutter.dart';

// Model Imports

import '../models/Report.dart';

class ReportsRepository {
  bool _loading = false;

  Future<bool> createReport(String postId, String reportText) async {
    // print("Inside create Report");
    _loading = true;
    try {
      Report report = Report(
          reportText: reportText,
          postID: postId,
          createdOn: TemporalDateTime.now(),
          updatedOn: TemporalDateTime.now());
      await Amplify.DataStore.save(report);
      // print("Creating report Successful");
      _loading = false;
      return true;
    } catch (ex) {
      // print("Inside Create Report Catch");
      // print(ex.toString());
      _loading = false;
      return false;
    }
  }
}
