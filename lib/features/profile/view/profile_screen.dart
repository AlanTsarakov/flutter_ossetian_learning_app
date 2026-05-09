import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ossetian_learning_app/widgets/profile_screen/adaptive_cards_widget.dart';
import 'package:flutter_ossetian_learning_app/widgets/profile_screen/profile_card_widget.dart';

import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget  {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Expanded(flex: 2, child: _TopPortion()),
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(
                    "Геор Гузитаев",
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  const _ProfileInfoRow(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ProfileInfoRow extends StatelessWidget {
  const _ProfileInfoRow();

  final List<ProfileInfoItem> _items = const [
    ProfileInfoItem("Выучено слов", 120),
    ProfileInfoItem("Топ", 120),
    ProfileInfoItem("Рейтинг", 200),
  ];

  @override
  Widget build(BuildContext context) {
    ;
    return Container(
      height: 80,
      constraints: const BoxConstraints(maxWidth: 400),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: _items
            .map(
              (item) => Expanded(
                child: Row(
                  children: [
                    if (_items.indexOf(item) != 0) const VerticalDivider(),
                    Expanded(child: _singleItem(context, item)),
                  ],
                ),
              ),
            )
            .toList(),
      ),
    );
  }

  Widget _singleItem(BuildContext context, ProfileInfoItem item) => Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          item.value.toString(),
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
      Text(item.title, style: Theme.of(context).textTheme.bodySmall),
    ],
  );
}

class ProfileInfoItem {
  final String title;
  final int value;
  const ProfileInfoItem(this.title, this.value);
}

class _TopPortion extends StatelessWidget {
  const _TopPortion();

  @override
  Widget build(BuildContext context) {
    final colors = ColorScheme.of(context);
    return Stack(
      fit: StackFit.expand,
      children: [
        Align(
          alignment: Alignment.bottomCenter,
          child: SizedBox(
            width: 150,
            height: 150,
            child: Stack(
              fit: StackFit.expand,
              children: [
                CircleAvatar(
                  radius: 75,
                  // decoration: const BoxDecoration(
                  //   color: Color.fromARGB(255, 255, 255, 255),
                  //   shape: BoxShape.circle,
                  //   // image: DecorationImage(
                  //   //   fit: BoxFit.cover,

                  //   //   // image: NetworkImage(
                  //   //   //   'https://img.freepik.com/free-photo/closeup-friendly-handsome-young-man-table_1262-3487.jpg?semt=ais_country_boost&w=740',
                  //   //   // ),
                  //   // ),
                  // ),
                  child: ClipOval(
                    
                    child: CachedNetworkImage(
                      placeholder: (context, url) =>
                          CircularProgressIndicator(padding: .all(5)),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                      imageUrl:
                          "https://img.freepik.com/free-photo/closeup-friendly-handsome-young-man-table_1262-3487.jpg?semt=ais_country_boost&w=740",
                      fit: BoxFit.cover,
                      width: 150,
                      height: 150,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: CircleAvatar(
                    radius: 20,
                    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                    child: Container(
                      margin: const EdgeInsets.all(8.0),
                      decoration: const BoxDecoration(
                        color: Colors.green,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

// class ProfileScreen extends StatefulWidget implements ScreenWithTitle {
//   const ProfileScreen({super.key});

//   @override
//   String getTitle() => "Профиль";

//   @override
//   State<StatefulWidget> createState() => ProfileScreenState();
// }

// class ProfileScreenState extends State<ProfileScreen> {
//   @override
//   Widget build(BuildContext context) {

//     final width = MediaQuery.of(context).size.width;

//     return Padding(
//       padding: .all(16),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.start,
//         children: [
//           ProfileCard(),
//           AdaptiveCards(width),
//         ],
//       ),
//     );
//   }
// }
