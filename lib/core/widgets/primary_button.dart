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
  final Color? backgroundColor;
  final Color? textColor;

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
    this.backgroundColor,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    final Color bg = backgroundColor ?? Colors.white.withOpacity(0.1);
    final Color fg = textColor ?? Colors.white;

    return ElevatedButton(
      onPressed: isLoading ? null : onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: bg,
        foregroundColor: fg,
        minimumSize: Size(width ?? double.infinity, height ?? 56),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(9999),
          side: BorderSide(color: Colors.white.withOpacity(0.2)),
        ),
        elevation: 0,
      ),
      child: Stack(
        children: [
          // Background Image (optional)
          if (backgroundImage != null)
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(9999),
                  image: DecorationImage(
                    image: backgroundImage!,
                    fit: BoxFit.cover,
                    opacity: 0.3,
                  ),
                ),
              ),
            ),

          // Content
          SizedBox(
            height: height ?? 56,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                if (isLoading)
                  SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      valueColor: AlwaysStoppedAnimation<Color>(fg),
                    ),
                  )
                else if (leadingIcon != null) ...[
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: leadingIcon!,
                  ),
                ],

                // Text
                Flexible(
                  child: Text(
                    text,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: fg),
                  ),
                ),

                if (!isLoading && trailingIcon != null) ...[
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: trailingIcon!,
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}
