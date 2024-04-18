import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../shared/styles/my_theme.dart';
import 'bloc/serring_states.dart';
import 'bloc/setting_cubit.dart';

class SettingsTab extends StatefulWidget {
  SettingsTab({super.key});

  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  final List<String> Lang = ['English', "Arabic"];

  String? value;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double dynamicHeight = screenHeight;
    double screenWidth = MediaQuery.of(context).size.width;
    double dynamicWidth = screenHeight;
    return BlocConsumer<SettingCubit, SettingStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Container(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Language'.tr()),
                ),
                Center(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(0),
                      border: Border.all(
                          color: MyThemeData.primaryColor, width: 1),
                    ),
                    width: dynamicWidth * 0.4,
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        padding: EdgeInsets.only(right: 8),
                        iconSize: 20,
                        iconEnabledColor: MyThemeData.primaryColor,
                        icon: Icon(Icons.keyboard_arrow_down_rounded),
                        isExpanded: true,
                        value: value ?? SettingCubit().languageCode,
                        // Set the initial value to the current language code
                        onChanged: (newValue) {
                          setState(() {
                            value =
                                newValue; // Update the selected language
                          });
                          if (newValue != null) {
                            SettingCubit.get(context).changeLanguage(
                                newValue); // Change the language in the provider
                          }
                        },
                        items: Lang.map((lang) => DropdownMenuItem(
                              value: lang == 'English' ? 'en' : 'ar',
                              // Set the value to the language code
                              child: Text(
                                lang,
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                    color: MyThemeData.primaryColor),
                              ),
                            )).toList(),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
