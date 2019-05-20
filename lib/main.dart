import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:io';
import 'dart:math' as math;

//void main() => runApp(MyApp());
void main() {
  runApp(MyApp());
  //沉浸式状态栏
  if (Platform.isAndroid) {
    // 以下两行 设置android状态栏为透明的沉浸。写在组件渲染之后，是为了在渲染后进行set赋值，覆盖状态栏，写在渲染之前MaterialApp组件会覆盖掉这个值。
//    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
  }
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '贷款比价',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      //home: MyHomePage(title: '贷款比价'),
      home: IndexPage(),
    );
  }
}

class IndexPage extends StatefulWidget {
  @override
  IndexPageState createState() => IndexPageState();
}

class IndexPageState extends State<IndexPage> {
  var showAll = false;
  var time = 0;
  var amount = 0;
  var txt1 = '请选择您的贷款周期(月)';
  var type = 1;
  final FocusNode _focus_amonut = FocusNode();
  List<Widget> _list_info = new List();
  List<ProductInfo> _list_product = new List();
  @override
  void initState() {
    super.initState();
    _list_info.add(buildInfoListData(context, '测试1', '', 'http://www.baidu.com',
        '8000.00', '2000.00', '100.00', '10000.00'));
    _list_info.add(buildInfoListData(context, '测试2', '', 'http://www.baidu.com',
        '8000.00', '2000.00', '100.00', '10000.00'));
    _list_info.add(buildInfoListData(context, '测试3', '', 'http://www.baidu.com',
        '8000.00', '2000.00', '100.00', '10000.00'));
//    _list_info.add(buildInfoListData(context, '测试4', '', 'http://www.baidu.com', '8000.00', '2000.00', '100.00', '10000.00'));
    _list_product.add(new ProductInfo('产品1',
        'https://cdn2.jianshu.io/assets/web/nav-logo-4c7bbafe27adc892f3046e6978459bac.png'));
    _list_product.add(new ProductInfo('产品2',
        'https://cdn2.jianshu.io/assets/web/nav-logo-4c7bbafe27adc892f3046e6978459bac.png'));
    _list_product.add(new ProductInfo('产品3',
        'https://cdn2.jianshu.io/assets/web/nav-logo-4c7bbafe27adc892f3046e6978459bac.png'));
    _list_product.add(new ProductInfo('产品4',
        'https://cdn2.jianshu.io/assets/web/nav-logo-4c7bbafe27adc892f3046e6978459bac.png'));
    _list_product.add(new ProductInfo('产品5',
        'https://cdn2.jianshu.io/assets/web/nav-logo-4c7bbafe27adc892f3046e6978459bac.png'));
    _list_product.add(new ProductInfo('产品6',
        'https://cdn2.jianshu.io/assets/web/nav-logo-4c7bbafe27adc892f3046e6978459bac.png'));
    _list_product.add(new ProductInfo('产品7',
        'https://cdn2.jianshu.io/assets/web/nav-logo-4c7bbafe27adc892f3046e6978459bac.png'));
    _list_product.add(new ProductInfo('产品8',
        'https://cdn2.jianshu.io/assets/web/nav-logo-4c7bbafe27adc892f3046e6978459bac.png'));
    _list_product.add(new ProductInfo('产品9',
        'https://cdn2.jianshu.io/assets/web/nav-logo-4c7bbafe27adc892f3046e6978459bac.png'));
    _list_product.add(new ProductInfo('产品10',
        'https://cdn2.jianshu.io/assets/web/nav-logo-4c7bbafe27adc892f3046e6978459bac.png'));
    _list_product.add(new ProductInfo('产品11',
        'https://cdn2.jianshu.io/assets/web/nav-logo-4c7bbafe27adc892f3046e6978459bac.png'));
    _list_product.add(new ProductInfo('产品12',
        'https://cdn2.jianshu.io/assets/web/nav-logo-4c7bbafe27adc892f3046e6978459bac.png'));
  }

