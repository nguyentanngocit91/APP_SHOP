import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ExpanstionTitle extends StatefulWidget {
  @override
  State<ExpanstionTitle> createState() => _ExpanstionTitle();
}
class _ExpanstionTitle extends State<ExpanstionTitle> {
  bool _customTileExpanded = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200,
      color: Color(0XFFF4f4f4),
      padding: EdgeInsets.only(top: 25,bottom: 25),
      child: ListView(
        padding: EdgeInsets.zero,

        children: <Widget>[

          ListTileTheme(
              contentPadding: EdgeInsets.only(left: 10, right: 10),
              dense: true,
              horizontalTitleGap: 0.0,
              minLeadingWidth:0,
              child: ExpansionTile(
                //controlAffinity: ListTileControlAffinity.leading,
                // tilePadding: EdgeInsets.symmetric(vertical: 0),
                trailing: Icon(
                  _customTileExpanded
                      ? Icons.remove
                      : Icons.add,
                ),
                onExpansionChanged: (bool expanded) {
                  setState(() => _customTileExpanded = expanded);
                },
                // childrenPadding: EdgeInsets.all(0),
                title:  Text("Thông tin chung".toUpperCase(),style: TextStyle(color: Color(0XFF333333),fontSize: 16, letterSpacing: 0.5),),

                /* leading: Padding(
              padding: EdgeInsets.only(top: 0),
              child: Icon(Icons.add),
            ),*/
                children: <Widget>[
                  ListTile(
                    //leading: Icon(Icons.arrow_right),
                    leading: GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      child: Container(
                        width: 48,
                        height: 48,
                        padding: const EdgeInsets.symmetric(vertical: 4.0),
                        alignment: Alignment.center,
                        child: const Icon(Icons.chevron_right),
                      ),
                    ),
                    onTap: () => { },
                    title: const Text("Giới thiệu",style: TextStyle(fontSize: 15,color: Color(0XFF333333),letterSpacing: 0.5),),
                  ),
                  ListTile(
                    leading: GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      child: Container(
                        width: 48,
                        height: 48,
                        padding: const EdgeInsets.symmetric(vertical: 4.0),
                        alignment: Alignment.center,
                        child: const Icon(Icons.chevron_right),
                      ),
                    ),
                    title: const Text("Hỗ trợ"),
                    onTap: () => { },
                  ),
                  ListTile(
                    leading: GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: () {},
                      child: Container(
                        width: 48,
                        height: 48,
                        padding: const EdgeInsets.symmetric(vertical: 4.0),
                        alignment: Alignment.center,
                        child: const Icon(Icons.chevron_right),
                      ),
                    ),
                    title: const Text("Chính sách bảo mật"),
                  ),
                  ListTile(
                    leading: GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: () {},
                      child: Container(
                        width: 48,
                        height: 48,
                        padding: const EdgeInsets.symmetric(vertical: 4.0),
                        alignment: Alignment.center,
                        child: const Icon(Icons.chevron_right),
                      ),
                    ),
                    title: const Text("Hướng dẫn thanh toán"),

                  ),
                ],
              ),

          ),


          ListTileTheme(
            contentPadding: EdgeInsets.only(left: 10,right: 10),
            dense: true,
            horizontalTitleGap: 0.0,
            minLeadingWidth: 0,
            child:  ExpansionTile(
              trailing: Icon(
                _customTileExpanded
                    ? Icons.remove
                    : Icons.add,
              ),
              onExpansionChanged: (bool expanded) {
                setState(() => _customTileExpanded = expanded);
              },
              // childrenPadding: EdgeInsets.all(0),
              title:  Text("Dịch vụ cung cấp".toUpperCase(),style: TextStyle(color: Color(0XFF333333),fontSize: 15, letterSpacing: 0.5),),


              children: <Widget>[
                ListTile(
                  //leading: Icon(Icons.arrow_right),
                  leading: GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    child: Container(
                      width: 48,
                      height: 48,
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      alignment: Alignment.center,
                      child: const Icon(Icons.chevron_right),
                    ),
                  ),
                  onTap: () => { },
                  title: const Text("Dịch vụ hosting",style:  TextStyle(color: Color(0XFF333333),fontSize: 15, letterSpacing: 0.5),),
                ),
                ListTile(
                  leading: GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    child: Container(
                      width: 48,
                      height: 48,
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      alignment: Alignment.center,
                      child: const Icon(Icons.chevron_right),
                    ),
                  ),
                  title: const Text("Dịch vụ email server",style:  TextStyle(color: Color(0XFF333333),fontSize: 15, letterSpacing: 0.5),),
                  onTap: () => { },
                ),
                ListTile(
                  leading: GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () {},
                    child: Container(
                      width: 48,
                      height: 48,
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      alignment: Alignment.center,
                      child: const Icon(Icons.chevron_right),
                    ),
                  ),
                  title: const Text("Dịch vụ tên miền"),
                ),
                ListTile(
                  leading: GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () {},
                    child: Container(
                      width: 48,
                      height: 48,
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      alignment: Alignment.center,
                      child: const Icon(Icons.chevron_right),
                    ),
                  ),
                  title: const Text("Dịch vụ thiết kế website"),

                ),
              ],
            ),


          ),



          ListTileTheme(
            contentPadding: EdgeInsets.only(left: 10,right: 10),
            dense: true,
            horizontalTitleGap: 0.0,
            minLeadingWidth: 0,
            child:   ExpansionTile(
              trailing: Icon(
                _customTileExpanded
                    ? Icons.remove
                    : Icons.add,
              ),
              onExpansionChanged: (bool expanded) {
                setState(() => _customTileExpanded = expanded);
              },
              title:  Text("Thông tin cần biết".toUpperCase().toUpperCase(),style: TextStyle(color: Color(0XFF333333),fontSize: 16, letterSpacing: 0.5),),


              children: <Widget>[
                ListTile(
                  //leading: Icon(Icons.arrow_right),
                  leading: GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    child: Container(
                      width: 48,
                      height: 48,
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      alignment: Alignment.center,
                      child: const Icon(Icons.chevron_right),
                    ),
                  ),
                  onTap: () => { },
                  title: const Text("Các quy định về tên miền"),
                ),
                ListTile(
                  leading: GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    child: Container(
                      width: 48,
                      height: 48,
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      alignment: Alignment.center,
                      child: const Icon(Icons.chevron_right),
                    ),
                  ),
                  title: const Text("Thỏa thuận bảo mật thông tin"),
                  onTap: () => { },
                ),
                ListTile(
                  leading: GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () {},
                    child: Container(
                      width: 48,
                      height: 48,
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      alignment: Alignment.center,
                      child: const Icon(Icons.chevron_right),
                    ),
                  ),
                  title: const Text("Văn bản pháp lý"),
                ),
                ListTile(
                  leading: GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () {},
                    child: Container(
                      width: 48,
                      height: 48,
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      alignment: Alignment.center,
                      child: const Icon(Icons.chevron_right),
                    ),
                  ),
                  title: const Text("Thỏa thuận sử dụng"),
                ),

                ListTile(
                  leading: GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () {},
                    child: Container(
                      width: 48,
                      height: 48,
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      alignment: Alignment.center,
                      child: const Icon(Icons.chevron_right),
                    ),
                  ),
                  title: const Text("Biểu mẫu hồ sơ"),
                ),

              ],
            ),



          ),


          const SizedBox(
            height: 5.0,
          ),
          const Divider(color: Colors.black12),
          const SizedBox(
            height: 5.0,
          ),
        ],
      ),

    );


  }

}