import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uiapi_design_thiran/src/models/datamodels.dart';
import 'package:uiapi_design_thiran/src/view/userdetailpage.dart';
import 'package:uiapi_design_thiran/widget/fade_ani.dart';
import 'package:uiapi_design_thiran/widget/herotag.dart';

import '../../utils/app_themes.dart';
import '../../utils/constant.dart';
import '../../utils/size_config.dart';
import '../provider/dataprovider.dart';

class MyHomePage extends ConsumerStatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  ConsumerState<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends ConsumerState<MyHomePage> {
  int page = 1;
  late ThemeData themeData;

  bool onTaped = false;
  bool onTapedDown = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // late ThemeData themeData;
    final themeData = Theme.of(context);
    final data = ref.watch(gitDataProvider);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: themeData.colorScheme.primary,
          centerTitle: true,
          title: Text(
            "User List",
            style: AppTheme.getTextStyle(
              fontSize: AppSize.s18,
              fontWeight: 800,
              color: themeData.colorScheme.background,
            ),
          ),
        ),
        body: data.when(
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, stackTrace) =>
              const Center(child: Text("No Data Availabile")),
          data: (data) {
            DataModel modelData = data;
            return SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  FadeAnimation(
                    0.7,
                    child: ListView.builder(
                      itemCount: modelData.items!.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        Items model = modelData.items![index];
                        return InkWell(
                          onTapUp: (details) {
                            setState(() {
                              onTaped = false;
                            });
                          },
                          onTapDown: (details) {
                            setState(() {
                              onTaped = true;
                            });
                          },
                          onTapCancel: () {
                            setState(() {
                              onTaped = false;
                            });
                          },
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => UserDetailPage(
                                      model: model, themeData: themeData),
                                ));
                          },
                          child: Container(
                            padding: EdgeInsets.all(AppSize.s6!),
                            margin: EdgeInsets.all(AppSize.s8!),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(AppSize.s8!),
                              color: themeData.colorScheme.background,
                              boxShadow: boxShadow(),
                            ),
                            child: Column(
                              children: [
                                UserImageandName(
                                    model: model, themeData: themeData),
                                verticalSpace(AppSize.s5),
                                StarandWatchWidget(themeData: themeData, model: model)
                              ],
                            ),
                          ),
                        )
                            .animate(target: onTaped ? 1 : 0)
                            .scaleXY(
                                begin: 1,
                                end: 0.85,
                                duration: const Duration(milliseconds: 100))
                            .rotate(end: index.isEven ? 0.00015 : -0.00015);
                      },
                    ),
                  ),
                  // : Expanded(
                  //     flex: 2,
                  //     child: Center(
                  //       child: Text(
                  //         "No Data Availabile",
                  //         style: AppTheme.getTextStyle(
                  //           fontSize: 16,
                  //           fontWeight: 600,
                  //           color: themeData.colorScheme.secondary,
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class StarandWatchWidget extends StatelessWidget {
  const StarandWatchWidget({
    super.key,
    required this.themeData,
    required this.model,
  });

  final ThemeData themeData;
  final Items model;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          MainAxisAlignment.spaceAround,
      children: [
        Row(
          children: [
            Icon(
              Icons.star,
              color:
                  themeData.colorScheme.onSecondary,
            ),
            horizontalSpace(AppSize.s2),
            Text(
              "Star Count : ",
              style: AppTheme.getTextStyle(
                fontSize: AppSize.s16,
                fontWeight: 600,
                color:
                    themeData.colorScheme.onPrimary,
              ),
            ),
            Text(
              model.stargazersCount!.toString(),
              style: AppTheme.getTextStyle(
                fontSize: AppSize.s16,
                fontWeight: 600,
                color: themeData
                    .colorScheme.onSecondary,
              ),
            ),
          ],
        ),
        Row(
          children: [
            Icon(
              Icons.tv,
              color:
                  themeData.colorScheme.onSecondary,
            ),
            horizontalSpace(AppSize.s2),
            Text(
              "Watchers Count : ",
              style: AppTheme.getTextStyle(
                fontSize: AppSize.s16,
                fontWeight: 600,
                color:
                    themeData.colorScheme.onPrimary,
              ),
            ),
            Text(
              model.watchersCount!.toString(),
              style: AppTheme.getTextStyle(
                fontSize: AppSize.s16,
                fontWeight: 600,
                color: themeData
                    .colorScheme.onSecondary,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class UserImageandName extends StatelessWidget {
  const UserImageandName({
    super.key,
    required this.model,
    required this.themeData,
  });

  final Items model;
  final ThemeData themeData;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HeroWidget(
          tag: model.owner!.avatarUrl!,
          child: CircleAvatar(
            radius: AppSize.s30,
            backgroundImage: NetworkImage(model.owner!.avatarUrl!),
          ),
        ).animate().rotate(
            begin: 0.4,
            duration: 200.ms,
            delay: 200.ms,
            alignment: Alignment.topCenter),
        horizontalSpace(AppSize.s10),
        Container(
          width: AppSize.screenWidth / 1.4,
          margin: EdgeInsets.only(right: AppSize.s4!),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HeroWidget(
                tag: model.name!,
                child: Text(
                  model.name!,
                  overflow: TextOverflow.ellipsis,
                  style: AppTheme.getTextStyle(
                    fontSize: AppSize.s18,
                    fontWeight: 800,
                    color: themeData.colorScheme.primary,
                  ),
                ),
              ),
              model.description!.isNotEmpty
                  ? Text(
                      model.description!,
                      style: AppTheme.getTextStyle(
                        fontSize: AppSize.s16,
                        fontWeight: 600,
                        color: themeData.colorScheme.onPrimary,
                      ),
                    )
                  : const SizedBox.shrink(),
            ],
          )
              .animate(delay: 150.ms)
              .moveX(begin: 100)
              .then()
              .shakeX(hz: 4, amount: 3),
        ),
      ],
    );
  }
}
