import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:aivo/components/list_tile/divider_list_tile.dart';
import 'package:aivo/components/network_image_with_loader.dart';
import 'package:aivo/constants.dart';
import 'package:aivo/route/screen_export.dart';
import 'package:aivo/services/supabase_auth_service.dart';

import 'components/profile_card.dart';
import 'components/profile_menu_item_list_tile.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late SupabaseAuthService _authService;
  bool _isLoggedIn = false;
  String _userEmail = '';

  @override
  void initState() {
    super.initState();
    _authService = SupabaseAuthService();
    _checkAuthStatus();
  }

  void _checkAuthStatus() {
    setState(() {
      _isLoggedIn = _authService.isLoggedIn;
      _userEmail = _authService.userEmail ?? 'user@aivo.app';
    });
  }

  Future<void> _handleLogout() async {
    try {
      await _authService.logout();
      if (!mounted) return;

      // Show success message
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Logged out successfully'),
          backgroundColor: Colors.green,
          duration: Duration(seconds: 2),
        ),
      );

      _checkAuthStatus();
      Navigator.pop(context);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Logout failed: $e'),
          backgroundColor: errorColor,
        ),
      );
    }
  }

  Future<void> _handleLogin() async {
    await Navigator.pushNamed(context, logInScreenRoute);
    _checkAuthStatus();
  }

  @override
  Widget build(BuildContext context) {
    // Si non connecté, invite à se connecter
    if (!_isLoggedIn) {
      return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                "assets/icons/Profile.svg",
                height: 80,
                width: 80,
                colorFilter: ColorFilter.mode(
                  Theme.of(context).iconTheme.color!.withOpacity(0.3),
                  BlendMode.srcIn,
                ),
              ),
              const SizedBox(height: defaultPadding),
              Text(
                "Vous devez vous connecter",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: defaultPadding / 2),
              const Text(
                "Connectez-vous pour accéder à votre profil et aux fonctionnalités personnalisées",
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: defaultPadding * 2),
              ElevatedButton(
                onPressed: _handleLogin,
                child: const Text("CONNEXION"),
              ),
            ],
          ),
        ),
      );
    }

    // Si connecté, affiche le profil complet selon l'arbre proposé
    return Scaffold(
      body: ListView(
        children: [
          // Carte profil
          ProfileCard(
            name: _userEmail.split('@')[0],
            email: _userEmail,
            imageSrc: "https://i.imgur.com/IXnwbLk.png",
            press: () {
              Navigator.pushNamed(context, userInfoScreenRoute);
            },
          ),
          const SizedBox(height: defaultPadding),

          // Section ACCOUNT
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
            child: Text(
              "Account",
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ),
          const SizedBox(height: 8),
          ProfileMenuListTile(
            text: "Orders",
            svgSrc: "assets/icons/Order.svg",
            press: () {
              Navigator.pushNamed(context, ordersScreenRoute);
            },
          ),
          ProfileMenuListTile(
            text: "Returns",
            svgSrc: "assets/icons/Return.svg",
            press: () {
              Navigator.pushNamed(context, returnsScreenRoute);
            },
          ),
          ProfileMenuListTile(
            text: "Wishlist",
            svgSrc: "assets/icons/Wishlist.svg",
            press: () {
              Navigator.pushNamed(context, wishlistScreenRoute);
            },
          ),
          ProfileMenuListTile(
            text: "Addresses",
            svgSrc: "assets/icons/Address.svg",
            press: () {
              Navigator.pushNamed(context, addressesScreenRoute);
            },
          ),
          ProfileMenuListTile(
            text: "Payment",
            svgSrc: "assets/icons/card.svg",
            press: () {
              Navigator.pushNamed(context, emptyPaymentScreenRoute);
            },
          ),
          ProfileMenuListTile(
            text: "Wallet",
            svgSrc: "assets/icons/Wallet.svg",
            press: () {
              Navigator.pushNamed(context, walletScreenRoute);
            },
          ),
          const SizedBox(height: defaultPadding),

          // Section PREFERENCES
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
            child: Text(
              "Preferences",
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ),
          const SizedBox(height: 8),
          ProfileMenuListTile(
            text: "Language",
            svgSrc: "assets/icons/Language.svg",
            press: () {
              Navigator.pushNamed(context, languageScreenRoute);
            },
          ),
          ProfileMenuListTile(
            text: "Theme",
            svgSrc: "assets/icons/Theme.svg",
            press: () {
              Navigator.pushNamed(context, themeScreenRoute);
            },
          ),
          DividerListTileWithTrilingText(
            svgSrc: "assets/icons/Notification.svg",
            title: "Notifications",
            trilingText: "Off",
            press: () {
              Navigator.pushNamed(context, enableNotificationScreenRoute);
            },
          ),
          ProfileMenuListTile(
            text: "Cookie Preferences",
            svgSrc: "assets/icons/Cookie.svg",
            press: () {
              Navigator.pushNamed(context, cookiePreferencesScreenRoute);
            },
          ),
          ProfileMenuListTile(
            text: "Preferences détaillées",
            svgSrc: "assets/icons/Preferences.svg",
            press: () {
              Navigator.pushNamed(context, preferencesScreenRoute);
            },
          ),
          const SizedBox(height: defaultPadding),

          // Section HELP & SUPPORT
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
            child: Text(
              "Help & Support",
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ),
          const SizedBox(height: 8),
          ProfileMenuListTile(
            text: "Get Help",
            svgSrc: "assets/icons/Help.svg",
            press: () {
              Navigator.pushNamed(context, getHelpScreenRoute);
            },
          ),
          ProfileMenuListTile(
            text: "FAQ",
            svgSrc: "assets/icons/FAQ.svg",
            press: () {
              Navigator.pushNamed(context, faqScreenRoute);
            },
            isShowDivider: false,
          ),
          const SizedBox(height: defaultPadding),

          // Log Out
          ListTile(
            onTap: _handleLogout,
            minLeadingWidth: 24,
            leading: SvgPicture.asset(
              "assets/icons/Logout.svg",
              height: 24,
              width: 24,
              colorFilter: const ColorFilter.mode(
                errorColor,
                BlendMode.srcIn,
              ),
            ),
            title: const Text(
              "Log Out",
              style: TextStyle(color: errorColor, fontSize: 14, height: 1),
            ),
          ),
        ],
      ),
    );
  }

}
