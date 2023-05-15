import 'package:flutter/material.dart';
import 'package:mvvm/mvvm_tut/route/routes_name.dart';

class LoginView extends StatelessWidget {
  LoginView({Key? key}) : super(key: key);

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final ValueNotifier<bool> _isPasswordVisible = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const Spacer(),
            TextFormField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                  hintText: "Email address",
                  labelText: "Email address",
                  prefixIcon: Icon(Icons.alternate_email)),
            ),
            ValueListenableBuilder<bool>(
              valueListenable: _isPasswordVisible,
              builder: (context, value, child) => TextFormField(
                controller: _passwordController,
                obscureText: _isPasswordVisible.value,
                decoration: InputDecoration(
                  hintText: "Password",
                  labelText: "Password",
                  prefixIcon: const Icon(Icons.lock_outline),
                  suffixIcon: IconButton(
                    onPressed: () {
                      _isPasswordVisible.value = !_isPasswordVisible.value;
                    },
                    icon: _isPasswordVisible.value
                        ? const Icon(Icons.visibility_off)
                        : const Icon(Icons.visibility),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: OutlinedButton(
                onPressed: () {
                  Navigator.pushNamed(context, RoutesName.home);
                },
                child: const Text("LOGIN"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
