# NAGANO-cake
<img width="668" alt="FF6A265F-D2E0-4B24-A013-338F68CE16C0" src="https://github.com/TEAM-OFA/TEAM-OFA/assets/166374884/efefc7a8-4332-41ba-88a7-edd50f0cb806">


# 概要
長野県にある小さな洋菓子店「ながのCAKE」の商品を通販するためのECサイト開発。

# ER図
<img width="1041" alt="スクリーンショット 2024-06-20 13 10 09" src="https://github.com/TEAM-OFA/TEAM-OFA/assets/166374884/6a347bdc-691e-4941-bd31-f5060d12d193">

# アプリケーションの詳細な説明・実装機能
・顧客が操作する会員側機能と、店側が操作する管理側機能がある。　　

・注文に応じて製作する受注生産型。

[会員側実装機能]

・サイトの閲覧はログインなしで行える。

・カートへの商品追加はログイン時のみ可能

・ログイン時[Welcome to NAGANO-Cake!ようこそ、〇〇様!]と登録名（カナ）で表示。

・会員は配送先を複数登録しておくことが可能

・会員はマイページから下記が行える

　・ユーザ情報の閲覧・編集

　・注文履歴の閲覧

　・配送先の閲覧・編集

商品は税込価格で表⽰されます。（消費税 10％）

[管理者側(店側)実装機能]

管理者用メールアドレスとパスワードでログインできる（sheeds.rb使用)

商品の新規追加、編集、閲覧、販売ステータス（販売中・販売停止）を選択でき販売停止選択時は会員側ではカート追加は不可。

会員登録されているユーザ情報の閲覧、編集、退会処理が行える。

ユーザの注文履歴が一覧・詳細表示できる。

注文ごとに注文ステータスの更新、注文商品ごとに製作ステータスの更新ができる。

[各種ステータス]

<img width="599" alt="スクリーンショット 2024-06-20 13 15 45" src="https://github.com/TEAM-OFA/TEAM-OFA/assets/166374884/05afcab1-a488-42d4-aff9-e5b007776561">


# 使用方法

### 管理側
まず管理者登録をお願いいたします。登録が完了しますと、管理者機能が使用可能になります。

ジャンルと商品を登録していただきますと、顧客サイトで閲覧が可能になります。

商品情報の編集や販売状況を変更することが可能です。販売停止中を選択すると顧客側では商品の閲覧は可能ですがカートに追加することができない仕様になっています。

顧客から注文がありますと、注文一覧に表示され、詳細が確認できます。入金が確認できたら注文ステータスを変更し、製作が終了しましたら製作ステータスを変更してください。（それぞれ連動して変更が反映されます）

顧客一覧から顧客詳細の確認・変更・退会が可能です。

### 顧客側

はじめに会員登録をお願い致します。登録なしに商品を閲覧することは可能です。

注文を行うには会員登録が必要になります。

右上にある検索欄から商品名で検索して頂くことも可能です。

お好きな商品が見つかりましたらカートに入れていただき、注文情報入力へお進みください。

配送先を複数保存することができ注文時選択していただけます。

支払い方法はクレジットカードもしくは銀行振り込みから選択していただき、注文確定を押すと注文が完了いたします。

# 開発環境
cloud9

ruby on rails

# 使用言語

HTML&CSS

ruby

Rails 6.1.7.8

# Gem

devise

kaminari

rails-i18n

bootstrap-sass

# 作成者

チームOFA（one for all）
