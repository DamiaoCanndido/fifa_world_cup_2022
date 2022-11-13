import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FWCTextFormField extends StatelessWidget {
  final String label;
  final TextStyle? style;
  final TextAlign? textAlign;
  final TextInputType? keyboardType;
  final ValueChanged<String>? onChange;
  final FormFieldValidator<String>? validator;
  final List<TextInputFormatter>? inputFormatters;
  final TextEditingController? controller;
  final String? errorText;
  final Widget? prefix;
  final Widget? suffix;
  final bool? obscureText;
  final String? initialValue;
  final bool? enabled;
  final double? widthTextField;
  final double? heightTextField;

  const FWCTextFormField({
    super.key,
    required this.label,
    this.validator,
    this.style,
    this.textAlign = TextAlign.start,
    this.keyboardType,
    this.onChange,
    this.inputFormatters,
    this.controller,
    this.prefix,
    this.suffix,
    this.obscureText = false,
    this.initialValue,
    this.enabled = true,
    this.errorText,
    this.widthTextField = double.infinity,
    this.heightTextField,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widthTextField,
      height: heightTextField,
      child: TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        keyboardType: keyboardType,
        obscureText: obscureText!,
        textAlign: textAlign!,
        style: style,
        autocorrect: false,
        textInputAction: TextInputAction.done,
        inputFormatters: inputFormatters,
        controller: controller,
        validator: validator,
        enabled: enabled,
        initialValue: initialValue,
        onChanged: onChange,
        cursorColor: Colors.white,
        decoration: InputDecoration(
          focusColor: Colors.white,
          labelText: label,
          prefix: prefix,
          suffix: suffix,
          isDense: true,
          errorText: errorText,
          labelStyle: const TextStyle(
            color: Colors.white,
          ),
          errorStyle: const TextStyle(color: Colors.redAccent),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(2),
            borderSide: BorderSide(color: Colors.grey[400]!),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(2),
            borderSide: BorderSide(color: Colors.grey[400]!),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(2),
            borderSide: BorderSide(color: Colors.grey[400]!),
          ),
          filled: true,
          fillColor: const Color(0xFF090910),
        ),
      ),
    );
  }
}
