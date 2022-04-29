import 'package:metashark/commons.dart';

class BinaryTreeDemoWidget extends StatefulWidget {
  const BinaryTreeDemoWidget({Key? key}) : super(key: key);

  @override
  State<BinaryTreeDemoWidget> createState() => _BinaryTreeDemoWidgetState();
}

class _BinaryTreeDemoWidgetState extends State<BinaryTreeDemoWidget> {
  var sizes = List.generate(
    5,
    (index) => Size(20 + index * 10, 20 + index * 10),
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 300,
      color: Colors.green,
      child: Flow(
        delegate: MyFlow(sizes: sizes),
        clipBehavior: Clip.none,
        children: [
          ...sizes.map2((e) => ItemAvatar(size: e.width)),
          // ...List.generate(
          //   5,
          //   (index) => ItemAvatar(size: 20 + index * 5),
          //   // (index) => AppMaterialButton(
          //   //   onTap: (){},
          //   //   child: Text(
          //   //     'Item $index',
          //   //     // style: TextStyle(color: Colors.red, fontSize: 24),
          //   //   ),
          //   // ),
          // ),
        ],
      ),
      // child: Text('Content for Voucher Search page'),
    );
  }
}

class ItemAvatar extends StatelessWidget {
  final double size;

  const ItemAvatar({Key? key, this.size = 40}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AppMaterialButton(
        padding: EdgeInsets.zero,
        onTap: () {},
        child: CommonAvatar(
          radius: size / 2,
          backgroundColor: Colors.red,
          child: Icon(
            AppIcons.all_inbox,
            color: Colors.white,
            size: 18,
          ),
        ),
      ),
    );
  }
}

class MyFlow extends FlowDelegate {
  final List<Size> sizes;

  MyFlow({required this.sizes});

  @override
  void paintChildren(FlowPaintingContext context) {
    double px = 20;
    for (var i = 0; i < context.childCount; ++i) {
      var size = context.getChildSize(i)!;
      // trace(size);
      var mtx = Matrix4.identity();
      // mtx.translate(i * 80.0, 0.0);
      mtx.translate(px, 30.0);
      mtx.scale(1.5, 1.0);
      px += size.width;
      context.paintChild(i, transform: mtx);
    }
  }

  @override
  BoxConstraints getConstraintsForChild(int i, BoxConstraints constraints) {
    return BoxConstraints.tight(sizes[i]);
    // return constraints;
    // return BoxConstraints()
  }

  @override
  bool shouldRepaint(covariant MyFlow oldDelegate) {
    return false;
  }
}

//// show layout data.
final _kBreakpointNames = {
  LayoutBreakpoint.xs: '(XS) Extra Small', // Extra Small Screens
  LayoutBreakpoint.sm: '(SM) Small', // Small Screen
  LayoutBreakpoint.md: '(MD) Medium', // Small Screen
  LayoutBreakpoint.lg: '(LG) Large', // Medium Screens
  LayoutBreakpoint.xl: '(XL) Extra Large', // Medium Screens
};

class LayoutBar extends StatelessWidget {
  const LayoutBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final layout = context.layout;
    final size = '${layout.size.width.round()} x ${layout.size.height.round()}';
    final breakpoint = _kBreakpointNames[layout.breakpoint]!;

    ///'${layout.breakpoint.name.toUpperCase()}';
    return Theme(
      data: ThemeData.dark(),
      child: Material(
        child: SafeArea(
          minimum: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
          child: Row(
            children: [
              Text(
                size,
                textAlign: TextAlign.start,
              ).exp(),
              Text(
                breakpoint,
                textAlign: TextAlign.end,
              ).exp(),
            ],
          ),
        ),
      ),
    );
  }
}
