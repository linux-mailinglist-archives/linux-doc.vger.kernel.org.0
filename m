Return-Path: <linux-doc+bounces-93828-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id qrmtMfcRQGombgkAu9opvQ
	(envelope-from <linux-doc+bounces-93828-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sat, 27 Jun 2026 20:09:59 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 551CD6D2753
	for <lists+linux-doc@lfdr.de>; Sat, 27 Jun 2026 20:09:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=infradead.org header.s=bombadil.20210309 header.b=sPS7BpM1;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-93828-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-doc+bounces-93828-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=infradead.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id AE3FC3006B45
	for <lists+linux-doc@lfdr.de>; Sat, 27 Jun 2026 18:09:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0E5B3451B5;
	Sat, 27 Jun 2026 18:09:55 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 887A63403FF;
	Sat, 27 Jun 2026 18:09:54 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782583795; cv=none; b=cE7Jql9DfPkGSISJ+0i7DRXLfg1VLAoFb12lMLOQzQXNBC09Ai5/nISLAFHBVV07tR6ra+dqkQb8aSNbRk2UTAQeR4eh3vNfVAlAFm6xzAti2ek3c2VLE5vM+W4whLPS342ib3WH64w2s6o4t6ZG9K7o5LPx/SzAdBPYhk9gW9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782583795; c=relaxed/simple;
	bh=Qgnr01V+W6PMgOiDnCyXE0LcsNkB2hh1kUa+jRngvCs=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=kY4PVtTW6PyTSGBuE4FGQmfnvdHnuocHWad2qZqPMKwSEOmpstNB6MiTGEGPfYafGN+ggsn1U2LRp6QhO/Ehr8E7xH7s3citgMuP7QKfgMZ5WaISq+bBpnuJm6SuGEk1Q7mM3Nc3CC1CqDFf8W9srYZCBfrohU63pRzXnAKDct4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=sPS7BpM1; arc=none smtp.client-ip=198.137.202.133
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Cc:Content-ID:Content-Description;
	bh=fv1VJlpZFoRUyN4SidIv7/k1kUrErSREvEiCw66vmp8=; b=sPS7BpM1d4C0/VLhGSryGwi16x
	GuFuyiRxbvHKQ7k+2fLGE00W/JgniVvV4d6SdSaeffkskbCqA8KOl/CcF4n2GKZDhID6J4SVrsUq+
	7UGDzGELx5+sMgAf//7X3rg99LVDYuOJTXuSPkEHYe7jNq5idt0vccsnqLMxL15MbD55/+uCKSAz5
	vi8Exugfbz0TQ0ZayJZUlYcOTqjeZicPQ8FR/RHPYismg/WF2VrF7j3J3I7S7+G6PXks31q+ubE8x
	Sae3elIsaudvJXHL1qPrxiSkkOdfv4QXO/kasDj2t/oftvzheCcNqFP0KCykx3506XuU06V4H2zR0
	FPLlXpTQ==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdXTV-0000000ChDq-3m7L;
	Sat, 27 Jun 2026 18:09:53 +0000
Message-ID: <7247dcf0-7aa8-4e01-8534-ace63afe49ec@infradead.org>
Date: Sat, 27 Jun 2026 11:09:53 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: kernel-hacking: fix typo
To: Manuel Ebner <manuelebner@mailbox.org>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20260627091603.29612-2-manuelebner@mailbox.org>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260627091603.29612-2-manuelebner@mailbox.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[infradead.org,none];
	R_DKIM_ALLOW(-0.20)[infradead.org:s=bombadil.20210309];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:manuelebner@mailbox.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[rdunlap@infradead.org,linux-doc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-93828-lists,linux-doc=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rdunlap@infradead.org,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[infradead.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,mailbox.org:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,infradead.org:dkim,infradead.org:mid,infradead.org:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 551CD6D2753

Hi,

On 6/27/26 2:16 AM, Manuel Ebner wrote:
> GP_KERNEL -> GFP_KERNEL
> 
> Signed-off-by: Manuel Ebner <manuelebner@mailbox.org>
> ---
>  Documentation/kernel-hacking/locking.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/kernel-hacking/locking.rst b/Documentation/kernel-hacking/locking.rst
> index c969c76ef7cb..9c6c76d3a723 100644
> --- a/Documentation/kernel-hacking/locking.rst
> +++ b/Documentation/kernel-hacking/locking.rst
> @@ -1317,7 +1317,7 @@ from user context, and can sleep.
>  
>     -  put_user()
>  
> --  kmalloc(GP_KERNEL) <kmalloc>`
> +-  kmalloc(GFP_KERNEL) <kmalloc>`

Please drop the trailing ` mark.
I have no idea what it was meant to be, but it adds nothing
to the rendered HTML output.
(I also have no idea why the trailing <kmalloc> is there.)

But the GFP_KERNEL change is good.

>  
>  -  mutex_lock_interruptible() and
>     mutex_lock()

-- 
~Randy


