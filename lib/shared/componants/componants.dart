
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:newsappaymn/modules/web_view/webview_screen.dart';
Widget defaultTextFormField(
    {required TextEditingController controller,
      required TextInputType type,
      required String label,
      String? Function(String?)? validate,
      required IconData prefix,
      VoidCallback? suffixPressed,
      VoidCallback? ontap,
      Function(String)? onSubmit,
      IconData? suffix,
      bool isPassword = false}) =>
    TextFormField(
      onTap: ontap,
      onFieldSubmitted: onSubmit,
      validator: validate,
      controller: controller,
      keyboardType: type,
      obscureText: isPassword,
      decoration: InputDecoration(
        prefixIcon: Icon(prefix),
        labelText: label,
        suffixIcon: suffix != null
            ? IconButton(
          icon: Icon(suffix),
          onPressed: suffixPressed,
        )
            : null,
        labelStyle: const TextStyle(
          color: Colors.black,
        ),
        border: const OutlineInputBorder(),
      ),
    );

Widget defaultButton(
    {double? width = 300,
      Color? background = Colors.cyan,
      Color? textColor = Colors.black,
      required VoidCallback function,
      required String text,
      double? radius = 10}) =>
    Container(
      decoration: defaultGradient(),
      width: width,
      child: MaterialButton(
        onPressed: function,
        child: Text(
          text,
          style: TextStyle(
            fontSize: 30,
            color: textColor,
          ),
        ),
      ),
    );

BoxDecoration defaultGradient() => BoxDecoration(
  borderRadius: BorderRadius.circular(20),
  gradient: LinearGradient(
    colors: [
      Colors.cyanAccent[100]!,
      Colors.cyan,
    ],
  ),
);


Widget buildArticleItem(
  article,
  context,
) =>
    InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => WebViewScreen(url: article['url'])));
      },
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      image: NetworkImage('${article['urlToImage']}'),
                      fit: BoxFit.cover)),
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: Container(
                height: 120,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        '${article['title']}',
                        style: Theme.of(context).textTheme.bodyText1,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      '${article['publishedAt']}',
                      style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );

Widget articleBuilder(list, context) => ConditionalBuilder(
      condition: list.length > 0,
      builder: (context) => ListView.separated(
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) =>
              buildArticleItem(list[index], context),
          separatorBuilder: (context, index) => Container(
                width: double.infinity,
                height: 1,
                color: Colors.deepOrange,
              ),
          itemCount: list.length),
      fallback: (context) => const Center(child: CircularProgressIndicator(

      )),
    );

Future myNavigator({required context, required Widget}) => Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => Widget),
);

Future myNavigator2({required context, required Widget}) =>
    Navigator.pushAndRemoveUntil(context,
        MaterialPageRoute(builder: (context) => Widget), (route) => false);