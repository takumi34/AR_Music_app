# AR音ゲーアプリ(製作中）

ARkitを使ってSwiftで作ります。　　

## ゲーム仕様　　
次々と落ちてくる箱を指定の範囲でタップすると音が鳴る。タップしても音の鳴らない箱も落ちてくるので、ARの良さを生かして、実際にプレイヤーが動いて、その手前にある箱を避けて目的の箱をタップする　　

### 作業工程

1. 平面検知　　
2. 平面検知した面に沿って平面ノード1（厚み0.01m）作る  
3. 平面検知した面の0.17m上に平面ノード2（厚み0.06m, 白色）を作る　
4. 箱１（赤色）と箱２（青色）を作る（箱１と箱２は平面ノード１と衝突するように設定）
5. 箱１と箱２が0.3m上からランダムで落ちてくる（物理特性） 
***
下記、製作予定  
6. 箱１が平面ノード２と接触している間（高さの範囲指定）に箱１をタップすると音が鳴る　 　
7. 音が鳴ると同時にエフェクトを入れる　　
8. カウンター（タップした箱の数）、タイマー（30秒で終了）の設置　　











