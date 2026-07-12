Return-Path: <linux-doc+bounces-96465-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id DZQlKFOsU2pLdQMAu9opvQ
	(envelope-from <linux-doc+bounces-96465-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sun, 12 Jul 2026 17:01:39 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E46F2745128
	for <lists+linux-doc@lfdr.de>; Sun, 12 Jul 2026 17:01:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=LkHTlnWn;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-96465-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-96465-lists+linux-doc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6AA273025922
	for <lists+linux-doc@lfdr.de>; Sun, 12 Jul 2026 15:00:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE6F833AD99;
	Sun, 12 Jul 2026 15:00:55 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FDFC33A70A;
	Sun, 12 Jul 2026 15:00:54 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783868455; cv=none; b=kf7OpGmSdSIVqwBOxzuGXaVcAdpIUzzHuHmfI8HRi3CzJkjBZSZ5y6TZ+nNw4kFVpXIr8rIC3cfdLhpNOL/oENMkaEEuGdRDYEHb2HnVxIV8xOs0AoETY3yc9MUkgOghaXK4+nlAZeJCkTzS0S5R2NI5z8+svSSYFBQP3I+wPQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783868455; c=relaxed/simple;
	bh=9ra3WOQMmyMROB3JfqeRXIlfwHMKIYcvg4WRAPZN22E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jeLy4EBM6jWj7Tuzg2xwyXpUbKZu5KAVubSbajFQfrC5yqh5Y/9Z7/9wbYhAfX6f1Z/oTGY76b6SJgRVhfJ8+pBZMdf4i5ATny/FhTcXrypzPUR0hruYJqBS+6iBcVgYiJvpp7kTjidnpwBEOaJcrJEGo8bTNFl24CrOSTyz1tg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LkHTlnWn; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C2AC1F00A3D;
	Sun, 12 Jul 2026 15:00:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783868454;
	bh=SFJk9gjDvrD5CEBsAC34vf7JxOqUGyNlJq5pVsuQDn4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=LkHTlnWnkw/A6Cs0tC668vWt3yLVEngqKI/jZo0CKZkmdbs033NxrO5WX0CI8AX09
	 tDNtyzRl/mDIgSerhsxX82NRiuNwtDeFTGSqAd6EJpnPZ5gT02ex/mVCgA/ZSxXqzX
	 w3Krn6fuPB8hqvUG7i9BhnBMHdykJ8aUDFoStNzRSbRjPWWzqR891bMcaHJppzQPFY
	 jCYM9KPNX9UgOoq9pbl0kLSTSLjraKd/ptVivqSBjaweNUHLGuVKGreNXlIGS84gws
	 6d+4qygqougrMMcTMt5AZtyFo3lYskDDL9R8wlo8gSCBPFVdmzBazKwMAWVSObOL3J
	 TM4f7DL011Alw==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.4)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1wivfo-00000003j11-3KFT;
	Sun, 12 Jul 2026 17:00:52 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	Shuah Khan <skhan@linuxfoundation.org>,
	Manuel Ebner <manuelebner@mailbox.org>
Subject: [PATCH 2/2] docs: maintainers_include.py: output subsystem name if available
Date: Sun, 12 Jul 2026 16:59:40 +0200
Message-ID: <7ed8f90597230358d3f38e2eaa007993a5c1970e.1783868309.git.mchehab+huawei@kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-96465-lists,linux-doc=lfdr.de,huawei];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[mchehab@kernel.org,linux-doc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:corbet@lwn.net,m:linux-doc@vger.kernel.org,m:mchehab@kernel.org,m:mchehab+huawei@kernel.org,m:linux-kernel@vger.kernel.org,m:skhan@linuxfoundation.org,m:manuelebner@mailbox.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E46F2745128

If the subsystem name is available (which should always be true,
except if the parser has an issue), outputs the subsystem's name
at the profile entry.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/sphinx/maintainers_include.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/sphinx/maintainers_include.py b/Documentation/sphinx/maintainers_include.py
index 7df73f66e13c..1596630a74ca 100755
--- a/Documentation/sphinx/maintainers_include.py
+++ b/Documentation/sphinx/maintainers_include.py
@@ -345,6 +345,8 @@ class MaintainersProfile(Include):
             elif entry.startswith("`"):
                 new_entry = f"- {name}: {entry}\n"
                 self.warning(f"{profile}: Invalid 'P' tag: {entry}\n")
+            elif name:
+                new_entry = f"- {name}: {entry}\n"
             else:
                 new_entry = f"- {entry}\n"
 
-- 
2.55.0


