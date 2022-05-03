import 'package:metashark/commons.dart';

/// ------
/// OBJECTS CARDS
///
class VoucherCard extends StatelessWidget {
  final Widget child;

  /// reactive radio button.
  static Widget getRadio(ObsValue<bool> rx) => Obs(
        () => Radio<bool>(
          groupValue: true,
          value: rx(),
          toggleable: true,
          onChanged: (_) => rx.toggle(),
        ),
      );

  const VoucherCard._({
    Key? key,
    required this.child,
  }) : super(key: key);

  VoucherCard.present({
    Key? key,
    VoidCallback? onTap,
    Widget? radio,
    VoucherObjectCardTag? tag,
    ObjectPresentCard type = ObjectPresentCard.big,
    required String imageUrl,
    required String title,
    required String body,
  })  : child = VoucherObjectCardPresent(
          radio: radio,
          title: title,
          type: type,
          body: body,
          imageUrl: imageUrl,
          onTap: onTap,
          // tag: tag,
        ),
        super(key: key);

  VoucherCard.collection({
    Key? key,
    VoidCallback? onTap,
    VoucherObjectCardTag? tag,
    Widget? radio,
    required String imageUrl,
    required String collection,
    required String id,
    required String status,
    required String strength,
  })  : child = VoucherObjectCollectionCard(
          radio: radio,
          collection: collection,
          id: id,
          status: status,
          strength: strength,
          imageUrl: imageUrl,
          onTap: onTap,
          tag: tag,
        ),
        super(key: key);

  VoucherCard.cash({
    Key? key,
    Widget? radio,
    VoidCallback? onTap,
    VoucherObjectCardTag? tag,
    bool extendImage = true,
    Color? leadingColor,
    required String title,
    required String body,
    String? imageUrl,
    Widget? tile,
  })  : child = VoucherObjectCashCard(
          radio: radio,
          title: title,
          body: body,
          tile: tile,
          imageUrl: imageUrl,
          onTap: onTap,
          leadingColor: leadingColor,
          extendImage: extendImage,
          tag: tag,
        ),
        super(key: key);

  VoucherCard.subscribe({
    Key? key,
    VoidCallback? onTap,
    VoucherObjectCardTag? tag,
    required String title,
    required String line1,
    required String line2,
    String? imageUrl,
    Widget? tile,
  })  : child = VoucherObjectNetworkCard(
          title: title,
          line1: line1,
          line2: line2,
          line2Style: const TextStyle(
            color: Color(0xff5e5873),
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
          tag: tag,
          imageUrl: imageUrl,
          tile: tile,
          onTap: onTap,
        ),
        super(key: key);

  VoucherCard.network({
    Key? key,
    VoidCallback? onTap,
    VoucherObjectCardTag? tag,
    Widget? radio,
    required String title,
    required String line1,
    required String line2,
    String? imageUrl,
    Widget? tile,
  })  : child = VoucherObjectNetworkCard(
          radio: radio,
          title: title,
          line1: line1,
          line2: line2,
          tag: tag,
          imageUrl: imageUrl,
          tile: tile,
          onTap: onTap,
        ),
        super(key: key);

  @override
  Widget build(BuildContext context) => child;
}

enum ObjectCardTagLocation { left, right }

class VoucherBaseObjectCard extends StatelessWidget {
  final Widget leading;
  final Color? leadingColor;
  final double? leadingSize;
  final Widget content;
  final Axis axis;
  final VoidCallback? onTap;
  final VoucherObjectCardTag? tag;
  final Widget? radioButton;
  final ObjectCardTagLocation? tagLocation;
  final Border? border;
  final double elevation;

