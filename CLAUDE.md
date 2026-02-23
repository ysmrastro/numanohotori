# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## プロジェクト概要

「沼のほとり」— 星空をゆるく楽しむ天文ファンコミュニティの公式Webサイト。
GitHub Pages + Jekyll で静的サイトとしてホスティング。

- サイトURL: https://ysmrastro.github.io/numanohotori/
- テーマ: [Minimal Mistakes](https://mmistakes.github.io/minimal-mistakes/)（remote_theme、ダークスキン）

## 開発コマンド

```bash
bundle install          # 依存関係インストール
bundle exec jekyll serve  # ローカルプレビュー → http://localhost:4000
```

テストやリンター等の設定はない。変更確認はローカルプレビューで行う。

## アーキテクチャ

### ページ構成

各ページはルート直下のMarkdownファイル。レイアウトは `_config.yml` の `defaults` で `single` をデフォルト指定、トップページのみ `home` レイアウト。

- `index.md` — トップページ（お知らせ、LINE誘導）
- `about.md` — コンセプト紹介
- `events.md` — イベント情報
- `gallery.md` — 天体写真ギャラリー（現在はAstroBinへの外部リンク）
- `contact.md` — お問い合わせ（LINE / Instagram / AstroBin / GitHub）
- `flyer.html` — A4印刷用チラシ（独立HTMLページ、`layout: null`）

### ナビゲーション

`_data/navigation.yml` でヘッダーナビを定義。ページ追加時はここも更新する。

### カスタマイズ

- `assets/css/custom.scss` — Minimal Mistakesのスタイル上書き（夜空テーマカラー `#0d1117`、リンク色 `#7eb8da`）
- `_includes/head/custom.html` — faviconの設定

### 画像・アセット

- `assets/images/` — サイトで使用する画像（ロゴ、QRコード、フライヤー画像等）
- `assets/docs/` — PDF等のドキュメント
- `_brand/` — ブランドアセット原本の保管場所（Jekyllビルドからは除外される `_` プレフィクス）

### デプロイ

mainブランチへのpushでGitHub Pagesが自動ビルド・デプロイ。

## コンテンツ編集時の注意

- Minimal Mistakesのクラス記法を使用: `{: .btn .btn--primary}`, `{: .align-center}`, `{: .notice}` 等
- 外部リンクを別タブで開く場合: `{:target="_blank"}`
- 画像追加は `assets/images/` に配置してMarkdownで参照
