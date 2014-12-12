var fs = require('fs');
var mkdirp = require('mkdirp');
var opencc = require('opencc');
var path = require('path');
var recursiveDir = require('recursive-readdir');

var converter = new opencc('t2s.json');

var getTarget = function(filename) {
  return 'zhs' + filename.substring(3);
};

recursiveDir('zht', function(err, files) {
  var numFinished = 0;
  files.forEach(function(file) {
    fs.readFile(file, function(err, data) {
      converter.convert(data, function(err, converted) {
        // Write file
        var target = getTarget(file);
        var targetDir = path.dirname(target);
        mkdirp(targetDir, function(err) {
          if (path.extname(target) == '.md') {
            data = converted;
          }
          fs.writeFile(target, data, function(err) {
            console.log(target);
            numFinished++;
            if (numFinished == files.length) {
              console.log('Done');
            }
          });
        });
      });
    });
  });
});
