import 'package:flutter/services.dart';
import 'package:metashark/commons.dart';

class FormTextField extends StatelessWidget {
  final String label;
  final String hint;
  final Widget? suffix;

  const FormTextField({
    Key? key,
    required this.label,
    required this.hint,
    this.suffix,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FormLabeledField(
      label: label,
      input: TextField(
        decoration: InputDecoration(
          hintText: hint,
          suffixIcon: suffix == null ? null : (suffix!).paddingOnly(right: 8.0),
        ),
      ),
    );
  }
}

class FormPassword extends StatelessWidget {
  final String label;
  final String hint;
  final bool showPassword;

  const FormPassword({
    Key? key,
    required this.label,
    required this.hint,
    this.showPassword = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var isShown = showPassword;
    return FormLabeledField(
      label: label,
      input: StatefulBuilder(
        builder: (_, builder) {
          var icon = isShown ? Icons.visibility : Icons.visibility_off;
          return TextField(
            obscureText: isShown,
            decoration: InputDecoration(
                hintText: hint,
                suffixIcon: IconButton(
                  icon: Icon(icon),
                  onPressed: () => builder(() {
                    isShown = !isShown;
                  }),
                )),
          );
        },
      ),
    );
  }
}

class FormLabeledField extends StatelessWidget {
  final String label;
  final Widget input;
  final Widget? bottom;

  const FormLabeledField({
    Key? key,
    required this.label,
    required this.input,
    this.bottom,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: kPadH16,
          child: Text(
            label,
            style: kFormLabeledStyle,
          ),
        ),
        kGap4,
        input,
        kGap4,
        if (bottom != null) bottom!,
      ],
    );
  }
}

class AppTextFieldInsert extends StatelessWidget {
  final AppTextControl? textControl;
  final VoidCallback? onInsertTap;
  final String label;
  final String hint;
  final String? insertLabel;

  const AppTextFieldInsert({
    Key? key,
    this.textControl,
    this.onInsertTap,
    required this.label,
    this.hint = 'Enter code',
    this.insertLabel = 'Insert',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppTextField(
      label: label,
      hint: hint,
      control: textControl,
      accessory: AppTextButton.accessory(
        label: insertLabel,
        onTap: textControl != null
            ? () async {
                var data = await Clipboard.getData('text/plain');
                var text = data?.text ?? '';
                if (text.isNotEmpty) {
                  final _control = textControl!;
                  _control.setFocus();
                  _control.text = text;
                  _control.editor.selection = TextSelection(
                    baseOffset: text.length,
                    extentOffset: text.length,
                  );
                }
              }
            : onInsertTap,
      ),
    );
  }
}

// Add missing fields as they are needed.
class AppTextField extends StatefulWidget {
  final AppTextControl? control;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final String label;
  final String hint;
  final Widget? accessory;
  final Widget? bottom;
  final bool isPassword;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final TextCapitalization textCapitalization;

  const AppTextField({
    Key? key,
    this.keyboardType,
    this.textInputAction,
    this.textCapitalization = TextCapitalization.none,
    this.control,
    this.controller,
    this.focusNode,
    required this.label,
    required this.hint,
    this.accessory,
    this.bottom,
    this.isPassword = false,
  }) : super(key: key);

  const AppTextField.password({
    this.hint = 'hint',
    this.label = 'label',
    this.accessory,
    this.bottom,
    this.control,
    this.controller,
    this.focusNode,
    this.keyboardType,
    this.textInputAction,
    this.textCapitalization = TextCapitalization.none,
    Key? key,
  })  : isPassword = true,
        super(key: key);

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  TextEditingController? get controller {
    return widget.controller ?? widget.control?.editor;
  }

  FocusNode? get focusNode {
    return widget.focusNode ?? widget.control?.focusNode;
  }

  bool obscured = false;

  Widget? get accessory {
    Widget? _a = widget.accessory;
    if (widget.isPassword && _a == null) {
      final icon = !obscured ? AppIcons.visibility : AppIcons.visibility_off;
      _a = TextFieldAccessoryButton(
        child: Icon(
          icon,
          size: 20,
          color: AppColors.greyAccesoryIconColor,
        ),
        onTap: () {
          obscured = !obscured;
          setState(() {});
        },
      );
    }
    if (_a != null) {
      _a = Padding(
        padding: const EdgeInsets.only(right: 8),
        child: _a,
      );
    }
    return _a;
  }

  @override
  void initState() {
    obscured = widget.isPassword;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FormLabeledField(
      label: widget.label,
      bottom: widget.bottom,
      input: TextField(
        obscureText: obscured,
        controller: controller,
        keyboardType: widget.keyboardType,
        textInputAction: widget.textInputAction,
        textCapitalization: widget.textCapitalization,
        focusNode: focusNode,
        decoration: InputDecoration(
          hintText: widget.hint,
          suffixIcon: accessory,
          // fillColor: Colors.red,
          // focusColor: Colors.red,
          // hoverColor: Colors.red,
        ),
      ),
    );
  }
}

// ---
// holder for TextEditignController and FocusNode
class AppTextControl {
  final TextEditingController editor;
  final FocusNode focusNode;

  AppTextControl({
    String? text,
    FocusOnKeyCallback? onKey,
    FocusOnKeyEventCallback? onKeyEvent,
    bool skipTraversal = false,
    bool canRequestFocus = true,
    bool descendantsAreFocusable = true,
  })  : editor = TextEditingController(text: text),
        focusNode = FocusNode(
          onKey: onKey,
          onKeyEvent: onKeyEvent,
          skipTraversal: skipTraversal,
          canRequestFocus: canRequestFocus,
          descendantsAreFocusable: descendantsAreFocusable,
        );

  set text(String value) {
    editor.text = value;
  }

  String get text => editor.text;

  void setFocus([FocusNode? node]) {
    focusNode.requestFocus(node);
  }

  bool get hasFocus => focusNode.hasFocus;

  void dispose() {
    editor.dispose();
    focusNode.dispose();
  }
}

class AppDateField extends StatefulWidget {
  final String label;
  final DateTime? selectedDate;
  final ValueChanged<DateTime?>? onChanged;

  const AppDateField({
    Key? key,
    this.label = 'Birthday',
    this.selectedDate,
    this.onChanged,
  }) : super(key: key);

  @override
  State<AppDateField> createState() => _AppDateFieldState();
}

class _AppDateFieldState extends State<AppDateField> {
  late DateTime? currentDate = widget.selectedDate;
  late final tec = TextEditingController(text: _dateString);

  @override
  void dispose() {
    tec.dispose();
    super.dispose();
  }

  String get _dateString {
    return currentDate?.formatEditProfile ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return FormLabeledField(
      label: widget.label,
      input: TextField(
        controller: tec,
        // focusNode: widget.focusNode,
        // enabled: false,
        decoration: InputDecoration(
          hintText: 'date',
          suffixIcon: Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: TextFieldAccessoryButton(
              child: Icon(
                AppIcons.date_range,
                color: AppColors.primaryPurple,
                size: 18,
              ),
              // child: Icon(
              //   Icons.calendar_today,
              //   color: AppColors.primaryPurple,
              //   size: 20,
              // ),
              onTap: () async {
                final now = DateTime.now();
                final date = await showDatePicker(
                  context: context,
                  initialDate: currentDate ?? now,
                  firstDate: now.subtract(
                    const Duration(days: 365 * 5),
                  ),
                  lastDate: now,
                );
                if (date != null) {
                  currentDate = date;
                  tec.text = _dateString;
                }
                widget.onChanged?.call(date);
              },
            ),
          ),
        ),
      ),
    );
  }
}
