Return-Path: <linux-doc+bounces-42497-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CA74A7F6BF
	for <lists+linux-doc@lfdr.de>; Tue,  8 Apr 2025 09:45:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2A260171D79
	for <lists+linux-doc@lfdr.de>; Tue,  8 Apr 2025 07:44:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F5E9264FA4;
	Tue,  8 Apr 2025 07:42:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="BKLZSlXi"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtpbg151.qq.com (smtpbg151.qq.com [18.169.211.239])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C32D264A90
	for <linux-doc@vger.kernel.org>; Tue,  8 Apr 2025 07:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.169.211.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744098126; cv=none; b=DIxVXQu3ErYJHGU8ijjND2XWkKppwlvVN0fwzGnPCv6sr4KXD1+uA4zS0iypQOA8dH4ArJW/k3e5bu6QaSCWYlt6b0xsebnj/ta2qpX1s9ZFlrGU/Y+J6U/aKhJC+kOTCgJrdPVFbrDzSUQ+h6k/HXF8dlD9KgfMyeit0TBxc9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744098126; c=relaxed/simple;
	bh=VmrdJVDpTY1Y3BF9QzGsEsk2pkeTQKYXt41LsIyEfyM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Rot2UYBn04JIGayjqDGREVVQ1S4+HPyHG1aNuhgS0QXk3PHK4Tx86cMXswSUEOml9uxEtkteffJOhwScGNlFkd51WB2IDe5RrJBHMI5v11q8o78rFqYtyCr29WOdnBUu8fvKVp47Lz71K5u31v9R9yZMQ+V+O1Zc3Gxg03Hynx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=BKLZSlXi; arc=none smtp.client-ip=18.169.211.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1744098047;
	bh=CwKUleQf27cGcf66047RnWHjOqMcyIi/LBBDO1qSzAM=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=BKLZSlXiwOS0ObJ8zdUczG1rUS1ZL2dEPFY1urmf19WwO2hi1pyfZKZz17LsAyV9B
	 f/u/M4HoLlv9WY6YV8EssNEPQyRxdGH2d2AF+mcduMmLOKtqs3HNv0BLLAFSpzjh/w
	 8oDqoRKsctdG9NWWKeWP9IoFCTPlXglH4CIVhfN4=
X-QQ-mid: bizesmtpsz4t1744098041tb64312
X-QQ-Originating-IP: YLpLnDErj1dtfcCfWuO3BojoYWQCqOM0zq8eEbVCJxE=
Received: from localhost.localdomain ( [113.57.152.160])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 08 Apr 2025 15:40:39 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 8994852775391133971
EX-QQ-RecipientCnt: 14
From: Chen Linxuan <chenlinxuan@uniontech.com>
To: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Pablo Neira Ayuso <pablo@netfilter.org>,
	Jozsef Kadlecsik <kadlec@netfilter.org>,
	netfilter-devel@vger.kernel.org,
	coreteam@netfilter.org,
	Chen Linxuan <chenlinxuan@uniontech.com>,
	netdev@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 nf-next] docs: tproxy: fix formatting for nft code block
Date: Tue,  8 Apr 2025 15:35:50 +0800
Message-ID: <E25F951CDC9F22B2+20250408073550.3319892-2-chenlinxuan@uniontech.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtpsz:uniontech.com:qybglogicsvrgz:qybglogicsvrgz5a-1
X-QQ-XMAILINFO: MMREUZv4wJ7/uOrne6X5SSbeT+Yka9zVShie8oIcWhB2JdLJ5WW4MiZr
	EcNaNn5OQy4bG0OswoJSKhKIxzRSTx8Ji7+YbJzGszsZ8swRuLITYCvaV75cop7PcdiT53B
	Tv7gyq+M57NR8SB4wgCAM9Za1FVwoE7GLC2D0d7uJ5/eASbI4KET6cJJwKrNoBONKOPt6ZK
	zhgULO6RkpBxK639RfIcrXaO5fmMxhpCoTi11CT8ViQimX2togtb6AC4vPfm5lsDzJ2wi54
	Xk8ruXvnMBGOZzFyMTewDewcl4hSax4NknF/qpnG879YSKMRYWopOklFOisHVy+IDv3kfyc
	E5FP+wSmH7Mh8Yv3mCk4id7pYXqxnFtE0ICnSUgPJBbPVpSodbLh5+DWNKtdQ6TILvQLkby
	kVxVC1glPfD0e4hLg1A/1F37cqJZJxtKJR/X3UiC8SQCwJ6ObNth0QFb5MF+04L9GxMp28i
	YN/+VoGG0SwWME66wZWCXhtYVYvMiTLTjbNhVPwaQa6MDjt2sL8jIKVPS8cJe8pnugeVdwn
	f3vaUEbY8GHZwM4SE8loBmWQeZQAPGRAQNiannu2ZUsw5bNHtOWjrE0GMbnuLL6bGJ9KBbM
	4MH1SqsuSL/aR/LlDtSWShsx1UyNy3kEiQu3cK3LXzPKw+iuipmLOgAB5LbkGFXa78aMa08
	XcZR8u+ljZtIKTsbyeaMZW3RgG73Gf8TqBiOKW1CI02vsvznzkiiZ8K0CJ4CkuXapzUyzqs
	U/CHkHFGQkyocjPZYxkajOOuOqs5NfWIyg8hSALnrQ+jk+wviR46TfyiGyn3NzOc/be4v2T
	bpGsWOh6JyvHKz2flezWYgXJb09DfHzt1aBj7F8gdtaNjetsLUsxUKKku3/JO78xazNwsXK
	o9cJriTCtnByBjDEIf54djXIGwmsKc4l8lC9GevAYyN9l9CAG9UXQzY/og/IBFV7FM+H76L
	vxK9Dvm1Xl55Uj/pE1lX3+QYIOJcuIiVwZ7+o4MtD7qmun35OMrdZaGam
X-QQ-XMRINFO: M/715EihBoGSf6IYSX1iLFg=
X-QQ-RECHKSPAM: 0

The nft command snippet for redirecting traffic isn't formatted
in a literal code block like the rest of snippets.
Fix the formatting inconsistency.

Signed-off-by: Chen Linxuan <chenlinxuan@uniontech.com>
---
v2:
  - Update commit message according to suggestion from Bagas
v1: https://lore.kernel.org/all/CFD0AAF9D7040B1E+20250407031727.1615941-1-chenlinxuan@uniontech.com/
---
 Documentation/networking/tproxy.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/networking/tproxy.rst b/Documentation/networking/tproxy.rst
index 7f7c1ff6f159..75e4990cc3db 100644
--- a/Documentation/networking/tproxy.rst
+++ b/Documentation/networking/tproxy.rst
@@ -69,9 +69,9 @@ add rules like this to the iptables ruleset above::
     # iptables -t mangle -A PREROUTING -p tcp --dport 80 -j TPROXY \
       --tproxy-mark 0x1/0x1 --on-port 50080
 
-Or the following rule to nft:
+Or the following rule to nft::
 
-# nft add rule filter divert tcp dport 80 tproxy to :50080 meta mark set 1 accept
+    # nft add rule filter divert tcp dport 80 tproxy to :50080 meta mark set 1 accept
 
 Note that for this to work you'll have to modify the proxy to enable (SOL_IP,
 IP_TRANSPARENT) for the listening socket.
-- 
2.48.1


