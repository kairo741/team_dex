import 'package:flutter/material.dart';

class DefaultNextButton extends StatelessWidget {
  final String buttonText;
  final double? fonteSize;
  final GestureTapCallback? onTap;
  final bool enableIcon;
  final bool uppercase;
  final IconData? icon;
  final Color? iconColor;
  final Color buttonColor;
  final Color fontColor;
  final double? height;
  final double? width;
  final BoxBorder? border;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final double? sizeIcon;
  final double? topIcon;
  final double? rightIcon;
  final double? leftIcon;

  const DefaultNextButton(
      {Key? key,
      required this.buttonText,
      required this.onTap,
      this.enableIcon = false,
      this.uppercase = true,
      this.buttonColor = Colors.red,
      this.fontColor = Colors.white,
      this.border,
      this.icon = Icons.arrow_forward_ios,
      this.iconColor = Colors.white,
      this.padding,
      this.margin,
      this.height,
      this.width,
      this.fonteSize,
      this.sizeIcon,
      this.topIcon,
      this.rightIcon = 8,
      this.leftIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      margin: margin,
      decoration: BoxDecoration(
          border: border,
          borderRadius: const BorderRadius.all(Radius.circular(50)),
          color: buttonColor),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          splashColor: Colors.red,
          borderRadius: const BorderRadius.all(Radius.circular(50)),
          onTap: onTap,
          child: Padding(
            padding: padding ?? const EdgeInsets.all(12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Stack(
                    children: [
                      Center(
                        child: Text(
                            uppercase ? buttonText.toUpperCase() : buttonText,
                            textAlign: TextAlign.center,
                            style: Theme.of(context)
                                .textTheme
                                .headline6!
                                .copyWith(
                                    fontSize: fonteSize,
                                    fontWeight: FontWeight.w500,
                                    color: fontColor)),
                      ),
                      if (enableIcon) ...[
                        Positioned(
                            top: topIcon,
                            right: rightIcon,
                            left: leftIcon,
                            child: Icon(
                              icon,
                              color: iconColor,
                              size: sizeIcon,
                            ))
                      ]
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
