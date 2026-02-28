import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

import '../../../../constants.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({
    super.key,
    required this.formKey,
  });

  final GlobalKey<FormState> formKey;

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  late TextEditingController _firstNameController;
  late TextEditingController _lastNameController;
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late TextEditingController _phoneController;
  
  String? _selectedUserType = 'buyer';
  String _countryCode = '';
  String _countryName = '';

  @override
  void initState() {
    super.initState();
    _firstNameController = TextEditingController();
    _lastNameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _phoneController = TextEditingController();
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  String get firstName => _firstNameController.text;
  String get lastName => _lastNameController.text;
  String get email => _emailController.text;
  String get password => _passwordController.text;
  String get phoneNumber => _phoneController.text;
  String get userType => _selectedUserType ?? 'buyer';
  String get countryCode => _countryCode;
  String get countryName => _countryName;

  void _onPhoneNumberChange(PhoneNumber phoneNumber) {
    setState(() {
      _countryCode = phoneNumber.isoCode ?? '';
      _countryName = _getCountryName(_countryCode);
    });
  }

  String _getCountryName(String isoCode) {
    // Map of ISO codes to country names
    const countryMap = {
      'US': 'United States',
      'CA': 'Canada',
      'GB': 'United Kingdom',
      'FR': 'France',
      'DE': 'Germany',
      'IT': 'Italy',
      'ES': 'Spain',
      'AU': 'Australia',
      'JP': 'Japan',
      'CN': 'China',
      'IN': 'India',
      'BR': 'Brazil',
      'MX': 'Mexico',
      'ZA': 'South Africa',
      'NG': 'Nigeria',
      'KE': 'Kenya',
      'SN': 'Senegal',
      'CM': 'Cameroon',
      'CG': 'Congo',
      'CI': 'Ivory Coast',
      'TN': 'Tunisia',
      'EG': 'Egypt',
      'MA': 'Morocco',
      'DZ': 'Algeria',
    };
    return countryMap[isoCode] ?? 'Unknown';
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(
        children: [
          // First Name (Optional)
          TextFormField(
            controller: _firstNameController,
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.name,
            decoration: InputDecoration(
              hintText: "First name (optional)",
              prefixIcon: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: defaultPadding * 0.75),
                child: SvgPicture.asset(
                  "assets/icons/Message.svg",
                  height: 24,
                  width: 24,
                  colorFilter: ColorFilter.mode(
                    Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .color!
                        .withValues(alpha: 0.3),
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: defaultPadding),

          // Last Name (Optional)
          TextFormField(
            controller: _lastNameController,
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.name,
            decoration: InputDecoration(
              hintText: "Last name (optional)",
              prefixIcon: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: defaultPadding * 0.75),
                child: SvgPicture.asset(
                  "assets/icons/Message.svg",
                  height: 24,
                  width: 24,
                  colorFilter: ColorFilter.mode(
                    Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .color!
                        .withValues(alpha: 0.3),
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: defaultPadding),

          // Email (Required)
          TextFormField(
            controller: _emailController,
            validator: emaildValidator.call,
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              hintText: "Email address *",
              prefixIcon: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: defaultPadding * 0.75),
                child: SvgPicture.asset(
                  "assets/icons/Message.svg",
                  height: 24,
                  width: 24,
                  colorFilter: ColorFilter.mode(
                    Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .color!
                        .withValues(alpha: 0.3),
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: defaultPadding),

          // Password (Required)
          TextFormField(
            controller: _passwordController,
            validator: passwordValidator.call,
            obscureText: true,
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
              hintText: "Password *",
              prefixIcon: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: defaultPadding * 0.75),
                child: SvgPicture.asset(
                  "assets/icons/Lock.svg",
                  height: 24,
                  width: 24,
                  colorFilter: ColorFilter.mode(
                    Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .color!
                        .withValues(alpha: 0.3),
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: defaultPadding),

          // Phone Number with Country Code (Optional)
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .color!
                    .withValues(alpha: 0.2),
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            child: InternationalPhoneNumberInput(
              onInputChanged: _onPhoneNumberChange,
              selectorConfig: const SelectorConfig(
                selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                useBottomSheetSafeArea: true,
              ),
              ignoreBlank: true,
              autoValidateMode: AutovalidateMode.disabled,
              inputDecoration: InputDecoration(
                hintText: 'Phone number (optional)',
                border: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: defaultPadding,
                  vertical: defaultPadding * 0.75,
                ),
              ),
              textFieldController: _phoneController,
              formatInput: true,
              keyboardType:
                  const TextInputType.numberWithOptions(signed: false, decimal: false),
              inputBorder: InputBorder.none,
              onSaved: (PhoneNumber number) {
                _onPhoneNumberChange(number);
              },
            ),
          ),

          // Display selected country
          if (_countryCode.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(top: defaultPadding / 2),
              child: Text(
                'Country: $_countryName',
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),

          const SizedBox(height: defaultPadding),

          // User Type (Required) - Radio buttons
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'I am a * (required)',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
              ),
              const SizedBox(height: defaultPadding / 2),
              Row(
                children: [
                  Expanded(
                    child: RadioListTile<String>(
                      title: const Text('Buyer'),
                      value: 'buyer',
                      groupValue: _selectedUserType,
                      onChanged: (String? value) {
                        setState(() {
                          _selectedUserType = value;
                        });
                      },
                      dense: true,
                      contentPadding: EdgeInsets.zero,
                    ),
                  ),
                  Expanded(
                    child: RadioListTile<String>(
                      title: const Text('Seller'),
                      value: 'seller',
                      groupValue: _selectedUserType,
                      onChanged: (String? value) {
                        setState(() {
                          _selectedUserType = value;
                        });
                      },
                      dense: true,
                      contentPadding: EdgeInsets.zero,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
