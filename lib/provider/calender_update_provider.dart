import 'package:flutter/foundation.dart';
import 'package:jackelieson/features/calendar/model/get_event_response_model.dart';

class CalenderUpdateProvider extends ChangeNotifier {
  GetEventResponseModel? eventResponse;

  getResponse({required GetEventResponseModel? res}) {


    eventResponse = res;
    notifyListeners();
  }
}
