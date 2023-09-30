import 'package:flutter/material.dart';

class CustomFilledButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final double? height;
  final Color? color;

  const CustomFilledButton(
      {Key? key,
      required this.title,
      required this.onTap,
      this.height,
      this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      textColor: Colors.white,
      color: color ?? Theme.of(context).primaryColor,
      height: height ?? 30,
      onPressed: onTap,
      child: Text(title),
    );
  }
}

class CustomFilledIconButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final IconData icon;
  final double? height;

  const CustomFilledIconButton(
      {Key? key,
      required this.title,
      required this.icon,
      this.height,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      textColor: Colors.white,
      color: Theme.of(context).primaryColor,
      onPressed: onTap,
      height: height ?? 20,
      child: Row(
        children: [Icon(icon), Text(title)],
      ),
    );
  }
}

class CustomIconButton extends StatelessWidget {
  final VoidCallback onTap;
  final IconData icon;
  final double? height;

  const CustomIconButton(
      {Key? key, required this.icon, this.height, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: 20,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      textColor: Colors.white,
      color: Theme.of(context).primaryColor,
      onPressed: onTap,
      height: height ?? 20,
      child: Icon(icon),
    );
  }
}
