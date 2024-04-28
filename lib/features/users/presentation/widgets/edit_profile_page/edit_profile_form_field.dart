import 'package:flutter/material.dart';

class EditProfileFormField extends StatelessWidget {
  final String initVal;
  final String labelText;
  final bool disable;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
      child: TextFormField(
        readOnly: disable,
        initialValue: initVal,
        textCapitalization: TextCapitalization.words,
        obscureText: false,
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: const TextStyle(
            color: Color(0xFF57636C),
            fontSize: 14,
            letterSpacing: 0,
            fontWeight: FontWeight.normal,
          ),
          hintStyle: const TextStyle(
            color: Color(0xFF57636C),
            fontSize: 14,
            letterSpacing: 0,
            fontWeight: FontWeight.normal,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Color(0xFFE0E3E7),
              width: 2,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Color(0xFF4B39EF),
              width: 2,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Color(0xFFFF5963),
              width: 2,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Color(0xFFFF5963),
              width: 2,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsetsDirectional.fromSTEB(20, 24, 0, 24),
        ),
        style: const TextStyle(
          color: Color(0xFF14181B),
          fontSize: 14,
          letterSpacing: 0,
          fontWeight: FontWeight.normal,
        ),
      ),
    );
  }

  const EditProfileFormField({
    super.key,
    required this.initVal,
    required this.labelText,
    this.disable = false
  });
}
