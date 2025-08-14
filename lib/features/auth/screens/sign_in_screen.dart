import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void handleLogin() {
    // Add your login logic
  }

  void handleGoogleLogin() {
    // Add Google login logic
  }

  void handleFacebookLogin() {
    // Add Facebook login logic
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 16),
              Text(
                'Sign in to your Account',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                'Enter your email and password to log in',
                style: TextStyle(color: Colors.grey),
              ),
              SizedBox(height: 32),
              Text('Email'),
              SizedBox(height: 8),
              EmailInput(controller: emailController, hint: 'Enter your email'),
              SizedBox(height: 16),
              Text('Password'),
              SizedBox(height: 8),
              PasswordInput(
                controller: passwordController,
                hint: 'Enter your password',
              ),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    'Forgot Password ?',
                    style: TextStyle(color: Colors.brown),
                  ),
                ),
              ),
              SizedBox(height: 24),
              ActionButton(label: 'Log In', onPressed: handleLogin),
              SizedBox(height: 24),
              Row(
                children: [
                  Expanded(child: Divider()),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: Text('Or'),
                  ),
                  Expanded(child: Divider()),
                ],
              ),
              SizedBox(height: 16),
              SocialButton(
                label: 'Continue with Google',
                icon: Icons.g_mobiledata,
                onPressed: handleGoogleLogin,
              ),
              SizedBox(height: 12),
              SocialButton(
                label: 'Continue with Facebook',
                icon: Icons.facebook,
                onPressed: handleFacebookLogin,
              ),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account?",
                    style: TextStyle(color: Colors.grey),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                        color: Colors.brown,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SocialButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final VoidCallback onPressed;

  const SocialButton({
    required this.label,
    required this.icon,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      icon: Icon(icon),
      label: Text(label),
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(minimumSize: Size(double.infinity, 50)),
    );
  }
}

class ActionButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const ActionButton({required this.label, required this.onPressed, Key? key})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.amber,
        minimumSize: Size(double.infinity, 50),
      ),
      child: Text(label),
    );
  }
}

class PasswordInput extends StatelessWidget {
  final TextEditingController controller;
  final String hint;

  const PasswordInput({required this.controller, required this.hint, Key? key})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: true,
      decoration: InputDecoration(
        hintText: hint,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        suffixIcon: Icon(Icons.visibility_off),
      ),
    );
  }
}

class EmailInput extends StatelessWidget {
  final TextEditingController controller;
  final String hint;

  const EmailInput({required this.controller, required this.hint, Key? key})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        hintText: hint,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
  }
}
