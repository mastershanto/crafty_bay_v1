///isCodingWorkCompleted?=>"yes, completed";
library;

import 'package:crafty_bay_v1/presentation/ui/ui_utility/form_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../state_holders/send_email_otp_controller.dart';
import '../../ui_utility/app_colors.dart';
import '../../widgets/app_logo.dart';
import 'verify_otp_screen.dart';

class VerifyEmailScreen extends StatefulWidget {
  const VerifyEmailScreen({super.key});

  @override
  State<VerifyEmailScreen> createState() => _VerifyEmailScreenState();
}

class _VerifyEmailScreenState extends State<VerifyEmailScreen> {
  final TextEditingController _emailTEController = TextEditingController();
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
                    const SizedBox(height: 160),
                    const AppLogo(
                      height: 80,
                    ),
                    const SizedBox(height: 24),
                    Text(
                      "Welcome Back",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "Please, enter your email address.",
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    TextFormField(
                      controller: _emailTEController,
                      validator: (value) => FormValidator.emailValidator(value),
                      decoration: const InputDecoration(hintText: "Email"),
                    ),
                    const SizedBox(height: 8),
                    GetBuilder<SendEmailOtpController>(builder: (controller) {
                      return SizedBox(
                        width: double.infinity,
                        child: Visibility(
                          visible: controller.inProgress == false,
                          replacement:
                              const Center(child: CircularProgressIndicator()),
                          child: ElevatedButton(
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                final bool result =
                                    await controller.sendOtpToEmail(
                                        _emailTEController.text.trim());
                                if (result) {
                                  Get.to(
                                    VerifyOtpScreen(
                                      email: _emailTEController.text.trim(),
                                    ),
                                  );
                                } else {
                                  Get.showSnackbar(
                                    GetSnackBar(
                                      title: "Email verification fail!",
                                      message: controller.errorMessage,
                                    ),
                                  );
                                }
                              }
                            },
                            child: const Text("Next"),
                          ),
                        ),
                      );
                    }),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
