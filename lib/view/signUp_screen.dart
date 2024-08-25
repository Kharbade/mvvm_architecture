import 'package:flutter/material.dart';
import 'package:mvvm/res/components/round_button.dart';
import 'package:mvvm/utils/routes/routes_name.dart';
import 'package:mvvm/utils/utils.dart';
import 'package:mvvm/view_model/auth_view_model.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  ValueNotifier<bool> _obsecurePassword = ValueNotifier<bool>(true);

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();

  @override
  void dispose() {
    super.dispose();

    _emailController.dispose();
    _passwordController.dispose();

    emailFocusNode.dispose();
    passwordFocusNode.dispose();

    _obsecurePassword.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);

    final height = MediaQuery.of(context).size.height * 1;
    return Scaffold(
      appBar: AppBar(
        title: Text("SignUp"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              focusNode: emailFocusNode,
              decoration: InputDecoration(
                  hintText: "Email",
                  labelText: "Email",
                  prefixIcon: Icon(Icons.alternate_email)),
              onFieldSubmitted: (value) {
                Utils.fieldFocusChange(
                    context, emailFocusNode, passwordFocusNode);
              },
            ),
            ValueListenableBuilder(
              valueListenable: _obsecurePassword,
              builder: (context, value, child) {
                return TextFormField(
                  controller: _passwordController,
                  focusNode: passwordFocusNode,
                  obscureText: _obsecurePassword.value,
                  decoration: InputDecoration(
                      hintText: "Password",
                      labelText: "Password",
                      prefixIcon: Icon(Icons.lock),
                      suffixIcon: InkWell(
                          onTap: () {
                            _obsecurePassword.value = !_obsecurePassword.value;
                          },
                          child: Icon(_obsecurePassword.value
                              ? Icons.visibility_off_outlined
                              : Icons.visibility))),
                );
              },
            ),
            SizedBox(
              height: height * 0.085,
            ),
            RoundButton(
              title: "SignUp",
              loading: authViewModel.signUploading,
              onPress: () {
                if(_emailController.text.isEmpty){
                  Utils.flushBarErrorMessage("Please Enter Email", context);
                }else if(_passwordController.text.isEmpty){
                  Utils.flushBarErrorMessage("Please Enter Password", context);
                }else if(_emailController.text.length<6){
                  Utils.flushBarErrorMessage("Please Enter atleast 6 digit Password", context);
                }else{
                  Map data = {
                    'email': _emailController.text.toString(),
                    'password': _passwordController.text.toString(),
                  };
                  authViewModel.signUpApi(data, context);
                }
              },
            ),
            SizedBox(
              height: height * 0.02,
            ),
            InkWell(
                onTap: (){
                  Navigator.pushNamed(context, RoutesName.login);
                },
                child: Text("Already have an account? LogIn"))
          ],
        ),
      ),
    );
  }
}
