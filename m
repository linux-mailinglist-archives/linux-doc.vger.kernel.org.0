Return-Path: <linux-doc+bounces-92994-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id MgCmIkAGN2pCIAcAu9opvQ
	(envelope-from <linux-doc+bounces-92994-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sat, 20 Jun 2026 23:29:36 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D297F6A9C19
	for <lists+linux-doc@lfdr.de>; Sat, 20 Jun 2026 23:29:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=infradead.org header.s=bombadil.20210309 header.b=iGK0CLF0;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-92994-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-92994-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=infradead.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B4B203004633
	for <lists+linux-doc@lfdr.de>; Sat, 20 Jun 2026 21:29:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8214370AD3;
	Sat, 20 Jun 2026 21:29:28 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 403E3371CE6
	for <linux-doc@vger.kernel.org>; Sat, 20 Jun 2026 21:29:22 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781990968; cv=none; b=avxOHDocYQybeaVFRRsf4YHBSIUh9MW52fCqDdsInjL/tjwd7VM7kbC93o32z022ZO6N9It/SQoR9P30ejEenAuZOKdB4F6cbysgVs8rW5f3woDp13+Mlezq0Sgc2A2pmdOZKEtWAv6OhG4UQ+MHJMvqXGACtLgCNCgE+Qj2AFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781990968; c=relaxed/simple;
	bh=OPZWhmZKal3C596ryPL5dMRYbqgKu6I948ldr7vGLL8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=h2HUFisXZG+m9dPE/vInTMUXUiVT61YeCbLIzEZiFxlPYl9W74h29yTX68YY5cCU8cCoYMjbYkyq1flLBJ06BMx3YpPqAhwSXMaRstvWk/CyIYKEga/x1kfev34GlElenutE22ybEDVCcxHpXbVMvWph8JSWV1xK2A5995PUU2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=iGK0CLF0; arc=none smtp.client-ip=198.137.202.133
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=BEfEKBYS4kURKsxj2WMbGHRUgPAFg/MEdW7uNhOIMhY=; b=iGK0CLF0icJ/siUc7/5qNbfCri
	2QnBLaRv7tBEu0E4nvKYkt4XaSn/YlIpZKfTbPH2Pqjly4X2+Ioznxj1vuzUL9X0VIt/vUuH7G55h
	73G+Em53srKFi6GjNVu4ZOWJbbfeznf2aE97JAmWVkn+zw66bOumSbMjLIQZufD223YXT+/1nbElu
	RhAGoeSCWFCDsMC+WuP4txmLPDioyUWR4uUjytbp07elh/O9luiwIgbI50dM29brXM/jFGOXlOoEe
	2T/DhsKcm40JMMJdPlaXy6jjXvDqh2bdGWW+MZ5ZR8OGeDbakrA9Ilkic/zpnqB5t3h2jukjManTX
	CgrL8zvg==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wb3Fh-00000003ZrU-2HGX;
	Sat, 20 Jun 2026 21:29:21 +0000
Message-ID: <a08c2c68-4ea4-45de-a496-3385e4343766@infradead.org>
Date: Sat, 20 Jun 2026 14:29:20 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] Documentation: iio: fix Malformed table for ltc4283
To: Rafael Passos <rafael@rcpassos.me>, linux-doc@vger.kernel.org
Cc: corbet@lwn.net, skhan@linuxfoundation.org
References: <20260620201732.94141-1-rafael@rcpassos.me>
 <20260620201732.94141-2-rafael@rcpassos.me>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260620201732.94141-2-rafael@rcpassos.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[infradead.org,none];
	R_DKIM_ALLOW(-0.20)[infradead.org:s=bombadil.20210309];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92994-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:rafael@rcpassos.me,m:linux-doc@vger.kernel.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[rdunlap@infradead.org,linux-doc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rdunlap@infradead.org,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[infradead.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D297F6A9C19

Hi,

On 6/20/26 1:16 PM, Rafael Passos wrote:
> Longest line in the first column is 27 chars
> 
> Signed-off-by: Rafael Passos <rafael@rcpassos.me>
> ---
>  Documentation/hwmon/ltc4283.rst | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Why "iio:" in the Subject line instead of "hwmon:"?

I sent this patch yesterday (my local time):
  https://lore.kernel.org/linux-doc/20260620011833.3568693-1-rdunlap@infradead.org/T/#u

scripts/get_maintainer.pl should have told you to send the patch the the hwmon
mailing list and the HWMON maintainer (as well as Documentation).

> 
> diff --git a/Documentation/hwmon/ltc4283.rst b/Documentation/hwmon/ltc4283.rst
> index a650c595bc8f..44a58ac6ee81 100644
> --- a/Documentation/hwmon/ltc4283.rst
> +++ b/Documentation/hwmon/ltc4283.rst
> @@ -256,7 +256,7 @@ these logs can be cleared by writing in the proper reset_history attribute.
>  ``/sys/kernel/debug/i2c/i2c-[X]/[X]-addr/``
>  contains the following attributes:
>  
> -=======================		==========================================
> +===========================  ===========================================================
>  power1_failed_fault_log		Set to 1 by a power1 fault occurring.
>  power1_good_input_fault_log	Set to 1 by a power1 good input fault occurring at PGIO3.
>  in11_fet_short_fault_log	Set to 1 when a FET-short fault occurs.
> @@ -264,4 +264,4 @@ in11_fet_bad_fault_log		Set to 1 when a FET-BAD fault occurs.
>  in0_lcrit_fault_log		Set to 1 by a VIN undervoltage fault occurring.
>  in0_crit_fault_log		Set to 1 by a VIN overvoltage fault occurring.
>  curr1_crit_fault_log		Set to 1 by an overcurrent fault occurring.
> -======================= 	==========================================
> +===========================  ===========================================================

-- 
~Randy


