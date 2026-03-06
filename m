Return-Path: <linux-doc+bounces-78209-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mBFpATj3qmlxZAEAu9opvQ
	(envelope-from <linux-doc+bounces-78209-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 06 Mar 2026 16:48:08 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 69CCD224306
	for <lists+linux-doc@lfdr.de>; Fri, 06 Mar 2026 16:48:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 66E2B30EA869
	for <lists+linux-doc@lfdr.de>; Fri,  6 Mar 2026 15:46:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E9BA3ED135;
	Fri,  6 Mar 2026 15:46:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k4Nlu4cu"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C94BC3ED10B;
	Fri,  6 Mar 2026 15:46:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772811960; cv=none; b=NsSqPxCCU2YTPX3PWQkENbZ6nYirv5VsA7mNT3BVSe5Fpe/XZG7ySC7gCOsJwHBkVlrBB8v6n0qKcZiy6wcYHS0UEYOq4zvMRwnSgrVvZyMM0jHOJ3nGqx1rWrUUzjK2UXCzaq9eNn+Eg64fK5nITJf7OQA/eyhf8daw4nvdbOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772811960; c=relaxed/simple;
	bh=I8pl1ObNgYBcBYQMqbLazkhnglEI29k6aw48idb2oew=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bzCt9vC5GERgghrfbmLWY2WtPUFszhw3RAZZKZsQnkPcfTFHsigXb9Mfkyz0ss59oFZqtf2OUNsliRXuI11TdOjH+P6J7VmeCpiLff3uZxBIu5+WOgOTlMgGmzFlaeCw+YUbL2PX2y5bx1v3MqM/4OLo4phwc+r1w2KfPIXhGgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k4Nlu4cu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61A84C2BCAF;
	Fri,  6 Mar 2026 15:46:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772811960;
	bh=I8pl1ObNgYBcBYQMqbLazkhnglEI29k6aw48idb2oew=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=k4Nlu4cuybc12bpnN6RHsliagb4P49/Oejk962NY8Z5HC88jUv/+1FsiWZu6eXH0q
	 jn0nZvtGXBJRS8/s8126f1RGd4Ca7HwFJYZZwd2lvURKKZRz5eUpTqFgN+Db8iNh/I
	 93dXA1hBgzocLNU9sqb7vL9AciTk747WJa66aZZ7c5T9w6uOhcAWM0ev5B5/wOfBxa
	 qW6hqtmKK2RNZ871DECFWxsxTaWl6KUQRljlIJ91iSBR1glUUCZ1UAbHlbjoYacnxD
	 J2wxmY3xu7jRaT9fiF59HHQ3/PR7edlhPb4c9EDkKciMOT5FlSkK4PjB+Rb4l83SBH
	 bsRnvADvuWj4Q==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1vyXNG-00000007ElA-20Da;
	Fri, 06 Mar 2026 16:45:58 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 13/13] docs: kdoc_output: better handle lists
Date: Fri,  6 Mar 2026 16:45:51 +0100
Message-ID: <edea87623550a51086c23c9af0edc5e9fcce0ed6.1772810752.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1772810752.git.mchehab+huawei@kernel.org>
References: <cover.1772810752.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
X-Rspamd-Queue-Id: 69CCD224306
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-78209-lists,linux-doc=lfdr.de,huawei];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mchehab@kernel.org,linux-doc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.971];
	TAGGED_RCPT(0.00)[linux-doc,huawei];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,self.data:url]
X-Rspamd-Action: no action

On several functions, the return values are inside a bullet
list. Also, on some places, there are numbered lists as well.

Use a troff markup to format them, to avoid placing everything
on a single line.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 tools/lib/python/kdoc/kdoc_output.py | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/tools/lib/python/kdoc/kdoc_output.py b/tools/lib/python/kdoc/kdoc_output.py
index df9af444da57..08539dd92cbb 100644
--- a/tools/lib/python/kdoc/kdoc_output.py
+++ b/tools/lib/python/kdoc/kdoc_output.py
@@ -963,6 +963,14 @@ class ManFormat(OutputFormat):
                     i += 1
                     continue
 
+                #
+                # Handle lists
+                #
+                line = KernRe(r'^[-*]\s+').sub(r'.IP \[bu]\n', line)
+                line = KernRe(r'^(\d+|a-z)[\.\)]\s+').sub(r'.IP \1\n', line)
+            else:
+                line = ".PP\n"
+
             i += 1
 
             self.data += line + "\n"
-- 
2.52.0


