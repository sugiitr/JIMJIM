# JIMちゃん リンク集

lit.link 風のリンク集ページです。

## ファイル構成

```
.
├── index.html        # メインページ
├── css/
│   └── style.css     # スタイルシート
├── images/
│   └── profile.jpg   # プロフィール画像（要配置）
└── README.md
```

## カスタマイズ

### プロフィール画像
`images/profile.jpg` に画像を配置してください。未配置の場合はプレースホルダーアイコンが表示されます。

### リンクURL
`index.html` 内の各 `<a href="#">` の `#` を実際のURLに変更してください。

### 自己紹介文
`index.html` の `<p class="profile-bio">` 内のテキストを書き換えてください。

## ローカル確認

```bash
# Node.js
npx serve .

# Python
python -m http.server 8000

# live-server
npx live-server --port=8080
```
