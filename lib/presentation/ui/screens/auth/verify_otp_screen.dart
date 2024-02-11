///todo: isCodingWorkCompleted?=>"no, work in progress!";
library;

import 'package:crafty_bay_v1/presentation/state_holders/verify_otp_controller.dart';
import 'package:crafty_bay_v1/presentation/ui/screens/main_bottom_nav_screen.dart';
import 'package:crafty_bay_v1/presentation/ui/ui_utility/form_validator.dart';
import 'package:crafty_bay_v1/presentation/ui/widgets/center_circular_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../ui_utility/app_colors.dart';
import '../../widgets/app_logo.dart';
import 'complete_profile_screen.dart';

class VerifyOtpScreen extends StatefulWidget {
  const VerifyOtpScreen({super.key, required this.email});

  final String email;

  @override
  State<VerifyOtpScreen> createState() => _VerifyOtpScreenState();
}

class _VerifyOtpScreenState extends State<VerifyOtpScreen> {
  final TextEditingController _otpTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.primaryColor,
      child: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    const SizedBox(height: 80),
                    const AppLogo(
                      height: 80,
                    ),
                    const SizedBox(height: 24),
                    Text(
                      "Enter OTP Code",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "A 4 digit OTP code has been  sent",
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    PinCodeTextField(
                      // controller: otp,
                      controller: _otpTEController,
                      validator: (value) => FormValidator.inputValidator(value,
                          errorMessage: "Input your 4 digit Otp"),
                      length: 4,
                      obscureText: false,
                      animationType: AnimationType.fade,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      pinTheme: PinTheme(
                          shape: PinCodeFieldShape.box,
                          borderRadius: BorderRadius.circular(5),
                          fieldHeight: 50,
                          fieldWidth: 40,
                          activeFillColor: Colors.transparent,
                          inactiveFillColor: Colors.transparent,
                          inactiveColor: AppColors.primaryColor,
                          selectedFillColor: Colors.transparent,
                          selectedColor: Colors.purple),
                      animationDuration: const Duration(milliseconds: 300),
                      backgroundColor: Colors.transparent,
                      enableActiveFill: true,
                      onCompleted: (v) {
                        // print("Completed");
                      },
                      // onChanged: (value) {
                      //   // print(value);
                      // },
                      // beforeTextPaste: (text) {
                      //   // print("Allowing to paste $text");
                      //   return true;
                      // },
                      appContext: context,
                    ),
                    // customPinCodeTextField(
                    //   context,
                    //   otp: _otpTEController,
                    // ),
                    const SizedBox(height: 24),
                    otpSubmitButton(),
                    const SizedBox(height: 24),
                    otpExpireTime,
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  SizedBox otpSubmitButton() {
    return SizedBox(
                    width: double.infinity,
                    child: GetBuilder<VerifyOtpController>(
                        builder: (verifyOtpController) {
                      return Visibility(
                        visible: verifyOtpController.inProgress == false,
                        replacement: const CenterCircularProgressIndicator(),
                        child: ElevatedButton(
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              final bool response = await verifyOtpController.verifyOtp(
                                widget.email,
                                _otpTEController.text.trim(),
                              );

                              if (response) {
                                if(verifyOtpController.shouldNavigateToCompleteProfile){
                                  Get.offAll(()=>
                                  const CompleteProfileScreen(),
                                  );
                                }else{
                                  Get.offAll(()=>
                                  const MainBottomNavScreen(),
                                  );
                                }


                              } else {
                                Get.showSnackbar(GetSnackBar(
                                  title: "OTP verification failed",
                                  message: verifyOtpController.errorMessage,
                                  duration: const Duration(seconds: 2),
                                  isDismissible: true,
                                ));
                              }
                            }
                          },
                          child: const Text("Next"),
                        ),
                      );
                    }),
                  );
  }

  RichText get otpExpireTime {
    return RichText(
      text: const TextSpan(
          style: TextStyle(
            color: Colors.grey,
          ),
          children: [
            TextSpan(text: "This code will expire"),
            TextSpan(
                style: TextStyle(
                    color: AppColors.primaryColor, fontWeight: FontWeight.w600),
                text: "120s"),
          ]),
    );
  }

  // PinCodeTextField customPinCodeTextField(BuildContext context,
  //     {required otp}) {
  //   return PinCodeTextField(
  //     controller: otp,
  //     validator: (value) => FormValidator.inputValidator(value,
  //         errorMessage: "Input your 4 digit Otp"),
  //     length: 4,
  //     obscureText: false,
  //     animationType: AnimationType.fade,
  //     mainAxisAlignment: MainAxisAlignment.spaceAround,
  //     pinTheme: PinTheme(
  //         shape: PinCodeFieldShape.box,
  //         borderRadius: BorderRadius.circular(5),
  //         fieldHeight: 50,
  //         fieldWidth: 40,
  //         activeFillColor: Colors.transparent,
  //         inactiveFillColor: Colors.transparent,
  //         inactiveColor: AppColors.primaryColor,
  //         selectedFillColor: Colors.transparent,
  //         selectedColor: Colors.purple),
  //     animationDuration: const Duration(milliseconds: 300),
  //     backgroundColor: Colors.transparent,
  //     enableActiveFill: true,
  //     onCompleted: (v) {
  //       print("Completed");
  //     },
  //     // onChanged: (value) {
  //     //   // print(value);
  //     // },
  //     // beforeTextPaste: (text) {
  //     //   // print("Allowing to paste $text");
  //     //   return true;
  //     // },
  //     appContext: context,
  //   );
  // }

  @override
  void dispose() {
    // TODO: implement dispose

    _otpTEController.dispose();
    super.dispose();
  }
}
