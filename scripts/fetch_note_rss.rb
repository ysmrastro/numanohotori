#!/usr/bin/env ruby
# frozen_string_literal: true

# noteのRSSフィードを取得して _data/note_posts.yml に変換するスクリプト。
# GitHub Actions（.github/workflows/fetch-note.yml）から定期実行される。
# ローカルで実行する場合: ruby scripts/fetch_note_rss.rb

require "net/http"
require "rexml/document"
require "yaml"
require "time"

FEED_URL = "https://note.com/ysmr3104astro/rss"
OUTPUT_PATH = File.expand_path("../_data/note_posts.yml", __dir__)
MAX_POSTS = 2

def fetch(url, limit = 3)
  raise "リダイレクトが多すぎます" if limit.zero?

  res = Net::HTTP.get_response(URI(url))
  case res
  when Net::HTTPSuccess then res.body
  when Net::HTTPRedirection then fetch(res["location"], limit - 1)
  else raise "RSS取得に失敗しました: #{res.code} #{res.message}"
  end
end

xml = fetch(FEED_URL)
doc = REXML::Document.new(xml)

posts = doc.get_elements("//item").first(MAX_POSTS).map do |item|
  title = item.elements["title"]&.text.to_s.strip
  url = item.elements["link"]&.text.to_s.strip
  pub_date = item.elements["pubDate"]&.text.to_s
  thumb_el = item.elements["media:thumbnail"]
  thumbnail = thumb_el&.text.to_s.strip
  thumbnail = thumb_el.attributes["url"].to_s.strip if thumbnail.empty? && thumb_el

  raise "title または link が空のitemがあります" if title.empty? || url.empty?

  post = {
    "title" => title,
    "url" => url,
    "date" => Time.parse(pub_date).strftime("%Y-%m-%d"),
  }
  post["thumbnail"] = thumbnail unless thumbnail.empty?
  post
end

raise "記事が1件も取得できませんでした" if posts.empty?

File.write(OUTPUT_PATH, posts.to_yaml)
puts "#{posts.size}件の記事を #{OUTPUT_PATH} に書き出しました"
