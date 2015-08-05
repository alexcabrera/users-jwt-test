# Remote User Authentication with JSON Web Tokens

This repository provides an simple example of a user authentication flow using JSON Web Tokens (JWT). It includes a sample authentication server, housed under the `server/` subdirectory; and a client application built atop the [Marquee Static SDK](https://github.com/marquee/static-sdk), contained in the `client/` subdirectory.

## Requirements

The two applications within this repository are designed to run under the 0.10.x branch of Node.js. If you're using the [Node Version Manager](https://github.com/creationix/nvm), simply run `nvm use` under the root project directory.

## Usage

The best way to run the example is by opening two terminal panes and navigating to the `./server` directory in one and to `./client` in the other.

From within each directory, run the `npm start` command. This will install the dependencies for each application and run up a development servers.

![usage.gif](https://slack-files.com/files-pub/T025HR57G-F08LN7ZPW-7b57ffcff7/usage.gif)

Once both servers are running, navigate to [http://localhost:5000](http://localhost:5000) to access the client application interface. You'll also want to have your browser's inspector open so you can see the token being stored.

![browser](https://slack-files.com/files-pub/T025HR57G-F08LNQA8M-dd081404c5/screen_shot_2015-08-05_at_2.16.59_pm.png)

Click the **Sign In Button** to open the **Login Form**. The default username and password are already populated, so you just have to click the submit button to make the API call to the authentication server. The authentication server is hardcoded to accept this username/password combination and will return a JSON Web Token to the client application.

_Excerpt from [`server/main.js`](https://github.com/alexcabrera/users-jwt-test/blob/master/server/main.js#L13-L22):_
```js
if(username == 'dev' && password == 'dev') {
    var payload = {
        'uid': 1,
        'publications': ['pubA', 'pubB', 'pubC']
    }
    var token = jwt.sign(payload, SECRET);
    res.send(token);
} else {
    res.send(403);
}
```

The client then stores the JWT in session storage and can use it to make future API requests:

_Excerpt from [`client/assets/Login.cjsx`](https://github.com/alexcabrera/users-jwt-test/blob/master/client/assets/Login.cjsx#L21-L32):_

```coffee
request.post('http://localhost:8080/login')
    .type('json')
    .send({
        username: username_el.value
        password: password_el.value
    })
    .end (err, res) =>
        unless err
            sessionStorage.token = res.body
```


## TODO

- [ ] Add a create user endpoint for the auth server
- [ ] Add a create user interface in the client application
