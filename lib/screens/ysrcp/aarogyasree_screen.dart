import 'package:flutter/material.dart';
import 'package:web_browser/web_browser.dart';
class AarogyasreeScreen extends StatelessWidget {
  const AarogyasreeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Browser(
          initialUriString: 'https://www.figma.com/proto/WK5K2I1KNsvFrokHVmvT1N/Political-Mobile-App?type=design&node-id=742-3&t=7Z9mc4xY72iVJSYv-0&scaling=scale-down&page-id=0%3A1&starting-point-node-id=742%3A3&show-proto-sidebar=1',
        ),
      ),
    );
  }
}
