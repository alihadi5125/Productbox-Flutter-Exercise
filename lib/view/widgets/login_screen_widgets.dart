import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreenTextField extends StatelessWidget {
  const LoginScreenTextField({
    Key? key,
    required TextEditingController controller,
    required String? hintText,
    required TextInputType inputType,
  })  : _controller = controller,
        hintText = hintText,
        inputType = inputType,
        super(key: key);

  final TextEditingController? _controller;
  final String? hintText;
  final TextInputType inputType;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 25.sp, vertical: 12.sp),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(30.r)),
        ),
        child: TextFormField(
          controller: _controller,
          cursorColor: Color(0xFF293462),
          keyboardType: inputType,
          decoration: InputDecoration(
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
            contentPadding:
                EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
            hintText: hintText!,
            hintStyle: GoogleFonts.poppins(
              color: Colors.grey,
              fontSize: 16.sp,
            ),
          ),
        ),
      ),
    );
  }
}

class RegisterHereText extends StatelessWidget {
  const RegisterHereText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: GestureDetector(
        onTap: () => ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Register Here...'),
            behavior: SnackBarBehavior.floating,
            duration: Duration(milliseconds: 800),
            backgroundColor: Color(0xFF00818A),
          ),
        ),
        child: Text(
          'Register Here',
          style: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: 20.sp,
              fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}

class ForgotPasswordText extends StatelessWidget {
  const ForgotPasswordText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: GestureDetector(
        onTap: () => ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Forgot password...'),
            behavior: SnackBarBehavior.floating,
            duration: Duration(milliseconds: 800),
            backgroundColor: Color(0xFF00818A),
          ),
        ),
        child: Text(
          'Forgot password?',
          style: GoogleFonts.poppins(
            color: Colors.grey,
            fontSize: 14.sp,
          ),
        ),
      ),
    );
  }
}
