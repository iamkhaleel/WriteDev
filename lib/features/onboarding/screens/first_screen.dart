import 'package:flutter/material.dart';
import '../../../core/widgets/logo_painter.dart';
import '../../../core/widgets/primary_button.dart';

class FirstOnboardingScreen extends StatelessWidget {
  const FirstOnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 80,
              width: 80,
              margin: const EdgeInsets.only(bottom: 16.0),
              child: CustomPaint(painter: LogoPainter()),
            ),
            Text(
              'WriteDev',
              style: TextStyle(
                color: Colors.white,
                fontSize: 32,
                fontWeight: FontWeight.bold,
                letterSpacing: -0.5,
                fontFamily: 'SpaceGrotesk',
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            Text(
              'Share code. Get reach. No followers needed.',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
                letterSpacing: -0.5,
                fontFamily: 'SpaceGrotesk',
              ),
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
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
                    onPressed: () {},
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
                    onPressed: () {},
                  ),
                  const SizedBox(height: 16),
                  PrimaryButton(
                    text: 'Sign up with Email',
                    onPressed: () {},
                    leadingIcon: Icon(Icons.email, color: Colors.white, size: 20),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            TextButton(
              onPressed: () {},
              child: Text(
                'Continue as Guest',
                style: TextStyle(
                  color: Colors.grey[400],
                  fontSize: 14,
                  fontFamily: 'SpaceGrotesk',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


