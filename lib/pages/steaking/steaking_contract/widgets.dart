part of 'steaking_contract.dart';

class _ContractLogItem extends StatelessWidget {
  final VoidCallback? onTap;
  final String title;
  final String date;
  final String amount;

  const _ContractLogItem({
    Key? key,
    this.onTap,
    required this.title,
    required this.date,
    required this.amount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LogBorderButton(
      onTap: onTap,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                title,
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: Color(0xff5e5873),
                  fontSize: 14,
                ),
              ),
              Text(
                date,
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: Color(0xffb9b9c3),
                  fontSize: 14,
                ),
              ),
            ],
          ).exp(),
          Center(
            child: Text(
              amount,
              style: TextStyle(
                color: Color(0xff5e5873),
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: kPad16,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              const SmallAppCardTextDetails(
                label: 'Lock Up:',
                value: '12 months',
                helperText: '365 days',
              ).exp(),
              kGap16,
              const SmallAppCardTextDetails(
                label: 'Staking:',
                value: '36% year',
                helperText: '0.1% day',
              ).exp(),
            ],
          ),
          kGap16,
          const _Earned(),
          kGap16,
          const _ContributionBar(),
        ],
      ),
    );
  }
}

class _ContributionBar extends StatelessWidget {
  const _ContributionBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: const [
        Text(
          "Contribution body:",
          style: TextStyle(
            color: Color(0xff5e5873),
            fontSize: 14,
          ),
        ),
        kGap4,
        CardLabelProgressBar(
          label: '700 MTS',
          percent: .7,
          barForegroundColor: AppColors.lightViolet,
        ),
        kGap4,
        Text(
          "Paid out: 300 MTS",
          style: TextStyle(
            color: Color(0xff5e5873),
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}

class _Earned extends StatelessWidget {
  const _Earned({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppCard(
      color: AppColors.primaryPurple10,
      padding: kPad16,
      elevation: 0,
      borderRadius: kBorderRadius8,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Text(
            "Earned",
            textAlign: TextAlign.start,
            style: TextStyle(
              color: Color(0xff5e5873),
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            "300 MTS",
            textAlign: TextAlign.end,
            style: TextStyle(
              color: Color(0xff5e5873),
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          )
        ],
      ),
    );
  }
}
