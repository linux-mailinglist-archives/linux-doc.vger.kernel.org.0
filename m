Return-Path: <linux-doc+bounces-82649-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YOzPFfP91GnOzQcAu9opvQ
	(envelope-from <linux-doc+bounces-82649-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 07 Apr 2026 14:52:03 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 474803AEABD
	for <lists+linux-doc@lfdr.de>; Tue, 07 Apr 2026 14:52:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 38D493006800
	for <lists+linux-doc@lfdr.de>; Tue,  7 Apr 2026 12:51:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9F563B52F1;
	Tue,  7 Apr 2026 12:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="ll/knAHH"
X-Original-To: linux-doc@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B84803B47D8;
	Tue,  7 Apr 2026 12:51:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775566309; cv=none; b=QlHvZLG3b/Z7hdSSkn46iBg+QsOmLnLhthDqb2XrYD5KdeKp74KTxvBUBBvRbrPyJo2RMiEvNmyLEezEGkLH2i2WDkmwawT4a0aSsE+5LJCT8E55d3uGFPll1JHYy23065OhYdxANxdzK/JSPqxEr75aHFvIN2qMH/45JASHpXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775566309; c=relaxed/simple;
	bh=D2+nsTltKeS2aJLcGja+dPxP3RoXO2zx1ST6wD8RCd4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CAdhgBNfGnmlV9wfCu3JemGZG0Z2e+xu4v6mAH+UClYlukJVNnvBQJkQs8fBzjXTvPXJCJpSbTcbBd0SrqbGxYLzYf+dgWL9QgkNdQqyFCAdq/xtKZ8ptqvFcMPLoWyA57Y/l8h+0qs7x8sTkidZgIK2m/HWV68SFu+dxWEiElg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=ll/knAHH; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 96F2416F2;
	Tue,  7 Apr 2026 05:51:39 -0700 (PDT)
Received: from e123572-lin.arm.com (e123572-lin.cambridge.arm.com [10.1.194.54])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4C6293F641;
	Tue,  7 Apr 2026 05:51:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1775566305; bh=D2+nsTltKeS2aJLcGja+dPxP3RoXO2zx1ST6wD8RCd4=;
	h=From:To:Cc:Subject:Date:From;
	b=ll/knAHHYoPZlwA2ugGWrzWF1qaS2kVj8w+KKn0Te59tEeWqEdgwWxsCKdOrq6xuB
	 lU6qMnNKqkWoJmh3WsG38+u5IU4EDX8OliCDKaShtoTYq5pU/IvOOSVcU247YsIogk
	 OazkLjcdkLa9AptLNm8U9gNqi+i5P8sjEuGvQ3gk=
From: Kevin Brodsky <kevin.brodsky@arm.com>
To: linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Yury Khrustalev <yury.khrustalev@arm.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	David Hildenbrand <david@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org
Subject: [PATCH] docs: proc: document ProtectionKey in smaps
Date: Tue,  7 Apr 2026 13:51:33 +0100
Message-ID: <20260407125133.564182-1-kevin.brodsky@arm.com>
X-Mailer: git-send-email 2.51.2
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[arm.com:s=foss];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-82649-lists,linux-doc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FROM_NEQ_ENVFROM(0.00)[kevin.brodsky@arm.com,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[arm.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,kvack.org:email,lwn.net:email,arm.com:dkim,arm.com:email,arm.com:mid]
X-Rspamd-Queue-Id: 474803AEABD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The ProtectionKey entry was added in v4.9; back then it was
x86-specific, but it now lives in generic code and applies to all
architectures supporting pkeys (currently x86, power, arm64).

Time to document it: add a paragraph to proc.rst about the
ProtectionKey entry.

Reported-by: Yury Khrustalev <yury.khrustalev@arm.com>
Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
---
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: Shuah Khan <skhan@linuxfoundation.org>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Lorenzo Stoakes <ljs@kernel.org>
Cc: Vlastimil Babka <vbabka@kernel.org>
Cc: David Hildenbrand <david@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: linux-fsdevel@vger.kernel.org
Cc: linux-mm@kvack.org
---
 Documentation/filesystems/proc.rst | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/filesystems/proc.rst b/Documentation/filesystems/proc.rst
index b0c0d1b45b99..d673cad7dbe4 100644
--- a/Documentation/filesystems/proc.rst
+++ b/Documentation/filesystems/proc.rst
@@ -549,6 +549,10 @@ does not take into account swapped out page of underlying shmem objects.
 naturally aligned THP pages of any currently enabled size. 1 if true, 0
 otherwise.
 
+If both the kernel and the system support protection keys (pkeys),
+"ProtectionKey" indicates the memory protection key associated with the
+virtual memory area.
+
 "VmFlags" field deserves a separate description. This member represents the
 kernel flags associated with the particular virtual memory area in two letter
 encoded manner. The codes are the following:
-- 
2.51.2


