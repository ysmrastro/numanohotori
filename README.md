# numanohotori.github.io

「沼のほとり」の公式サイトです。

## サイトURL

https://numanohotori.github.io

## ローカルでの確認方法

```bash
bundle install
bundle exec jekyll serve
```

ブラウザで http://localhost:4000 にアクセスしてください。

## ページ構成

| ファイル | ページ |
|----------|--------|
| `index.md` | トップページ |
| `about.md` | 沼のほとりとは |
| `events.md` | イベント情報 |
| `gallery.md` | 天体写真ギャラリー |
| `contact.md` | お問い合わせ・LINE誘導 |

## 写真の追加

1. `assets/images/` に画像ファイルを配置
2. `gallery.md` に Markdown 形式で追記
3. コミット & プッシュ → 自動的にサイトに反映
