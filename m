Return-Path: <linux-doc+bounces-83770-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UwULG37u42l9MwEAu9opvQ
	(envelope-from <linux-doc+bounces-83770-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sat, 18 Apr 2026 22:50:06 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AD2754223EC
	for <lists+linux-doc@lfdr.de>; Sat, 18 Apr 2026 22:50:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EEC6C3015D1E
	for <lists+linux-doc@lfdr.de>; Sat, 18 Apr 2026 20:50:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30D11209F43;
	Sat, 18 Apr 2026 20:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="nLjjs5DH"
X-Original-To: linux-doc@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12F021A683B;
	Sat, 18 Apr 2026 20:50:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776545403; cv=none; b=W0y2kZ38RhaTv/wKze5y2CCjMHT3R8kX2O54lI0nOiX56In2bdODY1w79yMQMKyfBvO+XWyVTwIZQtpmJWS0zNjCUGe6BR+zI8Z5n8ryDcI7H0jqiJZ1eT2kVLUiDIA66aMd4QuKJHBBVoTRP3DX0vieNtJxOnNnggV9xkbNBc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776545403; c=relaxed/simple;
	bh=7rRzjdaoHeUV1yvrxq1rjjB0hpgHM9ztOSPhIFTKh2s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VCvIYVMWHqF4xirKBl8WW7ZhiYLvRLS43r39kp28bzgI7vIg3B7Hrr8dQSweU0Jl+xmhiXDOwAP1+Yy8+Yxev8kL3SzlicrUjg1q9xY05PUZoIA89Lkzj1fbhdzRls+n1vw5oupECicu0jL1FCGKBf7WlTa/wRPPIfMXSzgL/6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=nLjjs5DH; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 83585168F;
	Sat, 18 Apr 2026 13:49:48 -0700 (PDT)
Received: from workstation-e142269.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5822D3F7D8;
	Sat, 18 Apr 2026 13:49:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776545394; bh=7rRzjdaoHeUV1yvrxq1rjjB0hpgHM9ztOSPhIFTKh2s=;
	h=From:To:Cc:Subject:Date:From;
	b=nLjjs5DH0Ua5b8R4mdWyr+b4VFdGT+bybJ9kybsMGGoO5uryBV+PaoHv4UBcB887r
	 tY92Ya3mSHC4x01/6JDi9IuixEolf9Ky53ZV4xwkIYgVjnZmalKgqSWgXrS0EOmqjZ
	 bgQnB2/N2PRGUL/GBEVXDAFVKulDTTPT1Txz/cNY=
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
Subject: [RFC PATCH 0/2] Documentation: maple_tree: Improve statements on reserved values
Date: Sat, 18 Apr 2026 21:47:52 +0100
Message-ID: <20260418204754.120405-1-weilin.chang@arm.com>
X-Mailer: git-send-email 2.43.0
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-83770-lists,linux-doc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: AD2754223EC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

While using the maple tree and reading its documentation, I found a few
bits confusing, mainly about the reserved values. So here are some
changes hoping to make things clearer.

I am not familiar with the implementation, so I might be getting things
wrong, hence this being RFC.

While looking at the code I also found that although the doc claims the
normal API blocks reserved value stores, the code checks this using
xa_is_advanced(), which only blocks values up to 1026, not up to the max
maple tree reserved value 4094. For this part I am not sure whether the
code needs to be changed or we can also improve the doc.

Any feedback is appreciated, thanks!

Wei-Lin Chang (2):
  Documentation: maple_tree: Point out constraint when using xa_{mk,
    to}_value
  Documentation: maple_tree: Clarify behavior when using reserved values

 Documentation/core-api/maple_tree.rst | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

-- 
2.43.0


