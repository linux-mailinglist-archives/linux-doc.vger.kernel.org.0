Return-Path: <linux-doc+bounces-87809-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 5v6IH//cB2o3MQMAu9opvQ
	(envelope-from <linux-doc+bounces-87809-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sat, 16 May 2026 04:57:03 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C862559F83
	for <lists+linux-doc@lfdr.de>; Sat, 16 May 2026 04:57:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4A41F30086DF
	for <lists+linux-doc@lfdr.de>; Sat, 16 May 2026 02:57:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73A2E224F3;
	Sat, 16 May 2026 02:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="eAX13BVo"
X-Original-To: linux-doc@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D41FD405C21
	for <linux-doc@vger.kernel.org>; Sat, 16 May 2026 02:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778900219; cv=none; b=oL6GlV31mh0E0qTdPl3FvY6HS4TEuUyAtJkOmdoaq+XSEiU8HgawnaF7mix/5ad3Kdz0IlbVTuLEM7SHgzAix/nfmPEhKiJPZqfC5gEzRhnCejlSf9h7b6GNybZemmcE5n4m6g7EtlNbyOdlHhM/wI0B5GaKiT1RdyidqfLkIOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778900219; c=relaxed/simple;
	bh=0+rvp3u+LrOD+f2CNM99I002HGBb+qeoKEpH9RpHNTA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VqcgubFR53AI55/0dWleyf8SZ/ZLikTKAgr+a4jMXPhVRO0izyqJwN/3r/OXGpiSzXtWIyOftEWSQpXedTneD5degwLF8tYWqy8TzsUPSewpmmoZ+AwH6AJArqqk7GapjGCNSq9EuMAwCk8MPuePrRZ95lUyZ6PgtdwM7yUyyTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=eAX13BVo; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=lAVf08DWkJ4eNnkT/GfgfAcc7pWG3Z9PhG7Qz3ZZwT0=; b=eAX13BVoFqBySGGUyPf7U8/u/z
	yqEau1bL4qTXXehGeoatUKVuqqbF8ah7qA3+7FXw7iE55nAr8x4yyRl4fw92xMYLMmF8lqR8fFm8e
	HdFblD+3hO7/RcHHHyr4rjtkiNcXuJ8QgnFJMOSYaYFqb1GneAueZqaCpSVMhU8LYR+GQKNQumRlG
	fIiOaxFUpljyJj39nsx8x/Oe4gEpZC6f7zSnOXjz45gVPepGF8iy59jaOko6Yr1Sq3GsqE4XBhQEF
	catFDAgEkkyRE/DNf1g8BecvjAB2m9Bju+GLDMAxNl3Gq+ianNf+GMtOoacVkmT9hnUXrfWdI+Wvs
	/iDiRhtw==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wO5Cw-00000009zWM-0VYS;
	Sat, 16 May 2026 02:56:54 +0000
Message-ID: <5e0aa2ae-b179-4cfa-85fc-805c0da79111@infradead.org>
Date: Fri, 15 May 2026 19:56:53 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Documentation: fix typo in title for max31730
To: Hassan Maazu <maazudev@proton.me>, "corbet@lwn.net" <corbet@lwn.net>
Cc: "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "khan@linuxfoundation.org" <khan@linuxfoundation.org>,
 Guenter Roeck <linux@roeck-us.net>
References: <lC2hDaF-g523KA69MW_DVSRix9HHjA5drjH62zaO9eFNuOboR1cxxrTbqNJ8lmvuZ0u35qD4Ds8x0SeARtp5Hi-qIVpOi2zjYoV_vzCJjEM=@proton.me>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <lC2hDaF-g523KA69MW_DVSRix9HHjA5drjH62zaO9eFNuOboR1cxxrTbqNJ8lmvuZ0u35qD4Ds8x0SeARtp5Hi-qIVpOi2zjYoV_vzCJjEM=@proton.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 3C862559F83
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[infradead.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[infradead.org:s=bombadil.20210309];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-87809-lists,linux-doc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rdunlap@infradead.org,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[infradead.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,proton.me:email]
X-Rspamd-Action: no action


[adding Guenter]

On 5/15/26 7:41 PM, Hassan Maazu wrote:
> Wrong device name used in title.
> 
> Signed-off-by: Hassan Maazu <maazudev@proton.me>

Acked-by: Randy Dunlap <rdunlap@infradead.org>

> 
> --- Documentation/hwmon/max31730.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/hwmon/max31730.rst b/Documentation/hwmon/max31730.rst
> index 1c5a32b64187..0936ba2eac24 100644
> --- a/Documentation/hwmon/max31730.rst
> +++ b/Documentation/hwmon/max31730.rst
> @@ -1,4 +1,4 @@
> -Kernel driver max31790
> +Kernel driver max31730
>  ======================
> 
>  Supported chips:
> --
> 2.54.0
> 

-- 
~Randy

