Return-Path: <linux-doc+bounces-86591-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WKKqFMPa/mnfxQAAu9opvQ
	(envelope-from <linux-doc+bounces-86591-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sat, 09 May 2026 08:57:07 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E9DF04FE555
	for <lists+linux-doc@lfdr.de>; Sat, 09 May 2026 08:57:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D46463008D67
	for <lists+linux-doc@lfdr.de>; Sat,  9 May 2026 06:57:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4445E381AFF;
	Sat,  9 May 2026 06:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ex2mb0L6"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EEBE37BE71;
	Sat,  9 May 2026 06:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778309813; cv=none; b=V9KTGgqx2vTeTidi3Yl9qVD4bhGPwQTAlt9HeaQDb7mBHqUoCH/nOtCVmI+d4BDc+7bWs0GUJ7y5nstyzQ2y14iKmKqThOeOwNlOltYo9MBb0mOlBhMEw1Q/dmRCDlWSWEQPNDkH57QeFkPk5RkXwXoj5LGhvh42wbP2mh9TtXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778309813; c=relaxed/simple;
	bh=gsoRMnvNN6edah3oPgUMaTpEDfU7uOambafbgeXQ/3s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QWDYhqkkS8TxsVeVLgln610dF5u+HIw4V4xNRu+OJBETP/m0qCCajcLi8fimQQiQn4Z/gFlTK9YGtV+eOeomq2AUIPOcn4p2bioL46wm9N4skXng+ocz3GTleS8vsBtuJVdkiEMhzl8m3RMqzdVIuEBtxkulDO46UUgZHzGAR8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ex2mb0L6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 960AFC2BCFC;
	Sat,  9 May 2026 06:56:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778309812;
	bh=gsoRMnvNN6edah3oPgUMaTpEDfU7uOambafbgeXQ/3s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Ex2mb0L6BYdXTrSN+WYsAO9UuCrQ7U0294tYEDYty1x5Bu3wsn7V/dywF6GPpY5Ck
	 EbDm16sxnFRnonq6K29zWN2Md692UAq/aqjzpspfMzEaSt+mIRXajwVWEujKwFgSqc
	 R8r/cnSujfSr3BwEvJfKcmwiUJmEoLgpPDWM5Hu3AHGbThVUHQH51JR884WIf604el
	 XMLUwO68wuNHWOXCuThuL2l51UI2iqG7La16jUbVeXkUqB7wudmV4DqZxjSmYvTflS
	 eA1k3QkrJ6q1j6PtG+HpmyQ20ph0jOlDE2AnloY17I4apynOyG+uXN8ailOekiqn/y
	 E9fk/rg5Ptiaw==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1wLbcI-00000000GJ7-35K2;
	Sat, 09 May 2026 08:56:50 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Benno Lossin <lossin@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	Miguel Ojeda <ojeda@kernel.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Trevor Gross <tmgross@umich.edu>
Subject: [PATCH v3 09/13] docs: maintainers_include: don't ignore invalid profile entries
Date: Sat,  9 May 2026 08:56:42 +0200
Message-ID: <98915f35442fa12c6d59611083aea3adbf8c6aff.1778309595.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1778309595.git.mchehab+huawei@kernel.org>
References: <cover.1778309595.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
X-Rspamd-Queue-Id: E9DF04FE555
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,protonmail.com,google.com,garyguo.net,linuxfoundation.org,umich.edu];
	TAGGED_FROM(0.00)[bounces-86591-lists,linux-doc=lfdr.de,huawei];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mchehab@kernel.org,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-doc,huawei];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Currently, there is a "P" entry for Rust pin-init that is
neither a valid ReST file inside Documentation nor an URL.

A proper fix is to either convert/move the file or point to
a URL. Yet, the parser should be able to pick what's there and
show on its output.

Add a logic to produce a warning when this happens.

Message-ID: <63228e005fcf3dc4583cee06905341e8bce84181.1777987027.git.mchehab+huawei@kernel.org>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/sphinx/maintainers_include.py | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/Documentation/sphinx/maintainers_include.py b/Documentation/sphinx/maintainers_include.py
index 7035754a1c66..073a10575872 100755
--- a/Documentation/sphinx/maintainers_include.py
+++ b/Documentation/sphinx/maintainers_include.py
@@ -240,6 +240,8 @@ class MaintainersParser:
                 if match:
                     entry = match.group(1).strip()
                     self.profile_entries[self.subsystem_name] = entry
+                else:
+                    self.profile_entries[self.subsystem_name] = f"``{details}``"
 
         details = self.linkify(details)
 
@@ -328,12 +330,15 @@ class MaintainersProfile(Include):
         #
         output = ""
         for profile, entry in sorted(maint_parser.profile_entries.items()):
-            profile = profile.title()
+            name = profile.title()
 
             if entry.startswith("http"):
-                output += f"- `{profile} <{entry}>`_\n"
+                output += f"- `{name} <{entry}>`_\n"
+            elif entry.startswith("`"):
+                output += f"- {name}: {entry}\n"
+                self.warning(f"{profile}: Invalid 'P' tag: {entry}\n")
             else:
-                output += f"- :doc:`{profile} <{entry}>`\n"
+                output += f"- :doc:`{name} <{entry}>`\n"
 
         #
         # Create a hidden TOC table with all profiles. That allows adding
-- 
2.54.0


