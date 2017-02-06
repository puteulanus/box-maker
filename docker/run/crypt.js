let bcrypt = require('bcrypt-nodejs');

if( process.argv[2] ){
    bcrypt.genSalt(10, (err, salt) => {
        bcrypt.hash( process.argv[2], salt, null, (err, hash) => { 
            console.log(hash);
        });
    });
}