Return-Path: <linux-doc+bounces-83771-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0KbzHMLu42l9MwEAu9opvQ
	(envelope-from <linux-doc+bounces-83771-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sat, 18 Apr 2026 22:51:14 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 028F7422409
	for <lists+linux-doc@lfdr.de>; Sat, 18 Apr 2026 22:51:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 96E40302C5FB
	for <lists+linux-doc@lfdr.de>; Sat, 18 Apr 2026 20:50:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45B2F30E82C;
	Sat, 18 Apr 2026 20:50:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="NcStPSRE"
X-Original-To: linux-doc@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 630EE19DF6A;
	Sat, 18 Apr 2026 20:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776545404; cv=none; b=P2DEahnLEcTFjABOyvRjqSKCqsK5cuJFvAnHsoY6U6iQlRyya4WUJej5iAFJ44YYixoOz3a+SQZHsnm058Z287f6x6E3eB+gLoJgXWgB/nNAnQgGDUHpEv3dGJx8pxLNX9JGDLtsVIPQbXSL2MGFcpP0lNrj9/nYqe+PdBM8KAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776545404; c=relaxed/simple;
	bh=H6WgkZZcA/mA2cLpnncZ0V6CejHxgd1bABjG2+xoA64=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TjSyXqnqWuoz9LBN87c9ZGQH5+rYKcuFrPSfCOIRHygn8aG7fA/s6KxM2+tiAu3P9aWnAuqfp1eePDOwakr44sssH6xfv2LhVRzIs160lkOnuOvevvZU1vOMFzLLKe9XDvRcIEiE5m2GJ6ceuLUa3y+a9jiNEjwQx6k4NBg947M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=NcStPSRE; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 97A3C176A;
	Sat, 18 Apr 2026 13:49:50 -0700 (PDT)
Received: from workstation-e142269.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 72C293F7D8;
	Sat, 18 Apr 2026 13:49:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776545396; bh=H6WgkZZcA/mA2cLpnncZ0V6CejHxgd1bABjG2+xoA64=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NcStPSRE4v1U9caa4EqTbzTMJOkAW0Q0Emov03fEF4WZ3WSZQaNvpplDjjSqnN7bV
	 F9dLncqqvCwwYWAVrwZTUvG0vWXQOkEb8JGA1tnCOndXcPmiiEYgO9+S9ZklCNEuup
	 JOVj+KgDtFS7/KQHicmvI3m5N14I0D7Py+zSHMmU=
From: Wei-Lin Chang <weilin.chang@arm.com>
To: maple-tree@lists.infradead.org,
	linux-mm@kvack.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: "Liam R . Howlett" <Liam.Howlett@oracle.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Andrew Ballance <andrewjballance@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Wei-Lin Chang <weilin.chang@arm.com>
Subject: [RFC PATCH 1/2] Documentation: maple_tree: Point out constraint when using xa_{mk, to}_value
Date: Sat, 18 Apr 2026 21:47:53 +0100
Message-ID: <20260418204754.120405-2-weilin.chang@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260418204754.120405-1-weilin.chang@arm.com>
References: <20260418204754.120405-1-weilin.chang@arm.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[arm.com:s=foss];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-83771-lists,linux-doc=lfdr.de];
	FREEMAIL_CC(0.00)[oracle.com,google.com,gmail.com,lwn.net,linuxfoundation.org,arm.com];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[weilin.chang@arm.com,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[arm.com:+];
	TAGGED_RCPT(0.00)[linux-doc];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,arm.com:email,arm.com:dkim,arm.com:mid]
X-Rspamd-Queue-Id: 028F7422409
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Using xa_{mk, to}_value when storing values loses the information of
the top bit from the left shift, point that out in the doc.

Signed-off-by: Wei-Lin Chang <weilin.chang@arm.com>
---
 Documentation/core-api/maple_tree.rst | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/Documentation/core-api/maple_tree.rst b/Documentation/core-api/maple_tree.rst
index ccdd1615cf97..15eda6742af8 100644
--- a/Documentation/core-api/maple_tree.rst
+++ b/Documentation/core-api/maple_tree.rst
@@ -28,10 +28,11 @@ virtual memory areas.
 The Maple Tree can store values between ``0`` and ``ULONG_MAX``.  The Maple
 Tree reserves values with the bottom two bits set to '10' which are below 4096
 (ie 2, 6, 10 .. 4094) for internal use.  If the entries may use reserved
-entries then the users can convert the entries using xa_mk_value() and convert
-them back by calling xa_to_value().  If the user needs to use a reserved
-value, then the user can convert the value when using the
-:ref:`maple-tree-advanced-api`, but are blocked by the normal API.
+entries under the condition that their top bits are never 1, then the user can
+convert the entries using xa_mk_value() and convert them back by calling
+xa_to_value().  If the user needs to use a reserved value, then the user can
+convert the value when using the :ref:`maple-tree-advanced-api`, but are blocked
+by the normal API.
 
 The Maple Tree can also be configured to support searching for a gap of a given
 size (or larger).
-- 
2.43.0


