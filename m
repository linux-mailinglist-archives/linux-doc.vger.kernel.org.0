Return-Path: <linux-doc+bounces-94508-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id qUMiBbTORWpHFgsAu9opvQ
	(envelope-from <linux-doc+bounces-94508-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 02 Jul 2026 04:36:36 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 536196F30EF
	for <lists+linux-doc@lfdr.de>; Thu, 02 Jul 2026 04:36:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linux.alibaba.com header.s=default header.b=JSjyD0y3;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-94508-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-doc+bounces-94508-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linux.alibaba.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F31C2301FD63
	for <lists+linux-doc@lfdr.de>; Thu,  2 Jul 2026 02:34:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25FB7258CE5;
	Thu,  2 Jul 2026 02:34:58 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from out30-132.freemail.mail.aliyun.com (out30-132.freemail.mail.aliyun.com [115.124.30.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0358519992C
	for <linux-doc@vger.kernel.org>; Thu,  2 Jul 2026 02:34:55 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782959698; cv=none; b=tJOYJd+IPFgNG2EMt93dvpv0J5vu/bPbnQQsw7ktpMhxVE2dYATzJm6+oL1IWO+uuHeZd2jbBh980q5xG8vLd6N5LPJRna9eOMeNQPFymLxcNeiq1lcTZ3NSFZQIZyTRrwZFe5I4OGVUAuk3bCOsKoJVdmO2U02RFyoy2uF2x5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782959698; c=relaxed/simple;
	bh=8kqHDz1T8vPkOVeqe1XSIrL8LjI68jWeARu4pzITenY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mdFQotIXhJMNyEq4v82hH3xn7RA/TV5EQOvlKNFqnyUS9F0MSpJ+RVFn0fOoMj4xXG2kvWzVCMNV8nMFTqHL8822VaxkfBpEioaI7JTjiD+4r3aNhfikL2jy1ekwlAgVD/zZ95MYYqCB8aSuQkosij8pEk4E9gaaeJ5BZO2Oo48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=JSjyD0y3; arc=none smtp.client-ip=115.124.30.132
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1782959688; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=8kqHDz1T8vPkOVeqe1XSIrL8LjI68jWeARu4pzITenY=;
	b=JSjyD0y3vqfAexga+S9sUbMdxPE480fNGUnMlzqiEAu7CmhjGjlF9OyWw/5pXYKppaKfgyF/3F/jxVULOBN2jKRgz81I8VIviTOr0T20etonvQqTaceGf6ieM6evdnarn19jHHW/1O+DL45xcliF8mTwQ8aFj/kaHQnFuxjV+TA=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R201e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045098064;MF=kanie@linux.alibaba.com;NM=1;PH=DS;RN=9;SR=0;TI=SMTPD_---0X6COG0M_1782959686;
Received: from 30.178.83.30(mailfrom:kanie@linux.alibaba.com fp:SMTPD_---0X6COG0M_1782959686 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 02 Jul 2026 10:34:47 +0800
Message-ID: <2dc374ad-b365-48c0-8d45-aacf53f80e4c@linux.alibaba.com>
Date: Thu, 2 Jul 2026 10:34:46 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] nvme: Introduce service-time iopolicy
To: Hannes Reinecke <hare@suse.de>, Keith Busch <kbusch@kernel.org>,
 Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>,
 Sagi Grimberg <sagi@grimberg.me>, onathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-nvme@lists.infradead.org, linux-doc@vger.kernel.org
References: <20260617114602.2224074-1-kanie@linux.alibaba.com>
 <8103a626-d07b-4b20-b10e-d258485176ee@suse.de>
From: Guixin Liu <kanie@linux.alibaba.com>
In-Reply-To: <8103a626-d07b-4b20-b10e-d258485176ee@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-12.16 / 15.00];
	WHITELIST_DMARC(-7.00)[alibaba.com:D:+];
	WHITELIST_SPF_DKIM(-3.00)[alibaba.com:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linux.alibaba.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[linux.alibaba.com:s=default];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:hare@suse.de,m:kbusch@kernel.org,m:axboe@kernel.dk,m:hch@lst.de,m:sagi@grimberg.me,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:linux-nvme@lists.infradead.org,m:linux-doc@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[kanie@linux.alibaba.com,linux-doc@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-94508-lists,linux-doc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kanie@linux.alibaba.com,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[linux.alibaba.com:+];
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[linux-doc];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 536196F30EF



在 2026/7/1 19:14, Hannes Reinecke 写道:
> On 6/17/26 1:45 PM, Guixin Liu wrote:
>> Hi all,
>>    I developed the service-time iopolicy in nvme native
>> multipath, please review, all comments are wellcome.
>>
>> Guixin Liu (2):
>>    nvme-multipath: add service-time I/O policy
>>    docs: nvme-multipath: document service-time I/O policy
>>
>>   Documentation/admin-guide/nvme-multipath.rst |  31 +++-
>>   drivers/nvme/host/multipath.c                | 165 ++++++++++++++++++-
>>   drivers/nvme/host/nvme.h                     |   6 +
>>   drivers/nvme/host/sysfs.c                    |   5 +-
>>   4 files changed, 202 insertions(+), 5 deletions(-)
>>
> We're still waiting for the adaptive I/O policy to be included, so I
> guess this patch should build on top of that.
>
> Cheers,
>
> Hannes
Yes, I work on that adaptation. But I thought it would be helpful
for the maintainers to review the logic here first before I proceed.

Best Regards,
Guixin Liu


