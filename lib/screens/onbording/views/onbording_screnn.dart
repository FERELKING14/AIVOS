import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:aivo/components/dot_indicators.dart';
import 'package:aivo/constants.dart';
import 'package:aivo/route/route_constants.dart';
import 'package:aivo/services/supabase_auth_service.dart';
import 'package:aivo/generated_l10n/app_localizations.dart';

import 'components/onbording_content.dart';

class OnBordingScreen extends StatefulWidget {
  const OnBordingScreen({super.key});

  @override
  State<OnBordingScreen> createState() => _OnBordingScreenState();
}

class _OnBordingScreenState extends State<OnBordingScreen> {
  late PageController _pageController;
  int _pageIndex = 0;
  late List<Onbord> _onbordData;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
    // Initialize onboarding data after first frame to access context
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _initializeOnboardingData();
    });
  }

  void _initializeOnboardingData() {
    final l10n = AppLocalizations.of(context)!;
    setState(() {
      _onbordData = [
        Onbord(
          image: "assets/Illustration/Illustration-0.png",
          imageDarkTheme: "assets/Illustration/Illustration_darkTheme_0.png",
          title: l10n.onboardingStep1Title,
          description: l10n.onboardingStep1Description,
        ),
        Onbord(
          image: "assets/Illustration/Illustration-1.png",
          imageDarkTheme: "assets/Illustration/Illustration_darkTheme_1.png",
          title: l10n.onboardingStep2Title,
          description: l10n.onboardingStep2Description,
        ),
        Onbord(
          image: "assets/Illustration/Illustration-2.png",
          imageDarkTheme: "assets/Illustration/Illustration_darkTheme_2.png",
          title: l10n.onboardingStep3Title,
          description: l10n.onboardingStep3Description,
        ),
        Onbord(
          image: "assets/Illustration/Illustration-3.png",
          imageDarkTheme: "assets/Illustration/Illustration_darkTheme_3.png",
          title: l10n.onboardingStep4Title,
          description: l10n.onboardingStep4Description,
        ),
        Onbord(
          image: "assets/Illustration/Illustration-4.png",
          imageDarkTheme: "assets/Illustration/Illustration_darkTheme_4.png",
          title: l10n.onboardingStep5Title,
          description: l10n.onboardingStep5Description,
        ),
      ];
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () async {
                    final navigator = Navigator.of(context);
                    final authService = SupabaseAuthService();
                    await authService.markOnboardingAsShown();
                    if (!mounted) return;
                    navigator.pushNamedAndRemoveUntil(
                      entryPointScreenRoute,
                      (route) => false,
                    );
                  },
                  child: Text(
                    l10n.skipButton,
                    style: TextStyle(
                        color: Theme.of(context).textTheme.bodyLarge!.color),
                  ),
                ),
              ),
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: _onbordData.length,
                  onPageChanged: (value) {
                    setState(() {
                      _pageIndex = value;
                    });
                  },
                  itemBuilder: (context, index) => OnbordingContent(
                    title: _onbordData[index].title,
                    description: _onbordData[index].description,
                    image: (Theme.of(context).brightness == Brightness.dark &&
                            _onbordData[index].imageDarkTheme != null)
                        ? _onbordData[index].imageDarkTheme!
                        : _onbordData[index].image,
                    isTextOnTop: index.isOdd,
                  ),
                ),
              ),
              Row(
                children: [
                  ...List.generate(
                    _onbordData.length,
                    (index) => Padding(
                      padding: const EdgeInsets.only(right: defaultPadding / 4),
                      child: DotIndicator(isActive: index == _pageIndex),
                    ),
                  ),
                  const Spacer(),
                  SizedBox(
                    height: 60,
                    width: 60,
                    child: ElevatedButton(
                      onPressed: () async {
                        if (_pageIndex < _onbordData.length - 1) {
                          _pageController.nextPage(
                              curve: Curves.ease, duration: defaultDuration);
                        } else {
                          final navigator = Navigator.of(context);
                          final authService = SupabaseAuthService();
                          await authService.markOnboardingAsShown();
                          if (!mounted) return;
                          navigator.pushNamedAndRemoveUntil(
                            entryPointScreenRoute,
                            (route) => false,
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        shape: const CircleBorder(),
                      ),
                      child: SvgPicture.asset(
                        "assets/icons/Arrow - Right.svg",
                        colorFilter: const ColorFilter.mode(
                          Colors.white,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: defaultPadding),
            ],
          ),
        ),
      ),
    );
  }
}

class Onbord {
  final String image, title, description;
  final String? imageDarkTheme;

  Onbord({
    required this.image,
    required this.title,
    this.description = "",
    this.imageDarkTheme,
  });
}
