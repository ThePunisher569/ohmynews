import 'package:OhMyNews/models/category_model.dart';

List<CategoryModel> getCategories() {
  List<CategoryModel> category = new List<CategoryModel>();
  CategoryModel categoryModel = new CategoryModel();

  //first
  categoryModel.categoryName = 'Business';
  categoryModel.imageUrl = 'https://images.unsplash.com/photo-1507679799987-c73779587ccf?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1051&q=80';
  category.add(categoryModel);
  categoryModel = new CategoryModel();

  //second
  categoryModel.categoryName = 'Science';
  categoryModel.imageUrl = 'https://images.unsplash.com/photo-1507413245164-6160d8298b31?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80';
  category.add(categoryModel);
  categoryModel = new CategoryModel();

  //third
  categoryModel.categoryName = 'Sports';
  categoryModel.imageUrl = 'https://images.unsplash.com/photo-1552674605-db6ffd4facb5?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80';
  category.add(categoryModel);
  categoryModel = new CategoryModel();

  //fourth
  categoryModel.categoryName = 'entertainment';
  categoryModel.imageUrl = 'https://images.unsplash.com/photo-1529107386315-e1a2ed48a620?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80';
  category.add(categoryModel);
  categoryModel = new CategoryModel();

  //fourth
  categoryModel.categoryName = 'Technology';
  categoryModel.imageUrl = 'https://images.unsplash.com/photo-1519389950473-47ba0277781c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80';
  category.add(categoryModel);
  categoryModel = new CategoryModel();



  return category;
}