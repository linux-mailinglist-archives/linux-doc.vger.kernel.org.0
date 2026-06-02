Return-Path: <linux-doc+bounces-90560-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id K3agFk8bH2oqgAAAu9opvQ
	(envelope-from <linux-doc+bounces-90560-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 02 Jun 2026 20:05:03 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BFB8D630EC7
	for <lists+linux-doc@lfdr.de>; Tue, 02 Jun 2026 20:05:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=infradead.org header.s=bombadil.20210309 header.b=zXPpd61h;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-90560-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-90560-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=infradead.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 85354300BD84
	for <lists+linux-doc@lfdr.de>; Tue,  2 Jun 2026 17:56:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03DB33FCB3E;
	Tue,  2 Jun 2026 17:56:55 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCA403FBED1;
	Tue,  2 Jun 2026 17:56:53 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780423014; cv=none; b=I6PzCt2gVY1JvI+zHE+mRgUaoF442xnbri+rv/eXf+L8NrkkDjhIqrIcL/JzMPZ/Ke/C7EA3iHhY8S2U6HfBQm86OcbnUBiGk4QgaUdpPcvoA1Z/b9HQDnNLNa63tCGrpT8YKl1IP0TR95sqA8NY5WTbTYkb9f7cPRQH0xjOs9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780423014; c=relaxed/simple;
	bh=NVWXmGqmUvJQny9yieHXIHHkLpzoqyVakt1uxLHG+3k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HCbFZvxX7KcudcaoAzRfzbk5bZOKxi1SbfxNPjn+dZhUohht0vhUs95afE4uuUu5D50tuLtuA+WrG5mfkXVj89o45GymIltKbo9Fs88aIw/bz6873yjtrMAVRSXaBS1fy8oKb4R4oVC6sshCsIit1+LrNiG5CUlOS5sz1PAUULU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=zXPpd61h; arc=none smtp.client-ip=198.137.202.133
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=Goe+jsCqeDAJ8nUJNisNgAeTC2XY0L4p8OmyKx0rp8E=; b=zXPpd61hBw8rl26vZtM28T9n4Q
	Il3HgNkkofilrRjJFUUx3szOmvA9/CeCaxodIQD2syctQbDOqTU8IMiwj6hC+fUqozGtDrluA3zyP
	rHdkUHMhozE/z7ULFYB8X7BuXrm0Z2xZfwyp+yqw6mJr7ta/NN5M3oyFJaKVNB7T8l51j8PYqWpl9
	nnnWkAUhiOIXui16yGfpvCXJl4qo9shOCQqSYxKD+e1HDqAJ3z12yqLaNLNJoM6jBViYcJ5AhF1VI
	Gy4Ea08DJFqK0+/KLkZUTiyhLOeivpeVu+oOX45mDDjYjUbnGwuur0KpiGgP9CLxip+8KGCOHCHbe
	HNNgINdQ==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUTMC-0000000DcHa-0r6p;
	Tue, 02 Jun 2026 17:56:52 +0000
Message-ID: <41eb226b-dafc-40ce-b6d5-a404683b239e@infradead.org>
Date: Tue, 2 Jun 2026 10:56:51 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 8/9] block: add configurable error injection
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
Cc: Jonathan Corbet <corbet@lwn.net>, linux-block@vger.kernel.org,
 linux-doc@vger.kernel.org, bpf@vger.kernel.org,
 linux-kselftest@vger.kernel.org
References: <20260602054615.3788425-1-hch@lst.de>
 <20260602054615.3788425-9-hch@lst.de>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260602054615.3788425-9-hch@lst.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[infradead.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[infradead.org:s=bombadil.20210309];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-90560-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:hch@lst.de,m:axboe@kernel.dk,m:corbet@lwn.net,m:linux-block@vger.kernel.org,m:linux-doc@vger.kernel.org,m:bpf@vger.kernel.org,m:linux-kselftest@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[infradead.org:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[rdunlap@infradead.org,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rdunlap@infradead.org,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BFB8D630EC7



On 6/1/26 10:45 PM, Christoph Hellwig wrote:
> diff --git a/Documentation/block/error-injection.rst b/Documentation/block/error-injection.rst
> new file mode 100644
> index 000000000000..be87091b5330
> --- /dev/null
> +++ b/Documentation/block/error-injection.rst
> @@ -0,0 +1,59 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +============================
> +Configurable Error Injection
> +============================
> +
> +Overview
> +--------
> +
> +Configurable error injection allows injecting specific block layer status codes
> +for ranges of a block device.  Error can be injected unconditional, or with a

                                  Errors can be injected unconditionally or with a

> +given probability.
> +
> +To use configurable error injection, CONFIG_FAIL_MAKE_REQUEST must be enabled.
> +
> +The only interface is the error_injection debugfs file, which is created for
> +each registered gendisk.  Writes to this file are used to create or delete rules
> +and reads return a list of the current error injection sites.

[snip]

-- 
~Randy


