Return-Path: <linux-doc+bounces-92278-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 37WFK/P2LWqPngQAu9opvQ
	(envelope-from <linux-doc+bounces-92278-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sun, 14 Jun 2026 02:33:55 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 61E736801F3
	for <lists+linux-doc@lfdr.de>; Sun, 14 Jun 2026 02:33:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linux.dev header.s=key1 header.b=m96K0j+L;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-92278-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-doc+bounces-92278-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linux.dev;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 50D4930027EA
	for <lists+linux-doc@lfdr.de>; Sun, 14 Jun 2026 00:33:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73DB119D8A8;
	Sun, 14 Jun 2026 00:33:51 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from out-183.mta0.migadu.com (out-183.mta0.migadu.com [91.218.175.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3581C2030A
	for <linux-doc@vger.kernel.org>; Sun, 14 Jun 2026 00:33:47 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781397231; cv=none; b=Cy4+kSkzBj0lj4n+AuzJbfjS9S1RSIROiC9IsdpxnvRhtQuh6HkCae0sxf2erG4ISRxQ7S/QKcflp07YLsj5YioZ0AkvQoiQQJadJT1yXgny3JKT5miSVrYBPqtfgdUlSvHLKsXDMae1j4DY+CnJU78e7UnAzQr+DXS3Ik9ThG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781397231; c=relaxed/simple;
	bh=H3qdW1OASO7EGbsJ6intxG6VFZhKlcf04Q6uXf5HD20=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UUWCQbv8Kpyu4grlD0SrRuSVrugJ1RXz4op0RLP5bMpcovDKfdE0ZbIAuIChqpQCfptW7I+QuAa83j7j9c/hhJ8JP5SlEupgMi9aMdO3BR4PNggkUWrLlCqzGIwIQ5zreqAbPNaAysLovQvm7TzepYQWTLmoJgbafJCcjtRaQYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=m96K0j+L; arc=none smtp.client-ip=91.218.175.183
Message-ID: <f80eae9d-cf80-4a03-8007-195f50bfdafd@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1781397225;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YVhYyEYulu2vZ8tBAz5TY40Ul8ZS2iko/Y1lbY+Stl0=;
	b=m96K0j+LuSBewTbVZqun0kdPCcA2xjZgJO3vvGS8MXsKjYXjSH2Us17AHasHTc4eoaACRU
	PW/P4w7PBUl+aTPs8T6tpt+v0XJlIUoQHxphAVVcWwtU7ZB6LctQ3468nwifpCaLhuTzc2
	jm8P8nwO6+lf7l9oXk8L4Jg8e+kAeYM=
Date: Sun, 14 Jun 2026 08:33:36 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v2] docs/zh_CN: fix CONFIG_CONPAT typo for CONFIG_COMPAT
To: Ethan Nelson-Moore <enelsonmoore@gmail.com>
Cc: Dongliang Mu <dzm91@hust.edu.cn>, Shuah Khan <skhan@linuxfoundation.org>,
 Kees Cook <kees@kernel.org>, linux-doc@vger.kernel.org,
 Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>,
 Jonathan Corbet <corbet@lwn.net>
References: <20260613183737.11434-1-enelsonmoore@gmail.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Zenghui Yu <zenghui.yu@linux.dev>
In-Reply-To: <20260613183737.11434-1-enelsonmoore@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linux.dev,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[linux.dev:s=key1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-92278-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:enelsonmoore@gmail.com,m:dzm91@hust.edu.cn,m:skhan@linuxfoundation.org,m:kees@kernel.org,m:linux-doc@vger.kernel.org,m:alexs@kernel.org,m:si.yanteng@linux.dev,m:corbet@lwn.net,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[zenghui.yu@linux.dev,linux-doc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[3];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linux.dev:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[zenghui.yu@linux.dev,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	TAGGED_RCPT(0.00)[linux-doc];
	MID_RHS_MATCH_FROM(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,linux.dev:dkim,linux.dev:email,linux.dev:mid,linux.dev:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 61E736801F3

On 6/14/26 2:37 AM, Ethan Nelson-Moore wrote:
> The Simplified Chinese translation of security/self-protection.rst
> contains a typo CONFIG_CONPAT for CONFIG_COMPAT. Fix it.
> 
> Signed-off-by: Ethan Nelson-Moore <enelsonmoore@gmail.com>
> ---
> Changes in v2: remove unnecessary information from commit message
> 
>  Documentation/translations/zh_CN/security/self-protection.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/translations/zh_CN/security/self-protection.rst b/Documentation/translations/zh_CN/security/self-protection.rst
> index 93de9cee5c1a..ad96bb4a4995 100644
> --- a/Documentation/translations/zh_CN/security/self-protection.rst
> +++ b/Documentation/translations/zh_CN/security/self-protection.rst
> @@ -97,7 +97,7 @@ ARCH_OPTIONAL_KERNEL_RWX时的默认设置。
>  --------------------
>  
>  对于64位系统，一种消除许多系统调用最简单的方法是构建时不启用
> -CONFIG_CONPAT。然而，这种情况通常不可行。
> +CONFIG_COMPAT。然而，这种情况通常不可行。
>  
>  “seccomp”系统为用户空间提供了一种可选功能，提供了一种减少可供
>  运行中进程使用内核入口点数量的方法。这限制了可以访问内核代码

Reviewed-by: Zenghui Yu <zenghui.yu@linux.dev>

Thanks,
Zenghui

