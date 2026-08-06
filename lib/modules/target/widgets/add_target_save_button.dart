import 'package:flutter/material.dart';

class AddTargetSaveButton extends StatelessWidget {
  final VoidCallback onTap;

  const AddTargetSaveButton({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 180,
        height: 52,
        child: ElevatedButton(
          onPressed: onTap,
          style: ElevatedButton.styleFrom(
            backgroundColor:
                const Color(0xff7B4DFF),

            elevation: 0,

            shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(14),
            ),
          ),
          child: const Text(
            "Simpan Target",
            style: TextStyle(
              color: Colors.white,
              fontWeight:
                  FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}