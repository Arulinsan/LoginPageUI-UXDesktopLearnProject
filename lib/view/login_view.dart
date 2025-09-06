import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  Color getColor(Set<WidgetState> states) {
    const Set<WidgetState> interactiveStates = <WidgetState>{
      WidgetState.pressed,
      WidgetState.selected,
      WidgetState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return Colors.white;
    }
    return Colors.transparent;
  }

  bool obscureText = true;
  bool check = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 50.0),
          child: const Text(
            'Welcome to My World',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(height: 20),
        TextField(
          style: TextStyle(color: Colors.white),
          cursorColor: Colors.white,
          decoration: const InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            border: OutlineInputBorder(),
            labelStyle: TextStyle(color: Colors.white),
            labelText: 'Email',
          ),
        ),
        const SizedBox(height: 20),
        TextField(
          obscureText: obscureText,
          style: TextStyle(color: Colors.white),
          cursorColor: Colors.white,
          decoration: InputDecoration(
            suffixIcon: IconButton(
              icon: Icon(
                obscureText
                    ? Icons.visibility_off_outlined
                    : Icons.visibility_outlined,
                color: obscureText ? Colors.grey : Colors.white,
              ),
              onPressed: () {
                setState(() {
                  obscureText = !obscureText;
                });
              },
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            border: OutlineInputBorder(),
            labelStyle: TextStyle(color: Colors.white),
            labelText: 'Password',
          ),
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Checkbox(
              side: const BorderSide(color: Colors.white),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4.0),
              ),
              checkColor: Colors.black,
              activeColor: Colors.white,
              fillColor: WidgetStateProperty.resolveWith(getColor),
              value: check,
              onChanged: (value) {
                setState(() {
                  check = value!;
                });
              },
            ),
            const Text('Remember me', style: TextStyle(color: Colors.white)),
          ],
        ),
        const SizedBox(height: 10),
        SizedBox(
          width: double.infinity,
          height: 50,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              backgroundColor: Colors.white, // Background color
            ),
            onPressed: () {
              // Handle login action
            },
            child: const Text(
              'Login',
              style: TextStyle(fontSize: 18, color: Colors.black),
            ),
          ),
        ),
        SizedBox(height: 20),
        Row(
          children: [
            Expanded(child: Divider(color: Colors.white)),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                'Or Maybe With',
                style: TextStyle(color: Colors.white),
              ),
            ),
            Expanded(child: Divider(color: Colors.white)),
          ],
        ),
        SizedBox(height: 20),
        Row(
          children: [
            Expanded(
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    side: BorderSide(color: Colors.white),
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () {},

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'lib/assets/logo/google.png',
                        height: 30,
                        width: 30,
                      ),
                      SizedBox(width: 10),
                      Text('Google', style: TextStyle(fontSize: 18)),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(width: 20),
            Expanded(
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    side: BorderSide(color: Colors.white),
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () {},

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'lib/assets/logo/x.png',
                        height: 30,
                        width: 30,
                      ),
                      SizedBox(width: 10),
                      Text('X', style: TextStyle(fontSize: 18)),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
