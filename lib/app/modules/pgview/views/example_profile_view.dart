// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:flower_app/app/data/atom/custom_appbar.dart';

class ExProfileView extends StatelessWidget {
  const ExProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: CustomAppbar(title: "ExProfileView"),
          ),
          SliverFillRemaining(
            child: Center(child: Text("Example Profile View")),
          )
        ],
      ),
    );
  }
}
