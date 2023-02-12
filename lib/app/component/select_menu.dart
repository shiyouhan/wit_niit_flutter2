import 'package:flutter/material.dart';
import 'package:wit_niit_flutter2/app/data/base_style.dart';

/// 弹出菜单按钮组件
class SelectMenu extends StatefulWidget {
  final List<selectMenuItem> items; // 显示的内容
  final dynamic value; // 当前选中的值
  final String? title; // 选择框前的标题
  final String tooltip; // 提示语
  final ValueChanged<dynamic>? valueChanged; // 选中数据的回调事件
  const SelectMenu(
      {Key? key,
      this.items = const [],
      this.value = "",
      this.valueChanged,
      this.title,
      this.tooltip = "点击选择"})
      : super(key: key);

  @override
  State<SelectMenu> createState() => _SelectMenuState();
}

class _SelectMenuState extends State<SelectMenu> {
  String label = '请选择';
  bool isExpand = false; // 是否展开下拉按钮
  dynamic currentValue; // 此时的值

  @override
  void initState() {
    currentValue = widget.value;
    super.initState();
  }

  /// 根据当前的value处理当前文本显示
  void initTitle() {
    if (currentValue != null) {
      // 有值查值
      for (selectMenuItem item in widget.items) {
        if (item.value == currentValue) {
          label = item.label;
          break;
        }
      }
    } else {
      // 没值默认取第一个
      if (widget.items.isNotEmpty) {
        label = widget.items[0].label;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    initTitle();
    return PopupMenuButton<String>(
      // initialValue: currentValue,
      tooltip: widget.tooltip,
      offset: Offset(25, 30),
      enableFeedback: true,
      child: Listener(
        // 使用listener事件能够继续传递
        onPointerDown: (event) {
          setState(() {
            isExpand = !isExpand;
          });
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (widget.title != null)
              Expanded(
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.star,
                      color: Colors.red,
                      size: 12,
                    ),
                    Text(widget.title!, style: BaseStyle.testFontBold),
                  ],
                ),
              ),
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    label,
                    style: TextStyle(fontSize: 18),
                  ),
                  isExpand
                      ? const Icon(Icons.arrow_right)
                      : const Icon(Icons.arrow_drop_down)
                ],
              ),
            )

          ],
        ),
      ),
      onSelected: (value) {
        widget.valueChanged?.call(value);
        setState(() {
          currentValue = value;
          isExpand = !isExpand;
        });
      },
      onCanceled: () {
        // 取消展开
        setState(() {
          isExpand = !isExpand;
        });
      },
      itemBuilder: (context) {
        return widget.items
            .map(
              (item) => item.value == currentValue
                  ? PopupMenuItem<String>(
                      value: item.value,
                      child: Text(
                        item.label,
                        style: TextStyle(
                            color: Theme.of(context).primaryColor),
                      ),
                    )
                  : PopupMenuItem<String>(
                      value: item.value,
                      child: Text(item.label),
                    ),
            )
            .toList();
      },
    );
  }
}

/// 通用菜单项model
class selectMenuItem {
  String label; // 显示的文本
  dynamic value; // 选中的值
  bool checked; // 是否选中

  selectMenuItem({this.label = '', this.value, this.checked = false});
}
