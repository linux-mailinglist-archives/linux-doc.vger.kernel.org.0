Return-Path: <linux-doc+bounces-92121-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id lp6jHFYTLGrHKwQAu9opvQ
	(envelope-from <linux-doc+bounces-92121-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 12 Jun 2026 16:10:30 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 71A0467A12E
	for <lists+linux-doc@lfdr.de>; Fri, 12 Jun 2026 16:10:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linux.dev header.s=key1 header.b=tylXjQFX;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-92121-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-92121-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linux.dev;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B3F9F30015B3
	for <lists+linux-doc@lfdr.de>; Fri, 12 Jun 2026 14:10:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB7A1383328;
	Fri, 12 Jun 2026 14:10:22 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from out-171.mta0.migadu.com (out-171.mta0.migadu.com [91.218.175.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 325BB27281E
	for <linux-doc@vger.kernel.org>; Fri, 12 Jun 2026 14:10:21 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781273422; cv=none; b=FZlhme4W+iDzwuR7qZzj9nG01GjR8S8oLS+PoGZPh2azFhw5DarPCsnZekfkRqc7Yq9DGNw6WokpzUR+x+xe/3FM9VT5qjr670bXpDQ4VQOaTbM6NlRVaEMkJTqDoLlOd5zqrEaU/B+r9CweP9oSVe7Za/re0VYD/EvjM/A7y/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781273422; c=relaxed/simple;
	bh=SwcMhVo3e/OSlG5u9jKKasCTCA1E0yZ6CzAo5ieB8Pw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GuYmBbyTRJfdPTczlhu8CKMhm7jJYbfss4kklN3BE8AStU5X+5RQIE110Fpnqe4RFpy40NtxX1qjI8r4qP/WAamDCOpEP7aXd43WL24Kw+MmN8SnlJBIBghWRPZh/KBEmvDd/5j+eXhKHtklwwdlfBX48W+sOpRDNsAqVx0Je0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=tylXjQFX; arc=none smtp.client-ip=91.218.175.171
Message-ID: <33309e37-e999-4c4c-a2b6-5eff22b1e933@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1781273409;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VgkFgiq3UgWO4mv31jMB1PbxwSyhPsMP6dnk06G777U=;
	b=tylXjQFXt9nqjJiTMazYQ6lwhdfPDtErq2oXG2P57stw+kOht1lpyupI4/HoeVo9nbbQUj
	TxlvRg0sqjAOU6uWisuUa52BhH0vLhbWuijbf01r6ibi9CZ7aQN3edFG+GoqhMcm6Hs1K/
	gTrNXgiGEmNhn5RufSkLile51kJd1Sk=
Date: Fri, 12 Jun 2026 16:10:06 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: configurable block error injection v5
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
Cc: Jonathan Corbet <corbet@lwn.net>, Damien Le Moal <dlemoal@kernel.org>,
 Hannes Reinecke <hare@suse.de>, Keith Busch <kbusch@kernel.org>,
 linux-block@vger.kernel.org, linux-doc@vger.kernel.org
References: <20260611140703.2401204-1-hch@lst.de>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Haris Iqbal <haris.iqbal@linux.dev>
In-Reply-To: <20260611140703.2401204-1-hch@lst.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linux.dev,none];
	R_DKIM_ALLOW(-0.20)[linux.dev:s=key1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92121-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER(0.00)[haris.iqbal@linux.dev,linux-doc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:hch@lst.de,m:axboe@kernel.dk,m:corbet@lwn.net,m:dlemoal@kernel.org,m:hare@suse.de,m:kbusch@kernel.org,m:linux-block@vger.kernel.org,m:linux-doc@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linux.dev:+];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[haris.iqbal@linux.dev,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	TAGGED_RCPT(0.00)[linux-doc];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.dev:dkim,linux.dev:email,linux.dev:mid,linux.dev:from_mime,vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 71A0467A12E



On 6/11/26 16:06, Christoph Hellwig wrote:
> Hi all,
> 
> this series adds a new configurable block error injection facility.
> We already have a few to inject block errors, but unfortunately most
> of them are either not very useful or hard to use, or both:
> 
>   - The fail_make_request failure injection point can't distinguish
>     different commands, different ranges in the file and can only injection
>     plain I/O errors.
>   - the should_fail_bio 'dynamic' failure injection has all the same issues
>     as fail_make_request
>   - dm-error can only fail all command in the table using BLK_STS_IOERR
>     and requires setting up a new block device
>   - dm-flakey and dm-dust allow all kinds of configurability, but still
>     don't have good error selection, no good support for non-read/write
>     commands and are limited to the dm table alignment requirements,
>     which for zoned devices enforces setting them up for an entire zone.
>     They also once again require setting up a stacked block device,
>     which is really annoying in harnesses like xfstests
> 
> This series adds a new debugfs-based block layer error injection
> that allows to configure what operations and ranges the injection
> applied to, and what status to return.  It also allows to configure a
> failure ratio similar to the xfs errortag injection.
> 
> Changes since v4:
>   - don't unlock in removeall to avoid a race between removeall and setup
>   - document why we can't match 0-sized bios
> 
> Changes since v3:
>   - use a static branch to guard the new condition
>   - split out a new header so that jump_label.h doesn't get pulled into
>     blk.h
>   - more checking for impossible conditions in blk_status_to_tag
>   - more spelling fixes
> 
> Changes since v2:
>   - improve the documentation a bit
>   - fix a spelling mistake in a comment
> 
> Changes since v1:
>   - drop the should_fail_bio removal and cleanup depending on it, as it's
>     used by eBPF programs and thus a hidden UABI.
>   - as a result split the code out to it's own Kconfig symbol
>   - various error handling fixed pointed out by Keith
>   - documentation spelling fixes pointed out by Randy
> 
> Diffstat:
>   Documentation/block/error-injection.rst |   59 +++++
>   Documentation/block/index.rst           |    1
>   block/Kconfig                           |    8
>   block/Makefile                          |    1
>   block/blk-core.c                        |   87 ++++++--
>   block/blk-sysfs.c                       |    5
>   block/blk.h                             |    3
>   block/error-injection.c                 |  315 ++++++++++++++++++++++++++++++++
>   block/error-injection.h                 |   21 ++
>   block/genhd.c                           |    4
>   include/linux/blkdev.h                  |    6
>   11 files changed, 490 insertions(+), 20 deletions(-)

Thank you for this series. It is a nice addition.


Reviewed-by: Md Haris Iqbal <haris.iqbal@linux.dev>
(for the whole series)

> 


