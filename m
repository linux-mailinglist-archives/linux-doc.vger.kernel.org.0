Return-Path: <linux-doc+bounces-79810-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OI9WD6OauWn5KwIAu9opvQ
	(envelope-from <linux-doc+bounces-79810-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 17 Mar 2026 19:17:07 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A0402B0C8C
	for <lists+linux-doc@lfdr.de>; Tue, 17 Mar 2026 19:17:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AC8753200D47
	for <lists+linux-doc@lfdr.de>; Tue, 17 Mar 2026 18:10:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B7A03F7AA0;
	Tue, 17 Mar 2026 18:09:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DgdPbz6l"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 547793F7A88;
	Tue, 17 Mar 2026 18:09:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773770988; cv=none; b=SZb8xWXN548w69ttxES0yT9MiPAcFAFq9Zk6B83RMgNXvYu7rtIgnqV/mhjtr87ufpBAKpaGoYvKZ8O9NOJEngxcA/S3O7kk6YHNOWLgTHX7s8mWUOqrV0B+dHgk0/bUbirqxx4zrLwB6sAVh4poDAMgxouYCS2orSHgOWykO9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773770988; c=relaxed/simple;
	bh=0vOonWQOVj1qAHLjTSR5HkO7zRxJDQfYV8AFJ54huG4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VPgZQZDcB//eVOG9tVzsPXMBN3UXqZ2IKufNhE3nD4y83LhrwUj8iaiE1aY2GB7lK2i3z1h7sUUy5wgcyCQ8cqwV7LGXWnwq7zhJzQ61gTah5GjYg4gYpJ0SeFayYgtLbC2c8D3ykOOdQpHWzUXA+OnknUGEx/IVCoScKZFhvlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DgdPbz6l; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33C6DC2BCAF;
	Tue, 17 Mar 2026 18:09:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773770988;
	bh=0vOonWQOVj1qAHLjTSR5HkO7zRxJDQfYV8AFJ54huG4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DgdPbz6lLyies0+bMQgWXkS8c6OPUVdxJwDTzkRNt+2RCtV4Z4F8hiV2WSyOvD43T
	 FwH6QFqyFvJOkrhxLALKGii1+TVJUP29lj2YiaHB09UOH5nRV+mLrW+bcrQkt9Tg7u
	 SwUyZEK8wb9JKJzV2EpLxY7eNY6TxhnGYsb6jeSdzr9HTWXceq7Pr4vajWYD5/TitW
	 k6dDXzSk1FhNMyp8Rrt4A9wRl0ueAPNdo2SVuX/ggXOx8UBAJtaArEt/90R3wvmql0
	 N7qddQx5ZZMFoYFOiowHOcfgrCPaF2zYEK5h4lEuqNzqE1B2nU4kV4PoYpUPpzK10t
	 tdt8JGeLC8xLw==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1w2YrS-0000000H5Lh-24iS;
	Tue, 17 Mar 2026 19:09:46 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-hardening@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Aleksandr Loktionov <aleksandr.loktionov@intel.com>,
	Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH v3 06/22] docs: kdoc: use tokenizer to handle comments on structs
Date: Tue, 17 Mar 2026 19:09:26 +0100
Message-ID: <054763260f7b5459ad0738ed906d7c358d640692.1773770483.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1773770483.git.mchehab+huawei@kernel.org>
References: <cover.1773770483.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_FROM(0.00)[bounces-79810-lists,linux-doc=lfdr.de,huawei];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc,huawei];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mchehab@kernel.org,linux-doc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 9A0402B0C8C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Better handle comments inside structs. After those changes,
all unittests now pass:

  test_private:
    TestPublicPrivate:
        test balanced_inner_private:                                 OK
        test balanced_non_greddy_private:                            OK
        test balanced_private:                                       OK
        test no private:                                             OK
        test unbalanced_inner_private:                               OK
        test unbalanced_private:                                     OK
        test unbalanced_struct_group_tagged_with_private:            OK
        test unbalanced_two_struct_group_tagged_first_with_private:  OK
        test unbalanced_without_end_of_line:                         OK

  Ran 9 tests

This also solves a bug when handling STRUCT_GROUP() with a private
comment on it:

	@@ -397134,7 +397134,7 @@ basic V4L2 device-level support.
	             unsigned int    max_len;
	             unsigned int    offset;
	             struct page_pool_params_slow  slow;
	-            STRUCT_GROUP( struct net_device *netdev;
	+            struct net_device *netdev;
	             unsigned int queue_idx;
	             unsigned int    flags;
	       };

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Message-ID: <f83ee9e8c38407eaab6ad10d4ccf155fb36683cc.1773074166.git.mchehab+huawei@kernel.org>
---
 tools/lib/python/kdoc/kdoc_parser.py | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/tools/lib/python/kdoc/kdoc_parser.py b/tools/lib/python/kdoc/kdoc_parser.py
index 4b3c555e6c8e..62d8030cf532 100644
--- a/tools/lib/python/kdoc/kdoc_parser.py
+++ b/tools/lib/python/kdoc/kdoc_parser.py
@@ -13,6 +13,7 @@ import sys
 import re
 from pprint import pformat
 
+from kdoc.c_lex import CTokenizer
 from kdoc.kdoc_re import NestedMatch, KernRe
 from kdoc.kdoc_item import KdocItem
 
@@ -84,15 +85,9 @@ def trim_private_members(text):
     """
     Remove ``struct``/``enum`` members that have been marked "private".
     """
-    # First look for a "public:" block that ends a private region, then
-    # handle the "private until the end" case.
-    #
-    text = KernRe(r'/\*\s*private:.*?/\*\s*public:.*?\*/', flags=re.S).sub('', text)
-    text = KernRe(r'/\*\s*private:.*', flags=re.S).sub('', text)
-    #
-    # We needed the comments to do the above, but now we can take them out.
-    #
-    return KernRe(r'\s*/\*.*?\*/\s*', flags=re.S).sub('', text).strip()
+
+    tokens = CTokenizer(text)
+    return str(tokens)
 
 class state:
     """
-- 
2.52.0


