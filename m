Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CB72B59846D
	for <lists+linux-doc@lfdr.de>; Thu, 18 Aug 2022 15:42:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245174AbiHRNjg (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 18 Aug 2022 09:39:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245147AbiHRNjP (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 18 Aug 2022 09:39:15 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 801755AC4B;
        Thu, 18 Aug 2022 06:39:10 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id DFEBC616C5;
        Thu, 18 Aug 2022 13:39:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E058C4347C;
        Thu, 18 Aug 2022 13:39:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1660829948;
        bh=cseEtMxLoBOZmCZ/5sxgI7f0uh+CuGoOfH2ONPcxTTQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=smUmKP/AML5uao6ORVdIbzGUiHgECDzv2JxQ/QYsYO4ZI70JBaXaf9FO33sH0LIla
         z13YTIUoFwBAs7KFnk9D72TUsbh28GaW9FqEvkhZYWHZq858YExhHsCQYjUuoXT+0p
         +gzWDjQTpFgiWt7POWFp+VIzGaaC2ljoqynOCjkZc0hhevBByK99mysNRmQwhldzoU
         s+pQAvrSY/SEt6vy7L5bdawfzaiFVZX+f9WGr6zaXm6PYmdnLdz6CiFTfapazHMSrn
         HGwCpfEY7vlN3TVCKFHVFKMefryjnZc21zoqTP0hjwgyxnfu41CUpRbTkOagsJ9i4r
         c5EcO6KotnwNQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.95)
        (envelope-from <mchehab@kernel.org>)
        id 1oOfjl-00AY7M-6l;
        Thu, 18 Aug 2022 15:39:05 +0200
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>, corbet@lwn.net
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Akira Yokosawa <akiyks@gmail.com>,
        Jiri Kosina <jkosina@suse.cz>,
        Kosuke Fujimoto <fujimotokosuke0@gmail.com>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        Tsugikazu Shibata <shibata@linuxfoundation.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 03/13] docs: ja_JP: remove SubmittingPatches
Date:   Thu, 18 Aug 2022 15:38:49 +0200
Message-Id: <2902bc232970588d4ca59b5df0afbabb0c345d6f.1660829433.git.mchehab@kernel.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <cover.1660829433.git.mchehab@kernel.org>
References: <cover.1660829433.git.mchehab@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This file is outdated as the original document was removed. So, drop
it too.

Fixes: 9db370de2780 ("docs: process: remove outdated submitting-drivers.rst")
Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---

See [PATCH 00/13] at: https://lore.kernel.org/all/cover.1660829433.git.mchehab@kernel.org/

 .../translations/ja_JP/SubmittingPatches      | 722 ------------------
 1 file changed, 722 deletions(-)
 delete mode 100644 Documentation/translations/ja_JP/SubmittingPatches

