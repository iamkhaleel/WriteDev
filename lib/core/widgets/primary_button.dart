import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final Widget? leadingIcon;
  final Widget? trailingIcon;
  final ImageProvider? backgroundImage;
  final bool isLoading;
  final double? width;
  final double? height;

  const PrimaryButton({
    super.key,
    required this.text,
    this.onPressed,
    this.leadingIcon,
    this.trailingIcon,
    this.backgroundImage,
    this.isLoading = false,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isLoading ? null : onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white.withOpacity(0.1),
        foregroundColor: Colors.white,
        minimumSize: Size(
          width ?? double.infinity,
          height ?? 56,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(9999),
          side: BorderSide(color: Colors.white.withOpacity(0.2)),
        ),
        elevation: 0,
      ),
      child: Stack(
        children: [
          // Background Image
          if (backgroundImage != null)
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(9999),
                  image: DecorationImage(
                    image: backgroundImage!,
                    fit: BoxFit.cover,
                    opacity: 0.3, // Adjust opacity as needed
                  ),
                ),
              ),
            ),

          // Content
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                // Leading Icon with conditional loading
                if (isLoading)
                  SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      valueColor: AlwaysStoppedAnimation<Color>(
                        Colors.white.withOpacity(0.7),
                      ),
                    ),
                  )
                else if (leadingIcon != null)
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: leadingIcon!,
                  ),

                // Text
                Expanded(
                  child: Text(
                    text,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.24,
                      fontFamily: 'SpaceGrotesk',
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),

                // Trailing Icon (only show when not loading)
                if (!isLoading && trailingIcon != null)
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: trailingIcon!,
                  ),

                // Spacer for loading state to maintain centering
                if (isLoading && trailingIcon != null)
                  const SizedBox(width: 28), // Matches icon size + padding
              ],
            ),
          ),
        ],
      ),
    );
  }
}