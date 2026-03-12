Return-Path: <linux-doc+bounces-78928-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sdiZNWRnsmlkMQAAu9opvQ
	(envelope-from <linux-doc+bounces-78928-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 12 Mar 2026 08:12:36 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0411B26E2B7
	for <lists+linux-doc@lfdr.de>; Thu, 12 Mar 2026 08:12:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 96B4030467CF
	for <lists+linux-doc@lfdr.de>; Thu, 12 Mar 2026 07:12:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1DEF3AC0ED;
	Thu, 12 Mar 2026 07:12:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WlXxBgRu"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD910314A6F;
	Thu, 12 Mar 2026 07:12:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773299553; cv=none; b=QMvJyTiVVckNaQngetRt347M3GlgvQSCsvodIVHDNCNvLHQLPuylCVa4zzLsT2aCG7Wq1+MhDfOiR+fbk/lu1h25gGHfoFcSr5EgzVGreIt+jmaxgkLAg3Z/K3GZfPkD+AoNqfj/OaJbZEQEW5tawE3JFtURAEvxkyBNL93FUWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773299553; c=relaxed/simple;
	bh=4zE5duoA2GQsqDENdL1YG74aJauA3hcB054cECvfzE0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UujYo7b4aWU2ErGFzhOFq/iUJcu0sTDDNN1b5qk45WMoj05B5IUY/g+EcYp7l9LyiomGpCTqptSS3kw3Se7CfjFVa+ViBL8GE43a/C6jiJimd4/gQhrDGwV6JR9I9V9TIHdh3ZaPjnC70CO0CDh+4alLytQdU+FKfYwA5+LxwfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WlXxBgRu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4EED3C4CEF7;
	Thu, 12 Mar 2026 07:12:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773299553;
	bh=4zE5duoA2GQsqDENdL1YG74aJauA3hcB054cECvfzE0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WlXxBgRuA5GSWJ9CE+evKx9kAPNc9AkZsoBgYNFMhsa9fomNm4TnYFGVnLDCkpJWk
	 FmmVCRggwXA9twvVLPSZk1lW68JIL1ioh+d0cxBtfQZMmjK+Q4DQ8RfxyxCpl46DAg
	 0FRcITWIh8WgRF8DpVtf9Mt4884YgOeXgnrP1oAwrLkrOj+oUP3BGNUvAtXXHPqTHW
	 o7BTWIFIxtfJcSKZsNIwq5e0okvs3932E+3Y5zC9lrkKoInFdD86fmE3zKu1ZCIQ4+
	 n9hIolIrGIaii+I50Yf4SpnqxeNQhv45iuaD87oYK3og/uvQYCF0ke0X0bB7HKQQpj
	 KCt2bSJ5qxEFA==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1w0aDf-000000077gO-1sXv;
	Thu, 12 Mar 2026 08:12:31 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-hardening@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Aleksandr Loktionov <aleksandr.loktionov@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH v2 06/20] docs: kdoc: use tokenizer to handle comments on structs
Date: Thu, 12 Mar 2026 08:12:14 +0100
Message-ID: <37117386c8ec0918a1d3a967bd785827fa2c2a1f.1773297828.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1773297828.git.mchehab+huawei@kernel.org>
References: <cover.1773297828.git.mchehab+huawei@kernel.org>
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
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-78928-lists,linux-doc=lfdr.de,huawei];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mchehab@kernel.org,linux-doc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc,huawei];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 0411B26E2B7
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

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Message-ID: <f83ee9e8c38407eaab6ad10d4ccf155fb36683cc.1773074166.git.mchehab+huawei@kernel.org>
---
 tools/lib/python/kdoc/kdoc_parser.py | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/tools/lib/python/kdoc/kdoc_parser.py b/tools/lib/python/kdoc/kdoc_parser.py
index 4b3c555e6c8e..6b181ead3175 100644
--- a/tools/lib/python/kdoc/kdoc_parser.py
+++ b/tools/lib/python/kdoc/kdoc_parser.py
@@ -13,7 +13,7 @@ import sys
 import re
 from pprint import pformat
 
-from kdoc.kdoc_re import NestedMatch, KernRe
+from kdoc.kdoc_re import NestedMatch, KernRe, CTokenizer
 from kdoc.kdoc_item import KdocItem
 
 #
@@ -84,15 +84,9 @@ def trim_private_members(text):
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
2.53.0


