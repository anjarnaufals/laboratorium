// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:flower_app/app/data/atom/custom_appbar.dart';

class ExNotifView extends StatelessWidget {
  const ExNotifView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: CustomAppbar(title: "ExNotifView"),
          ),
          SliverFillRemaining(
            child: Center(child: Text("Example Notif View")),
          )
        ],
      ),
    );
  }
}
