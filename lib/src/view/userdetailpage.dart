import 'package:flutter/material.dart';
import 'package:uiapi_design_thiran/src/view/homepage.dart';

import '../../utils/app_themes.dart';
import '../../utils/size_config.dart';
import '../../widget/fade_ani.dart';
import '../../widget/herotag.dart';
import '../models/datamodels.dart';

class UserDetailPage extends StatelessWidget {
  final Items model;
  const UserDetailPage({
    super.key,
    required this.model,
    required this.themeData,
  });

  final ThemeData themeData;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: const BackButton(),
          backgroundColor: themeData.colorScheme.primary,
          title: Text(
            "User Detail",
            style: AppTheme.getTextStyle(
              fontSize: AppSize.s18,
              fontWeight: 800,
              color: themeData.colorScheme.background,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: FadeAnimation(
            0.8,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  verticalSpace(AppSize.s20),
                  HeroWidget(
                    tag: model.owner!.avatarUrl!,
                    child: CircleAvatar(
                      radius: 100,
                      backgroundImage: NetworkImage(model.owner!.avatarUrl!),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        HeroWidget(
                          tag: model.name!,
                          child: Text(
                            model.name!,
                            style: AppTheme.getTextStyle(
                              fontSize: AppSize.s30,
                              fontWeight: 800,
                              color: themeData.colorScheme.primary,
                            ),
                          ),
                        ),
                        model.description!.isNotEmpty
                            ? Text(
                                model.description!,
                                style: AppTheme.getTextStyle(
                                  fontSize: AppSize.s20,
                                  fontWeight: 600,
                                  color: themeData.colorScheme.onPrimary,
                                ),
                              )
                            : const SizedBox.shrink(),
                      ],
                    ),
                  ),
                  verticalSpace(AppSize.s10),
                  StarandWatchWidget(themeData: themeData, model: model)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
