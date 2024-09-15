

import 'dart:async';

import 'package:advanced_course/domain/usecase/login_usecase.dart';
import 'package:advanced_course/presentation/base/baseviewmodel.dart';

import '../common/freezed_data_classes.dart';

class LoginViewModel extends BaseViewModel with LoginViewModelInputs,LoginViewModelOutputs {
  StreamController _userNameStreamController = StreamController<String>.broadcast(); //making this as a broadcast in order to let many subscribers listen to it through one stream
  StreamController _passwordStreamController = StreamController<String>.broadcast(); //making this as a broadcast in order to let many subscribers listen to it through one stream


  var loginObject=LoginObject(" "," "); //it is a data class


  LoginUseCase? _loginUseCase;
  LoginViewModel(this._loginUseCase);

//here overrides for inputs

  @override
  void dispose() {
    _userNameStreamController.close();
    _passwordStreamController.close();
  }

  @override
  void start() {
    // TODO: implement start
  }

  @override
  Sink get inputPassword => _passwordStreamController.sink;

  @override
  Sink get inputUserName => _userNameStreamController.sink;

  @override
  login() async {

    (await _loginUseCase.execute(LoginUseCaseInput(
        loginObject.userName, loginObject.password))
    ).fold((failure)=>
    {
      //left = failure = object from failure class consist of code and message
      print(failure.message)
    }
    ,(data)=>{
    //right = success = authentication object contain customer and contact info
          print(data.customer?.name)
        }

    );
    
  }
  @override
  setPassword(String password) {
    inputPassword.add(password); //here I added the password value to the sink and once the sink recieved the value the stream will validate it
    loginObject = loginObject.copyWith(password: password);
  }

  @override
  setUserName(String userName) {
     inputUserName.add(userName);
     loginObject = loginObject.copyWith(userName: userName);
  }

  //here overrides for the outputs
  @override
  // TODO: implement outputIsPasswordValid
  Stream<bool> get outputIsPasswordValid => _passwordStreamController.stream.map((password)=>_isPasswordValid(password)); //here we are listening to the password enetered inside the sink then validate it

  @override
  // TODO: implement outputIsUserNameValid
  Stream<bool> get outputIsUserNameValid => _userNameStreamController.stream.map((password)=> _isUserNameValid(password));

  //private function
bool _isPasswordValid(String password){
  return password.isNotEmpty;
}
  bool _isUserNameValid(String password){
    return password.isNotEmpty;
  }
}


abstract mixin class LoginViewModelInputs{
  //3 functions - > adding username - > password - > press Login button
  setUserName(String userName);
  setPassword(String password);
  login();
  //2 sinks for the streams
  Sink get inputUserName; //the sink here is like a pipeline in order to send the value to the stream controller
  Sink get inputPassword;
}


abstract mixin class LoginViewModelOutputs{
  //2 streams for the sinks that in the input
  Stream<bool> get outputIsUserNameValid; //the value come here from the sink and then the stream here will validate the username if it is correct
  Stream<bool> get outputIsPasswordValid;
}