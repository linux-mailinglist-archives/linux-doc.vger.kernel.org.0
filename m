Return-Path: <linux-doc+bounces-87423-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CF1qMIrnBGpCQQIAu9opvQ
	(envelope-from <linux-doc+bounces-87423-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 13 May 2026 23:05:14 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F97B53AD01
	for <lists+linux-doc@lfdr.de>; Wed, 13 May 2026 23:05:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A6A20304547E
	for <lists+linux-doc@lfdr.de>; Wed, 13 May 2026 21:02:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25841385D72;
	Wed, 13 May 2026 21:02:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="pSV2QSNG"
X-Original-To: linux-doc@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 947D025B090;
	Wed, 13 May 2026 21:02:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778706132; cv=none; b=cfbrm9sAaaz3NY7SZxsAnIhsKqwvmaQSGXYgXW7lF+D3/1Lz7H0jXMV4k+wQMJnc70VKuMTDN/Io5p0WIaU+mtXqgSw/m+ZZAlP/7UtsQhs18COB7kHvxYOlTF5hUkG5KLvDUt/TZK+tnOfMBz88I9GNdWQ+SF5ryzLLR80sYCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778706132; c=relaxed/simple;
	bh=TbkfPc8h9Yg2Y+A1hZpT5WLyg3Z/a6kJE+PemykFAuQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=eTjUt5+lV59nYG7pX6KiCH2izwDyXEZkc6zoMuEyVwYh3hzOn7pieTWY0mR2d3d5UBS0+1jT3RVwNhcapUMlpUlrVaYnh1HuE/kxB/uMYL7TGOgYkL7gnXT2pmIUWh0cKBa2LL9d1QpxHKx5jgHkBk4gk5EmL7DHLySfo0cLeLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=pSV2QSNG; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net B1293410B5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1778706129; bh=dTCLX34NNtsHVUB3KTt0hv/TciN7kdQPR191K7i/u/c=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=pSV2QSNGIXoYcVCjh2DBP4E8cOAPfrKXRDzQvzbuRXPQPmezZuML4u0DAvTrF5GXQ
	 PhDTDM/P0exezDUNMcyLzm7rcDg3OY+hHje/fZouQ29sRvxSgU9Sqo7dX1Cdyu8KWL
	 AXypaEy7BwJfjNSv8Rq6iV2N5u7W/F1P4Qjwf+3oXB8iFEbGnP2Jhdos+15Vx4uwdb
	 nQI0M4v/AVeBn4BFaV/aUXWvPvdJFcRMBVul/toYhP08kJF80VMVyqzYeu394weAL+
	 BU3TrEYe0uy8oUVNhSZoDKewFS0WeZ44D42DbGskkLtX0JHNtNPesqgOdB9Ob78+YL
	 CcpseXb2bKCHg==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id B1293410B5;
	Wed, 13 May 2026 21:02:09 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Willy Tarreau <w@1wt.eu>, Greg KH <greg@kroah.com>
Cc: Leon Romanovsky <leon@kernel.org>, skhan@linuxfoundation.org,
 security@kernel.org, workflows@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/3] Documentation: security-bugs: clarify
 requirements for AI-assisted reports
In-Reply-To: <87a4u3mpxk.fsf@trenco.lwn.net>
References: <20260509094755.2838-1-w@1wt.eu>
 <20260509094755.2838-4-w@1wt.eu> <87se7wo861.fsf@trenco.lwn.net>
 <2026051353-apricot-kleenex-fa57@gregkh> <agRfXQvN7ZDTNGQG@1wt.eu>
 <87a4u3mpxk.fsf@trenco.lwn.net>
Date: Wed, 13 May 2026 15:02:08 -0600
Message-ID: <87ik8r6n1r.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Rspamd-Queue-Id: 3F97B53AD01
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[lwn.net,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[lwn.net:s=20201203];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-87423-lists,linux-doc=lfdr.de];
	PRECEDENCE_BULK(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[lwn.net:+];
	MISSING_XM_UA(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[corbet@lwn.net,linux-doc@vger.kernel.org];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lwn.net:email,lwn.net:dkim,1wt.eu:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,trenco.lwn.net:mid]
X-Rspamd-Action: no action

Jonathan Corbet <corbet@lwn.net> writes:

> Willy Tarreau <w@1wt.eu> writes:
>
>> On Wed, May 13, 2026 at 12:30:10PM +0200, Greg KH wrote:
>>> > One nit:
>>> > 
>>> > > +  * **Impact Evaluation**: Many AI-generated reports lack an understanding of
>>> > > +    the kernel's threat model and go to great lengths inventing theoretical
>>> > > +    consequences.
>>> > 
>>> > If only we had a shiny new document describing that threat model that we
>>> > could reference here... :)
>>> 
>>> Ah yes, a link to that would make things better, but don't we have that
>>> elsewhere in this series?
>>
>> It's in the same patch, I think Jon was sarcastic here. I thought I had
>> addressed that one but apparently I was wrong :-/
>
> I'm just saying that this particular text should link to that document,
> don't make readers go searching for it.  I can certainly add a patch
> doing that if you like.

I was thinking something like this.

jon

From 3f02a3c190bab6b54e2a250ead0c7408af1a3c51 Mon Sep 17 00:00:00 2001
From: Jonathan Corbet <corbet@lwn.net>
Date: Wed, 13 May 2026 14:51:29 -0600
Subject: [PATCH 1/2] docs: security-bugs: add a link to the threat-model
 documentation

Rather than make readers search for this document, just a link to it where
it is referenced.

(While I was at it, I removed the unused and unneeded _threatmodel label
from the top of threat-model.rst).

Signed-off-by: Jonathan Corbet <corbet@lwn.net>
---
 Documentation/process/security-bugs.rst | 13 +++++++------
 Documentation/process/threat-model.rst  |  2 --
 2 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/Documentation/process/security-bugs.rst b/Documentation/process/security-bugs.rst
index f85c65f31f12f..3c51ddde31dd9 100644
--- a/Documentation/process/security-bugs.rst
+++ b/Documentation/process/security-bugs.rst
@@ -191,12 +191,13 @@ handle:
     Please **always convert your report to plain text** without any formatting
     decorations before sending it.
 
-  * **Impact Evaluation**: Many AI-generated reports lack an understanding of
-    the kernel's threat model and go to great lengths inventing theoretical
-    consequences. This adds noise and complicates triage. Please stick to
-    verifiable facts (e.g., "this bug permits any user to gain CAP_NET_ADMIN")
-    without enumerating speculative implications. Have your tool read this
-    documentation as part of the evaluation process.
+  * **Impact Evaluation**: Many AI-generated reports lack an understanding
+    of the kernel's threat model (see Documentation/process/threat-model.rst)
+    and go to great lengths inventing theoretical consequences. This adds
+    noise and complicates triage. Please stick to verifiable facts (e.g.,
+    "this bug permits any user to gain CAP_NET_ADMIN") without enumerating
+    speculative implications. Have your tool read this documentation as
+    part of the evaluation process.
 
   * **Reproducer**: AI-based tools are often capable of generating reproducers.
     Please always ensure your tool provides one and **test it thoroughly**. If
diff --git a/Documentation/process/threat-model.rst b/Documentation/process/threat-model.rst
index ecb432390e792..91da52f7114fd 100644
--- a/Documentation/process/threat-model.rst
+++ b/Documentation/process/threat-model.rst
@@ -1,5 +1,3 @@
-.. _threatmodel:
-
 The Linux Kernel threat model
 =============================
 
-- 
2.53.0


