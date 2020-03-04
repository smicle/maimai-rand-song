mkdir 'オンゲキ&CHUNITHM'
cd 'オンゲキ&CHUNITHM'

$song_list = @(
  ("200219_img2.jpg", "タテマエと本心の大乱闘"),
  ("200219_img3.jpg", "UTAKATA"),
  ("200219_img1.jpg", "最強 the サマータイム!!!!!"),
  ("200109_img4.jpg", "立川浄穢捕物帳"),
  ("200109_img3.jpg", "BOKUTO"),
  ("191114_img3.jpg", "Change Our MIRAI！"),
  ("191114_img2.jpg", "管弦楽組曲 第3番 ニ長調「第2曲（G線上のアリア）」BWV.1068-2"),
  ("191114_img1.jpg", "Agitation！"),
  ("191023_img2.jpg", "Titania"),
  ("191023_img1.jpg", "玩具狂奏曲 -終焉-"),
  ("190725_img1.jpg", "STARTLINER"),
  ("190725_img2.jpg", "Jump!! Jump!! Jump!!"),
  ("190711_620.jpg", "-OutsideRRequieM-"),
  ("190711_621.jpg", "イロトリドリのメロディ"),
  ("190711_622.jpg", "奏者はただ背中と提琴で語るのみ"),
  ("190711_646.jpg", "Kattobi KEIKYU Rider"),
  ("190711_648.jpg", "TiamaTF minor"),
  ("190711_586.jpg", "怒槌"),
  ("190711_589.jpg", "My First Phone"),
  ("190711_578.jpg", "We Gonna Journey"),
  ("190711_575.jpg", "Help me, あーりん！"),
  ("190711_576.jpg", "なるとなぎのパーフェクトロックンロール教室"),
  ("190711_577.jpg", "あねぺったん"),
  ("190711_564.jpg", "Xevel"),
  ("190711_543.jpg", "Session High?"),
  ("190711_544.jpg", "World Vanquisher"),
  ("190711_529.jpg", "エンドマークに希望と涙を添えて"),
  ("190711_508.jpg", "猫祭り"),
  ("190711_509.jpg", "TRUST"),
  ("190711_510.jpg", "Still"),
  ("190711_531.jpg", "Bang Babang Bang!!!"),
  ("190711_532.jpg", "Tic Tac DREAMIN’"),
  ("190711_533.jpg", "SPICY SWINGY STYLE"),
  ("190711_470.jpg", "My Dearest Song"),
  ("190711_471.jpg", "猛進ソリストライフ！"),
  ("190711_453.jpg", "心象蜃気楼"),
  ("190711_454.jpg", "光線チューニング"),
  ("190711_436.jpg", "The wheel to the right"),
  ("190711_435.jpg", "その群青が愛しかったようだった"),
  ("190711_397.jpg", "私の中の幻想的世界観及びその顕現を想起させたある現実での出来事に関する一考察"),
  ("190711_418.jpg", "ドキドキDREAM!!!"),
  ("190711_398.jpg", "DETARAME ROCK&amp;ROLL THEORY"),
  ("190711_396.jpg", "フォルテシモBELL"),
  ("190711_379.jpg", "ハート・ビート"),
  ("190711_378.jpg", "brilliant better"),
  ("190711_348.jpg", "Infantoon Fantasy"),
  ("190711_380.jpg", "Invitation"),
  ("190711_331.jpg", "無敵We are one!!"),
  ("190711_330.jpg", "閃鋼のブリューナク"),
  ("190711_325.jpg", "Counselor"),
  ("190711_329.jpg", "幾四音-Ixion-")
)

foreach ($i in $song_list) {
	$str = "curl 'https://maimai.sega.jp/storage/DX_jacket/" + $i[0] + "' -o `"" + $i[1] + ".jpg`""
	Invoke-Expression $str
}

cd ../