  const VoucherBaseObjectCard({
    Key? key,
    required this.leading,
    required this.content,
    required this.axis,
    this.elevation = 4,
    this.radioButton,
    this.border,
    this.leadingSize,
    this.leadingColor,
    this.onTap,
    this.tag,
    this.tagLocation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var hasBorder = border != null;

    final button = AppMaterialButton(
      padding: EdgeInsets.zero,
      shape: kBorder8,
      elevation: elevation,
      clip: Clip.antiAlias,
      onTap: onTap,
      color: Colors.white,
      child: _getBody(),
    );

    /// if border, no shadow.
    if (hasBorder) {
      return DecoratedBox(
        position: DecorationPosition.foreground,
        decoration: BoxDecoration(
          border: border!,
          borderRadius: kBorder8.borderRadius,
        ),
        child: button,
      );
    }
    return button;
  }

  ObjectCardTagLocation _locationFromAxis() {
    if (tagLocation != null) {
      return tagLocation!;
    }
    if (axis == Axis.horizontal) {
      return ObjectCardTagLocation.right;
    }
    return ObjectCardTagLocation.left;
  }

  Widget _getBody() {
    late Widget child;

    if (axis == Axis.horizontal) {
      child = IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // ntrinsicHeight(
            // child: Row(
            // children: [
            //   Container(
            //   width: 130,
            //   height: double.infinity,
            //
            SizedBox(
              width: leadingSize ?? 80,
              height: double.infinity,
              // color: Colors.grey,
              child: leading,
            ),
            content.exp(),
          ],
        ),
      );
    } else {
      child = Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: leadingSize ?? 229,
            // width: double.infinity,
            child: leading,
          ),
          content
        ],
      );
    }

    var hasStack = tag != null || radioButton != null;

    if (hasStack) {
      Widget? _tag, _radio;

      if (tag != null) {
        final _tagLocation = _locationFromAxis();
        final _isLeft = _tagLocation == ObjectCardTagLocation.left;
        _tag = Positioned(
          top: 0,
          left: _isLeft ? 0 : null,
          right: !_isLeft ? 0 : null,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: tag!,
          ),
        );
      }
      if (radioButton != null) {
        /// todo: add wrapper code.
        _radio = Positioned(
          top: 16,
          right: 16,
          child: radioButton!,
        );
      }
      child = Stack(
        children: [
          child,
          if (_radio != null) _radio,
          if (_tag != null) _tag,
        ],
      );
    }
    return child;
  }
}

class VoucherObjectCardTag extends StatelessWidget {
  final Widget child;
  final Color? backgroundColor;

  VoucherObjectCardTag.text(
      {Key? key,
      required String text,
      TextStyle? textStyle,
      this.backgroundColor = AppColors.red})
      : child = Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 12,
          ),
        ),
        super(key: key);

  const VoucherObjectCardTag(
      {Key? key, required this.child, this.backgroundColor = AppColors.red})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(4),
          bottomRight: Radius.circular(4),
        ),
        color: backgroundColor,
      ),
      padding: const EdgeInsets.all(6),
      child: child,
    );
  }
}

class VoucherObjectCashCard extends StatelessWidget {
  final VoidCallback? onTap;
  final VoucherObjectCardTag? tag;

  final String title, body;
  final String? imageUrl;
  final Widget? tile;
  final bool extendImage;
  final Color? leadingColor;
  final Widget? radio;

