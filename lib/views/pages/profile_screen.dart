import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:traveling/constants/app_images.dart';
import '../../widgets/theme_selection_dailog.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  UniqueKey keyForExperienceWidget = UniqueKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: context.statusBarHeight),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SettingItemWidget(
              leading: Image.asset(icLanguage,
                  height: 18, width: 18, color: context.iconColor),
              title: 'Lanquage',
              trailing: Icon(Icons.chevron_right,
                  color: gray.withOpacity(0.8), size: 24),
              onTap: () {
                // LanguagesScreen().launch(context).then((value) {
                //   keyForExperienceWidget = UniqueKey();
                // });
              },
            ),
            Divider(
                height: 0,
                endIndent: 16,
                indent: 16,
                color: gray.withOpacity(0.3)),
            SettingItemWidget(
              leading: Image.asset(
                icTheme,
                height: 19,
                width: 18,
                color: gray.withOpacity(0.8),
              ),
              title: 'Theme',
              trailing: Icon(Icons.chevron_right,
                  color: gray.withOpacity(0.8), size: 24),
              onTap: () async {
                await showInDialog(
                  context,
                  builder: (context) => ThemeSelectionDaiLog(context),
                  contentPadding: EdgeInsets.zero,
                );
              },
            ),
            Divider(
                    height: 0,
                    indent: 16,
                    endIndent: 16,
                    color: gray.withOpacity(0.3))
                .visible(true),
            SettingItemWidget(
              leading: Image.asset(icAbout,
                  height: 18, width: 18, color: gray.withOpacity(0.8)),
              title: 'About',
              trailing: Icon(Icons.chevron_right,
                  color: gray.withOpacity(0.8), size: 24),
              onTap: () {},
            ),
          ],
        ).paddingOnly(bottom: 24),
      ),
    );
  }
}
