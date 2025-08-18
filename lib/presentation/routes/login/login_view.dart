// ignore_for_file: unused_field, prefer_final_fields

import 'package:advanced_flutter_tutorial/presentation/auth/login/viewmodel/login_viewmodel.dart';
import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  LoginViewModel _viewModel = LoginViewModel(_loginUseCase);

  TextEditingController _userNameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  _bind() {
    _viewModel.start();
    _userNameController
        .addListener(() => _viewModel.setUsername(_userNameController.text));

    _passwordController
        .addListener(() => _viewModel.setUsername(_passwordController.text));
  }

  @override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
