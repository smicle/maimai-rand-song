"use strict";
exports.__esModule = true;
var fs = require("fs");
var jsdom_1 = require("jsdom");
var del = JSON.parse(fs.readFileSync('delete.json'));
var html = fs.readFileSync('song.html');
var document = new jsdom_1.JSDOM(html).window.document;
var song = Array.from(document.getElementsByClassName('song')[0].querySelectorAll(':scope > tr'), function (tr) {
    var e = Array.from(tr.children, function (td) { return td.textContent.replace(/\n/g, ''); }).map(function (e) {
        return e.replace(/^\s*(.*?)\s*$/, '$1');
    });
    return {
        title: e[0],
        genre: e[1].replace('＆', '&'),
        version: e[2],
        difficulty: e[3],
        level: e[4],
        format: e[5]
    };
}).filter(function (s) { return !del.find(function (d) { return d === s.title; }); });
fs.writeFileSync('song.json', JSON.stringify(song));
console.log('I wrote in it.');
