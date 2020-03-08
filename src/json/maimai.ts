import * as fs from 'fs'
import {JSDOM} from 'jsdom'

const html = fs.readFileSync('song.html')
const document = new JSDOM(html).window.document

const song = Array.from(
  document.getElementsByClassName('song')[0].querySelectorAll(':scope > tr'),
  (tr: any) => {
    const e = Array.from(tr.children, (td: any) => td.textContent.replace(/\n/g, '')).map(e =>
      e.replace(/^\s*(.*?)\s*$/, '$1')
    )
    return {
      title: e[0],
      genre: e[1].replace('＆', '&'),
      version: e[2],
      difficulty: e[3],
      level: e[4],
      format: e[5],
    }
  }
)
fs.writeFileSync('song.json', JSON.stringify(song))
console.log('I wrote in it.')
