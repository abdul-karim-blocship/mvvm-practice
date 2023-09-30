import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {Key? key,
        this.minLines,
        this.maxLength,
        required this.readOnly,
        this.maxLines,
        this.prefix,
        required this.controller,
        required this.hintText,
        this.onFieldSubmitted,
        required this.enabled,
        this.validator,
        this.focusNode,
        this.type})
      : super(key: key);
  final TextEditingController controller;
  final String hintText;
  final FocusNode? focusNode;
  final void Function(String)? onFieldSubmitted;
  final int? maxLines;
  final int? minLines;
  final Widget? prefix;
  final int? maxLength;
  final bool readOnly;
  final bool enabled;
  final String? Function(String? value)? validator;
  final TextInputType? type;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: Theme.of(context).textTheme.bodySmall,
      focusNode: focusNode,
      autofocus: false,
      maxLength: maxLength,
      minLines: minLines,
      readOnly: readOnly,
      maxLines: maxLines,
      enabled: enabled,
      validator: validator,
      onFieldSubmitted: onFieldSubmitted,
      keyboardType: type,
      autovalidateMode: AutovalidateMode.onUserInteraction,

      onEditingComplete: () => FocusScope.of(context).nextFocus(),
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefix: prefix,
        contentPadding: const EdgeInsets.all(20.0),
        fillColor: Colors.grey.withOpacity(0.1),
        filled: true,
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        // hintStyle: tfHintStyle,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide.none,
        ),
      ),
      controller: controller,
    );
  }
}

class CustomPasswordTextField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  FocusNode? focusNode;
  int? maxLength;
  final bool isPasswordField;
  String? Function(String? value)? validator;
  TextInputType? type;

  CustomPasswordTextField(
      {Key? key,
        required this.controller,
        required this.hintText,
        this.validator,
        this.focusNode,
        required this.isPasswordField,
        this.type})
      : super(key: key);

  @override
  State<CustomPasswordTextField> createState() =>
      _CustomPasswordTextFieldState();
}

class _CustomPasswordTextFieldState extends State<CustomPasswordTextField> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: Theme.of(context).textTheme.bodySmall,
      obscureText: obscureText,
      focusNode: widget.focusNode,
      autofocus: false,
      maxLength: widget.maxLength,
      validator: widget.validator,
      keyboardType: widget.type,
      onEditingComplete: () => FocusScope.of(context).nextFocus(),
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        suffixIcon: !widget.isPasswordField
            ? null
            : IconButton(
          onPressed: () {
            setState(() {});
            obscureText = !obscureText;
          },
          icon: passwordIcon(obscureText),
        ),
        contentPadding: const EdgeInsets.all(20.0),
        fillColor: Colors.grey.withOpacity(0.1),
        filled: true,
        hintText: widget.hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        // hintStyle: tfHintStyle,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide.none,
        ),
      ),
      controller: widget.controller,
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }

  Icon passwordIcon(bool obscure) {
    return obscure
        ? Icon(
      Icons.visibility,
      color: Theme.of(context).primaryColor,
    )
        : Icon(
      Icons.visibility_off,
      color: Theme.of(context).primaryColor,
    );
  }
}