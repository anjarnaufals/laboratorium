import 'package:flower_app/app/data/atom/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

class CustomHeaderRefresh extends StatelessWidget {
  const CustomHeaderRefresh({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomHeader(
      builder: (_, mode) {
        return Center(
          child: SizedBox(
            height: 20,
            width: 20,
            child: mode == RefreshStatus.refreshing
                ? const LoadingIndicator()
                : const SizedBox(),
          ),
        );
      },
    );
  }
}
