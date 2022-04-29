import 'package:flutter/cupertino.dart';
import 'package:metashark/commons.dart';

class ConfirmDialogMaterial extends StatelessWidget {
  const ConfirmDialogMaterial({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Please Confirm'),
      content: const Text('Are you sure to remove the box?'),
      actions: [
        // The "Yes" button
        TextButton(
            onPressed: () {
              Navigator.of(context).pop(true);
            },
            child: const Text('Yes')),
        TextButton(
            onPressed: () {
              Navigator.of(context).pop(false);
            },
            child: const Text('No'))
      ],
    );
  }
}

class ConfirmDialogCupertino extends StatelessWidget {
  const ConfirmDialogCupertino({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: AppText.cupertino(
        'Hey Mike, please confirm',
      ),
      content: AppText.cupertino(
        'Are you sure you want to remove the Sessions?',
      ),
      actions: [
        CupertinoDialogAction(
          child: AppText.cupertino('Yes'),
          onPressed: () {
            context.navigator()!.pop(true);
          },
          isDefaultAction: true,
          isDestructiveAction: true,
        ),
        CupertinoDialogAction(
          child: AppText.cupertino('Nope'),
          onPressed: () {
            context.navigator()!.pop(false);
          },
          isDefaultAction: false,
          isDestructiveAction: false,
        ),
      ],
    );
  }
}
