part of 'plans.dart';

class _BronzeCard extends StatelessWidget {
  const _BronzeCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xff2E9FD9),
        borderRadius: kBorderRadius20,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
      child: Row(
        children: [
          Image.asset(
            Images.briefcase,
            fit: BoxFit.contain,
            cacheHeight: 50,
            cacheWidth: 50,
            height: 50,
            width: 50,
          ),
          kGap16,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Text(
                    "BRONZE",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  kGap16,
                  ...List.generate(
                    3,
                    (index) => const Icon(
                      AppIcons.trophy,
                      size: 24,
                      color: AppColors.starOrange,
                    ),
                  ),
                ],
              ),
              const Text(
                "50-100 MTS",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

/// ---

