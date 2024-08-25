// class to define exceptions

class AppException implements Exception{
  //2 variables are initialized in the class
  final _message;
  final _prefix;

  //constructor for the class
  AppException([this._message,this._prefix]);

  String toString(){
    return "$_prefix$_message";
  }
}

//if Exception comes while fetching the data
class FetchDataException extends AppException{
  FetchDataException([String? message]) : super(message,"Error During Communication");
}

//if Exception comes while invalid request
class BadRequestException extends AppException{
  BadRequestException([String? message]) : super(message,"Invalid request");
}

//if Exception comes while UnAuthorized request
class UnAuthorizedException extends AppException{
  UnAuthorizedException([String? message]) : super(message,"UnAuthorized request");
}

//if Exception comes while Invalid Input
class InvalidInputException extends AppException{
  InvalidInputException([String? message]) : super(message,"Invalid Input");
}