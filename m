Return-Path: <linux-doc+bounces-92621-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ioU+MQiKMmrB1gUAu9opvQ
	(envelope-from <linux-doc+bounces-92621-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 17 Jun 2026 13:50:32 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 05DC6699477
	for <lists+linux-doc@lfdr.de>; Wed, 17 Jun 2026 13:50:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linux.alibaba.com header.s=default header.b=UcaPx8hB;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-92621-lists+linux-doc=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-doc+bounces-92621-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linux.alibaba.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7CB7C3017F25
	for <lists+linux-doc@lfdr.de>; Wed, 17 Jun 2026 11:46:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C0303EB816;
	Wed, 17 Jun 2026 11:46:20 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from out30-130.freemail.mail.aliyun.com (out30-130.freemail.mail.aliyun.com [115.124.30.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3FEA3E0738
	for <linux-doc@vger.kernel.org>; Wed, 17 Jun 2026 11:46:16 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781696780; cv=none; b=QctKlZXPJpnHJFrpHY9sfjLFz62FVZqApXEzHPEbXo3nepaXWRpoJ95c0sFAjgH8yQKKYUze9ZsF37pDNDKpyQT4vpk+z6xpqKAHzJqaQAYT9VmIV3Jr3BF71oeOm+vVNGKqi4gdx+cf6lWbtmtowK5TOCkSL21bSsC77GLUWw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781696780; c=relaxed/simple;
	bh=euURCyAij/DiVsfCeqLtmd1t/tFQLmYPVkXjq/f1vec=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Losi5JLk0p46B9qBIOOUv5OdrjTigfPw42qGGnmP0+qrdrodNJqmeVzuG0VqrBg9gCgKZBIizfq3ZzR3047yD4c6p9ct7ryujG2cRBuU/mpxdXTfeOX6/w5zRZHP/ClCuamh6ZFPg4PVH0DXZRfgOSXlU6bs09eqhGbDYMWmySg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=UcaPx8hB; arc=none smtp.client-ip=115.124.30.130
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1781696768; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=Kuyum3ZOu8vyChyP0CCx3KwpwUBf1l9eT41x3JiJcS0=;
	b=UcaPx8hBCAgfAXOESFxXAr6S19XQl9zyNoLBnaOaxK/RdR6Mj96bhI3DP5YKqWQscZ8tR3OY6e96nX8YtzcMA4gjQ+lCzJwxs2je1jV2cNSoBWxR2Sq7lxDFQmPaoCu61PRcM9DvXxsg6tYVJxDAzrnZ+6CG5tc3Yd0JccaLOtc=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R171e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045098064;MF=kanie@linux.alibaba.com;NM=1;PH=DS;RN=8;SR=0;TI=SMTPD_---0X53e-Rv_1781696763;
Received: from localhost(mailfrom:kanie@linux.alibaba.com fp:SMTPD_---0X53e-Rv_1781696763 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 17 Jun 2026 19:46:08 +0800
From: Guixin Liu <kanie@linux.alibaba.com>
To: Keith Busch <kbusch@kernel.org>,
	Jens Axboe <axboe@kernel.dk>,
	Christoph Hellwig <hch@lst.de>,
	Sagi Grimberg <sagi@grimberg.me>,
	onathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-nvme@lists.infradead.org,
	linux-doc@vger.kernel.org
Subject: [PATCH 0/2] nvme: Introduce service-time iopolicy
Date: Wed, 17 Jun 2026 19:45:57 +0800
Message-ID: <20260617114602.2224074-1-kanie@linux.alibaba.com>
X-Mailer: git-send-email 2.43.7
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-10.66 / 15.00];
	WHITELIST_DMARC(-7.00)[alibaba.com:D:+];
	WHITELIST_SPF_DKIM(-3.00)[alibaba.com:d:+,kernel.org:s:+];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linux.alibaba.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[linux.alibaba.com:s=default];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-92621-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:kbusch@kernel.org,m:axboe@kernel.dk,m:hch@lst.de,m:sagi@grimberg.me,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:linux-nvme@lists.infradead.org,m:linux-doc@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[kanie@linux.alibaba.com,linux-doc@vger.kernel.org];
	RCVD_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kanie@linux.alibaba.com,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[linux.alibaba.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 05DC6699477

Hi all,
  I developed the service-time iopolicy in nvme native
multipath, please review, all comments are wellcome.

Guixin Liu (2):
  nvme-multipath: add service-time I/O policy
  docs: nvme-multipath: document service-time I/O policy

 Documentation/admin-guide/nvme-multipath.rst |  31 +++-
 drivers/nvme/host/multipath.c                | 165 ++++++++++++++++++-
 drivers/nvme/host/nvme.h                     |   6 +
 drivers/nvme/host/sysfs.c                    |   5 +-
 4 files changed, 202 insertions(+), 5 deletions(-)

-- 
2.43.7


