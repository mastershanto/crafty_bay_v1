///todo: isCodingWorkCompleted?=>"no, work in progress!";
library;

import 'package:crafty_bay_v1/presentation/state_holders/complete_profile_controller.dart';
import 'package:crafty_bay_v1/presentation/state_holders/verify_otp_controller.dart';
import 'package:crafty_bay_v1/presentation/ui/screens/main_bottom_nav_screen.dart';
import 'package:crafty_bay_v1/presentation/ui/ui_utility/form_validator.dart';
import 'package:crafty_bay_v1/presentation/ui/widgets/center_circular_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../data/models/create_profile_params.dart';
import '../../ui_utility/app_colors.dart';
import '../../widgets/app_logo.dart';

class CompleteProfileScreen extends StatefulWidget {
  const CompleteProfileScreen({super.key});

  @override
  State<CompleteProfileScreen> createState() => _CompleteProfileScreenState();
}

class _CompleteProfileScreenState extends State<CompleteProfileScreen> {
  final TextEditingController _firstNameTEController=TextEditingController();
  final TextEditingController _lastNameTEController=TextEditingController();
  final TextEditingController _mobileTEController=TextEditingController();
  final TextEditingController _cityTEController=TextEditingController();
  final TextEditingController _shippingAddressTEController=TextEditingController();

  final GlobalKey<FormState> _formKey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      color:AppColors.primaryColor,
      child: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Form(
                key:_formKey,
                child: Column(
                  children: [
                    const SizedBox(height: 160),
                    const AppLogo(
                      height: 80,
                    ),
                    const SizedBox(height: 24),
                    Text(
                      "Complete Profile",
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge
                          ?.copyWith(fontSize: 28),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "Get started with us with your details",
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    TextFormField(
                      controller: _firstNameTEController,
                      validator: (value)=>FormValidator.inputValidator(value,errorMessage:"Input your first name"),
                      decoration: const InputDecoration(hintText: "First name"),
                      textInputAction: TextInputAction.next,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    TextFormField(
                      controller: _lastNameTEController,
                      validator: (value)=>FormValidator.inputValidator(value,errorMessage:"Input your last name"),
                      decoration: const InputDecoration(hintText: "Last name"),
                      textInputAction: TextInputAction.next,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    TextFormField(
                      controller: _mobileTEController,
                      validator: (value)=>FormValidator.phoneNumberValidator(value,errorMessage:"Enter your valid mobile number!"),
                      decoration: const InputDecoration(hintText: "Mobile"),
                      textInputAction: TextInputAction.next,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    TextFormField(
                      controller: _cityTEController,
                      validator: (value)=>FormValidator.inputValidator(value,errorMessage:"Enter your city name!"),
                      decoration: const InputDecoration(hintText: "City"),
                      textInputAction: TextInputAction.next,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    TextFormField(
                      controller: _shippingAddressTEController,
                      validator: (value)=>FormValidator.inputValidator(value,errorMessage:"Enter your shipping address!"),
                      decoration: const InputDecoration(hintText: "Shipping address"),
                      textInputAction: TextInputAction.next,
                    ),
                    const SizedBox(height: 8),
                    SizedBox(
                        width: double.infinity,
                      child: GetBuilder<CompleteProfileController>(
                          builder: (completeProfileController) {
                            return Visibility(
                              visible: completeProfileController.inProgress == false,
                              replacement: const CenterCircularProgressIndicator(),
                              child: ElevatedButton(
                                onPressed: () async {
                                  if (_formKey.currentState!.validate()) {
                                    final createProfileParams = CreateProfileParams(
                                      firstName:
                                      _firstNameTEController.text.trim(),
                                      lastName:
                                      _lastNameTEController.text.trim(),
                                      mobile: _mobileTEController.text.trim(),
                                      city: _cityTEController.text.trim(),
                                      shippingAddress:
                                      _shippingAddressTEController.text
                                          .trim(),
                                    );
                                    final bool result =
                                    await completeProfileController
                                        .createProfileData(
                                        Get.find<VerifyOtpController>().token,
                                        createProfileParams
                                    );
                                    if (result) {
                                      Get.offAll(() => const MainBottomNavScreen());
                                    } else {
                                      Get.showSnackbar(GetSnackBar(
                                        title: 'Complete profile failed',
                                        message: completeProfileController.errorMessage,
                                        duration: const Duration(seconds: 2),
                                        isDismissible: true,
                                      ));
                                    }
                                  }
                                },
                                child: const Text('Complete'),
                              ),
                            );
                          }
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

    @override
  void dispose(){
    super.dispose();
    _firstNameTEController.clear();
    _lastNameTEController.clear();
    _mobileTEController.clear();
    _cityTEController.clear();
    _shippingAddressTEController.clear();
    }
}
