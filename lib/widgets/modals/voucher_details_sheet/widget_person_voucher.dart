part of 'voucher_details_sheet.dart';

class OtherVoucher extends StatelessWidget {
  final VoidCallback? onPayTap;
  final VoidCallback? onUserCardTap;

  const OtherVoucher({
    Key? key,
    this.onPayTap,
    this.onUserCardTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = context.findAncestorStateOfType<_VoucherDetailsSheetState>()!;

    return Column(
      children: [
        // owner data.
        _Pane(
          title: 'Owner',
          child: Column(
            children: [
              _UserCard(
                onTap: onUserCardTap,
                title: 'Last name First name',
                subtitle: 'Login',
              ),
              kGap16,
              const _LabelValueRow(
                label: 'Date of creation:',
                value: '11.04.2022 23:50',
              ),
              // kGap8,
              // const _LabelValueRow(
              //   label: 'Cancellation date:',
              //   value: '11.04.2022 23:55',
              // ),
            ],
          ),
        ).paddingSymmetric(horizontal: 16),
        kGap16,
        // _Pane(
        //   title: 'Recipients',
        //   titlePadding: kPadH16,
        //   child: PageViewWithIndicator(
        //     itemBuilder: (ctx, idx) {
        //       return Padding(
        //         padding: kPadH16,
        //         child: _UserCard(
        //           onTap: onUserCardTap,
        //           title: 'Last name First name',
        //           subtitle: 'Login',
        //           subtitleIconData: AppIcons.person,
        //         ),
        //       );
        //     },
        //     itemCount: 3,
        //   ),
        // ),
        // kGap16,
        _Pane(
          title: 'Objects',
          titlePadding: kPadH16,
          child: PageViewWithIndicator(
            itemBuilder: (ctx, idx) {
              return Padding(
                padding: kPadH16,
                child: NotificationCircleBadge(
                  value: 2,
                  backgroundColor: AppColors.primaryPurple,
                  child: VoucherCard.network(
                    title: 'Подписка',
                    line1: 'Действие:  3 месяца',
                    line2: 'Активировать до: 23.05.2022',
                    tile: const VoucherIconTile(
                      color: Color(0xff18CBC7),
                      iconData: AppIcons.park_tickets_couple,
                    ),
                    tag: VoucherObjectCardTag.text(text: 'Кинотеатр'),
                    onTap: () {},
                  ),
                ),
              );
            },
            itemCount: 3,
          ),
        ),
        kGap16,
        _Pane(
          title: 'Activation',
          child: Column(
            children: getActivationFields(state),
          ),
        ).paddingSymmetric(horizontal: 16),
        kGap16,
        SafeArea(
          child: SizedBox(
            height: 47,
            child: AppElevatedButton.primary(
              child: Text(state.buttonLabel),
              onTap: onPayTap,
            ),
          ),
        ).paddingSymmetric(horizontal: 16),
        kGap16,
      ],
    );
  }

  List<Widget> getActivationFields(_VoucherDetailsSheetState state) {
    if (state.mode == VoucherMode.code) {
      return [
        AppTextField(
          label: 'Enter activation code',
          hint: 'Enter activation code',
          control: state.activationCodeControl,
        ),
      ];
    } else {
      return [
        FormLabeledField(
          label: 'Select currency',
          input: Obs(
            () => CurrencyDropdown(
              options: state.currencyOptions,
              onChanged: state.currency,
              current: state.currency(),
            ),
          ),
        ),
        kGap16,
        AppTextField(
          keyboardType: const TextInputType.numberWithOptions(
            decimal: true,
            signed: false,
          ),
          textInputAction: TextInputAction.done,
          control: state.amountControl,
          label: 'Price',
          hint: '1.0005',
          accessory: Row(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Text(
                " BTC ",
                textAlign: TextAlign.center,
                style: kTextAccessoryStyle,
              ),
            ],
          ),
        ),
      ];
    }
  }
}
