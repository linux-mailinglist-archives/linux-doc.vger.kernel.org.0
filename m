Return-Path: <linux-doc+bounces-93755-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id EGt1AR61PmoqKgkAu9opvQ
	(envelope-from <linux-doc+bounces-93755-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 26 Jun 2026 19:21:34 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 65FA96CF639
	for <lists+linux-doc@lfdr.de>; Fri, 26 Jun 2026 19:21:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linux.dev header.s=key1 header.b=Vm5itcG9;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-93755-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-93755-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linux.dev;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4B34030683E0
	for <lists+linux-doc@lfdr.de>; Fri, 26 Jun 2026 17:21:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D5AB3FBEBC;
	Fri, 26 Jun 2026 17:21:06 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from out-174.mta0.migadu.com (out-174.mta0.migadu.com [91.218.175.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9590D3F1ADB
	for <linux-doc@vger.kernel.org>; Fri, 26 Jun 2026 17:21:04 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782494466; cv=none; b=At7+MINpb5FHaRoqa5+DGfSByA0RIfQ+XOnFBeGgFqzxwpAOLdN8h5JTU1hSGPT4IBeDwVpamALHFlrABlgC1O1emhEcSaF63Ls6IB2fUGoJNyyybDIqHHZoRCLQXcMWc5tr5IFndRLbbXZsqpWLMW5E5DsvvsiRm/r2xXdebnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782494466; c=relaxed/simple;
	bh=q2Cv0Xql/qftpCYgDKhvRODhJjVn1gDLrqwNHRKsOuA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MOxu5qyClcQH37dXyLlc2WzUhQKGBpMxK317usFkv/SrUO8pXSnDGiNG1PuOXZyYpxth4T7N9XNfXoYnJzKv7F1lhwK3txZAyyc4geOsJTwFose0VF3YnNz206Z5VG8fxQMBLQsYCx4hTVf5lri0TN474zk1u389cjByjaFmKOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Vm5itcG9; arc=none smtp.client-ip=91.218.175.174
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1782494452;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=2Xg7cKreO3eTZGOl7kCsYPcqSDyRb1+Ql6WyJKlGBcw=;
	b=Vm5itcG9mBWJYoa2spr2swaJPOZ8/2SXaAIqAuwy3E2sRd9O4HcKLPg6VT2AH4X3cgillI
	D3jhKOiX9XltBytbRktXQnzjVPSVQ81bR81z/IqK8RS2Zx4+ZJaiH+Ug8gM6aD7ymWiUDM
	Y1jk2XC/2sYvomvVLkyrFEKZvc3CZ/4=
From: JP Kobryn <jp.kobryn@linux.dev>
To: ast@kernel.org,
	roman.gushchin@linux.dev,
	daniel@iogearbox.net,
	andrii@kernel.org,
	eddyz87@gmail.com,
	memxor@gmail.com,
	martin.lau@linux.dev,
	song@kernel.org,
	yonghong.song@linux.dev,
	jolsa@kernel.org,
	emil@etsalapatis.com,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	bpf@vger.kernel.org
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] Documentation/bpf: make it clear that kfuncs should be non-static
Date: Fri, 26 Jun 2026 10:20:26 -0700
Message-ID: <20260626172026.7327-1-jp.kobryn@linux.dev>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linux.dev,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[linux.dev:s=key1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93755-lists,linux-doc=lfdr.de];
	FORGED_SENDER(0.00)[jp.kobryn@linux.dev,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:ast@kernel.org,m:roman.gushchin@linux.dev,m:daniel@iogearbox.net,m:andrii@kernel.org,m:eddyz87@gmail.com,m:memxor@gmail.com,m:martin.lau@linux.dev,m:song@kernel.org,m:yonghong.song@linux.dev,m:jolsa@kernel.org,m:emil@etsalapatis.com,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:bpf@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,linux.dev,iogearbox.net,gmail.com,etsalapatis.com,lwn.net,linuxfoundation.org,vger.kernel.org];
	RCVD_COUNT_THREE(0.00)[3];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jp.kobryn@linux.dev,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[linux.dev:+];
	TO_DN_NONE(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.dev:dkim,linux.dev:email,linux.dev:mid,linux.dev:from_mime,vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 65FA96CF639

The kfunc documentation mentions how the macro __bpf_kfunc prevents
inlining for static functions. This makes it sound like static kfuncs are
acceptable. Although static kfuncs may happen to work, it is by chance that
the compiler chose not to rename these functions and BTF resolution still
succeeds.

Make it clear in the documentation why kfuncs should not be declared
static. First, remove wording that makes it sound like static is ok. Then
point out the external naming needed for BTF resolution. Finally point out
that sparse may warn on unreferenced kfuncs and that this warning can be
ignored.

Signed-off-by: JP Kobryn <jp.kobryn@linux.dev>
---
 Documentation/bpf/kfuncs.rst | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/Documentation/bpf/kfuncs.rst b/Documentation/bpf/kfuncs.rst
index 4c814ff6061e..1dbaff8d4805 100644
--- a/Documentation/bpf/kfuncs.rst
+++ b/Documentation/bpf/kfuncs.rst
@@ -276,19 +276,26 @@ This set encodes the BTF ID of each kfunc listed above, and encodes the flags
 along with it. Ofcourse, it is also allowed to specify no flags.
 
 kfunc definitions should also always be annotated with the ``__bpf_kfunc``
-macro. This prevents issues such as the compiler inlining the kfunc if it's a
-static kernel function, or the function being elided in an LTO build as it's
-not used in the rest of the kernel. Developers should not manually add
-annotations to their kfunc to prevent these issues. If an annotation is
-required to prevent such an issue with your kfunc, it is a bug and should be
-added to the definition of the macro so that other kfuncs are similarly
-protected. An example is given below::
+macro. This prevents issues such as the compiler inlining the kfunc, or the
+function being elided in an LTO build as it's not used in the rest of the
+kernel. Developers should not manually add annotations to their kfunc to prevent
+these issues. If an annotation is required to prevent such an issue with your
+kfunc, it is a bug and should be added to the definition of the macro so that
+other kfuncs are similarly protected. An example is given below::
 
         __bpf_kfunc struct task_struct *bpf_get_task_pid(s32 pid)
         {
         ...
         }
 
+Note that kfuncs must not be declared ``static``. A kfunc can be called from a
+BPF program ``*.c`` file outside the compilation unit that defines it, so its
+externally visible name must remain available for BTF ID lookup. ``static``
+linkage allows the compiler to rename the function, which can break this
+BTF-based kfunc resolution. Further note that sparse may warn that an otherwise
+unreferenced kfunc should be static. Such warnings should be ignored for kfunc
+definitions.
+
 2.5.1 KF_ACQUIRE flag
 ---------------------
 
-- 
2.54.0


