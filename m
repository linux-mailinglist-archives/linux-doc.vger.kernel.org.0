Return-Path: <linux-doc+bounces-90711-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 9CBSH18GIGoMuQAAu9opvQ
	(envelope-from <linux-doc+bounces-90711-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 03 Jun 2026 12:47:59 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 707C8636B76
	for <lists+linux-doc@lfdr.de>; Wed, 03 Jun 2026 12:47:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=M2PlSNwR;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-90711-lists+linux-doc=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-doc+bounces-90711-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 34AAB3038AC9
	for <lists+linux-doc@lfdr.de>; Wed,  3 Jun 2026 10:44:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 581FF3B2FEB;
	Wed,  3 Jun 2026 10:44:03 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 111D23AB5DE;
	Wed,  3 Jun 2026 10:44:02 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780483443; cv=none; b=k9Vcx8TQM5kaPQrkr18wqGhBoYsFya7xbm8TruDK9yDKjb0pjrkOn7mnz8YinhoX9odVxX+W34q4JOOrxUXmftZH0ijk4bUgimJSszLOW1Alqwa46qYi8ngpPRf1O4COhNhIzVGVPMbHPJhneC3h1qC+7bjObk/PV42349epEoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780483443; c=relaxed/simple;
	bh=FUqkxg9X9pTDyYgUQHCBQQ+9Gx1j2j9g6vbAYFIzuw0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZX71N01z7VN9n1kVEe0XJq/uohF0FDmW03f2PmbjDoJ+Q8kQh7eVccuicwusHaKCCjxxke0lO8lLUD4dVvnohPjiGigirU2KLcuZFehUnsPOmjR85RjumtGdgK7p9m7boZ5W2badZLK5Qf9Nq+ovc6O0YcL7cTPeM/NYxm44Xgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M2PlSNwR; arc=none smtp.client-ip=192.198.163.18
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780483442; x=1812019442;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=FUqkxg9X9pTDyYgUQHCBQQ+9Gx1j2j9g6vbAYFIzuw0=;
  b=M2PlSNwRsgu80KFdUxT9canR9/IGcJ98w9bk1rofFU2Mv6qKumPu4+5/
   7zw1eRq/9WO6LmgU+r2t6PxQ2ITPO+1tE24QMtWoRfyttvFWFjclBGyM2
   hS3+zvL5O1JMLSZICGlLKMvav2LcT9oOeg7x/H7OYEtRRVSLiI7iw8J1i
   aLZwYtVDxQGh2RgoWmy2WxD6tTisPbB4vtgT7qStiN2xlwaJ6MjngmBk5
   n0iyZxtSg37rkz5RJI5Bcjumprr/9nnnW3zp01f9hj9QjNm+wNMc1E05e
   j4sZtfvniKvMEObO7hzsivB9TGWs3T/7ioVWT2/TSuVIhSa1GlXrOPRcV
   w==;
X-CSE-ConnectionGUID: d2dOyV/WS0m3hedLFIZi4Q==
X-CSE-MsgGUID: q5xzDj7BRg2D6boG7S3uLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11805"; a="80429108"
X-IronPort-AV: E=Sophos;i="6.24,185,1774335600"; 
   d="scan'208";a="80429108"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2026 03:44:00 -0700
X-CSE-ConnectionGUID: oHEVwuRHRL2kLDFxCKvfYg==
X-CSE-MsgGUID: sHmtmpHGTdyHOlcIrSIkiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,185,1774335600"; 
   d="scan'208";a="241695747"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa008.fm.intel.com with ESMTP; 03 Jun 2026 03:43:57 -0700
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 2C55995; Wed, 03 Jun 2026 12:43:56 +0200 (CEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Jiri Kosina <jikos@kernel.org>,
	"Daniel J. Ogorchock" <djogorchock@gmail.com>,
	Petr Mladek <pmladek@suse.com>,
	Tamir Duberstein <tamird@kernel.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org
Cc: Steven Rostedt <rostedt@goodmis.org>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v2 0/2] vsprintf: add upper case to %p[mM] et alia
Date: Wed,  3 Jun 2026 12:34:01 +0200
Message-ID: <20260603104351.152085-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90711-lists,linux-doc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andriy.shevchenko@linux.intel.com,m:jikos@kernel.org,m:djogorchock@gmail.com,m:pmladek@suse.com,m:tamird@kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-input@vger.kernel.org,m:rostedt@goodmis.org,m:linux@rasmusvillemoes.dk,m:senozhatsky@chromium.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:bentiss@kernel.org,m:akpm@linux-foundation.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[andriy.shevchenko@linux.intel.com,linux-doc@vger.kernel.org];
	FREEMAIL_TO(0.00)[linux.intel.com,kernel.org,gmail.com,suse.com,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@linux.intel.com,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,linux.intel.com:from_mime,linux.intel.com:mid,intel.com:dkim,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 707C8636B76

The first patch induced by Sashiko rightfully rises a concern on
potential ABI breakage. To avoid that and allow the user (patch 2)
to be converted to use unified output introduce %p[mM][...]U for
printing in upper case. Tests are included and passed.

Changelog v2:
- added first patch (Sashiko)

Andy Shevchenko (2):
  vsprintf: Add upper case flavour to %p[mM]
  HID: nintendo: Use %pM format specifier for MAC addresses

 Documentation/core-api/printk-formats.rst |  3 +++
 drivers/hid/hid-nintendo.c                | 10 ++--------
 lib/tests/printf_kunit.c                  |  2 ++
 lib/vsprintf.c                            | 22 ++++++++++++++++------
 4 files changed, 23 insertions(+), 14 deletions(-)

-- 
2.50.1


