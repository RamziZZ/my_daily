import 'package:flutter/material.dart';

class RegisterButton extends StatelessWidget {

  final bool loading;
  final VoidCallback onTap;

  const RegisterButton({
    super.key,
    required this.loading,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 58,
      child: ElevatedButton(
        onPressed:
            loading ? null : onTap,
        style:
            ElevatedButton.styleFrom(
          backgroundColor:
              const Color(0xff7B4DFF),
          shape:
              RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(14),
          ),
        ),
        child: loading
            ? const CircularProgressIndicator(
                color: Colors.white,
              )
            : const Text(
                "Daftar",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight:
                      FontWeight.bold,
                ),
              ),
      ),
    );
  }
}