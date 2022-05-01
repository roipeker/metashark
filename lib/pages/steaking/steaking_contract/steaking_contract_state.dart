part of 'steaking_contract.dart';

abstract class _SteakingContractState extends State<SteakingContractPage> {
  final scrollController = ScrollController();

  List<ContractLogVo> get logs => _kData;

  String get appbarTitle {
    return 'Contract #${widget.contractId}';
  }

  Future<void> onRefreshPull() {
    return 2.seconds.delay();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  void onCardTap() {
    // context.openModalSheet(const ShowGiftsSheet());
  }

  void onLogItemTap(ContractLogVo vo) {
    context.openModalSheet(VoucherDetailsSheet(
      voucherId: vo.voucherId,
    ));
  }
}

class ContractLogVo {
  final String voucherId;
  final String title;
  final String date;
  final String amount;

  const ContractLogVo({
    this.voucherId='1234123',
    required this.title,
    required this.date,
    required this.amount,
  });
}

const _kData = <ContractLogVo>[
  ContractLogVo(
    voucherId: "12345",
    title: "Разморозка",
    date: "11.04.2022",
    amount: "3 MTS",
  ),
  ContractLogVo(
    voucherId: "4534",
    title: "Доход",
    date: "11.04.2022",
    amount: "3 MTS",
  ),
  ContractLogVo(
    voucherId: "887755",
    title: "Доход\nРазморозка",
    date: "11.04.2022",
    amount: "1 MTS\n10 MTS",
  ),
];
