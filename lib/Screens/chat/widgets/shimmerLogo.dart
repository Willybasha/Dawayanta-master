
import 'package:daawyenta/utils/univesal_val.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../constants.dart';

class ShimmeringLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      child: Shimmer.fromColors(
        baseColor: green.withOpacity(0.1),
        highlightColor: pink.withOpacity(0.1),
        child: Image.asset("assets/Mini.jpg"),
        period: Duration(seconds: 1),
      ),
    );
  }
}
