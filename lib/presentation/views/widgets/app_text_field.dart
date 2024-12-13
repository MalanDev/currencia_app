import 'package:currencia_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    this.controller,
    this.labelText,
    this.enabled = true,
    this.obscureText = false,
    this.onChanged,
    this.autovalidateMode = AutovalidateMode.onUserInteraction,
    this.validator,
    this.helperText,
    this.errorText,
    this.suffixIcon,
    this.suffixIconConstraints =
        const BoxConstraints(minHeight: 24, minWidth: 40),
    this.prefixIcon,
    this.prefixIconConstraints =
        const BoxConstraints(minHeight: 24, minWidth: 40),
    this.autofillHints,
    this.onEditingComplete,
    this.inputFormatters,
    this.keyboardType,
    this.maxLines = 1,
  });

  /// The controller for the text field.
  final TextEditingController? controller;

  /// The label text for the text field.
  final String? labelText;

  /// Whether the text field is enabled.
  final bool enabled;

  /// Whether the text field is obscured.
  final bool obscureText;

  /// Called when the text field value changes.
  final ValueChanged<String>? onChanged;

  /// The autovalidate mode for the text field.
  final AutovalidateMode autovalidateMode;

  /// The validator for the text field.
  final FormFieldValidator<String>? validator;

  /// The helper text for the text field.
  final String? helperText;

  /// The error text for the text field.
  final String? errorText;

  /// The suffix icon for the text field.
  final Widget? suffixIcon;

  /// The constraints for the suffix icon.
  final BoxConstraints? suffixIconConstraints;

  /// The prefix icon for the text field.
  final Widget? prefixIcon;

  /// The constraints for the prefix icon.
  final BoxConstraints? prefixIconConstraints;

  /// The autofillhints for app text field.
  final Iterable<String>? autofillHints;

  /// Called when the text field value completed.
  final VoidCallback? onEditingComplete;

  /// The input formatters for the text field.
  final List<TextInputFormatter>? inputFormatters;

  /// The keyboard type for the text field.
  final TextInputType? keyboardType;

  /// the maximum lines available in text field.
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,
      onEditingComplete: onEditingComplete,
      autofillHints: autofillHints,
      controller: controller,
      enabled: enabled,
      obscureText: obscureText,
      onChanged: onChanged,
      autovalidateMode: autovalidateMode,
      validator: validator,
      maxLines: maxLines,
      cursorColor: AppColors.buttonPrimary,
      cursorHeight: 16,
      decoration: InputDecoration(
        labelText: labelText,
        filled: true,
        fillColor: Colors.transparent,
        hoverColor: Colors.transparent,
        focusColor: Colors.transparent,
        helperText: helperText,
        errorText: errorText,
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        suffixIconConstraints: suffixIconConstraints,
        prefixIconConstraints: prefixIconConstraints,
      ),
    );
  }
}
