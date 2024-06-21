import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IndividualPage extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _otpController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final RxBool _agreeToTerms = false.obs;

  IndividualPage({super.key});

  void _sendOtp() {
    // Function to send OTP to the phone number
    print("OTP sent to ${_phoneNumberController.text}");
  }

  void _verifyOtp() {
    // Function to verify OTP
    print("OTP verified: ${_otpController.text}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Create Account',
          style: TextStyle(fontFamily: 'Poppins'),
        ),
        backgroundColor: Colors.teal,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTextField(_usernameController, 'Username', Icons.person),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: _buildTextField(
                        _phoneNumberController, 'Phone Number', Icons.phone),
                  ),
                  const SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: _sendOtp,
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.teal,
                        foregroundColor: Colors.white),
                    child: const Text(
                      'Send OTP',
                      style: TextStyle(fontFamily: 'Poppins'),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              _buildTextField(_otpController, 'Enter OTP', Icons.verified,
                  isOtp: true),
              const SizedBox(height: 16),
              _buildTextField(
                  _locationController, 'Location', Icons.location_on),
              const SizedBox(height: 16),
              Obx(
                () => CheckboxListTile(
                  title: const Text('I agree to the terms and conditions',
                      style: TextStyle(
                          fontFamily: 'Poppins', fontWeight: FontWeight.w500)),
                  value: _agreeToTerms.value,
                  onChanged: (bool? value) {
                    _agreeToTerms.value = value!;
                  },
                  activeColor: Colors.teal,
                ),
              ),
              const SizedBox(height: 32),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate() &&
                        _agreeToTerms.value) {
                      _verifyOtp();
                      // Handle form submission after OTP verification
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                  child: const Text('Confirm',
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                          fontSize: 18)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(
      TextEditingController controller, String labelText, IconData icon,
      {bool isOtp = false}) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: const TextStyle(fontFamily: 'Poppins'),
        prefixIcon: Icon(icon, color: Colors.teal),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      keyboardType: isOtp ? TextInputType.number : TextInputType.text,
      style: const TextStyle(fontFamily: 'Poppins'),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your $labelText';
        }
        return null;
      },
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: IndividualPage(),
    theme: ThemeData(
      primarySwatch: Colors.teal,
      fontFamily: 'Poppins',
    ),
  ));
}
