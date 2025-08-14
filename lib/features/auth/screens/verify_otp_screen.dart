import 'package:flutter/material.dart';

class VerifyOtpScreen extends StatefulWidget {
  const VerifyOtpScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _VerifyOtpScreenState createState() => _VerifyOtpScreenState();
}

class _VerifyOtpScreenState extends State<VerifyOtpScreen> {
  int secondsLeft = 16;
  TextEditingController otpController = TextEditingController();

  // You'll need to implement the countdown timer logic below

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 40),
            Header(title: "Let’s verify", subtitle: "Your Google Account"),
            SizedBox(height: 20),
            InstructionText(
              instructionText: "Enter the OTP code we sent to",
              email: "shammas1918@gmail.com",
              onEditEmail: () {
                /* Handle edit email */
              },
            ),
            SizedBox(height: 20),
            OTPInput(placeholder: "Enter your OTP", controller: otpController),
            SizedBox(height: 10),
            TimerText(
              secondsLeft: secondsLeft,
              onResend: () {
                /* Handle resend OTP */
              },
            ),
            SizedBox(height: 20),
            ActionButton(
              label: "Verify OTP",
              onPressed: () {
                /* Handle OTP verification */
              },
              disabled: otpController.text.isEmpty,
            ),
          ],
        ),
      ),
    );
  }
}

class ActionButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final bool disabled;

  const ActionButton({
    required this.label,
    required this.onPressed,
    required this.disabled,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: disabled ? null : onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.amber,
        minimumSize: Size(double.infinity, 50),
      ),
      child: Text(label),
    );
  }
}

class TimerText extends StatelessWidget {
  final int secondsLeft;
  final VoidCallback onResend;

  const TimerText({
    required this.secondsLeft,
    required this.onResend,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      'Resend code in (${secondsLeft.toString().padLeft(2, '0')})',
      style: TextStyle(color: Colors.orange),
    );
  }
}

class OTPInput extends StatelessWidget {
  final String placeholder;
  final TextEditingController controller;

  const OTPInput({
    required this.placeholder,
    required this.controller,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: placeholder,
        border: OutlineInputBorder(),
      ),
      keyboardType: TextInputType.number,
    );
  }
}

class InstructionText extends StatelessWidget {
  final String instructionText;
  final String email;
  final void Function()? onEditEmail;

  const InstructionText({
    required this.instructionText,
    required this.email,
    this.onEditEmail,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Text('$instructionText $email.')),
        if (onEditEmail != null)
          GestureDetector(
            onTap: onEditEmail,
            child: Text('edit the email', style: TextStyle(color: Colors.blue)),
          ),
      ],
    );
  }
}

class Header extends StatelessWidget {
  final String title;
  final String subtitle;

  const Header({required this.title, required this.subtitle, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        ),
        Text(
          subtitle,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
