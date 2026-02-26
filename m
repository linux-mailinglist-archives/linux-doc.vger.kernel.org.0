Return-Path: <linux-doc+bounces-77228-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oFrXI35voGk3jgQAu9opvQ
	(envelope-from <linux-doc+bounces-77228-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 26 Feb 2026 17:06:22 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BC811A99B4
	for <lists+linux-doc@lfdr.de>; Thu, 26 Feb 2026 17:06:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C0DFF30B89C7
	for <lists+linux-doc@lfdr.de>; Thu, 26 Feb 2026 15:59:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F21FE42DFFF;
	Thu, 26 Feb 2026 15:56:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thorsis.com header.i=@thorsis.com header.b="ZMFUxuWy"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail.thorsis.com (mail.thorsis.com [217.92.40.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57F9342981A;
	Thu, 26 Feb 2026 15:56:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.92.40.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772121416; cv=none; b=oagttjWndDtH5g0wgDyHyqGggjo4JxwGS84qZR7HJU8z25mB/mJ/Bz8R47Z8myRqydGlzO8VFVW2OPQ5QZSbbzInCJRz+QVhwExrj2mrx3oHgIHc9FNCuztkb5+iZNvBiqi+Jwli/IYDgVPRR73vw014sdSBlwyUDEc673H5UDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772121416; c=relaxed/simple;
	bh=f3+Ecr5/HQWuhvNp+zHEIbMzl/pJzzTr39VQ67h3VBI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LeAEaJeqG7wik8kPerwGvkNszt8uPqP3lVq9a0yJmhRjDyIQgCIdUxj0GF1I6qEZkJgOYSUPXOccKuy3glfyvOsvh2ZhoVskpg/GWx2URCBXIqRXKYwI9NclIrzgqpgyl/3sc6zP6RtGr6kqKRwgg3XGAbSA/PpDqAcMDjjnc30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=thorsis.com; spf=pass smtp.mailfrom=thorsis.com; dkim=pass (2048-bit key) header.d=thorsis.com header.i=@thorsis.com header.b=ZMFUxuWy; arc=none smtp.client-ip=217.92.40.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=thorsis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thorsis.com
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 491D51486E9D;
	Thu, 26 Feb 2026 16:56:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=thorsis.com; s=dkim;
	t=1772121395; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=A06kg6CiR5kRLTRkrkEYzfmLVvYjkpG7fFLV3p9x0EE=;
	b=ZMFUxuWy/IVDEuiWiB3KHT/qpJQ6M6YO/hqLegH+I0DMkabP2eP0MDIj0+2sJ2nlIdZ6cz
	Ieb/KVo/Xn3E8PGlm/9MZWiWk6oipCsxwEyUvzycptFWetR+2j/3jGl3URCQa9i/R6unVF
	r2fp+q7u555MEpQr+4RCDP8L4gI8dj2uh2jXuXp07uWkX4HAEV5kM3AcZEIxdG1rYGeFLV
	i0/XEghthj+MDitNbhwL0r9+GhWfPxsSFkdPCbMYie+SvsiWXwk3nS5WPuE/+xYJX3slXl
	SIQd1RrzXZ4/+ZI7jn4wF1WYdKZk8qv6kSijHeUHXUaE1EPBi96HU9eEBxdHFA==
From: Alexander Dahl <ada@thorsis.com>
To: linux-doc@vger.kernel.org
Cc: Stephan Mueller <smueller@chronox.de>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-crypto@vger.kernel.org (open list:CRYPTO API),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] docs: crypto: userspace-if: Fix outdated links
Date: Thu, 26 Feb 2026 16:56:27 +0100
Message-ID: <20260226155627.3243344-1-ada@thorsis.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[thorsis.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[thorsis.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-77228-lists,linux-doc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[thorsis.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ada@thorsis.com,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-doc];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,chronox.de:url,archive.org:url,thorsis.com:mid,thorsis.com:dkim,thorsis.com:email]
X-Rspamd-Queue-Id: 4BC811A99B4
X-Rspamd-Action: no action

According to archive.org the site threw HTTP errors 404 since early 2024.
The last snapshot in the archive having actual content was from late 2023.
The page behind the new URL has more or less the same content as the
archived page from 2023, so it probably was just moved without setting
up a redirect.

Signed-off-by: Alexander Dahl <ada@thorsis.com>
---
 Documentation/crypto/userspace-if.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/crypto/userspace-if.rst b/Documentation/crypto/userspace-if.rst
index 8158b363cd98f..021759198fe77 100644
--- a/Documentation/crypto/userspace-if.rst
+++ b/Documentation/crypto/userspace-if.rst
@@ -23,7 +23,7 @@ user space, however. This includes the difference between synchronous
 and asynchronous invocations. The user space API call is fully
 synchronous.
 
-[1] https://www.chronox.de/libkcapi.html
+[1] https://www.chronox.de/libkcapi/index.html
 
 User Space API General Remarks
 ------------------------------
@@ -406,4 +406,4 @@ Please see [1] for libkcapi which provides an easy-to-use wrapper around
 the aforementioned Netlink kernel interface. [1] also contains a test
 application that invokes all libkcapi API calls.
 
-[1] https://www.chronox.de/libkcapi.html
+[1] https://www.chronox.de/libkcapi/index.html

base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
-- 
2.47.3


