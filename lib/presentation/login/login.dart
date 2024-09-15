import 'package:advanced_course/presentation/login/login_viewmodel.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:advanced_course/data/responses/responses.dart';
import 'package:advanced_course/app/constant.dart';
import 'package:advanced_course/data/network/app_api.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {

  LoginViewModel? _viewModel=LoginViewModel(null);
  late Dio _dio;
  late AppServiceClient _appServiceClient;

  @override
  void initState() {
    super.initState();
    _dio = Dio();
    _dio.interceptors.add(PrettyDioLogger(requestHeader: true, requestBody: true, responseHeader: true, enabled: true));
    _appServiceClient = AppServiceClient(_dio, baseUrl: Constant.baseUrl);
  }

  Future<void> _login() async {
    try {

      AuthenticationResponse response = await _appServiceClient.login(
        "aseel@example.com",
        "password123",
        "123456789",
        "Iphone",
      );


      print("Login successful: ${response.toString()}");

    } on DioException catch (e) {

      print("Login failed: ${e.response?.data ?? e.message}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: const Text('Login View'),
    ),
    body: Center(
    child: ElevatedButton(
      onPressed: _login,
      child: const Text('Login'),
    ),
    ),
    );
  }
}
