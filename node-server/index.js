const express = require("express");

const app = express();

const root = './node-angular';

app.use(express.static(publicweb));


app.get('*', (req, res) => {
  res.sendFile(`index.html`, { root: root });
});


app.listen(3000, function(){
    console.log("Server runing on 3000")
})

