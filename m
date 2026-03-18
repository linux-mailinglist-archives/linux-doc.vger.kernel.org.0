Return-Path: <linux-doc+bounces-79958-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SCcQMEO2umlWawIAu9opvQ
	(envelope-from <linux-doc+bounces-79958-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 18 Mar 2026 15:27:15 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 56D332BD166
	for <lists+linux-doc@lfdr.de>; Wed, 18 Mar 2026 15:27:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 12150301025A
	for <lists+linux-doc@lfdr.de>; Wed, 18 Mar 2026 14:26:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B76C1F3B87;
	Wed, 18 Mar 2026 14:26:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I3xH968+"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4850A35DA51;
	Wed, 18 Mar 2026 14:26:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773843979; cv=none; b=Nltag6hcPr3+Mp6V99ANNBwuBgT1thrSsXg7MHtOr4EMQU1Ewz4Wsh+xdipQqU7tbcjlpFFN1vgPKiosimexVbnvXSEs5+n9RBSlAQ+sQd1WE+0VFlDPQKqMCaaOIDwxTzCU3ZbCebAIyRYJYZJUy8WjDZRlvV5Q7Shmg3Hjlvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773843979; c=relaxed/simple;
	bh=HwY8I3zXcImK3OgeF7kPvxKVjw/REp9yVm0+IjtHVcc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=d0AzRKM6yFxC3IVw2OK23kxo/nAnxMPjEHz0mCqnxcF7mchNbl7ZCrG/gXtAlqfoLwONfmO7SC1hXEs78tUOEt6tkR+RlGNsQpJOBoN/eG/c2MEBxumSytIpdWRZAKsrmqoEJLfvpeXQEETIK9VfIHKpvKhQZnA1sEtG27rYFwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I3xH968+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2521EC19424;
	Wed, 18 Mar 2026 14:26:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773843979;
	bh=HwY8I3zXcImK3OgeF7kPvxKVjw/REp9yVm0+IjtHVcc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=I3xH968+8pEaUPHWnDNTGGElsQPixBSu0ElyYoyhx29T5S8liJDBHtKCUBAn0DyYG
	 YU4dS7oqY3XaE6DQCjaobw+QhrIEAkZpQwVsFkxsAOUDeLX3N9w0bh2otv3sfxvOwY
	 GM4SIHZIuv1w/4EmCQwA/L6tQyjgu0KmL30wTFjT3+ogQyV8jd2D90JPk31/4luxeY
	 IuaMqfKTwttKH8I5KSYRk90iKHW16fCJmQiqVTXb2Pp9sg5y23Wv6Y6T5DaFer8Con
	 X9KVjn08nMmRI3vIV8qcJruC32TUvqKv7TmWO7enE2B2qcqAGC6UdvgZoaQ4qAtKmw
	 KV+quvYruwVnw==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1w2rqj-00000004HXG-12o7;
	Wed, 18 Mar 2026 15:26:17 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	Aleksandr Loktionov <aleksandr.loktionov@intel.com>,
	Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH 1/7] docs: kdoc_parser: add some debug for variable parsing
Date: Wed, 18 Mar 2026 15:26:05 +0100
Message-ID: <e9628303cc68a602482c69967fed1f06e731d8f7.1773841456.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1773841456.git.mchehab+huawei@kernel.org>
References: <cover.1773841456.git.mchehab+huawei@kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-79958-lists,linux-doc=lfdr.de,huawei];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mchehab@kernel.org,linux-doc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-0.995];
	TAGGED_RCPT(0.00)[linux-doc,huawei];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,infradead.org:email]
X-Rspamd-Queue-Id: 56D332BD166
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This is a new parser that we're still fine-tuning. Add some
extra debug messages to help addressing issues over there.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Acked-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org>
Reviewed-by: Aleksandr Loktionov <aleksandr.loktionov@intel.com>
---
 tools/lib/python/kdoc/kdoc_parser.py | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/tools/lib/python/kdoc/kdoc_parser.py b/tools/lib/python/kdoc/kdoc_parser.py
index a10e64589d76..bbad4a3e4d4d 100644
--- a/tools/lib/python/kdoc/kdoc_parser.py
+++ b/tools/lib/python/kdoc/kdoc_parser.py
@@ -882,11 +882,19 @@ class KernelDoc:
                 declaration_name = r.group(1)
 
             default_val = r.group(2)
+
+            self.config.log.debug("Variable proto parser: %s from '%s'",
+                                  r.groups(), proto)
+
         else:
             r= KernRe(OPTIONAL_VAR_ATTR + r"(?:[\w_\s]*)?\s+(?:\*+)?(?:[\w_]+)\s*[\d\]\[]*\s*(=.*)?")
 
             if r.match(proto):
                 default_val = r.group(1)
+
+        if default_val:
+            self.config.log.debug("default: '%s'", default_val)
+
         if not declaration_name:
            self.emit_msg(ln,f"{proto}: can't parse variable")
            return
@@ -894,6 +902,9 @@ class KernelDoc:
         if default_val:
             default_val = default_val.lstrip("=").strip()
 
+        self.config.log.debug("'%s' variable prototype: '%s', default: %s",
+                              declaration_name, proto, default_val)
+
         self.output_declaration("var", declaration_name,
                                 full_proto=full_proto,
                                 default_val=default_val,
-- 
2.52.0


