Return-Path: <linux-doc+bounces-96466-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Pt1gGVisU2pMdQMAu9opvQ
	(envelope-from <linux-doc+bounces-96466-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sun, 12 Jul 2026 17:01:44 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C774E74512D
	for <lists+linux-doc@lfdr.de>; Sun, 12 Jul 2026 17:01:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b="hqEDX/qr";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-96466-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-doc+bounces-96466-lists+linux-doc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9BCB83027694
	for <lists+linux-doc@lfdr.de>; Sun, 12 Jul 2026 15:00:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D92D533ADA9;
	Sun, 12 Jul 2026 15:00:55 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89CB33385BC;
	Sun, 12 Jul 2026 15:00:54 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783868455; cv=none; b=AjWCCk/eJcgOus8YiRznQo7vJYj4y4McBMhjqZ1TzKmV0nCc97Tl2Q8OEeExdWcOstlWOBm/6Ruu3mxM7y+M6woY85nvGybHTpuvW+l3GM1rWsTnwR+z4UTEHcvKmdeWrPo4uimP4R/duFDH8kpA1RVWXsRCfAB6XCbRei7+oos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783868455; c=relaxed/simple;
	bh=TbWMuCdVsk6idi6belWdkFeK6k8m6ernlDMJz09zqX0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oZXkD5Dli40IlYqjxay8DD4bJ4I9+PDsQJAp84qjH7XtH8naajY1u0lTC7M2MbVNSdlqLniDbkN4d16xsfvImLXZZJF4g44rPwkdSM3elhud9AHvc8PcydYimpcP6kHZp1RujxDcHJT/F4aT4dAqlwplCekNVy2URXK66VVXZXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hqEDX/qr; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F8571F00A3A;
	Sun, 12 Jul 2026 15:00:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783868454;
	bh=85Ztyx8pOdBTh00fpIVUppASwDXOl/nChFjgIqRuMLw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=hqEDX/qrkR5XeA/ZqXRLWbiWnP4q9BP0gZhL4xguDIzBREygRXQsp1Cv9kf9evwFl
	 cSLbxOenQUBDZxh4DbFQ+0UEC6G4b+eGirP7ChWFwmjEchqnSYm00GRoSyTwXeeYYj
	 tc+C0sCwXh1rkwkhf6cjivcYZknylgKkkkwT/8vqKWuf7WNe72t4YE+GrBeHc3ypIB
	 j9UDp5F/CAX/sOloQ7QR5ORnFtX/dmK+XgJWyMzH3S5TGmwF0880Odjz7cXHw+7yX5
	 YTJpLwZqQ3I+momUkfpQZltNhQXdzap+TlARwimgU2avhaPh4obnibo6QR70uY2SKQ
	 GGTexkYa6r7iw==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.4)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1wivfo-00000003j0x-3Cgu;
	Sun, 12 Jul 2026 17:00:52 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	Shuah Khan <skhan@linuxfoundation.org>,
	Manuel Ebner <manuelebner@mailbox.org>
Subject: [PATCH 1/2] docs: maintainers_include: don't output duplicated profile entries
Date: Sun, 12 Jul 2026 16:59:39 +0200
Message-ID: <89182694652e67b89dfa413e25bd00eb365a551d.1783868309.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1783868309.git.mchehab+huawei@kernel.org>
References: <cover.1783868309.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-96466-lists,linux-doc=lfdr.de,huawei];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[mchehab@kernel.org,linux-doc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:corbet@lwn.net,m:linux-doc@vger.kernel.org,m:mchehab@kernel.org,m:mchehab+huawei@kernel.org,m:linux-kernel@vger.kernel.org,m:skhan@linuxfoundation.org,m:manuelebner@mailbox.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mchehab@kernel.org,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc,huawei];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,mailbox.org:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C774E74512D

Add a logic to prevent having duplicated maintainer's profile entries
at the rst output.

Reported-by: Manuel Ebner <manuelebner@mailbox.org>
Closes: https://lore.kernel.org/linux-doc/98a558a87a07ab641f47c66c372ee7ed0735f4f5.camel@mailbox.org/
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/sphinx/maintainers_include.py | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/Documentation/sphinx/maintainers_include.py b/Documentation/sphinx/maintainers_include.py
index dc9f9e188ffa..7df73f66e13c 100755
--- a/Documentation/sphinx/maintainers_include.py
+++ b/Documentation/sphinx/maintainers_include.py
@@ -336,16 +336,24 @@ class MaintainersProfile(Include):
         # Produce a list with all maintainer profiles, sorted by subsystem name
         #
         output = ""
-        for profile, entry in sorted(maint_parser.profile_entries.items()):
+        entries = set()
+        for profile, entry in maint_parser.profile_entries.items():
             name = profile.title()
 
             if entry.startswith("http"):
-                output += f"- `{name} <{entry}>`_\n"
+                new_entry = f"- `{name} <{entry}>`_\n"
             elif entry.startswith("`"):
-                output += f"- {name}: {entry}\n"
+                new_entry = f"- {name}: {entry}\n"
                 self.warning(f"{profile}: Invalid 'P' tag: {entry}\n")
             else:
-                output += f"- {entry}\n"
+                new_entry = f"- {entry}\n"
+
+            if new_entry not in entries:
+                entries.add(new_entry)
+
+        for entry in sorted(entries):
+            output += entry
+
 
         #
         # Create a hidden TOC table with all profiles. That allows adding
-- 
2.55.0