diff --git a/Documentation/translations/ja_JP/SubmittingPatches b/Documentation/translations/ja_JP/SubmittingPatches
deleted file mode 100644
index 66ce0d8b0526..000000000000
--- a/Documentation/translations/ja_JP/SubmittingPatches
+++ /dev/null
@@ -1,722 +0,0 @@
-NOTE:
-This is a version of Documentation/process/submitting-patches.rst into Japanese.
-This document is maintained by Keiichi KII <k-keiichi@bx.jp.nec.com>
-and the JF Project team <http://www.linux.or.jp/JF/>.
-If you find any difference between this document and the original file
-or a problem with the translation,
-please contact the maintainer of this file or JF project.
-
-Please also note that the purpose of this file is to be easier to read
-for non English (read: Japanese) speakers and is not intended as a
-fork. So if you have any comments or updates of this file, please try
-to update the original English file first.
-
-Last Updated: 2011/06/09
-
-==================================
-これは、
-linux-2.6.39/Documentation/process/submitting-patches.rst の和訳
-です。
-翻訳団体： JF プロジェクト < http://www.linux.or.jp/JF/ >
-翻訳日： 2011/06/09
-翻訳者： Keiichi Kii <k-keiichi at bx dot jp dot nec dot com>
-校正者： Masanari Kobayashi さん <zap03216 at nifty dot ne dot jp>
-         Matsukura さん <nbh--mats at nifty dot com>
-         Takeshi Hamasaki さん <hmatrjp at users dot sourceforge dot jp>
-==================================
-
-        Linux カーネルに変更を加えるための Howto
-        又は
-        かの Linus Torvalds の取り扱い説明書
-
-Linux カーネルに変更を加えたいと思っている個人又は会社にとって、パッ
-チの投稿に関連した仕組みに慣れていなければ、その過程は時々みなさんを
-おじけづかせることもあります。この文章はあなたの変更を大いに受け入れ
-てもらえやすくする提案を集めたものです。
-
-コードを投稿する前に、Documentation/process/submit-checklist.rst の項目リストに目
-を通してチェックしてください。もしあなたがドライバーを投稿しようとし
-ているなら、Documentation/process/submitting-drivers.rst にも目を通してください。
-
---------------------------------------------
-セクション1 パッチの作り方と送り方
---------------------------------------------
-
-1) 「 diff -up 」
-------------
-
-パッチの作成には「 diff -up 」又は「 diff -uprN 」を使ってください。
-
-Linux カーネルに対する全ての変更は diff(1) コマンドによるパッチの形式で
-生成してください。パッチを作成するときには、diff(1) コマンドに「 -u 」引
-数を指定して、unified 形式のパッチを作成することを確認してください。また、
-変更がどの C 関数で行われたのかを表示する「 -p 」引数を使ってください。
-この引数は生成した差分をずっと読みやすくしてくれます。パッチは Linux
-カーネルソースの中のサブディレクトリではなく Linux カーネルソースのルート
-ディレクトリを基準にしないといけません。
-
-1個のファイルについてのパッチを作成するためには、ほとんどの場合、
-以下の作業を行えば十分です。
-
-	SRCTREE=linux-2.6
-	MYFILE=drivers/net/mydriver.c
-
-	cd $SRCTREE
-	cp $MYFILE $MYFILE.orig
-	vi $MYFILE	# make your change
-	cd ..
-	diff -up $SRCTREE/$MYFILE{.orig,} > /tmp/patch
-
-複数のファイルについてのパッチを作成するためには、素の( vanilla )、す
-なわち変更を加えてない Linux カーネルを展開し、自分の Linux カーネル
-ソースとの差分を生成しないといけません。例えば、
-
-	MYSRC=/devel/linux-2.6
-
-	tar xvfz linux-2.6.12.tar.gz
-	mv linux-2.6.12 linux-2.6.12-vanilla
-	diff -uprN -X linux-2.6.12-vanilla/Documentation/dontdiff \
-		linux-2.6.12-vanilla $MYSRC > /tmp/patch
-
-dontdiff ファイルには Linux カーネルのビルドプロセスの過程で生成された
-ファイルの一覧がのっています。そして、それらはパッチを生成する diff(1)
-コマンドで無視されるべきです。dontdiff ファイルは 2.6.12 以後のバージョ
-ンの Linux カーネルソースツリーに含まれています。
-
-投稿するパッチの中に関係のない余分なファイルが含まれていないことを確
-認してください。diff(1) コマンドで生成したパッチがあなたの意図したとお
-りのものであることを確認してください。
-
-もしあなたのパッチが多くの差分を生み出すのであれば、あなたはパッチ
-を意味のあるひとまとまりごとに分けたいと思うかもしれません。
-これは他のカーネル開発者にとってレビューしやすくなるので、あなたの
-パッチを受け入れてもらうためにはとても重要なことです。これを補助でき
-る多くのスクリプトがあります。
-
-Quilt:
-http://savannah.nongnu.org/projects/quilt
-
-2) パッチに対する説明
-
-パッチの中の変更点に対する技術的な詳細について説明してください。
-
-説明はできる限り具体的に。もっとも悪い説明は「ドライバー X を更新」、
-「ドライバー X に対するバグフィックス」あるいは「このパッチはサブシス
-テム X に対する更新を含んでいます。どうか取り入れてください。」などです。
-
-パッチの説明を Linux カーネルのソースコードマネジメントシステム「 git 」の
-コミットログとして簡単に引用できる形で書けば、メンテナから感謝されるでしょう。
-以下の #15 を見てください。
-
-説明が長くなりだしたのであれば、おそらくそれはパッチを分ける必要がある
-という兆候です。次の #3 を見てください。
-
-パッチ(シリーズ)を(再)投稿する時、十分なパッチの説明とそのパッチが必要な理由を
-パッチに含めてください。ただ「これはパッチ(シリーズ)のバージョン N」とだけ
-書かないでください。そして、パッチをマージする人にパッチの説明を探させそれを
-パッチに追記させるため、過去のバージョンのパッチやそのパッチの URL を参照する
-手間をかけさせないでください。
-つまり、パッチシリーズとその説明は一緒にあるべきです。これはパッチをマージする
-人、レビューする人、どちらのためにもなります。レビューする人の中には、おそらく
-過去のバージョンのパッチを受け取ってもいない人がいます。
-
-登録済みのバグエントリを修正するパッチであれば、そのバグエントリを示すバグ ID
-や URL を明記してください。
-
-特定のコミットを参照したい場合は、その SHA-1 ID だけでなく、一行サマリ
-も含めてください。それにより、それが何に関するコミットなのかがレビューする
-人にわかりやすくなります。
-例 (英文のママ):
-
-       Commit e21d2170f36602ae2708 ("video: remove unnecessary
-       platform_set_drvdata()") removed the unnecessary
-       platform_set_drvdata(), but left the variable "dev" unused,
-       delete it.
-
-
-3) パッチの分割
-
-意味のあるひとまとまりごとに変更を個々のパッチファイルに分けてください。
-
-例えば、もし1つのドライバーに対するバグフィックスとパフォーマンス強
-化の両方の変更を含んでいるのであれば、その変更を2つ以上のパッチに分
-けてください。もし変更箇所に API の更新と、その新しい API を使う新たな
-ドライバーが含まれているなら、2つのパッチに分けてください。
-
-一方で、もしあなたが多数のファイルに対して意味的に同じ1つの変更を加え
-るのであれば、その変更を1つのパッチにまとめてください。言いかえると、
-意味的に同じ1つの変更は1つのパッチの中に含まれます。
-
-あるパッチが変更を完結させるために他のパッチに依存していたとしても、
-それは問題ありません。パッチの説明の中で「このパッチはパッチ X に依存
-している」と簡単に注意書きをつけてください。
-
-もしパッチをより小さなパッチの集合に凝縮することができないなら、まずは
-15かそこらのパッチを送り、そのレビューと統合を待って下さい。
-
-4) パッチのスタイルチェック
-
-あなたのパッチが基本的な( Linux カーネルの)コーディングスタイルに違反し
-ていないかをチェックして下さい。その詳細を Documentation/process/coding-style.rst で
-見つけることができます。コーディングスタイルの違反はレビューする人の
-時間を無駄にするだけなので、恐らくあなたのパッチは読まれることすらなく
-拒否されるでしょう。
-
-あなたはパッチを投稿する前に最低限パッチスタイルチェッカー
-( scripts/checkpatch.pl )を利用してパッチをチェックすべきです。
-もしパッチに違反がのこっているならば、それらの全てについてあなたは正当な
-理由を示せるようにしておく必要があります。
-
-5) 電子メールの宛先の選び方
-
-MAINTAINERS ファイルとソースコードに目を通してください。そして、その変
-更がメンテナのいる特定のサブシステムに加えられるものであることが分か
-れば、その人に電子メールを送ってください。その際
-./scripts/get_maintainers.pl のスクリプトが有用です。
-
-もし、メンテナが載っていなかったり、メンテナからの応答がないなら、
-LKML ( linux-kernel@vger.kernel.org )へパッチを送ってください。ほとんど
-のカーネル開発者はこのメーリングリストに目を通しており、変更に対して
-コメントを得ることができます。
-
-15個より多くのパッチを同時に vger.kernel.org のメーリングリストへ送らな
-いでください!!!
-
-Linus Torvalds は Linux カーネルに入る全ての変更に対する最終的な意思決定者
-です。電子メールアドレスは torvalds@linux-foundation.org になります。彼は
-多くの電子メールを受け取っているため、できる限り彼に電子メールを送るのは
-避けるべきです。
-
-バグフィックスであったり、自明な変更であったり、話し合いをほとんど
-必要としないパッチは Linus へ電子メールを送るか CC しなければなりません。
-話し合いを必要としたり、明確なアドバンテージがないパッチは、通常まず
-は LKML へ送られるべきです。パッチが議論された後にだけ、そのパッチを
-Linus へ送るべきです。
-
-6) CC (カーボンコピー)先の選び方
-
-特に理由がないなら、LKML にも CC してください。
-
-Linus 以外のカーネル開発者は変更に気づく必要があり、その結果、彼らはそ
-の変更に対してコメントをくれたり、コードに対してレビューや提案をくれ
-るかもしれません。LKML とは Linux カーネル開発者にとって一番中心的なメー
-リングリストです。USB やフレームバッファデバイスや VFS や SCSI サブシステ
-ムなどの特定のサブシステムに関するメーリングリストもあります。あなた
-の変更に、はっきりと関連のあるメーリングリストについて知りたければ
-MAINTAINERS ファイルを参照してください。
-
-VGER.KERNEL.ORG でホスティングされているメーリングリストの一覧が下記の
-サイトに載っています。
-<http://vger.kernel.org/vger-lists.html>
-
-もし、変更がユーザランドのカーネルインタフェースに影響を与え
-るのであれば、MAN-PAGES のメンテナ( MAINTAINERS ファイルに一覧
-があります)に man ページのパッチを送ってください。少なくとも
-情報がマニュアルページの中に入ってくるように、変更が起きたという
-通知を送ってください。
-
-たとえ、メンテナが #5 で反応がなかったとしても、メンテナのコードに変更を
-加えたときには、いつもメンテナに CC するのを忘れないようにしてください。
-
-
-7) MIME やリンクや圧縮ファイルや添付ファイルではなくプレインテキストのみ
-
-Linus や他のカーネル開発者はあなたが投稿した変更を読んで、コメントでき
-る必要があります。カーネル開発者にとって、あなたが書いたコードの特定の
-部分にコメントをするために、標準的な電子メールクライアントで変更が引用
-できることは重要です。
-
-上記の理由で、すべてのパッチは文中に含める形式の電子メールで投稿さ
-れるべきです。警告：あなたがパッチをコピー&ペーストする際には、パッ
-チを改悪するエディターの折り返し機能に注意してください。
-
-パッチを圧縮の有無に関わらず MIME 形式で添付しないでください。多くのポ
-ピュラーな電子メールクライアントは MIME 形式の添付ファイルをプレーンテ
-キストとして送信するとは限らないでしょう。そうなると、電子メールクラ
-イアントがコードに対するコメントを付けることをできなくします。また、
-MIME 形式の添付ファイルは Linus に手間を取らせることになり、その変更を
-受け入れてもらう可能性が低くなってしまいます。
-
-例外：お使いの電子メールクライアントがパッチをめちゃくちゃにするので
-あれば、誰かが MIME 形式のパッチを再送するよう求めるかもしれません。
-
-余計な変更を加えずにあなたのパッチを送信するための電子メールクライアントの設定
-のヒントについては Documentation/process/email-clients.rst を参照してください。
-
-8) 電子メールのサイズ
-
-パッチを Linus へ送るときは常に #7 の手順に従ってください。
-
-大きなパッチはメーリングリストやメンテナにとって不親切です。パッチが
-未圧縮で 300KB を超えるようであるなら、インターネット上のアクセス可能な
-サーバに保存し、保存場所を示す URL を伝えるほうが適切です。
-
-9) カーネルバージョンの明記
-
-パッチが対象とするカーネルのバージョンをパッチの概要か電子メールの
-サブジェクトに付けることが重要です。
-
-パッチが最新バージョンのカーネルに正しく適用できなければ、Linus は
-そのパッチを採用しないでしょう。
-
-10) がっかりせず再投稿
-
-パッチを投稿した後は、辛抱強く待っていてください。Linus があなたのパッ
-チを気に入って採用すれば、Linus がリリースする次のバージョンのカーネル
-の中で姿を見せるでしょう。
-
-しかし、パッチが次のバージョンのカーネルに入っていないなら、いくつもの
-理由があるのでしょう。その原因を絞り込み、間違っているものを正し、更新
-したパッチを投稿するのはあなたの仕事です。
-
-Linus があなたのパッチに対して何のコメントもなく不採用にすることは極め
-て普通のことです。それは自然な姿です。もし、Linus があなたのパッチを受
-け取っていないのであれば、以下の理由が考えられます。
-* パッチが最新バージョンの Linux カーネルにきちんと適用できなかった
-* パッチが LKML で十分に議論されていなかった
-* スタイルの問題(セクション2を参照)
-* 電子メールフォーマットの問題(このセクションを参照)
-* パッチに対する技術的な問題
-* Linus はたくさんの電子メールを受け取っているので、どさくさに紛れて見
-  失った
-* 不愉快にさせている
-
-判断できない場合は、LKML にコメントを頼んでください。
-
-11) サブジェクトに「 PATCH 」
-
-Linus や LKML への大量の電子メールのために、サブジェクトのプレフィックスに
-「 [PATCH] 」を付けることが慣習となっています。これによって Linus や他の
-カーネル開発者がパッチであるのか、又は、他の議論に関する電子メールであるの
-かをより簡単に識別できます。
-
-12) パッチへの署名
-
-誰が何をしたのかを追いかけやすくするために (特に、パッチが何人かの
-メンテナを経て最終的に Linux カーネルに取り込まれる場合のために)、電子
-メールでやり取りされるパッチに対して「 sign-off 」という手続きを導入し
-ました。
-
-「 sign-off 」とは、パッチがあなたの書いたものであるか、あるいは、
-あなたがそのパッチをオープンソースとして提供する権利を保持している、
-という証明をパッチの説明の末尾に一行記載するというものです。
-ルールはとても単純です。以下の項目を確認して下さい。
-
-        原作者の証明書( DCO ) 1.1
-
-        このプロジェクトに寄与するものとして、以下のことを証明する。
-
-        (a) 本寄与は私が全体又は一部作成したものであり、私がそのファイ
-            ル中に明示されたオープンソースライセンスの下で公開する権利
-            を持っている。もしくは、
-
-        (b) 本寄与は、私が知る限り、適切なオープンソースライセンスでカバ
-            ーされている既存の作品を元にしている。同時に、私はそのライセ
-            ンスの下で、私が全体又は一部作成した修正物を、ファイル中で示
-            される同一のオープンソースライセンスで(異なるライセンスの下で
-            投稿することが許可されている場合を除いて)投稿する権利を持って
-            いる。もしくは、
-
-        (c) 本寄与は(a)、(b)、(c)を証明する第3者から私へ直接提供された
-            ものであり、私はそれに変更を加えていない。
-
-        (d) 私はこのプロジェクトと本寄与が公のものであることに理解及び同意す
-            る。同時に、関与した記録(投稿の際の全ての個人情報と sign-off を
-            含む)が無期限に保全されることと、当該プロジェクト又は関連する
-            オープンソースライセンスに沿った形で再配布されることに理解及び
-            同意する。
-
-もしこれに同意できるなら、以下のような1行を追加してください。
-
-	Signed-off-by: Random J Developer <random@developer.example.org>
-
-実名を使ってください。(残念ですが、偽名や匿名による寄与はできません。)
-
-人によっては sign-off の近くに追加のタグを付加しています。それらは今のところ
-無視されますが、あなたはそのタグを社内の手続きに利用したり、sign-off に特別
-な情報を示したりすることができます。
-
-あなたがサブシステムまたはブランチのメンテナであれば、受け取ったパッチを自身の
-ツリーにマージするために、わずかに変更が必要となる場合があります。なぜなら
-あなたのツリーの中のコードと投稿者のツリーの中のコードは同一ではないためです。
-もし、あなたが厳密に上記ルール(c)にこだわるのであれば、投稿者に再度差分を
-とるよう依頼すべきです。しかし、これは時間とエネルギーを非生産的に浪費する
-ことになります。ルール(b)はあなたにコードを修正する権利を与えてくれます。
-しかし、投稿者のコードを修正し、その修正によるバグを投稿者に押し付けてしまう
-ことはとても失礼なことです。この問題を解決するために、末尾の投稿者の
-Signed-off-by とあなたがその末尾に追加する Signed-off-by の間に、修正を
-加えたことを示す1行を追加することが推奨されています。
-(その1行の書き方に)決まりはありませんが、大括弧の中に電子メールアドレスや氏名
-と修正内容を記載するやり方は目につきやすく、最終段階での変更の責任があなたに
-あることを明確にするのに十分な方法のようです。例えば、
-
-	Signed-off-by: Random J Developer <random@developer.example.org>
-	[lucky@maintainer.example.org: struct foo moved from foo.c to foo.h]
-	Signed-off-by: Lucky K Maintainer <lucky@maintainer.example.org>
-
-あなたが安定版のブランチを管理しており、作成者のクレジット、変更の追跡、
-修正のマージ、と同時に苦情からの投稿者の保護を行いたい場合、この慣習は特に
-有用となります。いかなる事情があってもチェンジログに出てくる作成者の
-アイデンティティ情報(From ヘッダ)は変更できないことに注意してください。
-
-バックポートする人のための特別な注意事項。追跡を容易に行うために、コミット
-メッセージのトップ(サブジェクト行のすぐ後)にパッチの起源を示す情報を記述する
-ことは一般的で有用な慣習です。例えば、これは 2.6-stable ツリーでの一例です。    
-
-    Date:   Tue May 13 19:10:30 2008 +0000
-
-        SCSI: libiscsi regression in 2.6.25: fix nop timer handling
-
-        commit 4cf1043593db6a337f10e006c23c69e5fc93e722 upstream
-
-そして、これは 2.4 ツリーでの一例です。
-
-    Date:   Tue May 13 22:12:27 2008 +0200
-
-        wireless, airo: waitbusy() won't delay
-
-        [backport of 2.6 commit b7acbdfbd1f277c1eb23f344f899cfa4cd0bf36a]
-
-どんな形式であれ、この情報はあなたのツリーを追跡する人やあなたのツリーのバグを
-解決しようとしている人にとって価値のある支援となります。
-
-13) いつ Acked-by: と Cc: を使うのか
-
-「 Signed-off-by: 」タグはその署名者がパッチの開発に関わっていたことやパッチ
-の伝播パスにいたことを示しています。
-
-ある人が直接パッチの準備や作成に関わっていないけれど、その人のパッチに対す
-る承認を記録し、示したいとします。その場合、その人を示すのに Acked-by: が使
-えます。Acked-by: はパッチのチェンジログにも追加されます。
-
-パッチの影響を受けるコードのメンテナがパッチに関わっていなかったり、パッチ
-の伝播パスにいなかった時にも、メンテナは Acked-by: をしばしば利用します。
-
-Acked-by: は Signed-off-by: のように公式なタグではありません。それはメンテナが
-少なくともパッチをレビューし、同意を示しているという記録です。そのような
-ことからパッチをマージする人がメンテナの「うん、良いと思うよ」という発言を
-Acked-by: へ置き換えることがあります。
-
-Acked-by: が必ずしもパッチ全体の承認を示しているわけではありません。例えば、
-あるパッチが複数のサブシステムへ影響を与えており、その中の1つのサブシステム
-のメンテナからの Acked-by: を持っているとします。その場合、Acked-by: は通常
-そのメンテナのコードに影響を与える一部分だけに対する承認を示しています。
-この点は、ご自分で判断してください。(その Acked-by: が)疑わしい場合は、
-メーリングリストアーカイブの中の大元の議論を参照すべきです。
-
-パッチにコメントする機会を持っていたが、その時にコメントしなかった人がいれば、
-その人を指す「Cc:」タグを任意で追加してもかまいません。これは指定された人からの
-明確なアクションなしに付与できる唯一のタグです。
-このタグはパッチに関心があると思われる人達がそのパッチの議論に含まれていたこと
-を明文化します。
-
-14) Reported-by:, Tested-by:, Reviewed-by: および Suggested-by: の利用
-
-他の誰かによって報告された問題を修正するパッチであれば、問題報告者という寄与を
-クレジットするために、Reported-by: タグを追加することを検討してください。
-こまめにバグ報告者をクレジットしていくことで、うまくいけばその人たちが将来再び
-コミュニティの力となってくれるでしょう。
-ただし、報告者の許可無くこのタグを追加しないように注意してください。特に、
-問題が公の場で報告されていなかったのであれば。
-
-Tested-by: タグはタグで指定された人によって(ある環境下で)パッチのテストに成功
-していることを示します。このタグはメンテナにテストが実施済みであることを
-知らせ、将来の関連パッチのテスト協力者を見つける方法を提供し、テスト実施者に
-対するクレジットを保証します。
-
-Reviewed-by: タグは、それとは異なり、下記のレビューア宣言の下にレビューされ、
-受け入れ可能とみなされたパッチであることを示します。
-
-        レビューアによる監督宣言
-
-        私は Reviewed-by: タグを提示することによって、以下のことを明言する。
-
-        (a) 私はメインラインカーネルへの統合に向け、その妥当性及び「即応性
-            (訳注)」を検証し、技術的側面からパッチをレビュー済みである。
-
-        訳注:
-        「即応性」の原文は "readiness"。
-        パッチが十分な品質を持っており、メインラインカーネルへの統合を即座に
-        行うことができる状態であるかどうかを "readiness" という単語で表現
-        している。
-
-        (b) パッチに関するあらゆる問題、懸念、あるいは、疑問は投稿者へ伝達済み
-            である。私はそれらのコメントに対する投稿者の返答に満足している。
-
-        (c) 投稿に伴い改良されるコードがある一方で、現時点で、私は(1)それが
-            カーネルにとって価値のある変更であること、そして、(2)統合に際して
-            議論になり得るような問題はないものと確信している。
-
-        (d) 私はパッチをレビューし適切であると確信している一方で、あらゆる
-            状況においてその宣言した目的や機能が正しく実現することに関して、
-            いかなる保証もしない(特にどこかで明示しない限り)。
-
-Reviewd-by タグはそのパッチがカーネルに対して適切な修正であって、深刻な技術的
-問題を残していないという意見の宣言です。興味のあるレビューアは誰でも(レビュー
-作業を終えたら)パッチに対して Reviewed-by タグを提示できます。このタグは
-レビューアの寄与をクレジットする働き、レビューの進捗の度合いをメンテナに
-知らせる働きを持ちます。そのパッチの領域に詳しく、そして、しっかりとした
-レビューを実施したレビューアによって提供される時、Reviewed-by: タグがあなたの
-パッチをカーネルにマージする可能性を高めるでしょう。
-
-Suggested-by: タグは、パッチのアイデアがその人からの提案に基づくものである
-ことを示し、アイデアの提供をクレジットするものです。提案者の明示的な許可が
-ない場合、特にそのアイデアが公開のフォーラムで示されていない場合には、この
-タグをつけないように注意してください。とはいえ、アイデアの提供者をこつこつ
-クレジットしていけば、望むらくはその人たちが将来別の機会に再度力を貸す気に
-なってくれるかもしれません。
-
-15) 標準的なパッチのフォーマット
-
-標準的なパッチのサブジェクトは以下のとおりです。
-
-    Subject: [PATCH 001/123] subsystem: summary phrase
-
-標準的なパッチの、電子メールのボディは以下の項目を含んでいます。
-
-  - パッチの作成者を明記する「 from 」行
-
-  - 空行
-
-  - 説明本体。これはこのパッチを説明するために無期限のチェンジログ
-    (変更履歴)にコピーされます。
-
-  - 上述した「 Signed-off-by: 」行。これも説明本体と同じくチェン
-    ジログ内にコピーされます。
-
-  - マーカー行は単純に「 --- 」です。
-
-  - 余計なコメントは、チェンジログには不適切です。
-
-  - 実際のパッチ(差分出力)
-
-サブジェクト行のフォーマットは、アルファベット順で電子メールをとても
-ソートしやすいものになっています。(ほとんどの電子メールクライアント
-はソートをサポートしています)パッチのサブジェクトの連番は0詰めであ
-るため、数字でのソートとアルファベットでのソートは同じ結果になります。
-
-電子メールのサブジェクト内のサブシステム表記は、パッチが適用される
-分野またはサブシステムを識別できるようにすべきです。
-
-電子メールのサブジェクトの「summary phrase」はそのパッチの概要を正確
-に表現しなければなりません。「summary phrase」をファイル名にしてはい
-けません。パッチシリーズ中でそれぞれのパッチは同じ「summary phrase」を
-使ってはいけません(「パッチシリーズ」とは順序付けられた関連のある複数の
-パッチ群です)。
-
-あなたの電子メールの「summary phrase」がそのパッチにとって世界で唯一の識別子に
-なるように心がけてください。「summary phrase」は git のチェンジログの中へ
-ずっと伝播していきます。「summary phrase」は、開発者が後でパッチを参照する
-ために議論の中で利用するかもしれません。
-人々はそのパッチに関連した議論を読むために「summary phrase」を使って google で
-検索したがるでしょう。それはまた2、3ヶ月あとで、人々が「gitk」や
-「git log --oneline」のようなツールを使用して何千ものパッチに目を通す時、
-唯一目にとまる情報となるでしょう。
-
-これらの理由のため、「summary phrase」はなぜパッチが必要であるか、パッチが何を
-変更するかの2つの情報をせいぜい70〜75文字で表現していなければなりません。
-「summary phrase」は簡潔であり説明的である表現を目指しつつ、うまく
-まとめられている概要となるべきです。
-
-「summary phrase」は「Subject: [PATCH tag] <summary phrase>」のように、
-大括弧で閉じられたタグを接頭辞として付加してもかまいません。このタグは
-「summary phrase」の一部とは考えませんが、パッチをどのように取り扱うべきかを
-表現します。
-一般的には「v1, v2, v3」のようなバージョン情報を表すタグ(過去のパッチに対する
-コメントを反映するために複数のバージョンのパッチが投稿されているのであれば)、
-「RFC」のようなコメントを要求するタグが挙げられます。パッチシリーズとして4つの
-パッチがあれば、個々のパッチに「1/4, 2/4, 3/4, 4/4」のように番号を付けても
-かまいません。これは開発者がパッチを適用する順番を確実に把握するためです。
-そして、開発者がパッチシリーズの中のすべてのパッチをもらさずレビュー或いは
-適用するのを保証するためです。
-
-サブジェクトの例を二つ
-
-    Subject: [patch 2/5] ext2: improve scalability of bitmap searching
-    Subject: [PATCHv2 001/207] x86: fix eflags tracking
-
-「 from 」行は電子メールのボディの一番最初の行でなければなりません。
-その形式は以下のとおりです。
-
-        From: Original Author <author@example.com>
-
-「 from 」行はチェンジログの中で、そのパッチの作成者としてクレジットされ
-ている人を特定するものです。「 from 」行がかけていると、電子メールのヘッ
-ダーの「 From: 」が、チェンジログの中でパッチの作成者を決定するために使わ
-れるでしょう。
-
-説明本体は無期限のソースのチェンジログにコミットされます。なので、説明
-本体はそのパッチに至った議論の詳細を忘れているある程度の技量を持っている人
-がその詳細を思い出すことができるものでなければなりません。パッチが対処する
-障害の症状(カーネルログメッセージや oops メッセージ等)を記載することは問題に
-対処可能なパッチを求めてコミットログを検索する人々にとって特に有用です。
-パッチがコンパイル問題を解決するのであれば、そのパッチを探している人が見つける
-ことができる情報だけで十分であり、コンパイル時の全てのエラーを含める必要は
-ありません。「summary phrase」と同様に、簡潔であり説明的であることが重要です。
-
-「 --- 」マーカー行はパッチ処理ツールに対して、チェンジログメッセージの終端
-部分を認識させるという重要な役目を果たします。
-
-「 --- 」マーカー行の後の追加コメントの良い使用方法の1つに diffstat コマンド
-があります。diffstat コマンドとは何のファイルが変更され、1ファイル当たり何行
-追加され何行消されたかを示すものです。diffstat コマンドは特に大きなパッチに
-おいて役立ちます。その時点でだけ又はメンテナにとってのみ関係のあるコメント
-は無期限に保存されるチェンジログにとって適切ではありません。そのため、この
-ようなコメントもマーカー行の後に書かれるべきです。
-このようなコメントの良い例として、v1 と v2 のバージョン間で何が変更されたかを
-表す「パッチの変更履歴」が挙げられます。
-
-「 --- 」マーカー行の後に diffstat コマンドの結果を含めるのであれば、ファイル
-名はカーネルソースツリーのトップディレクトリからの表記で列記されるため、横方向
-のスペースをとり過ぎないように、diffstat コマンドにオプション「 -p 1 -w 70 」
-を指定してください(インデントを含めてちょうど80列に合うでしょう)。
-
-適切なパッチのフォーマットの詳細についてはセクション3の参考文献を参照して
-ください。
-
-16) 「git pull」要求の送り方(Linus の電子メールから)
-
-間違ったブランチから引っ張るのを防ぐために、git リポジトリのアドレスと
-ブランチ名を同じ行に1行で記載してください。そうすることで、3回の連続クリック
-で全て選択できます。
-
-正しい形式は下記の通りです。
-
-	"Please pull from
-
-		git://jdelvare.pck.nerim.net/jdelvare-2.6 i2c-for-linus
-
-	 to get these changes:"
-
-その結果、アドレスを自分自身でタイピングして間違えることはなくなります(実際に、
-何度か間違ったブランチから引っ張ってきてしまい、その時に diffstat の結果を
-検証して間違っていることに気づいたことがあります。どこから何を引っ張るべきかを
-「探したり」、正しいブランチ名かどうかを重ねてチェックしたりする必要が
-なくなればより快適になるでしょう)。
-
-diffstat の結果を生成するために「 git diff -M --stat --summary 」を使って
-ください。-M オプションはファイル名の変更を検知でき、--summary オプションは
-新規ファイル、削除されたファイル、名前が変更されたファイルの概要を生成します。
-
--M オプション(ファイル名の変更検知)を指定すると、diffstat の結果はかなり
-異なってきます。git は大規模な変更(追加と削除のペア)をファイル名の変更と
-判断するためです。
-
-------------------------------------
-セクション2 - ヒントとTIPSと小技
-------------------------------------
-
-このセクションは Linux カーネルに変更を適用することに関係のある一般的な
-「お約束」の多くを載せています。物事には例外というものがあります。しか
-し例外を適用するには、本当に妥当な理由が不可欠です。あなたは恐らくこの
-セクションを Linus のコンピュータ・サイエンス101と呼ぶでしょう。
-
-1) Documentation/process/coding-style.rstを参照
-
-言うまでもなく、あなたのコードがこのコーディングスタイルからあまりに
-も逸脱していると、レビューやコメントなしに受け取ってもらえないかもし
-れません。
-
-特筆すべき例外は、コードをあるファイルから別のファイルに移動
-するときです。この場合、コードを移動するパッチでは、移動されるコード
-に関して移動以外の変更を一切加えるべきではありません。これにより、
-コードの移動とあなたが行ったコードの修正を明確に区別できるようにな
-ります。これは実際に何が変更されたかをレビューする際の大きな助けに
-なるとともに、ツールにコードの履歴を追跡させることも容易になります。
-
-投稿するより前にパッチのスタイルチェッカー( scripts/checkpatch.pl )で
-あなたのパッチをチェックしてください。このスタイルチェッカーは最終結
-論としてではなく、指標としてみるべきです。もし、あなたのコードが違反
-はしているが修正するより良く見えるのであれば、おそらくそのままにする
-のがベストです。
-
-スタイルチェッカーによる3段階のレポート:
- - エラー: 間違っている可能性が高い
- - 警告：注意してレビューする必要がある
- - チェック：考慮する必要がある
-
-あなたはパッチに残っている全ての違反について、それがなぜ必要なのか正当な
-理由を示せるようにしておく必要があります。
-
-2) #ifdefは見苦しい
-
-ifdef が散乱したコードは、読むのもメンテナンスするのも面倒です。コードの中
-で ifdef を使わないでください。代わりに、ヘッダファイルの中に ifdef を入れて、
-条件付きで、コードの中で使われる関数を「 static inline 」関数かマクロで定義し
-てください。後はコンパイラが、何もしない箇所を最適化して取り去ってくれるで
-しょう。
-
-まずいコードの簡単な例
-
-	dev = alloc_etherdev (sizeof(struct funky_private));
-	if (!dev)
-		return -ENODEV;
-	#ifdef CONFIG_NET_FUNKINESS
-	init_funky_net(dev);
-	#endif
-
-クリーンアップしたコードの例
-
-(in header)
-	#ifndef CONFIG_NET_FUNKINESS
-	static inline void init_funky_net (struct net_device *d) {}
-	#endif
-
-(in the code itself)
-	dev = alloc_etherdev (sizeof(struct funky_private));
-	if (!dev)
-		return -ENODEV;
-	init_funky_net(dev);
-
-3) マクロより「 static inline 」を推奨
-
-「 static inline 」関数はマクロよりもずっと推奨されています。それらは、
-型安全性があり、長さにも制限が無く、フォーマットの制限もありません。
-gcc においては、マクロと同じくらい軽いです。
-
-マクロは「 static inline 」が明らかに不適切であると分かる場所(高速化パスの
-いくつかの特定のケース)や「 static inline 」関数を使うことができないような
-場所(マクロの引数の文字列連結のような)にだけ使われるべきです。
-
-「 static inline 」は「 static __inline__ 」や「 extern inline 」や
-「 extern __inline__ 」よりも適切です。
-
-4) 設計に凝りすぎるな
-
-それが有用になるかどうか分からないような不明瞭な将来を見越した設計
-をしないでください。「できる限り簡単に、そして、それ以上簡単になら
-ないような設計をしてください。」
-
-----------------------
-セクション3 参考文献
-----------------------
-
-Andrew Morton, "The perfect patch" (tpp).
-  <http://www.ozlabs.org/~akpm/stuff/tpp.txt>
-
-Jeff Garzik, "Linux kernel patch submission format".
-  <https://web.archive.org/web/20180829112450/http://linux.yyz.us/patch-format.html>
-
-Greg Kroah-Hartman, "How to piss off a kernel subsystem maintainer".
-  <http://www.kroah.com/log/linux/maintainer.html>
-  <http://www.kroah.com/log/linux/maintainer-02.html>
-  <http://www.kroah.com/log/linux/maintainer-03.html>
-  <http://www.kroah.com/log/linux/maintainer-04.html>
-  <http://www.kroah.com/log/linux/maintainer-05.html>
-
-NO!!!! No more huge patch bombs to linux-kernel@vger.kernel.org people!
-  <https://lore.kernel.org/r/20050711.125305.08322243.davem@davemloft.net>
-
-Kernel Documentation/process/coding-style.rst:
-  <http://users.sosdg.org/~qiyong/lxr/source/Documentation/process/coding-style.rst>
-
-Linus Torvalds's mail on the canonical patch format:
-  <https://lore.kernel.org/r/Pine.LNX.4.58.0504071023190.28951@ppc970.osdl.org>
-
-Andi Kleen, "On submitting kernel patches"
-  Some strategies to get difficult or controversial changes in.
-  http://halobates.de/on-submitting-patches.pdf
-
---
-
-
-- 
2.37.1

