# flutter_login_tab

A new Flutter project for Login view.

```
Container(
    margin: EdgeInsets.only(left: 16.0),
    child: TextFormField(
      controller: _username,
      decoration: InputDecoration(
          hintText: '请输入工号',
          filled: true,
          prefixIcon: Icon(
            Icons.account_box,
            size: 28.0,
          ),
          suffixIcon: IconButton(
              icon: Icon(Icons.remove),
              onPressed: () {
                debugPrint('222');
              })),
    ),
  ),
  
  #Hide and Show Password Flutter
  
   new ListTile(
    leading: const Icon(Icons.phone),
    title: new TextField(
      controller: password,
      obscureText: _obscureText,
      maxLength: 150,
      decoration: new InputDecoration(
        border: OutlineInputBorder(),
        hintText: "Password",
        filled: true,
        suffixIcon: IconButton(
            icon: Icon(Icons.remove_red_eye),
            onPressed: _toggle
        ),
      ),
      keyboardType: TextInputType.text,
      style: TextStyle(color: Colors.red, fontWeight: FontWeight.normal),
    ),
  ),
  ```
