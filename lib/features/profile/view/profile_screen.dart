import 'package:flutter/material.dart';
import 'package:flutter_ossetian_learning_app/interfaces/screen_with_title.dart';
import 'package:flutter_ossetian_learning_app/widgets/profile_screen/adaptive_cards.dart';
import 'package:flutter_ossetian_learning_app/widgets/profile_screen/profile_card.dart';

class ProfileScreen extends StatefulWidget implements ScreenWithTitle {
  const ProfileScreen({super.key});

  @override
  String getTitle() => "Профиль";

  @override
  State<StatefulWidget> createState() => ProfileScreenState();
}

class ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {

    final width = MediaQuery.of(context).size.width;

    return Padding(
      padding: .all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ProfileCard(),
          AdaptiveCards(width),
        ],
      ),
    );
  }
}
