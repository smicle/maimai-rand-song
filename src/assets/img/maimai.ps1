mkdir 'オンゲキ&CHUNITHM'
cd 'オンゲキ&CHUNITHM'

$song_list = @(
  ("200219_img2.jpg", "タテマエと本心の大乱闘")
)

foreach ($i in $song_list) {
	$str = "curl 'https://maimai.sega.jp/storage/DX_jacket/" + $i[0] + "' -o `"" + $i[1] + ".jpg`""
	Invoke-Expression $str
}

cd ../
