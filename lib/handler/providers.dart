import 'package:flutter/foundation.dart';

class Providers extends ChangeNotifier{
  bool isDonor;
  var user;
  Providers({ this.isDonor=true});

  bool changeToHospitalStaff(bool val){
    isDonor=val;
    notifyListeners();
    return isDonor;
  }
   currentUser(var val){
    user=val;
    notifyListeners();
    return user;
  }
}