  const VoucherObjectCashCard({
    Key? key,
    this.onTap,
    this.tag,
    this.extendImage = true,
    this.radio,
    this.leadingColor,
    required this.title,
    required this.body,
    this.imageUrl,
    this.tile,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VoucherBaseObjectCard(
      onTap: onTap,
      radioButton: radio,
      border: Border.all(
        color: AppColors.darkGrey.withOpacity(.12),
        width: 1,
      ),
      elevation: 0,
      tag: tag,
      axis: Axis.horizontal,
      leadingColor: AppColors.primaryPurple10,
      content: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              maxLines: 1,
              style: const TextStyle(
                color: AppColors.darkGrey,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(
              body,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: Color(0xffb9b9c3),
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
      // leading: Image.network('asdad'),
      leading: SizedBox(
        height: extendImage ? double.infinity : null,
        child: tile ??
            AppFadeImage(
              url: imageUrl!,
              fit: BoxFit.cover,
            ),
      ),
    );
  }
}

class VoucherObjectNetworkCard extends StatelessWidget {
  final VoidCallback? onTap;
  final VoucherObjectCardTag? tag;
  final String title, line1, line2;
  final TextStyle? line2Style;
  final String? imageUrl;
  final Widget? tile;
  final Widget? radio;

  const VoucherObjectNetworkCard({
    Key? key,
    this.onTap,
    this.tag,
    this.radio,
    required this.title,
    required this.line1,
    this.line2Style,
    required this.line2,
    this.imageUrl,
    this.tile,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VoucherBaseObjectCard(
      onTap: onTap,
      radioButton: radio,
      border: Border.all(
        color: AppColors.darkGrey.withOpacity(.12),
        width: 1,
      ),
      tag: tag,
      axis: Axis.horizontal,
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: AppColors.darkGrey,
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
          kGap4,
          Text(
            line1,
            style: const TextStyle(
              color: AppColors.greyAccesoryIconColor,
              fontSize: 14,
            ),
          ),
          kGap4,
          Text(
            line2,
            style: line2Style ??
                const TextStyle(
                  color: AppColors.greyAccesoryIconColor,
                  fontSize: 14,
                ),
          ),
        ],
      ).padding(16),
      leading: tile ??
          AppFadeImage(
            url: imageUrl!,
          ),
    );
  }
}

class VoucherObjectCollectionCard extends StatelessWidget {
  final VoidCallback? onTap;
  final VoucherObjectCardTag? tag;
  final String collection, id, imageUrl, status, strength;
  final Widget? radio;

  const VoucherObjectCollectionCard({
    Key? key,
    this.onTap,
    this.tag,
    this.radio,
    required this.imageUrl,
    required this.collection,
    required this.id,
    required this.status,
    required this.strength,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VoucherBaseObjectCard(
      onTap: onTap,
      tag: tag,
      radioButton: radio,
      axis: Axis.vertical,
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                collection,
                style: const TextStyle(
                  color: AppColors.darkGrey,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                id,
                style: const TextStyle(
                  color: AppColors.darkGrey,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              )
            ],
          ),
          kGap8,
          Text(
            status,
            style: const TextStyle(
              color: AppColors.darkGrey,
              fontSize: 12,
            ),
          ),
          kGap4,
          Text(
            strength,
            style: const TextStyle(
              color: AppColors.darkGrey,
              fontSize: 12,
            ),
          )
        ],
      ).padding(16),
      leading: AppFadeImage(url: imageUrl),
    );
  }
}

enum ObjectPresentCard { big, small }

class VoucherObjectCardPresent extends StatelessWidget {
  final String imageUrl, title, body;
  final VoidCallback? onTap;
  final ObjectPresentCard type;
  final Widget? radio;

  const VoucherObjectCardPresent({
    Key? key,
    this.onTap,
    this.radio,
    this.type = ObjectPresentCard.big,
    required this.imageUrl,
    required this.title,
    required this.body,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppMaterialButton(
      padding: EdgeInsets.zero,
      shape: kBorder8,
      elevation: 4,
      clip: Clip.antiAlias,
      onTap: onTap,
      color: Colors.white,
      child: Stack(children: [
        _getBody(),
        if (radio != null)
          Positioned(
            top: 16,
            right: 16,
            child: radio!,
          ),
      ]),
    );
  }

  Widget _getBody() {
    if (type == ObjectPresentCard.big) {
      return Column(
        children: [
          Container(
            height: 229,
            width: double.infinity,
            color: AppColors.appbarIconGrey,
            child: AppFadeImage(
              url: imageUrl,
            ),
            // child: FadeInImage.memoryNetwork(
            //   placeholder: kTransparentImage,
            //   image: imageUrl,
            //   fit: BoxFit.cover,
            // ),
          ),
          _footer(),
        ],
      );
    } else {
      return IntrinsicHeight(
        child: Row(
          children: [
            Container(
              width: 130,
              height: double.infinity,
              color: AppColors.appbarIconGrey,
              child: AppFadeImage(
                url: imageUrl,
              ),
              // child: FadeInImage.memoryNetwork(
              //   placeholder: kTransparentImage,
              //   image: imageUrl,
              //   fit: BoxFit.cover,
              // ),
            ),
            Flexible(child: _footer()),
          ],
        ),
      );
    }
  }

  Widget _footer() {
    return Padding(
      padding: kPad16,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            maxLines: 1,
            textAlign: TextAlign.start,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: AppColors.darkGrey,
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
          kGap8,
          Text(
            body,
            maxLines: 4,
            textAlign: TextAlign.start,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: AppColors.darkGrey,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
