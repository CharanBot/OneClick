import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ServiceProviderPage extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _serviceTypeController = TextEditingController();
  final RxBool _agreeToTerms = false.obs;
  final RxBool _hidePassword = true.obs;
  final RxBool _hideConfirmPassword = true.obs;

  ServiceProviderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Create Account',
          style: TextStyle(fontFamily: 'Poppins'),
        ),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
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
              _buildTextField(
                  _phoneNumberController, 'Phone Number', Icons.phone),
              const SizedBox(height: 16),
              Obx(
                () => _buildTextField(
                  _passwordController,
                  'Password',
                  Icons.lock,
                  obscureText: _hidePassword.value,
                  toggleVisibility: () {
                    _hidePassword.value = !_hidePassword.value;
                  },
                  isPassword: true,
                  hidePassword: _hidePassword.value,
                ),
              ),
              const SizedBox(height: 16),
              Obx(
                () => _buildTextField(
                  _confirmPasswordController,
                  'Confirm Password',
                  Icons.lock,
                  obscureText: _hideConfirmPassword.value,
                  toggleVisibility: () {
                    _hideConfirmPassword.value = !_hideConfirmPassword.value;
                  },
                  isPassword: true,
                  hidePassword: _hideConfirmPassword.value,
                ),
              ),
              const SizedBox(height: 16),
              _buildTextField(
                  _locationController, 'Location', Icons.location_on),
              const SizedBox(height: 16),
              _buildTextField(
                  _serviceTypeController, 'Service Type', Icons.work),
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
                      // Handle form submission
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                  child: const Text('Confirm',
                      style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'Poppins',
                          color: Colors.white)),
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
      {bool obscureText = false,
      bool isPassword = false,
      bool hidePassword = false,
      VoidCallback? toggleVisibility}) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: const TextStyle(fontFamily: 'Poppins'),
        prefixIcon: Icon(icon, color: Colors.teal),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        suffixIcon: isPassword
            ? IconButton(
                icon: Icon(
                  hidePassword ? Icons.visibility_off : Icons.visibility,
                  color: Colors.teal,
                ),
                onPressed: toggleVisibility,
              )
            : null,
      ),
      obscureText: obscureText,
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
