import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EditProfileButton extends StatelessWidget {
  const EditProfileButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 25,
      width: 45,
      decoration: BoxDecoration(
          color: const Color(0xffF0EFFA),
          borderRadius: BorderRadius.circular(15)),
      child: Center(
          child: Text(
        'Edit',
        style: GoogleFonts.poppins(fontSize: 12),
      )),
    );
  }
}
