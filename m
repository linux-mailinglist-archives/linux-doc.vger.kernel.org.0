Return-Path: <linux-doc+bounces-93891-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ZH7UH/H2QWohxQkAu9opvQ
	(envelope-from <linux-doc+bounces-93891-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 29 Jun 2026 06:39:13 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 317016D5E31
	for <lists+linux-doc@lfdr.de>; Mon, 29 Jun 2026 06:39:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linux.dev header.s=key1 header.b=CZlIPKgH;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-93891-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-doc+bounces-93891-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linux.dev;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A05A730041CA
	for <lists+linux-doc@lfdr.de>; Mon, 29 Jun 2026 04:39:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD06C37BE7A;
	Mon, 29 Jun 2026 04:39:08 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from out-189.mta0.migadu.com (out-189.mta0.migadu.com [91.218.175.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8BB037BE96
	for <linux-doc@vger.kernel.org>; Mon, 29 Jun 2026 04:39:05 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782707948; cv=none; b=HH5snLxAQ8TZ60pSbOPFK93Hm7LDOZfila4yENf+5RBLkTAIiE18C6wY2tPxN2Nq+NkyLm8AUeR0XGoUsAc8UWNkJ9sX3l4zfQBibB+uV/vGH3VmMF+S1YoM3OuZLXUIk/N2m6yQ8R7vk8ET1OPO0DB4zejISWPGyv5gv6NWqNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782707948; c=relaxed/simple;
	bh=FPjr2lEBsf6tuINR6Z2hE7dN1HCg7bXg2Jp+zTC1I20=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=imVTm1+8sVjHaO1337q54lkObNkMvNFJmFrMI4ZcabeUizsA3rgFwKTnM5wVZ+AtWYfP7ilX7mJz/bRpe5fl76ejDs1NuuYEp30/fqJv9IL4wrU4QlB+8C/bhZPKsJNpWTg9CbVOratlkjsFL4D/hRg3V0iCG1tTbqGzSbLpy4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=CZlIPKgH; arc=none smtp.client-ip=91.218.175.189
Message-ID: <840fa721-297d-4147-ac58-7aa6f4673faf@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1782707943;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yoEJ91xEiAqps2gA9CAfL/dauGrpRbXH1HQpcKF9hGY=;
	b=CZlIPKgHewo6byYDJC0G6KfIOCWH8Q84iS/6U5TRCL9ZjBsInEtWkPv3nBYGz7UAlQJDWY
	gkDxqFj6edQfjY4NfVeYRD8kUtk3NhvLoqfIqpLmk809W+eKmuoEfSCYmM2Lxe7RTUuQZG
	3Gc/69MgDHkGdQkPYgX7XIy8dN/oEZc=
Date: Sun, 28 Jun 2026 21:38:55 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] Documentation/bpf: make it clear that kfuncs should be
 non-static
Content-Language: en-GB
To: JP Kobryn <jp.kobryn@linux.dev>, ast@kernel.org,
 roman.gushchin@linux.dev, daniel@iogearbox.net, andrii@kernel.org,
 eddyz87@gmail.com, memxor@gmail.com, martin.lau@linux.dev, song@kernel.org,
 jolsa@kernel.org, emil@etsalapatis.com, corbet@lwn.net,
 skhan@linuxfoundation.org, bpf@vger.kernel.org
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260626172026.7327-1-jp.kobryn@linux.dev>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Yonghong Song <yonghong.song@linux.dev>
In-Reply-To: <20260626172026.7327-1-jp.kobryn@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linux.dev,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[linux.dev:s=key1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jp.kobryn@linux.dev,m:ast@kernel.org,m:roman.gushchin@linux.dev,m:daniel@iogearbox.net,m:andrii@kernel.org,m:eddyz87@gmail.com,m:memxor@gmail.com,m:martin.lau@linux.dev,m:song@kernel.org,m:jolsa@kernel.org,m:emil@etsalapatis.com,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:bpf@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER(0.00)[yonghong.song@linux.dev,linux-doc@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-93891-lists,linux-doc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
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
	FROM_NEQ_ENVFROM(0.00)[yonghong.song@linux.dev,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[linux.dev:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 317016D5E31



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

Acked-by: Yonghong Song <yonghong.song@linux.dev>

> ---
>   Documentation/bpf/kfuncs.rst | 21 ++++++++++++++-------
>   1 file changed, 14 insertions(+), 7 deletions(-)
>
> diff --git a/Documentation/bpf/kfuncs.rst b/Documentation/bpf/kfuncs.rst
> index 4c814ff6061e..1dbaff8d4805 100644
> --- a/Documentation/bpf/kfuncs.rst
> +++ b/Documentation/bpf/kfuncs.rst
> @@ -276,19 +276,26 @@ This set encodes the BTF ID of each kfunc listed above, and encodes the flags
>   along with it. Ofcourse, it is also allowed to specify no flags.
>   
>   kfunc definitions should also always be annotated with the ``__bpf_kfunc``
> -macro. This prevents issues such as the compiler inlining the kfunc if it's a
> -static kernel function, or the function being elided in an LTO build as it's
> -not used in the rest of the kernel. Developers should not manually add
> -annotations to their kfunc to prevent these issues. If an annotation is
> -required to prevent such an issue with your kfunc, it is a bug and should be
> -added to the definition of the macro so that other kfuncs are similarly
> -protected. An example is given below::
> +macro. This prevents issues such as the compiler inlining the kfunc, or the
> +function being elided in an LTO build as it's not used in the rest of the
> +kernel. Developers should not manually add annotations to their kfunc to prevent
> +these issues. If an annotation is required to prevent such an issue with your
> +kfunc, it is a bug and should be added to the definition of the macro so that
> +other kfuncs are similarly protected. An example is given below::
>   
>           __bpf_kfunc struct task_struct *bpf_get_task_pid(s32 pid)
>           {
>           ...
>           }
>   
> +Note that kfuncs must not be declared ``static``. A kfunc can be called from a
> +BPF program ``*.c`` file outside the compilation unit that defines it, so its
> +externally visible name must remain available for BTF ID lookup. ``static``
> +linkage allows the compiler to rename the function, which can break this
> +BTF-based kfunc resolution. Further note that sparse may warn that an otherwise
> +unreferenced kfunc should be static. Such warnings should be ignored for kfunc
> +definitions.
> +
>   2.5.1 KF_ACQUIRE flag
>   ---------------------
>   


