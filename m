Return-Path: <linux-doc+bounces-93762-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id fdbsHsTYPmo0MQkAu9opvQ
	(envelope-from <linux-doc+bounces-93762-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 26 Jun 2026 21:53:40 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CBB9A6CFEDE
	for <lists+linux-doc@lfdr.de>; Fri, 26 Jun 2026 21:53:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=infradead.org header.s=bombadil.20210309 header.b=18cgYXPc;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-93762-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-doc+bounces-93762-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=infradead.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 67C423012C6A
	for <lists+linux-doc@lfdr.de>; Fri, 26 Jun 2026 19:53:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 209173BB9FD;
	Fri, 26 Jun 2026 19:53:22 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 988EF3403EC;
	Fri, 26 Jun 2026 19:53:19 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782503602; cv=none; b=amceza2bMCvhJsL8Gp6B6w+oYFCIeRidoMl2GWnvj2agoV22E+LtkjYhkMtueho4G7nrnSuCG9GtktG+jooJq6d98Hr25gEYkn1PA8DNmgz6hPLkqogzyAF450gyxroXulD954YhTg++Bi2rYAyqZjbo83PQUgh8mbN1irEzQ64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782503602; c=relaxed/simple;
	bh=NN9WDuDGSzdNDBHCxJqoO8gBoD7FqB1i1qJy1+GLFKs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BoTNU2ik6oePTDxNL97/eMFMluDhqGh8xWLEIWYGF6EpMX3dOhySkvPdwVl/2j0XCNHy0TwXTIpr0cALNV4YWu7/l5QP8H5qTUG2eAI2neJOtEYqZ2jguQPYN4xBqpMIP98X+7pq6GuIx59b2Phyefrf2zVUo5tlPoply4E1xw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=18cgYXPc; arc=none smtp.client-ip=198.137.202.133
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=1fEEafuRv0ZfFVGSQlLhFd1iUhmIuBL5MeuWAryH8tY=; b=18cgYXPcaf9I9EQAO1oFzH6vo/
	Kbz1X9HDkKdoV/oh+9w/r2S+nKl/DO1Azl1SxXdpHxFnprBGArfkJarTC44HS6yUop8ml3hK1odCy
	esecIBC9NhcPmVMZyvMisSktjzSHIVQV9PITz2XlVgTp4+CTcu8NfKKOtSpWsB97PEJCYfJ+BTqce
	2tsqBA8/jkF4SUjF5bp4jmQHZCKwoH3652+ZgbD3YLEaWqwBF5Qz8G+22NEl1hKvykDgP0Lj+Hr5P
	zWLfw6jULz+FmAlV+ToUbx1dxNqc4bhAq1I+uHI5beSqfNaZDiefnd3BNJDerVGdRFqR9gTWxRH+9
	5kN8tkDw==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdCbu-0000000Bnyc-3hyz;
	Fri, 26 Jun 2026 19:53:10 +0000
Message-ID: <9dc3ca18-55c4-4642-aba2-679af2464c65@infradead.org>
Date: Fri, 26 Jun 2026 12:53:09 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Documentation/bpf: make it clear that kfuncs should be
 non-static
To: JP Kobryn <jp.kobryn@linux.dev>, ast@kernel.org,
 roman.gushchin@linux.dev, daniel@iogearbox.net, andrii@kernel.org,
 eddyz87@gmail.com, memxor@gmail.com, martin.lau@linux.dev, song@kernel.org,
 yonghong.song@linux.dev, jolsa@kernel.org, emil@etsalapatis.com,
 corbet@lwn.net, skhan@linuxfoundation.org, bpf@vger.kernel.org
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260626172026.7327-1-jp.kobryn@linux.dev>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260626172026.7327-1-jp.kobryn@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[infradead.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[infradead.org:s=bombadil.20210309];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jp.kobryn@linux.dev,m:ast@kernel.org,m:roman.gushchin@linux.dev,m:daniel@iogearbox.net,m:andrii@kernel.org,m:eddyz87@gmail.com,m:memxor@gmail.com,m:martin.lau@linux.dev,m:song@kernel.org,m:yonghong.song@linux.dev,m:jolsa@kernel.org,m:emil@etsalapatis.com,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:bpf@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[rdunlap@infradead.org,linux-doc@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-93762-lists,linux-doc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[17];
	FREEMAIL_TO(0.00)[linux.dev,kernel.org,iogearbox.net,gmail.com,etsalapatis.com,lwn.net,linuxfoundation.org,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rdunlap@infradead.org,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[infradead.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,infradead.org:dkim,infradead.org:mid,infradead.org:from_mime,linux.dev:email,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CBB9A6CFEDE



On 6/26/26 10:20 AM, JP Kobryn wrote:
> The kfunc documentation mentions how the macro __bpf_kfunc prevents
> inlining for static functions. This makes it sound like static kfuncs are
> acceptable. Although static kfuncs may happen to work, it is by chance that
> the compiler chose not to rename these functions and BTF resolution still
> succeeds.
> 
> Make it clear in the documentation why kfuncs should not be declared
> static. First, remove wording that makes it sound like static is ok. Then
> point out the external naming needed for BTF resolution. Finally point out
> that sparse may warn on unreferenced kfuncs and that this warning can be
> ignored.
> 
> Signed-off-by: JP Kobryn <jp.kobryn@linux.dev>
> ---
>  Documentation/bpf/kfuncs.rst | 21 ++++++++++++++-------
>  1 file changed, 14 insertions(+), 7 deletions(-)
> 
> diff --git a/Documentation/bpf/kfuncs.rst b/Documentation/bpf/kfuncs.rst
> index 4c814ff6061e..1dbaff8d4805 100644
> --- a/Documentation/bpf/kfuncs.rst
> +++ b/Documentation/bpf/kfuncs.rst
> @@ -276,19 +276,26 @@ This set encodes the BTF ID of each kfunc listed above, and encodes the flags
>  along with it. Ofcourse, it is also allowed to specify no flags.
>  

Not part of this patch, but "Ofcourse," should be "Of course,"
of course.

-- 
~Randy