  @override
  Widget build(BuildContext context) {
    EdgeInsets padding = MediaQuery.of(context).padding;
    //状态栏高度
    double top = math.max(padding.top, EdgeInsets.zero.top);
    if (type == 1) {
      return Scaffold(
          body: SingleChildScrollView(
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SingleChildScrollView(),
            Padding(
              padding: EdgeInsets.fromLTRB(15, top + 5, 15, 5),
              child: TextField(
                maxLines: 1,
                textAlign: TextAlign.center,
                autofocus: false,
                cursorColor: Colors.grey,
                style: TextStyle(fontSize: 20.0, color: Colors.black),
                decoration: InputDecoration(
                    fillColor: Colors.black12,
                    filled: true,
                    contentPadding: EdgeInsets.all(0),
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.grey,
                    ),
                    hintText: '搜索或输入网站名称',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide.none,
                    )),
                inputFormatters: [LengthLimitingTextInputFormatter(20)],
              ),
            ),
            Divider(),
            buildBaseProductListData(_list_product
                .getRange(0, showAll ? _list_product.length : 8)
                .toList()),
            Padding(
              padding: EdgeInsets.only(left: 15.0, right: 15.0),
              child: Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      '选择借款金额与周期',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.0,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Container(
                      height: 10.0,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          '贷款金额',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15.0,
                          ),
                        ),
                        Container(
                          width: 15.0,
                        ),
                        Flexible(
                          child: TextField(
                            decoration: InputDecoration(
                              fillColor: Colors.black12,
                              filled: true,
                              contentPadding: EdgeInsets.all(10),
                              hintText: '请输入您的贷款金额(元)',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide: BorderSide.none,
                              ),
                            ),
                            focusNode: _focus_amonut,
                            maxLines: 1,
                            textInputAction: TextInputAction.done,
                            keyboardType: TextInputType.number,
                            inputFormatters: <TextInputFormatter>[
                              WhitelistingTextInputFormatter.digitsOnly,
                              LengthLimitingTextInputFormatter(8),
                            ],
                            textAlign: TextAlign.right,
                            onChanged: (String value) {
                              if (value.isNotEmpty) amount = int.parse(value);
                            },
                          ),
                        ),
                      ],
                    ),
                    Container(
                      height: 15.0,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          '贷款周期',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15.0,
                          ),
                        ),
                        Container(
                          width: 15.0,
                        ),
                        Flexible(
                          child: FlatButton(
                            onPressed: () {
                              showModalBottomSheet(
                                context: context,
                                builder: (BuildContext context) {
                                  return buildPopTimeData(context);
                                },
                              );
                            },
                            color: Colors.black12,
                            child: Container(
                              height: 45,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  Text(
                                    txt1,
                                    style: TextStyle(
                                      color: Colors.black54,
                                      fontSize: 15.0,
                                    ),
                                  ),
                                  Icon(
                                    Icons.expand_more,
                                    color: Colors.black54,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      height: 35.0,
                    ),
                    Center(
                      child: RaisedButton(
                        child: Text(
                          '立即比价',
                          style: TextStyle(fontSize: 20),
                        ),
                        onPressed: () {
                          if (amount <= 0) {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return new AlertDialog(
                                  title: new Text(
                                    '提示',
                                    style: new TextStyle(
                                      color: Colors.black54,
                                      fontSize: 18.0,
                                    ),
                                  ),
                                  content: new Text('请输入您的贷款金额'),
                                  actions: <Widget>[
                                    new FlatButton(
                                      child: new Text("知道了"),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                        FocusScope.of(context)
                                            .requestFocus(_focus_amonut);
                                      },
                                    ),
                                  ],
                                );
                              },
                            );
                            return;
                          }
                          if (time <= 0) {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return new AlertDialog(
                                  title: new Text(
                                    '提示',
                                    style: new TextStyle(
                                      color: Colors.black54,
                                      fontSize: 18.0,
                                    ),
                                  ),
                                  content: new Text('请选择您的贷款周期'),
                                  actions: <Widget>[
                                    new FlatButton(
                                      child: new Text("知道了"),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                        showModalBottomSheet(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return buildPopTimeData(context);
                                          },
                                        );
                                      },
                                    ),
                                  ],
                                );
                              },
                            );
                            return;
                          }
                          setState(() {
                            type = 2;
                          });
                        },
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        padding: EdgeInsets.fromLTRB(50, 10, 50, 10),
                        color: Colors.blue,
                        textColor: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ));
    } else {
      return Scaffold(
        body: new Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(15, top + 5, 15, 5),
              child: TextField(
                maxLines: 1,
                textAlign: TextAlign.center,
                autofocus: false,
                cursorColor: Colors.grey,
                style: TextStyle(fontSize: 20.0, color: Colors.black),
                decoration: InputDecoration(
                    fillColor: Colors.black12,
                    filled: true,
                    contentPadding: EdgeInsets.all(0),
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.grey,
                    ),
                    hintText: '搜索或输入网站名称',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide.none,
                    )),
                inputFormatters: [LengthLimitingTextInputFormatter(20)],
              ),
            ),
            Divider(),
            DefaultTextStyle(
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
              ),
              child: Container(
                color: Colors.blue,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(15, 0, 15, 30),
                  child: ListView(
                    shrinkWrap: true,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Text('您需要借款(元)'),
                          Expanded(
                            child: Text(
                              '借款周期(月)',
                              textAlign: TextAlign.right,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        height: 10,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Text(
                            amount.toString() + '.00',
                            style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Expanded(
                              child: Text(
                            time.toString(),
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w500,
                            ),
                          )),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView(
                shrinkWrap: true,
                children: _list_info,
              ),
            ),
            Container(
              padding: EdgeInsets.all(20),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: RaisedButton(
                      onPressed: () {
                        setState(() {
                          type = 1;
                          txt1 = '请选择您的贷款周期(月)';
                          time = 0;
                          amount = 0;
                        });
                      },
                      child: Text(
                        '再算一次',
                        style: TextStyle(fontSize: 20),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      padding: EdgeInsets.only(top: 10, bottom: 10),
                      color: Colors.blue,
                      textColor: Colors.white,
                    ),
                  ),
                  Container(
                    width: 10,
                  ),
                  Expanded(
                    child: RaisedButton(
                      onPressed: () {},
                      child: Text(
                        '申请最划算的',
                        style: TextStyle(fontSize: 20),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      padding: EdgeInsets.only(top: 10, bottom: 10),
                      color: Colors.deepOrange,
                      textColor: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }
  }

  Widget buildPopTimeData(BuildContext context) {
    return new Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        buildTimeListData(context, '1个月', 1),
        buildTimeListData(context, '3个月', 3),
        buildTimeListData(context, '6个月', 6),
        buildTimeListData(context, '12个月', 12),
      ],
    );
  }

  Widget buildBaseProductListData(List<ProductInfo> lsData) {
    List<Widget> list = new List<Widget>();
    for (ProductInfo p in lsData) {
      list.add(new Column(
        children: <Widget>[
          Image.network(p.Icon),
          Text(
            p.Name,
            style: TextStyle(color: Colors.black, fontSize: 15),
          ),
        ],
      ));
    }
    return new Column(
      children: <Widget>[
        GridView.count(
          crossAxisCount: 4,
          children: list,
          shrinkWrap: true,
          padding: EdgeInsets.all(0),
        ),
        Offstage(
          offstage: showAll,
          child: SizedBox(
            child: OutlineButton(
              onPressed: () {
                setState(() {
                  showAll = true;
                });
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('展开更多'),
                  Icon(
                    Icons.expand_more,
                  ),
                ],
              ),
              borderSide: BorderSide(color: Colors.blue),
              color: Colors.white,
              textColor: Colors.blue,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(5)),
              ),
            ),
            width: 150,
          ),
        ),
      ],
    );
  }

  Widget buildInfoListData(
      BuildContext context,
      String name,
      String icon,
      String url,
      String amount1,
      String amount2,
      String amount3,
      String amount4) {
    return new ListView(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      children: <Widget>[
        DefaultTextStyle(
          style: TextStyle(fontSize: 12, color: Colors.black),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Column(
                  children: <Widget>[
                    Text(amount1),
                    Text('最高可借'),
                  ],
                ),
              ),
              Icon(
                Icons.more_vert,
                color: Colors.grey,
              ),
              Expanded(
                child: Column(
                  children: <Widget>[
                    Text(amount2),
                    Text('每月还款'),
                  ],
                ),
              ),
              Icon(
                Icons.more_vert,
                color: Colors.grey,
              ),
              Expanded(
                child: Column(
                  children: <Widget>[
                    Text(
                      amount3,
                      style: TextStyle(color: Colors.blue),
                    ),
                    Text('每月利息'),
                  ],
                ),
              ),
              Icon(
                Icons.more_vert,
                color: Colors.grey,
              ),
              Expanded(
                child: Column(
                  children: <Widget>[
                    Text(
                      amount4,
                      style: TextStyle(color: Colors.blue),
                    ),
                    Text('总费用'),
                  ],
                ),
              ),
            ],
          ),
        ),
        Row(
          children: <Widget>[
            Expanded(
              child: FlatButton(
                onPressed: null,
                child: Row(
                  children: <Widget>[
                    Icon(Icons.home),
                    Text(
                      name,
                      style: TextStyle(color: Colors.black),
                    ),
                  ],
                ),
              ),
            ),
            FlatButton(
              onPressed: null,
              child: Row(
                children: <Widget>[
                  Text(
                    '查看官网',
                    style: TextStyle(color: Colors.blue),
                  ),
                  Icon(
                    Icons.keyboard_arrow_right,
                    color: Colors.blue,
                  ),
                ],
              ),
            ),
          ],
        ),
        Divider(),
        Container(
          height: 10,
        ),
      ],
    );
  }

  Widget buildTimeListData(BuildContext context, String text, int value) {
    return new ListTile(
      isThreeLine: false,
      title: new Text(text),
      onTap: () {
        setState(() {
          txt1 = text;
          time = value;
        });
        Navigator.of(context).pop();
//        showDialog(
//          context: context,
//          builder: (BuildContext context) {
//            return new AlertDialog(
//              title: new Text(
//                'ListViewDemo',
//                style: new TextStyle(
//                  color: Colors.black54,
//                  fontSize: 18.0,
//                ),
//              ),
//              content: new Text('您选择的item内容为:$value'),
//            );
//          },
//        );
      },
    );
  }
}

class ProductInfo {
  String Name;
  String Icon;
  ProductInfo(String name, String icon) {
    Name = name;
    Icon = icon;
  }
}
