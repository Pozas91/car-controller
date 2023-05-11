import 'package:car_controller/theme/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Template extends StatelessWidget {
  final Widget child;
  final Widget? actionButton;
  final Widget? bottomNavigationBar;
  final Color? backgroundColor;
  final PreferredSizeWidget? appBar;
  final bool padding;

  const Template({
    Key? key,
    required this.child,
    this.appBar,
    this.actionButton,
    this.bottomNavigationBar,
    this.backgroundColor,
    this.padding = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () {
          // Get focus information
          FocusScopeNode currentFocus = FocusScope.of(context);

          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child: WillPopScope(
          onWillPop: () => _onWillPop(context),
          child: Scaffold(
            appBar: appBar,
            body: Container(
              width: SizeConfig.bH * 100,
              height: SizeConfig.bV * 100,
              color: backgroundColor ?? Colors.white,
              padding: padding
                  ? EdgeInsets.symmetric(
                vertical: SizeConfig.bV * 2,
                horizontal: SizeConfig.bH * 2,
              )
                  : const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
              child: child,
            ),
            bottomNavigationBar: bottomNavigationBar,
            floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
            floatingActionButton: actionButton,
          ),
        ),
      ),
    );
  }

  Future<bool> _onWillPop(BuildContext context) async {
    return (await showDialog<bool>(
      context: context,
      builder: (localContext) => AlertDialog(
        actionsAlignment: MainAxisAlignment.center,
        title: Text('Are you sure?'.tr),
        content: Text('Do you want to exit from app?'.tr),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.of(localContext).pop(false),
            child: Text('No'.tr),
          ),
          TextButton(
            onPressed: () => Navigator.of(localContext).pop(true),
            child: Text('Yes'.tr),
          ),
        ],
      ),
    )) ??
        false;
  }
}
