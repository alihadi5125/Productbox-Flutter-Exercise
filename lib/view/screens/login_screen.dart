import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:productbox_flutter_exercise/constants/strings.dart';
import 'package:productbox_flutter_exercise/controller/cubits/login_cubit/login_cubit.dart';
import 'package:productbox_flutter_exercise/view/widgets/loading_state.dart';
import 'package:productbox_flutter_exercise/view/widgets/login_screen_widgets.dart';
import 'package:productbox_flutter_exercise/view/widgets/login_shapes/login_custom_shape.dart';
import 'package:productbox_flutter_exercise/view/widgets/snack_bar.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        height: 118.sp,
        child: Stack(
          children: [
            Positioned(
              bottom: -10.sp,
              child: CustomPaint(
                painter: BottomLeftShape(),
                child: Container(
                  height: 112.sp,
                  width: 191.sp,
                ),
              ),
            ),
            Positioned(
              bottom: -25.sp,
              left: 60.sp,
              child: CustomPaint(
                painter: BottomRightShape(),
                child: Container(
                  width: 148.sp,
                  height: 116.sp,
                ),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Color(0xFF293462),
      body: SizedBox(
        height: 1.sh,
        width: 1.sw,
        child: Stack(
          children: [
            Positioned(
              top: -10.sp,
              left: -10.sp,
              child: CustomPaint(
                painter: TopCustomFirstShape(),
                child: Container(
                  width: 326.sp,
                  height: 268.sp,
                ),
              ),
            ),
            Positioned(
              top: -30.sp,
              left: -24.sp,
              child: CustomPaint(
                painter: TopCustomSecondShape(),
                child: Container(
                  height: 185,
                  width: 150,
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              top: 0,
              child: SizedBox(
                height: 1.sh,
                width: 1.sw,
                child: ListView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  shrinkWrap: true,
                  padding: EdgeInsets.only(top: 280.h),
                  children: [
                    /// Login Text Widget
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Log In',
                        style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 26.sp,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                    SizedBox(height: 40.h),

                    /// Email Address Text field
                    LoginScreenTextField(
                        controller: _emailController,
                        hintText: "Email Address",
                        inputType: TextInputType.emailAddress),

                    /// Password Text field
                    LoginScreenTextField(
                        controller: _passwordController,
                        hintText: "Password",
                        inputType: TextInputType.visiblePassword),

                    /// Login Button
                    Align(
                      alignment: Alignment.center,
                      child: GestureDetector(
                        onTap: () {
                          if (_emailController.text.isEmpty ||
                              _passwordController.text.isEmpty) {
                            snackBar(
                                context: context,
                                message: 'Please Enter Email & Password!');
                          } else if (_emailController.text.trim() !=
                              _passwordController.text.trim()) {
                            snackBar(
                                context: context,
                                message:
                                    'Your Email & Password are not matched!');
                          } else {
                            context
                                .read<LoginCubit>()
                                .userLogin(email: _emailController.text.trim());
                          }
                        },
                        child: Container(
                          height: 55.sp,
                          margin: EdgeInsets.symmetric(
                              horizontal: 25.sp, vertical: 15.sp),
                          decoration: BoxDecoration(
                            color: Color(0xFF00818A),
                            borderRadius:
                                BorderRadius.all(Radius.circular(30.r)),
                          ),
                          child: Align(
                            alignment: Alignment.center,
                            child: BlocConsumer<LoginCubit, LoginState>(
                              listener: (context, state) {
                                if (state is LoginSuccessState) {
                                  snackBar(
                                      context: context,
                                      message: 'Logged in successfully.');
                                  Navigator.pushNamed(
                                      context, Strings.uploadDocumentScreen);
                                } else if (state is EmailNotExistState) {
                                  snackBar(
                                      context: context,
                                      message: 'Email does not exists.');
                                } else if (state is LoginErrorState) {
                                  snackBar(
                                      context: context,
                                      message:
                                          'An error occurred while logging in user.');
                                }
                              },
                              builder: (context, state) {
                                if (state is LoginLoadingState) {
                                  return loadingState(
                                      size: 40.sp, color: Colors.white);
                                }

                                return Text(
                                  'LOGIN',
                                  style: GoogleFonts.poppins(
                                      color: Colors.white,
                                      fontSize: 22.sp,
                                      fontWeight: FontWeight.w600),
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.h),
                    ForgotPasswordText(),
                    SizedBox(height: 80.h),
                    RegisterHereText(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
