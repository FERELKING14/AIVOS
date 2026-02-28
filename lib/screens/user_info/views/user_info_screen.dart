import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:aivo/components/list_tile/info_field_list_tile.dart';
import 'package:aivo/components/network_image_with_loader.dart';
import 'package:aivo/constants.dart';
import 'package:aivo/services/supabase_auth_service.dart';

class UserInfoScreen extends StatefulWidget {
  const UserInfoScreen({super.key});

  @override
  State<UserInfoScreen> createState() => _UserInfoScreenState();
}

class _UserInfoScreenState extends State<UserInfoScreen> {
  late SupabaseAuthService _authService;
  String _userEmail = '';
  String _userName = '';

  @override
  void initState() {
    super.initState();
    _authService = SupabaseAuthService();
    _loadUserData();
  }

  void _loadUserData() {
    setState(() {
      _userEmail = _authService.userEmail ?? 'user@aivo.app';
      _userName = _userEmail.split('@')[0];
    });
  }

  void _handleEditProfile() {
    // TODO: Navigate to edit profile screen
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Edit profile coming soon')),
    );
  }

  void _handleEditPhoto() {
    // TODO: Navigate to edit photo screen
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Edit photo coming soon')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: _handleEditProfile,
                  borderRadius: BorderRadius.circular(8),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.info_outlined,
                      size: 20,
                      color: Theme.of(context).iconTheme.color,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Profile Header Section
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: defaultPadding * 1.5),
              child: Column(
                children: [
                  // Profile Photo with Edit Button
                  Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      const CircleAvatar(
                        radius: 50,
                        child: NetworkImageWithLoader(
                          "https://i.imgur.com/IXnwbLk.png",
                          radius: 100,
                        ),
                      ),
                      // Edit Photo Button
                      FloatingActionButton(
                        mini: true,
                        backgroundColor: primaryColor,
                        onPressed: _handleEditPhoto,
                        child: SvgPicture.asset(
                          'assets/icons/Edit.svg',
                          height: 16,
                          width: 16,
                          colorFilter: const ColorFilter.mode(
                            Colors.white,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: defaultPadding / 2),
                  // Edit Photo Text
                  GestureDetector(
                    onTap: _handleEditPhoto,
                    child: const Text(
                      'Edit photo',
                      style: TextStyle(
                        color: primaryColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const SizedBox(height: defaultPadding),
                  // Name
                  Text(
                    _userName,
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                  const SizedBox(height: 4),
                  // Email
                  Text(
                    _userEmail,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey.shade400,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: defaultPadding),

            // User Info Fields Section with Icons and Gray Background
            Container(
              color: Colors.grey.shade50,
              child: Column(
                children: [
                  // Name Field
                  InfoFieldListTile(
                    label: 'Name',
                    value: _userName,
                    svgIcon: 'assets/icons/Profile.svg',
                  ),
                  // Email Field
                  InfoFieldListTile(
                    label: 'Email',
                    value: _userEmail,
                    svgIcon: 'assets/icons/Message.svg',
                  ),
                  // Date of Birth Field
                  const InfoFieldListTile(
                    label: 'Date of birth',
                    value: '10/31/1997',
                    svgIcon: 'assets/icons/Calendar.svg',
                  ),
                  // Phone Number Field
                  const InfoFieldListTile(
                    label: 'Phone number',
                    value: '+1 202 555 0162',
                    svgIcon: 'assets/icons/Call.svg',
                  ),
                ],
              ),
            ),
            const SizedBox(height: defaultPadding * 2),
          ],
        ),
      ),
    );
  }
}
