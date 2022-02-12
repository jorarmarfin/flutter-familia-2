import 'package:flutter/cupertino.dart';
import 'package:flutter_familia/theme/mytheme.dart';

class Tipografia extends StatelessWidget {
  const Tipografia({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Texto comun google  nunito'),
          Text(
            'Google font Dancing Script headline1',
            style: MyTheme.base.textTheme.headline1,
          ),
          Text(
            'Google font headline2',
            style: MyTheme.base.textTheme.headline2,
          ),
        ],
      ),
    );
  }
}
