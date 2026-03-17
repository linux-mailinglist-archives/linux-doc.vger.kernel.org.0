Return-Path: <linux-doc+bounces-79763-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mO/GFZpruWl6EgIAu9opvQ
	(envelope-from <linux-doc+bounces-79763-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 17 Mar 2026 15:56:26 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BA2BE2AC78B
	for <lists+linux-doc@lfdr.de>; Tue, 17 Mar 2026 15:56:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 812C9328F56E
	for <lists+linux-doc@lfdr.de>; Tue, 17 Mar 2026 14:43:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 536313E9297;
	Tue, 17 Mar 2026 14:41:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="fBYDTSxY"
X-Original-To: linux-doc@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BBD53EB81E
	for <linux-doc@vger.kernel.org>; Tue, 17 Mar 2026 14:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773758506; cv=none; b=l+Zxl3edU9ZDFqiGRwLCXo0bMv80E9YPUHR9EszR84JU38O9dnn6QNsbuAe0AqHLHyKUHP4z2Blk5cFOx8NCwptS/9TCix1pKoTddCndVaS4uQtiWId1KMaGWZISSQZQ7tlkUBTn2oiKkiOR5T79ruGlabFaOCe2ZBSAj6OFB/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773758506; c=relaxed/simple;
	bh=zkCvbsdIhKl9UZnE8fSX71dB2nU9XiGjYqAANt5dRZc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=YHWMk+ixxK/0L9iAYKEznXGf+nGeGIImaV9FLDNGR/k2AHNBFsF5RKxCI6BPnAXrEIbKCfn1PAKl/FnHDoplqemdm+s81peuPl3YJrgS58cy6w0ewEBo7RMqFID+SoSWpgBnqvvwA6BOunUj8oLOzx3JljYb7uBGg0eEqidMwRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=fBYDTSxY; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 3462040C7C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1773758504; bh=zkCvbsdIhKl9UZnE8fSX71dB2nU9XiGjYqAANt5dRZc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=fBYDTSxYHvdJbQTZvcGiB3I5ZA+0xxn+e/JQ4F/3F7FftPqW9Bh/zUe68PhJVg9rv
	 MkNY/k1YVTg5RaGyr2MxXSRhDv6fqOn35QT2ioJiROof1Z4ZlgpBOQJfhfi7S/d//i
	 5j4CyzOa857lOIXfR0BFPgPr9mLjL4iAWt8hq4rGNK65m07WNypX2QzeOymoZ9Uo8T
	 e0KVONVTpz6EbyfrhuBLoSZ9KmsackpAf9vNNAdwo8EW2mJClcZt6wPzCIxeS8m3nb
	 D3uWXoUFve2Wx0rFUShaY+GlsRiINL2HNQ0Ma7pHQSLXhfPZk3RHFuiD9nrxGVoAZP
	 0IQUcQbCu5pQw==
Received: from localhost (c-71-229-227-126.hsd1.co.comcast.net [71.229.227.126])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 3462040C7C;
	Tue, 17 Mar 2026 14:41:44 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: John Ogness <john.ogness@linutronix.de>, h3288824963
 <3288824963@qq.com>, linux-doc@vger.kernel.org
Cc: pmladek@suse.com, senozhatsky@chromium.org, rostedt@goodmis.org,
 qujingling@huawei.com, zhangjiaji1@huawei.com, xushuangxing@huawei.com,
 hujinfei3@huawei.com, h3288824963 <3288824963@qq.com>
Subject: Re: [PATCH v2] Documentation: printk: Add section about avoiding
 lockups
In-Reply-To: <87341yd79c.fsf@jogness.linutronix.de>
References: <tencent_FB5B7DCFFB10BCDE325397D1202226779D09@qq.com>
 <87341yd79c.fsf@jogness.linutronix.de>
Date: Tue, 17 Mar 2026 08:41:43 -0600
Message-ID: <87a4w6ecwo.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[lwn.net,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[lwn.net:s=20201203];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-79763-lists,linux-doc=lfdr.de];
	FREEMAIL_CC(0.00)[suse.com,chromium.org,goodmis.org,huawei.com,qq.com];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[linutronix.de,qq.com,vger.kernel.org];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[lwn.net:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[corbet@lwn.net,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	RCPT_COUNT_SEVEN(0.00)[11];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linutronix.de:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,trenco.lwn.net:mid,suse.com:email,qq.com:email,lwn.net:dkim]
X-Rspamd-Queue-Id: BA2BE2AC78B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

John Ogness <john.ogness@linutronix.de> writes:

> On 2026-03-17, h3288824963 <3288824963@qq.com> wrote:
>> Add a section 'Avoiding lockups from excessive printk() use' to
>> printk-basics.rst, explaining the risk of calling printk() in hot paths
>> with legacy consoles and suggesting alternatives.
>>
>> The section covers:
>> - Rate-limited and one-time printing variants
>> - Log level filtering
>> - printk_deferred() for legacy consoles
>> - Porting to nbcon API (preferred solution)
>> - Using tracepoints for permanent debugging
>>
>> This documentation is relevant only for legacy console drivers and
>> !PREEMPT_RT kernels.
>>
>> Suggested-by: Petr Mladek <pmladek@suse.com>
>> Suggested-by: John Ogness <john.ogness@linutronix.de>
>> Signed-off-by: h3288824963 <3288824963@qq.com>
>
> Thanks for addressing my concerns.
>
> Reviewed-by: John Ogness <john.ogness@linutronix.de>

Applied, thanks.

jon

