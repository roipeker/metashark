part of 'partner_info_sheet.dart';

class _Title extends StatelessWidget {
  const _Title({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CommonAvatar(
                radius: 40 / 2,
                label: 'F',
              ),
              kGap16,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "First & last name",
                    style: TextStyle(
                      color: Color(0xff5e5873),
                      fontSize: 14,
                      fontFamily: "Open Sans",
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    "Login",
                    style: TextStyle(
                      color: Color(0xffb9b9c3),
                      fontSize: 14,
                    ),
                  )
                ],
              ).exp(),
            ],
          ),
        ),
        const ContractBadge.bronze(),
        // _TitleBadge(),
      ],
    );
  }
}
//
// class _TitleBadge extends StatelessWidget {
//   const _TitleBadge({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(4),
//         gradient: LinearGradient(
//           begin: Alignment.topLeft,
//           end: Alignment.bottomRight,
//           colors: [Color(0xfff595e0), Color(0xffd468a9)],
//         ),
//       ),
//       padding: const EdgeInsets.symmetric(
//         horizontal: 6,
//         vertical: 4,
//       ),
//       child: Row(
//         mainAxisSize: MainAxisSize.min,
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: const [
//           Text(
//             "BRONZE",
//             style: TextStyle(
//               color: Colors.white,
//               fontSize: 14,
//               fontFamily: "Open Sans",
//               fontWeight: FontWeight.w600,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

class _Boss extends StatelessWidget {
  const _Boss({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text(
          "BOSS",
          style: TextStyle(
            color: Color(0xff5e5873),
            fontSize: 20,
            fontFamily: "Open Sans",
            fontWeight: FontWeight.w600,
          ),
        ),
        kGap16,
        const StarRating(),
      ],
    );
  }
}
