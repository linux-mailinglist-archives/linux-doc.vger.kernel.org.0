Return-Path: <linux-doc+bounces-84639-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2bFcCOI/7mnqrgAAu9opvQ
	(envelope-from <linux-doc+bounces-84639-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sun, 26 Apr 2026 18:40:02 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DE4C46A983
	for <lists+linux-doc@lfdr.de>; Sun, 26 Apr 2026 18:40:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EF3603007F53
	for <lists+linux-doc@lfdr.de>; Sun, 26 Apr 2026 16:39:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4747D2701B8;
	Sun, 26 Apr 2026 16:39:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=1wt.eu header.i=@1wt.eu header.b="IbPrCOGu"
X-Original-To: linux-doc@vger.kernel.org
Received: from mta1.formilux.org (mta1.formilux.org [51.159.59.229])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74B3A15ECCC;
	Sun, 26 Apr 2026 16:39:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=51.159.59.229
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777221599; cv=none; b=MiIIj26D7g58yMBS5WGT6gFFqB08skWUbdeIkafTUhxzKwNyt4lVGkWhJw5S7SNElQZXa8vTFhE8Y53IPr3pUM78HQ3K3Nicu+JvZGa5mOKMwDsbQlDUF7Wv4XzoAR9hcCjAO50AsgQCrpkkHg/tmXGgKQ1604xx21RRiTqdsOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777221599; c=relaxed/simple;
	bh=Zpm+q72om5yA8p4EnQwGqp0rxQ3IAcd9DhWAGW7hhRQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Mk3JBDFlIVM0JloNVZU7QuplPc4qpejqpJRejr4IG6bqkKgWas60rlq0wOsOW3TJo+8iXdqyapBVMsPgEetgUUhRzgi8TL3dOTkR8YPX08us27IOPIii5af4CWhshk3e9kq4zQJ3oJnikjGZGm1vbHqTfzxvwiwG3F3jGbpGyrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=1wt.eu; spf=pass smtp.mailfrom=1wt.eu; dkim=pass (1024-bit key) header.d=1wt.eu header.i=@1wt.eu header.b=IbPrCOGu; arc=none smtp.client-ip=51.159.59.229
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=1wt.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=1wt.eu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=1wt.eu; s=mail;
	t=1777221592; bh=Ud0GtTrott0uPFZMSj7ou7b9Gz9IWwgrKBvjc4zUFoE=;
	h=From:Message-ID:From;
	b=IbPrCOGuUHmX+82zwGMIN9EKKrzHc3DAYNUQj94YS1s/5Xh9IOjMQDVstIujHunoO
	 WyeEqWY/kKNqP2cSGLRIofT5xyLxrl0WEvF4uJ44WyBU1ay8e8i0BU1XwfcRJpkMg+
	 p9MQ5ykDhVROZ0ZzWz2MU9HH3P0NPWQrbKXGVCJw=
Received: from 1wt.eu (ded1.1wt.eu [163.172.96.212])
	by mta1.formilux.org (Postfix) with ESMTP id 7A609C0B22;
	Sun, 26 Apr 2026 18:39:52 +0200 (CEST)
From: Willy Tarreau <w@1wt.eu>
To: greg@kroah.com
Cc: leon@kernel.org, security@kernel.org, Jonathan Corbet <corbet@lwn.net>,
        skhan@linuxfoundation.org, workflows@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Willy Tarreau <w@1wt.eu>, Greg KH <gregkh@linuxfoundation.org>
Subject: [PATCH 1/3] Documentation: security-bugs: do not systematically Cc the security team
Date: Sun, 26 Apr 2026 18:39:12 +0200
Message-ID: <20260426163914.19449-2-w@1wt.eu>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260426163914.19449-1-w@1wt.eu>
References: <20260426163914.19449-1-w@1wt.eu>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 5DE4C46A983
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[1wt.eu,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[1wt.eu:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-84639-lists,linux-doc=lfdr.de];
	DKIM_TRACE(0.00)[1wt.eu:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[w@1wt.eu,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linuxfoundation.org:email]

With the increase of automated reports, the security team is dealing
with way more messages than really needed. The reporting process works
well with most teams so there is no need to systematically involve the
security team in reports.

Let's suggest to keep it for small lists of recipients, to cover the
risk of lost messages (spam, vacation etc) but to avoid it for larger
teams.

Cc: Greg KH <gregkh@linuxfoundation.org>
Cc: Leon Romanovsky <leon@kernel.org>
Signed-off-by: Willy Tarreau <w@1wt.eu>
---
 Documentation/process/security-bugs.rst | 26 ++++++++++++++-----------
 1 file changed, 15 insertions(+), 11 deletions(-)

diff --git a/Documentation/process/security-bugs.rst b/Documentation/process/security-bugs.rst
index 27b028e858610..a8a8fc724e8c8 100644
--- a/Documentation/process/security-bugs.rst
+++ b/Documentation/process/security-bugs.rst
@@ -70,11 +70,10 @@ Identifying contacts
 --------------------
 
 The most effective way to report a security bug is to send it directly to the
-affected subsystem's maintainers and Cc: the Linux kernel security team.  Do
-not send it to a public list at this stage, unless you have good reasons to
-consider the issue as being public or trivial to discover (e.g. result of a
-widely available automated vulnerability scanning tool that can be repeated by
-anyone).
+affected subsystem's maintainers.  Do not send it to a public list at this
+stage, unless you have good reasons to consider the issue as being public or
+trivial to discover (e.g. result of a widely available automated vulnerability
+scanning tool that can be repeated by anyone).
 
 If you're sending a report for issues affecting multiple parts in the kernel,
 even if they're fairly similar issues, please send individual messages (think
@@ -148,12 +147,17 @@ run additional tests.  Reports where the reporter does not respond promptly
 or cannot effectively discuss their findings may be abandoned if the
 communication does not quickly improve.
 
-The report must be sent to maintainers, with the security team in ``Cc:``.
-The Linux kernel security team can be contacted by email at
-<security@kernel.org>.  This is a private list of security officers
-who will help verify the bug report and assist developers working on a fix.
-It is possible that the security team will bring in extra help from area
-maintainers to understand and fix the security vulnerability.
+The report must be sent to maintainers.  If there are two or fewer recipients
+in your message, and only in this case, you can also Cc: the Linux kernel
+security team who will ensure the message is delivered to the proper people,
+and will be able to assist small maintainers teams with a process they are not
+necessarily familiar with.  For larger teams, please do not Cc: the Linux
+kernel security team, unless you're seeking specific help (e.g. when resending
+a message which got no response within a week).  The Linux kernel security team
+can be contacted by email at <security@kernel.org>.  This is a private list of
+security officers who will help verify the bug report and assist developers
+working on a fix.  It is possible that the security team will bring in extra
+help from area maintainers to understand and fix the security vulnerability.
 
 Please send **plain text** emails without attachments where possible.
 It is much harder to have a context-quoted discussion about a complex
-- 
2.52.0


