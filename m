Return-Path: <linux-doc+bounces-91202-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id vb60OfTII2pbyQEAu9opvQ
	(envelope-from <linux-doc+bounces-91202-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sat, 06 Jun 2026 09:15:00 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FDFB64CCC8
	for <lists+linux-doc@lfdr.de>; Sat, 06 Jun 2026 09:15:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b="kB/Qipoz";
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-91202-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-doc+bounces-91202-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DD4EF3016C97
	for <lists+linux-doc@lfdr.de>; Sat,  6 Jun 2026 07:14:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D06A305E1F;
	Sat,  6 Jun 2026 07:14:57 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82B5126B755;
	Sat,  6 Jun 2026 07:14:56 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780730097; cv=none; b=iltDsTlIYWyL6W5nnAn6IALZIqaxawBeCLVaKgABBP9jQZYSqUH2ZPkxnidFxYkkGIy1Bo61uqg84ZqJ7U1zctDD8HQL9wk0I3qXJwJmG/q5i6e74agj2txx0cSGO93kWGSXJls5uwUsKu9la85jlHx5j9zgCzHqU9Hd3t+QhOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780730097; c=relaxed/simple;
	bh=TnS7422DmVPb160bVG826GnKnvow1WQ19aspgIRgDNM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JiicLJfKyOQ784ei2iBPZokzhHr02T1X0VCfqrJt+BT5HoMa5cSklDjTg7EVDfj5Xy5HZbIsRvfB1o7gCMIFp3n3NGe49x8hNchfsycT8pMyFSdtny1Jrur6ytUhAox3Tccp/V6NeEWRLPEYi+z0DfxPYqXAZQeKo3fIcpHUx0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kB/Qipoz; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 359B41F00893;
	Sat,  6 Jun 2026 07:14:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780730096;
	bh=S9TKnr0jUrpLPiALjIbDdTwl2faU9LAlnTbHQCYW5bk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=kB/QipozwDVXw6hNWbkOsv/JUMU3PcKvLNTq6YiETvCxqJN/izQHExAtDj9A71oFn
	 1XgU7VJuh7fzzNbRwqdP0kEMaCV4huZGZ9ojMS3T87nHwFRvUd3ACytUVvWjssxVEc
	 jWgy3A+bDtOK1aagwRpHmcL66Udgg2UQBFrK7yN6kpvdD8UJz+JooZZy8dgV2rhTJD
	 jz+SfVO2ZQ6F6QDIJtTII7k7rV+NWJvBoorlHx949UxJqSk8nZ23Ty9qL6x2TF1Q8+
	 cZrtUgZ0kaJHkAinK/T0rd0iyMx2Zc7/xN7Iu3FDfGdpzzT3tWRH7+IW6nUMrA2KwH
	 3Ei0TtcxJ5kiw==
Message-ID: <83b4e64f-4f86-4bc3-8c8b-855e05192312@kernel.org>
Date: Sat, 6 Jun 2026 15:14:48 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] block: add a macro to initialize the status table
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
Cc: Jonathan Corbet <corbet@lwn.net>, linux-block@vger.kernel.org,
 linux-doc@vger.kernel.org, Keith Busch <kbusch@kernel.org>
References: <20260605184441.590927-1-hch@lst.de>
 <20260605184441.590927-2-hch@lst.de>
Content-Language: en-US
From: Damien Le Moal <dlemoal@kernel.org>
Organization: Western Digital Research
In-Reply-To: <20260605184441.590927-2-hch@lst.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:hch@lst.de,m:axboe@kernel.dk,m:corbet@lwn.net,m:linux-block@vger.kernel.org,m:linux-doc@vger.kernel.org,m:kbusch@kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	HAS_ORG_HEADER(0.00)[];
	TAGGED_FROM(0.00)[bounces-91202-lists,linux-doc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dlemoal@kernel.org,linux-doc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dlemoal@kernel.org,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5FDFB64CCC8

On 2026/06/06 2:44, Christoph Hellwig wrote:
> Prepare for adding a new value to the error table by adding a macro
> to fill it.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> Reviewed-by: Keith Busch <kbusch@kernel.org>

Looks good to me.

Reviewed-by: Damien Le Moal <dlemoal@kernel.org>

-- 
Damien Le Moal
Western Digital Research

