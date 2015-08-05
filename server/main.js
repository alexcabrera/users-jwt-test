jwt     = require('jsonwebtoken');
restify = require('restify');
SECRET  = 'hush'

var server = restify.createServer();

server.pre(restify.CORS());
server.use(restify.bodyParser());
server.use(restify.queryParser());
server.use(restify.fullResponse());

server.post('/login', function(req, res, next){
    var username = req.body.username;
    var password = req.body.password;

    console.log(username, password);

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
    next();
});

server.get('/verify', function(req, res, next){
    var token = req.headers.authorization;
    var decoded = jwt.verify(token, SECRET);
    res.send(decoded);
    next();
});

server.listen(8080, function(){
    console.log(server.name + ' listening at ' + server.url);
});
