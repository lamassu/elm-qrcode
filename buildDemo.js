var fs = require('fs');
var exec = require('child_process').exec;
var makeCmd = 'elm-make demo/Main.elm --output main.js';
var uglifyCmd = 'uglifyjs main.js --output main.js';

exec(makeCmd, elm_make);


function elm_make (error, stdout, stderr) {
	if (error) {
		console.error(error);
		return;
	}

	console.log(stdout);
	exec(uglifyCmd, uglify);
};

function uglify (error, stdout, stderr) {
	if (error) {
		console.error(error);
		return;
	}

	console.log("Successfully uglifyed main.js");
	fs.writeFileSync("index.html", fs.readFileSync("demo/index.html"));
};



