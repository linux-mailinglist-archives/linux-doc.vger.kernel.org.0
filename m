Return-Path: <linux-doc+bounces-77601-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4EP9MyW+pWkbFgAAu9opvQ
	(envelope-from <linux-doc+bounces-77601-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 02 Mar 2026 17:43:17 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C5061DD19B
	for <lists+linux-doc@lfdr.de>; Mon, 02 Mar 2026 17:43:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B90323032D09
	for <lists+linux-doc@lfdr.de>; Mon,  2 Mar 2026 16:41:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DE22423A83;
	Mon,  2 Mar 2026 16:41:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B5+5UFsv"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56F22423A67;
	Mon,  2 Mar 2026 16:41:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772469670; cv=none; b=s6PwT323NaKUHGMkiMuMQ3QZ4hH2C0hcon+f9fjE+bVkaVIivbjx7fXKX7C3j56r9iVuwULUwZJasf2/l5BtLHAYXGzLX/8VdjIVpxw084oUlbmTTb86VU8aIojCWeyTMZfJlFpFvALjyauRtLcSATK6vLkGk9PujK2d4R16/ko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772469670; c=relaxed/simple;
	bh=Cz/nEycnBHQCO4/w8hm2Eo242zi9lKr/VICMSuqJXdw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=G6ozi6xJTAIn1mBRnLP4svI9mxu4C05khzvoyW9b3pxtJGY405SLJXTDKukXE5PyOD7P81ZbOkkj4foVQBtYclKIn6SAHChvQoeEQjnLIjvIlDKoqYnbsz8XgqdtzaYN8jiN5rnClkgJT7FJjQ2cVqs5giKFv57ynrMuxwfL28Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B5+5UFsv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35FE3C19423;
	Mon,  2 Mar 2026 16:41:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772469670;
	bh=Cz/nEycnBHQCO4/w8hm2Eo242zi9lKr/VICMSuqJXdw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=B5+5UFsv2VkRh7U/2I9W1NgiGTA90D1siDOibs+9CWTz/Fqw5pf9CpqFtbEd3OnIu
	 BbJ0UR/zDmcCsN4KqbXlf63g9n98ckb6LKlnNO1dPqMGMxYMrCKY6oo1sFuIVeR4kR
	 ++P8yq8rKOCeNP4WBF1B3j9W0zUsuQSYgYBhlYwuCZ7n5KKgle9CEyJ0Nt36R23KJQ
	 i86QMWtWYwVPrVhhvmI436XHX/oe0/eO1/iawD98vOVypU8e6w/12kaLpsSTaSCVUf
	 0HE9NcL04TlaIHtG9yiOS5LSjtP2LzNhJnLHUbYgb/nKI3MDow1CDbUvx6YK8BN4GV
	 j3HzXZeElIpIQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1vx6KS-0000000034f-0BnH;
	Mon, 02 Mar 2026 17:41:08 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-hardening@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Aleksandr Loktionov <aleksandr.loktionov@intel.com>,
	Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH 07/18] docs: kdoc_parser: don't exclude defaults from prototype
Date: Mon,  2 Mar 2026 17:40:50 +0100
Message-ID: <cedf2a819846d2f082388e9ba3d95047c35df6fd.1772469446.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1772469446.git.mchehab+huawei@kernel.org>
References: <cover.1772469446.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
X-Rspamd-Queue-Id: 6C5061DD19B
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
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_FROM(0.00)[bounces-77601-lists,linux-doc=lfdr.de,huawei];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc,huawei];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mchehab@kernel.org,linux-doc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

If we do that, the defaults won't be parsed.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Acked-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org>
Reviewed-by: Aleksandr Loktionov <aleksandr.loktionov@intel.com>
---
 tools/lib/python/kdoc/kdoc_parser.py | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tools/lib/python/kdoc/kdoc_parser.py b/tools/lib/python/kdoc/kdoc_parser.py
index 4bf55244870f..39ff27d421eb 100644
--- a/tools/lib/python/kdoc/kdoc_parser.py
+++ b/tools/lib/python/kdoc/kdoc_parser.py
@@ -201,7 +201,6 @@ var_xforms = [
     (KernRe(r"(?://.*)$"), ""),
     (KernRe(r"(?:/\*.*\*/)"), ""),
     (KernRe(r";$"), ""),
-    (KernRe(r"=.*"), ""),
 ]
 
 #
-- 
2.52.0


