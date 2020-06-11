import 'package:OhMyNews/helper/data.dart';
import 'package:OhMyNews/helper/news.dart';
import 'package:OhMyNews/models/article_model.dart';
import 'package:OhMyNews/models/category_model.dart';
import 'package:OhMyNews/views/article_view.dart';
import 'package:OhMyNews/views/category_news.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategoryModel> categories = new List<CategoryModel>();
  List<ArticleModel> articles = new List<ArticleModel>();
  bool _loading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    categories = getCategories();
    getNews();
  }

  getNews() async {
    News newsClass = News();
    await newsClass.getNews();
    articles = newsClass.news;

    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('OhMy'),
            Text(
              'News',
              style: TextStyle(color: Colors.blue),
            )
          ],
        ),
        elevation: 0.0,
      ),
      body: _loading
          ? Center(
              child: Container(
                child: CircularProgressIndicator(),
              ),
            )
          : SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 15.0),
            child: Container(
                child: Column(
                  children: <Widget>[

                    // Categories
                    Container(
                      height: 70.0,
                      child: ListView.builder(
                        itemCount: categories.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return CategoryTile(
                            imageUrl: categories[index].imageUrl,
                            categoryName: categories[index].categoryName,
                          );
                        },
                      ),
                    ),

                    //News
                    Container(
                      padding: EdgeInsets.only(top: 15.0),
                      child: ListView.builder(
                        physics: ClampingScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context,index){
                        return BlogTile(
                          imageUrl: articles[index].urlToImage,
                          title: articles[index].title,
                          desc: articles[index].description,
                          url: articles[index].url,
                        );
                      },
                      itemCount: articles.length,),
                    )
                  ],
                ),
              ),
          ),
    );
  }
}

class CategoryTile extends StatelessWidget {
  final imageUrl, categoryName;
  CategoryTile({this.imageUrl, this.categoryName});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()  {
        Navigator.push(context, MaterialPageRoute(builder: (context)=>CategoryNews(category: categoryName.toLowerCase(),)));
      },
      child: Container(
        margin: EdgeInsets.only(right: 15.0),
        child: Stack(
          children: <Widget>[
            ClipRRect(
                borderRadius: BorderRadius.circular(6.0),
                child: CachedNetworkImage(
                  imageUrl: imageUrl,
                  width: 120.0,
                  height: 60.0,
                  fit: BoxFit.cover,
                )),
            Container(
              alignment: Alignment.center,
              width: 120.0,
              height: 60.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6.0),
                color: Colors.black26,
              ),
              child: Text(
                categoryName,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class BlogTile extends StatelessWidget {
  final String imageUrl, title, desc,url;
  BlogTile(
      {@required this.imageUrl, @required this.title, @required this.desc,@required this.url});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => ArticleView(
          articleUrl: url,
        )));
      },
      child: Container(
        margin: EdgeInsets.only(top: 10.0),
        child: Column(
          children: <Widget>[
            ClipRRect(
                borderRadius: BorderRadius.circular(6.0),
                child: Image.network(imageUrl)),
            SizedBox(height: 8.0,),
            Text(title,style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.w500,
            ),),
            SizedBox(height: 8.0,),
            Text(desc,style: TextStyle(
              color: Colors.black54
            ),),
          ],
        ),
      ),
    );
  }
}
