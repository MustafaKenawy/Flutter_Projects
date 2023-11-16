// ignore_for_file: prefer_const_constructors, unnecessary_new, curly_braces_in_flow_control_structures

import 'package:flutter/material.dart';
import 'package:shop/samples/product.dart';
import 'package:provider/provider.dart';
import 'package:shop/Providers/products.dart';

class Editing extends StatefulWidget {
  const Editing({Key? key}) : super(key: key);
  static const routeName = '/editing';

  @override
  _EditingState createState() => _EditingState();
}

class _EditingState extends State<Editing> {
  String imgUrl = '';
  final _descriptionFocusNode = FocusNode();
  final _imgFocusNode = FocusNode();
  final _form = GlobalKey<FormState>();
  Product editedProduct =
      Product(imageUrl: '', title: '', description: '', id: '', price: 0);

  @override
  void dispose() {
    _descriptionFocusNode.dispose();
    _imgFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments;
    if (args != '') {
      editedProduct.id = args.toString();
    }
    var provided = Provider.of<Products>(context,listen: false);
    void _saveForm() {
      _form.currentState!.save();
      provided.add_items(editedProduct);
      Navigator.of(context).pop();
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Product'),
        actions: [
          IconButton(onPressed: _saveForm, icon: Icon(Icons.save_rounded))
        ],
      ),
      body: Form(
        key: _form,
        autovalidateMode: AutovalidateMode.always,
        child: Container(
          margin: EdgeInsets.symmetric(
            horizontal: 15,
          ),
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              Expanded(
                  child: ListView(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: 'Name',
                        labelStyle: TextStyle(fontSize: 18),
                        border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(15.0),
                        )),
                    onFieldSubmitted: (_) {
                      FocusScope.of(context)
                          .requestFocus(_descriptionFocusNode);
                    },
                    onSaved: (val) {
                      editedProduct.title = val!;
                    },
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.multiline,
                    maxLines: 3,
                    focusNode: _descriptionFocusNode,
                    decoration: InputDecoration(
                        labelText: 'Description',
                        labelStyle: TextStyle(fontSize: 18),
                        border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(15.0),
                        )),
                    validator: (val) {
                      if (val!.length < 10) return "Less than 10 Chars ";
                      return null;
                    },
                    onSaved: (val) {
                      editedProduct.description = val!;
                    },
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: 'Price',
                        labelStyle: TextStyle(fontSize: 18),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        )),
                    keyboardType: TextInputType.number,
                    onFieldSubmitted: (_) {
                      FocusScope.of(context).requestFocus(_imgFocusNode);
                    },
                    validator: (val) {
                      if (double.tryParse(val!) == null)
                        return 'Enter Valid number';
                      if (double.parse(val) <= 0)
                        return "Price can't be Zero";
                      else
                        return null;
                    },
                    onSaved: (val) {
                      editedProduct.price = double.parse(val!);
                    },
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    focusNode: _imgFocusNode,
                    decoration: InputDecoration(
                        labelText: 'Image-URl',
                        labelStyle: TextStyle(fontSize: 18),
                        border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(15.0),
                        )),
                    keyboardType: TextInputType.url,
                    textInputAction: TextInputAction.done,
                    onFieldSubmitted: (_) {
                      _saveForm();
                    },
                    validator: (val) {
                      if (!(val!.startsWith('http') || val.startsWith('https')))
                        return 'Enter valid URL';
                      if (!(val.endsWith('png') || val.endsWith('jpg')))
                        return 'not a valid image URL';
                      return null;
                    },
                    onSaved: (val) {
                      editedProduct.imageUrl = val!;
                    },
                  ),
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}
