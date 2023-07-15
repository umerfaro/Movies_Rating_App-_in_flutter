
class AppException implements Exception{

  final _message;
  final _prefix;
  AppException([this._message, this._prefix]);

  String toString(){
    return "$_prefix$_message";
  }


}

// also here we pass second augument as prefix after message to show the error message

//if no internet connection
class FetchDataException extends AppException{

  FetchDataException([String? message]):super(message,"Error During Communication: ");
}

//if url does not exist

class BadRequestException extends AppException{

  BadRequestException([message]):super(message,"Invalid Request: ");
}

//if user is not authorised
class UnauthorisedException extends AppException{

  UnauthorisedException([message]):super(message,"Unauthorised request: ");
}

//if invalid input is given
class InvalidInputException extends AppException{

  InvalidInputException([String? message]):super(message,"Invalid Input: ");
}

//if no internet connection
class NoInternetException extends AppException{

  NoInternetException([String? message]):super(message,"No Internet: ");
}

//if no service is found
class NoServiceFoundException extends AppException{

  NoServiceFoundException([String? message]):super(message,"No Service Found: ");
}

//if format is invalid
class InvalidFormatException extends AppException{

  InvalidFormatException([String? message]):super(message,"Invalid Format: ");
}

//if unknown error occurs
class UnknownException extends AppException{

  UnknownException([String? message]):super(message,"Unknown Error: ");
}

//if no data is found
class NoDataFoundException extends AppException{

  NoDataFoundException([String? message]):super(message,"No Data Found: ");
}

//if no image is found
class NoImageFoundException extends AppException{

  NoImageFoundException([String? message]):super(message,"No Image Found: ");
}

//if no video is found
class NoVideoFoundException extends AppException{

  NoVideoFoundException([String? message]):super(message,"No Video Found: ");
}

//if no audio is found
class NoAudioFoundException extends AppException{

  NoAudioFoundException([String? message]):super(message,"No Audio Found: ");
}
//if no file is found
class NoFileFoundException extends AppException{

  NoFileFoundException([String? message]):super(message,"No File Found: ");
}
//if no contact is found
class NoContactFoundException extends AppException{

  NoContactFoundException([String? message]):super(message,"No Contact Found: ");
}
// if no location is found
class NoLocationFoundException extends AppException{

  NoLocationFoundException([String? message]):super(message,"No Location Found: ");
}

// if no permission is found
class NoPermissionFoundException extends AppException{

  NoPermissionFoundException([String? message]):super(message,"No Permission Found: ");
}

//if no camera is found
class NoCameraFoundException extends AppException{

  NoCameraFoundException([String? message]):super(message,"No Camera Found: ");
}

//if no microphone is found
class NoMicrophoneFoundException extends AppException{

  NoMicrophoneFoundException([String? message]):super(message,"No Microphone Found: ");
}

//if no bluetooth is found
class NoBluetoothFoundException extends AppException{

  NoBluetoothFoundException([String? message]):super(message,"No Bluetooth Found: ");
}

//if no wifi is found
class NoWifiFoundException extends AppException{

  NoWifiFoundException([String? message]):super(message,"No Wifi Found: ");
}

//if no gps is found
class NoGPSFoundException extends AppException{

  NoGPSFoundException([String? message]):super(message,"No GPS Found: ");
}

//if no battery is found
class NoBatteryFoundException extends AppException{

  NoBatteryFoundException([String? message]):super(message,"No Battery Found: ");
}

//if no sensor is found
class NoSensorFoundException extends AppException{

  NoSensorFoundException([String? message]):super(message,"No Sensor Found: ");
}

//if no storage is found
class NoStorageFoundException extends AppException{

  NoStorageFoundException([String? message]):super(message,"No Storage Found: ");
}

//if no notification is found
class NoNotificationFoundException extends AppException{

  NoNotificationFoundException([String? message]):super(message,"No Notification Found: ");
}

//if no alarm is found
class NoAlarmFoundException extends AppException{

  NoAlarmFoundException([String? message]):super(message,"No Alarm Found: ");
}

//if no calendar is found
class NoCalendarFoundException extends AppException{

  NoCalendarFoundException([String? message]):super(message,"No Calendar Found: ");
}

//if no event is found
class NoEventFoundException extends AppException{

  NoEventFoundException([String? message]):super(message,"No Event Found: ");
}

//if storage is full
class StorageFullException extends AppException{

  StorageFullException([String? message]):super(message,"Storage Full: ");
}

