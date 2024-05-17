import 'package:flutter/material.dart';

class AuthFormTextField extends StatelessWidget {
  final TextEditingController editingController;
  final String label;
  final bool isSecure;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.symmetric(vertical: 8),
      child: SizedBox(
        width: double.infinity,
        child: TextFormField(
          controller: editingController,
          autofillHints: const [AutofillHints.email],
          obscureText: isSecure,
          decoration: InputDecoration(
            labelText: label,
            labelStyle: const TextStyle(
              fontFamily: 'Plus Jakarta Sans',
              color: Color(0xFF57636C),
              fontSize: 16,
              letterSpacing: 0,
              fontWeight: FontWeight.w500,
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Color(0xFFF1F4F8),
                width: 2,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Color(0xFF4B39EF),
                width: 2,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Color(0xFFE0E3E7),
                width: 2,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Color(0xFFE0E3E7),
                width: 2,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            filled: true,
            fillColor: const Color(0xFFF1F4F8),
          ),
          style: const TextStyle(
            fontFamily: 'Plus Jakarta Sans',
            color: Color(0xFF101213),
            fontSize: 16,
            letterSpacing: 0,
            fontWeight: FontWeight.w500,
          ),
          onTapOutside: (_){
            FocusManager.instance.primaryFocus?.unfocus();
          },
          keyboardType: TextInputType.number,
        ),
      ),
    );
  }

  const AuthFormTextField({super.key,
    required this.editingController,
    required this.label,
    this.isSecure = false,
  });
}
