Return-Path: <linux-doc+bounces-96474-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id v5pNGLkBVGpOgwMAu9opvQ
	(envelope-from <linux-doc+bounces-96474-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sun, 12 Jul 2026 23:06:01 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 054BC745E79
	for <lists+linux-doc@lfdr.de>; Sun, 12 Jul 2026 23:05:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=redadmin.org header.s=20231208space header.b=wl4gmnZq;
	dmarc=temperror reason="query timed out" header.from=redadmin.org (policy=temperror);
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-96474-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-doc+bounces-96474-lists+linux-doc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3F4B3300D459
	for <lists+linux-doc@lfdr.de>; Sun, 12 Jul 2026 21:05:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BB672701B6;
	Sun, 12 Jul 2026 21:05:51 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from www.redadmin.org (bc043154.ppp.asahi-net.or.jp [222.228.43.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4641AD24;
	Sun, 12 Jul 2026 21:05:46 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783890350; cv=pass; b=V8e20++KAEncoZJjrkA+rNmdTIDwqg5buQbpesa0FEhviwxh9uVKgmL5PugWbpFlb9Q5E3nhgzeSPo+feRBvkPN+/WNtRhhuHZggosVWpE+wNh9XPiAfNbbIaJFwvhhuURFLcMox3ZEvcv750nA44qz37ojlaVGWq1S/a7AhxHE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783890350; c=relaxed/simple;
	bh=ojmf/OgAeYAFzjYXX2LMdybPYZcXi2GgMXvuWgaUZB0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=MaLO15sg/41/X89dH7mAvgXAubymNu+UJ1yI4d8NxOOgCDsQFOLPEKBgzLScp6TTU97V9T+MYJAzGn3p8R+veLHfP8OxTRd4pqXjVbr3ikvyL3fnggXWhq/HapY+665ioIbmtN6+ct3YgVvQD4nqtR3DmLNxaHXMGpYEyemP4Aw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redadmin.org; spf=none smtp.mailfrom=www.redadmin.org; dkim=pass (1024-bit key) header.d=redadmin.org header.i=@redadmin.org header.b=wl4gmnZq; arc=pass smtp.client-ip=222.228.43.154
Received: from localhost (localhost [127.0.0.1])
	by www.redadmin.org (Postfix) with ESMTP id 19FC210B212D2;
	Mon, 13 Jul 2026 06:05:44 +0900 (JST)
X-Virus-Scanned: amavis at redadmin.org
Received: from www.redadmin.org ([127.0.0.1])
 by localhost (redadmin.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v4WXQ82ILTjf; Mon, 13 Jul 2026 06:05:40 +0900 (JST)
ARC-Seal: i=1; d=redadmin.org; s=20231208space; a=rsa-sha256; cv=none;
	t=1783890340;
	b=kaWeOX3KZ6Zdm56VqvjFRNgLEMSidvhMMASh6Z2q4Yo/5GLkogFaax6juiwYMziDJWuh
	 MoGuz0p2LI44snM8zf5JVTtH9sHvsrwH5EJs0+cXCJ4LzUwDvXLE5V1ERu9YolGNYdMo6
	 GCsGGmXnv4T4qHU1B23tqykMkP9p0r7MiM=
ARC-Message-Signature: i=1; d=redadmin.org; s=20231208space; a=rsa-sha256;
	c=relaxed/relaxed; t=1783890340;
	h=DKIM-Filter:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=G+U2aZiFLo63kgUj/30ynjZeaJyYU4PHJDsbvodi9eQ=;
	b=zydjXqZIxeZnhSwF00/5xQawgv1/LKPmP2365Zga8EYWoBlhpczcn1djRgOdPo7FARUP
	 R47Ce0V0yqyFtEVF05ee0iDS0ua5P9/0vM0u7WSwzUWFib1f3ZUqBvDZfeUMr36KNHA/3
	 uchEq385Rl5nPB4B6NwYgVRmal32Xv8mH8=
ARC-Authentication-Results: i=1; www.redadmin.org; arc=none smtp.remote-ip=127.0.0.1
Received: by www.redadmin.org (Postfix, from userid 0)
	id 25FDF10B212D1; Mon, 13 Jul 2026 06:05:40 +0900 (JST)
DKIM-Filter: OpenDKIM Filter v2.11.0 www.redadmin.org 25FDF10B212D1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redadmin.org;
	s=20231208space; t=1783890340;
	bh=G+U2aZiFLo63kgUj/30ynjZeaJyYU4PHJDsbvodi9eQ=;
	h=From:To:Cc:Subject:Date:From;
	b=wl4gmnZqtt8MESFr1Ki8RcdRrnKfKT0vxCvgXDRyRzpdc9mO0LegF94+jgKEab370
	 x5ussuNyBase696YfMuI1izYAqt+ZC3p2A2GZx9ouz3svQjpa4Wr9qXwqVh8czEx8J
	 tVPqy/gbDoIGnKQukM1oaQmgpEAuBOTAPmgG8RzU=
From: Akiyoshi Kurita <weibu@redadmin.org>
To: linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	corbet@lwn.net,
	akiyks@gmail.com,
	weibu@redadmin.org
Subject: [PATCH v3] docs/ja_JP: translate submitting-patches.rst (sign-off)
Date: Mon, 13 Jul 2026 06:05:01 +0900
Message-ID: <20260712210535.161387-1-weibu@redadmin.org>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	R_DKIM_ALLOW(-0.20)[redadmin.org:s=20231208space];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	URIBL_MULTI_FAIL(0.00)[redadmin.org:server fail,sea.lore.kernel.org:server fail,vger.kernel.org:server fail];
	TAGGED_FROM(0.00)[bounces-96474-lists,linux-doc=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:corbet@lwn.net,m:akiyks@gmail.com,m:weibu@redadmin.org,s:lists@lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,lwn.net,gmail.com,redadmin.org];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[weibu@redadmin.org,linux-doc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[weibu@redadmin.org,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[redadmin.org:+];
	TO_DN_NONE(0.00)[];
	DMARC_DNSFAIL(0.00)[redadmin.org : query timed out];
	RCPT_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,redadmin.org:from_mime,redadmin.org:email,redadmin.org:mid,redadmin.org:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 054BC745E79

Translate the "Include PATCH in the subject" and "Sign your work -
the Developer's Certificate of Origin" sections into Japanese.

Keep the DCO text in English as the original certificate text, and add
a Japanese note that the sign-off refers to the English DCO text.

Signed-off-by: Akiyoshi Kurita <weibu@redadmin.org>
---
Changes in v3:

  - Keep the DCO 1.1 text in English instead of translating it.
  - Add a Japanese note explaining that Signed-off-by refers to the
    original English DCO text, not to a translated version.
  - Address Akira Yokosawa's concern about possible confusion around
    translating the DCO text.

Changes in v2:

  - Added the Japanese translation of the "Include PATCH in the subject"
    section.
  - Updated the DCO translation to match the current English text and
    structure.
  - Kept the DCO statement in a literal block following commit
    999161066dc5.

 .../ja_JP/process/submitting-patches.rst      | 75 +++++++++++++++++++
 1 file changed, 75 insertions(+)

diff --git a/Documentation/translations/ja_JP/process/submitting-patches.rst b/Documentation/translations/ja_JP/process/submitting-patches.rst
index d31d469909e4..9bf4d1f99196 100644
--- a/Documentation/translations/ja_JP/process/submitting-patches.rst
+++ b/Documentation/translations/ja_JP/process/submitting-patches.rst
@@ -402,3 +402,78 @@ ping したりする前に、少なくとも 1 週間は待ってください。
 パッチまたはパッチシリーズの修正版を投稿する場合は、"RESEND" を
 追加しないでください。"RESEND" は、前回の投稿から一切変更していない
 パッチまたはパッチシリーズを再送する場合にのみ使います。
+
+
+件名に PATCH を含める
+---------------------
+
+Linus と linux-kernel メーリングリストには大量のメールが届くため、
+件名の先頭に ``[PATCH]`` を付けることが一般的な慣例となっています。
+これにより、Linus や他のカーネル開発者は、パッチとその他の議論を
+容易に区別できます。
+
+``git send-email`` は、この指定を自動的に行います。
+
+
+作業への署名 - Developer's Certificate of Origin
+--------------------------------------------------
+
+誰が何を行ったのかを追跡しやすくするため、特にパッチが複数階層の
+メンテナーを経由して最終的にカーネルへ取り込まれる場合に備えて、
+メールでやり取りされるパッチには sign-off の手続きが導入されています。
+
+sign-off は、パッチの説明の末尾に追加する単純な一行です。これは、
+そのパッチを自分で作成したか、オープンソースのパッチとして提出する
+権利を持っていることを証明します。
+
+注意: ``Signed-off-by`` によって同意する対象は、翻訳文ではなく、
+以下に示す英語原文の Developer's Certificate of Origin 1.1 です。
+DCO は法的な性質を持つ文書であるため、本文は翻訳せず、原文のまま
+掲載します。内容を確認する場合は、必ず英語原文を参照してください。
+
+規則は単純で、以下を証明できる場合です::
+
+        Developer's Certificate of Origin 1.1
+
+        By making a contribution to this project, I certify that:
+
+        (a) The contribution was created in whole or in part by me and I
+            have the right to submit it under the open source license
+            indicated in the file; or
+
+        (b) The contribution is based upon previous work that, to the best
+            of my knowledge, is covered under an appropriate open source
+            license and I have the right under that license to submit that
+            work with modifications, whether created in whole or in part
+            by me, under the same open source license (unless I am
+            permitted to submit under a different license), as indicated
+            in the file; or
+
+        (c) The contribution was provided directly to me by some other
+            person who certified (a), (b) or (c) and I have not modified
+            it.
+
+        (d) I understand and agree that this project and the contribution
+            are public and that a record of the contribution (including all
+            personal information I submit with it, including my sign-off) is
+            maintained indefinitely and may be redistributed consistent with
+            this project or the open source license(s) involved.
+
+上記を証明できる場合は、次のような行を追加します::
+
+        Signed-off-by: Random J Developer <random@developer.example.org>
+
+既知の身元を使用してください。匿名での貢献は認められません。
+``git commit -s`` を使用すると、この行を自動的に追加できます。
+
+revert にも ``Signed-off-by:`` を含める必要があります。
+``git revert -s`` を使用すると、自動的に追加できます。
+
+末尾に追加のタグを付ける人もいます。現時点では無視されますが、
+社内手続きを示したり、sign-off に関する特記事項を記録したりするために
+使用できます。
+
+作者の SoB に続く追加の SoB（``Signed-off-by:``）は、パッチの開発には
+関与せず、その取り扱いや転送を行った人によるものです。SoB の連鎖は、
+パッチがメンテナーを経て最終的に Linus へ届いた実際の経路を反映する
+必要があります。最初の SoB は、単独の主要作者であることを示します。
-- 
2.52.0


