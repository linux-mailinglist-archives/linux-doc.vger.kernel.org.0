Return-Path: <linux-doc+bounces-89042-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mB0RObmWEGqBZwYAu9opvQ
	(envelope-from <linux-doc+bounces-89042-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 22 May 2026 19:47:37 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EB125B8816
	for <lists+linux-doc@lfdr.de>; Fri, 22 May 2026 19:47:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5F1EA3011076
	for <lists+linux-doc@lfdr.de>; Fri, 22 May 2026 17:44:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8032134CFDA;
	Fri, 22 May 2026 17:44:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="sCzaO8K7"
X-Original-To: linux-doc@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E327326D4C3;
	Fri, 22 May 2026 17:44:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779471871; cv=none; b=RRNyQhAvq3m63CGjS1E+rb0V9jOaaRKigvI2Pw8nxnRtb3DhgaVjLP6Y123Nh3/bakDXHCuNIEMymHZdHrKleG3mIX4A9uyaHoH146AHq4d5P+Uw4W5N7BDbhs/vg76/3whw0WuvXK7cHAvjO2RLEdXIIdmSY9vYlij7d6vM46U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779471871; c=relaxed/simple;
	bh=iydub1rWgsaBqreMLWrp9051kz9y2EdBFTuYUOqOy00=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gqHcPPpDclSaqb4HJ01Fh+hHnNGjjPOX8LR+6KO1UGz3YQ5FQwk7MYqh3ROAVptQ34hUdTtyY9/5530GTMbVhUZUFHutqsLky6XYLwo6cpzrVQS54mw8rKPet198olkGEecGNqvw84vWdV1ghDgA89u0q4ca7O48UfWrtQci3lA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=sCzaO8K7; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=Lpk/G+s3635r6xB3IoMaLT6FJnb35y3X5yGekjIsKgs=; b=sCzaO8K70Za/V6P5Wm0AbNG6+N
	ZYApcz5I5BLMlh1a/p5M9j/FLOXtM0Lb+3fz7fq3IZbzfYLQ5Z/sQF7NxRRpk5pRyk9y/AtiH13ft
	KkkM3wP1loDAjAOTDaEZ6a5a7DVGPGBfp1Cn4PudItP00Fwq3PWTZGRkfC2e5XR4HzhJ1VhylnFCD
	QLMlrAV27HmsGzZCNhzxnSv0q1e0nuvyGyDu3orDm0a0wnHL5QBcLbmjgWAPFYxpza0tNMEtm7zas
	74sDzkVhgRzEm4V/V9ow8HleexRJ9++CSKayaNSZe8PMpIXSsxh+h+kRMMZ2lXPWMQI9qjUVRg/FL
	cOOx6cpw==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQTv8-0000000BanG-1Whi;
	Fri, 22 May 2026 17:44:26 +0000
Message-ID: <503916c8-da3b-42dd-812e-356f519be47f@infradead.org>
Date: Fri, 22 May 2026 10:44:24 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARM: zte: clean up zx297520v3 doc. warnings
To: =?UTF-8?Q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>,
 linux-kernel@vger.kernel.org
Cc: Linus Walleij <linusw@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 linux-arm-kernel@lists.infradead.org, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org
References: <20260521191458.177046-1-rdunlap@infradead.org>
 <13240501.O9o76ZdvQC@strix>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <13240501.O9o76ZdvQC@strix>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[infradead.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[infradead.org:s=bombadil.20210309];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-89042-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com,vger.kernel.org];
	DKIM_TRACE(0.00)[infradead.org:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rdunlap@infradead.org,linux-doc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 6EB125B8816
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 5/22/26 12:09 AM, Stefan Dösinger wrote:
> Hi,
> 
> Am Donnerstag, 21. Mai 2026, 22:14:57 Ostafrikanische Zeit schrieben Sie:
>> Fix multiple documentation build warnings.
>> Improve punctuation and formatting of the rendered output.
>>
>> Documentation/arch/arm/zte/zx297520v3.rst:66: WARNING: Title underline too
>> short. 3. Building for built-in U-Boot
> 
> I am sorry for the mess. I'll look into doc building before I send clock 
> documentation...
> 
> Reviewed-by: Stefan Dösinger <stefandoesinger@gmail.com>

Hi Stefan,
Does this mean that you will be merging this patch since you merged the
original patch?

thanks.
-- 
~Randy


