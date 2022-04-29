import 'package:dotted_decoration/dotted_decoration.dart';
import 'package:metashark/commons.dart';

part 'vouchers_logs_state.dart';

class VouchersLogsPage extends StatefulWidget {
  static const url = "/vouchers-logs";

  const VouchersLogsPage({Key? key}) : super(key: key);

  @override
  createState() => _VouchersLogsPage();
}

class _VouchersLogsPage extends _VouchersLogsState {
  final GlobalKey refKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            bottom: 0,
            left: 16 + 4,
            child: Container(
              width: 1,
              decoration: DottedDecoration(
                shape: Shape.line,
                linePosition: LinePosition.left,
                dash: const [2, 2],
                color: const Color(0xffB9B9C3),
                strokeWidth: 1,
              ),
            ),
          ),
          Positioned.fill(
            child: RefreshIndicator(
              onRefresh: onRefreshPull,
              child: Scrollbar(
                controller: scrollController,
                child: ListView(
                  padding: kPad16,
                  physics: const AlwaysScrollableScrollPhysics(),
                  controller: scrollController,
                  clipBehavior: Clip.none,
                  shrinkWrap: true,
                  children: [
                    Container(
                      // color: Colors.red,
                      key: refKey,
                      child: CustomPaint(
                        // foregroundPainter: _LinePainter(),
                        child: Column(
                          children: [
                            ...List.generate(
                              3,
                              (index) => Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const Dot(
                                    size: 9,
                                    color: Color(0xffB9B9C3),
                                  ),
                                  const Gap(17),
                                  VoucherLogItem(
                                    title: 'Created',
                                    subtitle: '11.04.2022' +
                                        ' sample lorem ipsum ' * (10 * (index)),
                                    id: '# 125',
                                    onTap: () {
                                      onVoucherTap();
                                    },
                                  ).exp(),
                                ],
                              ),
                            ).separator(kGap8),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
