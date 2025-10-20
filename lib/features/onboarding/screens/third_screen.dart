import 'package:flutter/material.dart';
import '../../../core/widgets/social_button.dart';
import '../../../core/widgets/primary_button.dart';
import '../../../core/navigation/main_navigation_screen.dart';

class ThirdOnboardingScreen extends StatelessWidget {
  const ThirdOnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 200,
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('lib/assets/images/waveform.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 32),
          Text(
            'Welcome to WriteDev',
            style: TextStyle(
              color: Colors.white,
              fontSize: 32,
              fontWeight: FontWeight.bold,
              letterSpacing: -0.5,
              fontFamily: 'SpaceGrotesk',
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          Text(
            'Join the community where every voice is heard.',
            style: TextStyle(
              color: Colors.grey[400],
              fontSize: 16,
              fontFamily: 'SpaceGrotesk',
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 32),
           Container(
              constraints: const BoxConstraints(maxWidth: 320),
              child: Column(
                children: [
                  PrimaryButton(
                    text: 'Sign up with GitHub',
                    leadingIcon: Image.asset(
                      'lib/assets/images/github-logo.png',
                      width: 20,
                      height: 20,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => MainNavigationScreen()),
                      );
                    },
                  ),
                  const SizedBox(height: 16),
                  PrimaryButton(
                    text: 'Sign up with Google',
                    leadingIcon: Image.asset(
                      'lib/assets/images/google-logo.png',
                      width: 20,
                      height: 20,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => MainNavigationScreen()),
                      );
                    },
                  ),
                  const SizedBox(height: 16),
                  PrimaryButton(
                    text: 'Sign up with Email',
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => MainNavigationScreen()),
                      );
                    },
                    leadingIcon: Icon(Icons.email, color: Colors.white, size: 20),
                  ),
                ],
              ),
            ),
          const SizedBox(height: 16),
          TextButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => MainNavigationScreen()),
              );
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Already have an account? ',
                  style: TextStyle(
                    color: Colors.grey[400],
                    fontSize: 14,
                    fontFamily: 'SpaceGrotesk',
                  ),
                ),
                const Text(
                  'Log In',
                  style: TextStyle(
                    color: Color(0xFF00f5d4),
                    fontSize: 14,
                    fontFamily: 'SpaceGrotesk',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


