
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/localization/app_language.dart';
import '../../l10n/app_localizations.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  static const Color primaryGreen = Color(0xFF245548);
  static const Color gold = Color(0xFFD4AF78);
  static const Color backgroundColor = Color(0xFFF8F4EB);
  static const Color textColor = Color(0xFF242820);
  static const Color mutedColor = Color(0xFF77766E);

  String _name = 'User Name';
  String _email = 'user@email.com';

  @override
  void initState() {
    super.initState();
    _loadProfile();
  }

  Future<void> _loadProfile() async {
    final prefs = await SharedPreferences.getInstance();

    if (!mounted) return;

    setState(() {
      _name = prefs.getString('profile_name') ?? 'User Name';
      _email = prefs.getString('profile_email') ?? 'user@email.com';
    });
  }

  Future<void> _saveProfile(String name, String email) async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setString('profile_name', name);
    await prefs.setString('profile_email', email);

    if (!mounted) return;

    setState(() {
      _name = name;
      _email = email;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Profile updated successfully.'),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  void _showEditProfileDialog() {
    showDialog(
      context: context,
      builder: (dialogContext) {
        return EditProfileDialog(
          initialName: _name,
          initialEmail: _email,
          onSave: _saveProfile,
        );
      },
    );
  }

 void _showLanguageDialog() {
  showDialog(
    context: context,
    builder: (dialogContext) {
      return AlertDialog(
        title: const Text('Select Language'),
        content: ValueListenableBuilder<Locale>(
          valueListenable: AppLanguage.locale,
          builder: (context, currentLocale, child) {
            return RadioGroup<String>(
              groupValue: currentLocale.languageCode,
              onChanged: (value) async {
                if (value == null) return;

                await AppLanguage.changeLanguage(value);

                if (!dialogContext.mounted) return;

                Navigator.pop(dialogContext);
              },
              child: const Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  RadioListTile<String>(
                    title: Text('English'),
                    value: 'en',
                  ),
                  RadioListTile<String>(
                    title: Text('العربية'),
                    value: 'ar',
                  ),
                ],
              ),
            );
          },
        ),
      );
    },
  );
}

  void _showMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                l10n.profile,
                style: const TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: primaryGreen,
                ),
              ),

              const SizedBox(height: 10),

              Container(
                width: 32,
                height: 2,
                decoration: BoxDecoration(
                  color: gold,
                  borderRadius: BorderRadius.circular(1),
                ),
              ),

              const SizedBox(height: 48),

              Center(
                child: Column(
                  children: [
                    Container(
                      width: 88,
                      height: 88,
                      decoration: BoxDecoration(
                        color: primaryGreen.withValues(alpha: 0.1),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.person_outline,
                        size: 42,
                        color: primaryGreen,
                      ),
                    ),

                    const SizedBox(height: 24),

                    Text(
                      _name,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: textColor,
                      ),
                    ),

                    const SizedBox(height: 6),

                    Text(
                      _email,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 13,
                        color: mutedColor,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 32),

              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: textColor.withValues(alpha: 0.07),
                  ),
                ),
                child: Column(
                  children: [
                    _buildOption(
                      title: l10n.editProfile,
                      onTap: _showEditProfileDialog,
                    ),

                    _buildDivider(),

                    ValueListenableBuilder<Locale>(
                      valueListenable: AppLanguage.locale,
                      builder: (context, locale, child) {
                        final language =
                            locale.languageCode == 'ar'
                                ? 'العربية'
                                : 'English';

                        return _buildOption(
                          title: '${l10n.language}: $language',
                          onTap: _showLanguageDialog,
                        );
                      },
                    ),

                    _buildDivider(),

                    _buildOption(
                      title: 'Currency: USD (\$)',
                      onTap: () {
                        _showMessage(
                          'Currency settings are not implemented yet.',
                        );
                      },
                    ),

                    _buildDivider(),

                    _buildOption(
                      title: 'Settings',
                      onTap: () {
                        _showMessage(
                          'Settings are not implemented yet.',
                        );
                      },
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              SizedBox(
                width: double.infinity,
                height: 56,
                child: OutlinedButton(
                  onPressed: () {
                    _showMessage(
                      'Authentication is not connected yet.',
                    );
                  },
                  style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: const Color(0xFFB3402F),
                    side: BorderSide(
                      color: textColor.withValues(alpha: 0.07),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: const Text(
                    'Log out',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOption({
    required String title,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: textColor,
                ),
              ),
            ),
            const Icon(
              Icons.chevron_right,
              color: mutedColor,
              size: 22,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDivider() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Divider(
        height: 1,
        thickness: 1,
        color: textColor.withValues(alpha: 0.08),
      ),
    );
  }
}

// Edit Profile Dialog

class EditProfileDialog extends StatefulWidget {
  final String initialName;
  final String initialEmail;
  final Function(String, String) onSave;

  const EditProfileDialog({
    super.key,
    required this.initialName,
    required this.initialEmail,
    required this.onSave,
  });

  @override
  State<EditProfileDialog> createState() => _EditProfileDialogState();
}

class _EditProfileDialogState extends State<EditProfileDialog> {
  late final TextEditingController nameController;
  late final TextEditingController emailController;

  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

    nameController = TextEditingController(
      text: widget.initialName,
    );

    emailController = TextEditingController(
      text: widget.initialEmail,
    );
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      scrollable: true,
      title: const Text('Edit Profile'),
      content: Form(
        key: formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: 'Full Name',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Enter your name.';
                }
                return null;
              },
            ),

            const SizedBox(height: 16),

            TextFormField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                labelText: 'Email Address',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null ||
                    !RegExp(r'^[^@]+@[^@]+\.[^@]+$')
                        .hasMatch(value.trim())) {
                  return 'Enter a valid email address.';
                }
                return null;
              },
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Cancel'),
        ),

        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF245548),
            foregroundColor: Colors.white,
          ),
          onPressed: () {
            if (!formKey.currentState!.validate()) return;

            final name = nameController.text.trim();
            final email = emailController.text.trim();

            widget.onSave(name, email);

            Navigator.pop(context);
          },
          child: const Text('Save Changes'),
        ),
      ],
    );
  }
}
