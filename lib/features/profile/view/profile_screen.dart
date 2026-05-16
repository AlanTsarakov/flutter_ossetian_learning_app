import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_ossetian_learning_app/features/profile/widgets/profile_card.dart';
import 'package:flutter_ossetian_learning_app/theme_notifier.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Center(
            child: Container(
              constraints: const BoxConstraints(maxWidth: 1200),
              child: Padding(
                padding: .all(16),
                child: ListView(
                  children: [
                    ProfileCard(name: "Alan Tsarakov", id: "@id12439"),
                    const SizedBox(height: 24),
                    _SingleSection(
                      title: "Общие настройки",
                      children: [
                        _CustomListTile(
                          title: "Темная тема",
                          icon: Icons.dark_mode_outlined,
                          onTap: () => _showFormSheet(context),
                          // trailing: Switch(
                          //   value: _isDark,
                          //   onChanged: (value) {
                          //     setState(() {
                          //       _isDark = value;
                          //     });
                          //   },
                          // ),
                        ),

                        const _CustomListTile(
                          title: "Напоминание",
                          icon: Icons.notifications_none_rounded,
                        ),
                        const _CustomListTile(
                          title: "Язык",
                          icon: CupertinoIcons.globe,
                        ),
                        const _CustomListTile(
                          title: "Обнулить прогресс",
                          icon: CupertinoIcons.clear,
                        ),
                      ],
                    ),
                    const Divider(),
                    const _SingleSection(
                      children: [
                        _CustomListTile(
                          title: "Помощь & Обратная связь",
                          icon: Icons.help_outline_rounded,
                        ),
                        _CustomListTile(
                          title: "О нас",
                          icon: Icons.info_outline_rounded,
                        ),
                        // _CustomListTile(
                        //   title: "Sign out",
                        //   icon: Icons.exit_to_app_rounded,
                        // ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  void _showFormSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (ctx) => Padding(
        padding: const EdgeInsets.all(8),
        // padding: EdgeInsets.only(bottom: MediaQuery.of(ctx).viewInsets.bottom),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () {
                    themeModeNotifier.value = .system;
                    Navigator.pop(ctx);
                  },
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: const Text(
                    'По умолчанию',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),

              const Divider(height: 1),

              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () {
                    themeModeNotifier.value = .dark;
                    Navigator.pop(ctx);
                  },
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: const Text('Включена', style: TextStyle(fontSize: 16)),
                ),
              ),

              const Divider(height: 1),

              // Текстовая кнопка темной темы
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () {
                    themeModeNotifier.value = .light;
                    Navigator.pop(ctx);
                  },
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: const Text(
                    'Выключена',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CustomListTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final Widget? trailing;
  final GestureTapCallback? onTap;
  const _CustomListTile({
    required this.title,
    required this.icon,
    this.trailing,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      leading: Icon(icon),
      trailing: trailing,
      onTap: onTap,
    );
  }
}

class _SingleSection extends StatelessWidget {
  final String? title;
  final List<Widget> children;
  const _SingleSection({this.title, required this.children});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null)
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title!,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        Column(children: children),
      ],
    );
  }
}

// class ProfileScreen extends StatelessWidget  {
//   const ProfileScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           const Expanded(flex: 2, child: _TopPortion()),
//           Expanded(
//             flex: 3,
//             child: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Column(
//                 children: [
//                   Text(
//                     "Геор Гузитаев",
//                     style: Theme.of(context).textTheme.headlineMedium?.copyWith(
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   const SizedBox(height: 16),
//                   const _ProfileInfoRow(),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class _ProfileInfoRow extends StatelessWidget {
//   const _ProfileInfoRow();

//   final List<ProfileInfoItem> _items = const [
//     ProfileInfoItem("Выучено слов", 120),
//     ProfileInfoItem("Топ", 120),
//     ProfileInfoItem("Рейтинг", 200),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     ;
//     return Container(
//       height: 80,
//       constraints: const BoxConstraints(maxWidth: 400),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: _items
//             .map(
//               (item) => Expanded(
//                 child: Row(
//                   children: [
//                     if (_items.indexOf(item) != 0) const VerticalDivider(),
//                     Expanded(child: _singleItem(context, item)),
//                   ],
//                 ),
//               ),
//             )
//             .toList(),
//       ),
//     );
//   }

//   Widget _singleItem(BuildContext context, ProfileInfoItem item) => Column(
//     mainAxisAlignment: MainAxisAlignment.center,
//     children: [
//       Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Text(
//           item.value.toString(),
//           style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
//         ),
//       ),
//       Text(item.title, style: Theme.of(context).textTheme.bodySmall),
//     ],
//   );
// }

// class ProfileInfoItem {
//   final String title;
//   final int value;
//   const ProfileInfoItem(this.title, this.value);
// }

// class _TopPortion extends StatelessWidget {
//   const _TopPortion();

//   @override
//   Widget build(BuildContext context) {
//     final colors = ColorScheme.of(context);
//     return Stack(
//       fit: StackFit.expand,
//       children: [
//         Align(
//           alignment: Alignment.bottomCenter,
//           child: SizedBox(
//             width: 150,
//             height: 150,
//             child: Stack(
//               fit: StackFit.expand,
//               children: [
//                 CircleAvatar(
//                   radius: 75,
//                   // decoration: const BoxDecoration(
//                   //   color: Color.fromARGB(255, 255, 255, 255),
//                   //   shape: BoxShape.circle,
//                   //   // image: DecorationImage(
//                   //   //   fit: BoxFit.cover,

//                   //   //   // image: NetworkImage(
//                   //   //   //   'https://img.freepik.com/free-photo/closeup-friendly-handsome-young-man-table_1262-3487.jpg?semt=ais_country_boost&w=740',
//                   //   //   // ),
//                   //   // ),
//                   // ),
//                   child: ClipOval(

//                     child: CachedNetworkImage(
//                       placeholder: (context, url) =>
//                           CircularProgressIndicator(padding: .all(5)),
//                       errorWidget: (context, url, error) => Icon(Icons.error),
//                       imageUrl:
//                           "https://img.freepik.com/free-photo/closeup-friendly-handsome-young-man-table_1262-3487.jpg?semt=ais_country_boost&w=740",
//                       fit: BoxFit.cover,
//                       width: 150,
//                       height: 150,
//                     ),
//                   ),
//                 ),
//                 Positioned(
//                   bottom: 0,
//                   right: 0,
//                   child: CircleAvatar(
//                     radius: 20,
//                     backgroundColor: Theme.of(context).scaffoldBackgroundColor,
//                     child: Container(
//                       margin: const EdgeInsets.all(8.0),
//                       decoration: const BoxDecoration(
//                         color: Colors.green,
//                         shape: BoxShape.circle,
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }

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
