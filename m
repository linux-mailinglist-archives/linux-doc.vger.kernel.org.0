Return-Path: <linux-doc+bounces-90195-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QBNhBZydHGodQQkAu9opvQ
	(envelope-from <linux-doc+bounces-90195-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sun, 31 May 2026 22:44:12 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CAB0617E7E
	for <lists+linux-doc@lfdr.de>; Sun, 31 May 2026 22:44:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 09098301877E
	for <lists+linux-doc@lfdr.de>; Sun, 31 May 2026 20:44:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23157334692;
	Sun, 31 May 2026 20:44:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="MfbLmO8J"
X-Original-To: linux-doc@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 365AF1A9FA0;
	Sun, 31 May 2026 20:44:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780260249; cv=none; b=NtHMrbGvMfxjnoE2n30+Oz4TSgRZdQnUbeilU33xKpS2zo6qAgrKFKuv2CfYcpeQHM1nKPpA0JuK5lQPAdMjPKsBbML+9hK4Ej5LwLWyjBf6o9xQtMw3YAPQsG4W2tnpUXG1ibc7V5ijOKYeRoNjXeePmGEwioO0MPqygSJHJU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780260249; c=relaxed/simple;
	bh=w9DlpySWIcQ2Do7Uz1WWqyXKrWObxbYmXe0T4IKKNng=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=Z7uWn0XYQ6rJLY/1xNhriNOCAm6/FdzJqRDYZ8gpkm5uUwiigUkOcKlEICxGs0cGfCjTc3Bg3nBOaDtNDcF2yiH69TMaco9WNh2ZaVtJhc0nlYurwfwIB6ffh1evOaxP/mfax/KN0VtIfVGKSS78RPEjk0KeMOJz75ZIhMWqLpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=MfbLmO8J; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Cc:Content-ID:Content-Description;
	bh=a4EJfGDq70YtaAB3zTh/2z+QUih9wu5a0EDhPrb8Tlo=; b=MfbLmO8JE2LYmvaUmgJHfnhYvB
	n7F9qGW7KRzKLxjKx7QwststW740DYqwjWQwzZ44ttHJWasOESXV/ZmhbgKO+fCXpY6LBqyAE4qrI
	Wrd3ifjkcFb3BLdSjYCjxKIMVdKo7rqNjJtBxMv0YeaxUP6z1FiLZIoLmCD/QsfkBeNvcNUWVoD0W
	DRyTd3QKmcgUo5rKWhn/eZGGaRwfkeo++eEmNO8jVtN3j632IL6E3Xf77KkCsw8ccXrrCaSCJb6zZ
	U2FVhRrz2Yn/qFCg2B3iJbB9zaxSOiwwK55UmUba72HGX3X8ZTBiDiXBFRjTs8ZelYdM6QiJJd4m8
	flQ8hw7w==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTn0r-00000009tlq-18u3;
	Sun, 31 May 2026 20:44:01 +0000
Message-ID: <2094f45a-7e74-4f7a-be70-7f856b43df21@infradead.org>
Date: Sun, 31 May 2026 13:43:59 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] docs: real-time: Fix duplicated sched(7) text
To: Costa Shulyupin <costa.shul@redhat.com>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 linux-rt-devel@lists.linux.dev, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260531141823.4118954-1-costa.shul@redhat.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260531141823.4118954-1-costa.shul@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[infradead.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[infradead.org:s=bombadil.20210309];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[infradead.org:+];
	TAGGED_FROM(0.00)[bounces-90195-lists,linux-doc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rdunlap@infradead.org,linux-doc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.997];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 6CAB0617E7E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 5/31/26 7:18 AM, Costa Shulyupin wrote:
> The man page reference appeared twice - once as plain text and
> once as a hyperlink. Remove the plain text duplicate.
> 
> Assisted-by: Claude:claude-opus-4-6
> Signed-off-by: Costa Shulyupin <costa.shul@redhat.com>

Acked-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org>
Thanks.

> ---
>  Documentation/core-api/real-time/theory.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/core-api/real-time/theory.rst b/Documentation/core-api/real-time/theory.rst
> index 43d0120737f8..92de5654163d 100644
> --- a/Documentation/core-api/real-time/theory.rst
> +++ b/Documentation/core-api/real-time/theory.rst
> @@ -25,7 +25,7 @@ Scheduling
>  ==========
>  
>  The core principles of Linux scheduling and the associated user-space API are
> -documented in the man page sched(7)
> +documented in the man page
>  `sched(7) <https://man7.org/linux/man-pages/man7/sched.7.html>`_.
>  By default, the Linux kernel uses the SCHED_OTHER scheduling policy. Under
>  this policy, a task is preempted when the scheduler determines that it has

-- 
~Randy

