Return-Path: <linux-doc+bounces-85978-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uKdVLPg3+mnHKwMAu9opvQ
	(envelope-from <linux-doc+bounces-85978-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 05 May 2026 20:33:28 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 297B54D2BA5
	for <lists+linux-doc@lfdr.de>; Tue, 05 May 2026 20:33:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 99E4A3124C73
	for <lists+linux-doc@lfdr.de>; Tue,  5 May 2026 18:28:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A9F44B8DEA;
	Tue,  5 May 2026 18:27:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="BkPduMn+"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D91B4B8DC0
	for <linux-doc@vger.kernel.org>; Tue,  5 May 2026 18:27:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778005655; cv=none; b=Y7UbaUaIRrMUy3E8lm2by4m8v+tNRrFL7qmMFc8ej5CBd4xuG2MrdzUd7jrECzAzJwgffpslGwoJp14sNgU7p813TX8/yG6sifaHDx1D/sh7ouMQmKNnE/wYks0glvIdr1/i+DjP8EY9OYBFjXyAktks0nJW4jaXs7S68NGBWao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778005655; c=relaxed/simple;
	bh=YTVW4pUZTSDeC82Rnl/pTC4eFdKZlXiqm99aarxCe/4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=F+Y/45l40zMkTWwNPsSbzCfkALU985FMKmZGmtlPMpfCEsf0h02F3sNSVVIKB3aqoaFNA+vOMOUhTeQ8S6sfUV7T1j1B8L1O5MKa2VXNbS6bonjihXdme0sdG8a6WwaxyPF8VxC6DVmWZ7G8rXtZ0OdXXYGCzl8E4OuFptI7THc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=BkPduMn+; arc=none smtp.client-ip=209.85.210.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-7dea1272943so3375949a34.0
        for <linux-doc@vger.kernel.org>; Tue, 05 May 2026 11:27:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1778005652; x=1778610452; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LUBbLfBCn/WmOVE04/JxOS2ECgB4l+ZqRZjcxgYIb88=;
        b=BkPduMn+AwSPXOzQkpRkxsgJ26RK9GDbvSzqe4Occ8N9XYj5rHSpzOinOZlkGuj0w5
         hpaj43fabWN5VyXH+jWOgVodBCBBVSKVXC99LQMDDPvthPovA7POqvPe1ynpjiU3IbcL
         2CAYfLucsa2q62NClzn08HETneUoPRaM6euEY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778005652; x=1778610452;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LUBbLfBCn/WmOVE04/JxOS2ECgB4l+ZqRZjcxgYIb88=;
        b=OgNb/tqbcyr9qWtpVaU9hTvCtaBQMOCSOSAn5jKmfgAre+RMcIQs7iMVrCdbtRhwBf
         yqUTGqaMM0beXdyoF3MWiEmHZF28woLVq30Tz3VE4gD89c8CR8Qa/9aSbxj62WqmM3i+
         OmHHf+uOe3a5I64OwPyQYjdhzgngd6yQP7o9qmkvpxfBRNurALxKC+sBjQOAHzXfgiXN
         FL1H2LMqVM2FPGzrm5JO8Ium0UduRl/2GNKl6w33GMoS+EUbq7Z4JLTMEk1e7woErbgd
         ZGerh23UWInPpCKy4pLNrnqfn4zZTHJIpmFf1G+2066Iczs03DnaWDEvTR1qACcwIWQ3
         mkBw==
X-Forwarded-Encrypted: i=1; AFNElJ9fik6PT+vQw5sirKoZTwfaTDxTT/BkqLwp5UL9yT+MozjToEQHyRXbMBa9czpY2uSitWHdsAOwsxo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxiarC/BCrSDR8V2pnznqLVzfsC3G0Zx/Dp2OkpfvFdaPnq2vOM
	H91TxfoBHxuk/vU0l4M9IjB5yZJWUogPJYHpDzbIZVx3zGp0sA4UbWSFulH8gKOXDp+EnmmZpC8
	qfzA1
X-Gm-Gg: AeBDieu5IJU/TKPsDNCtVdxn6mTKGoxcjVMvVdHy2PKjcwDIb+KaCTHOranl/0ulOIz
	YsfwGgYKfXUymt/nJ5NYtG5hDgCRfey0APsd8Yw2x8onyauAX5iy29VHxQbx1Sb2VAiHtcjINpp
	m+6inWzY2wIdy6wZVheHzVK/i2U4vk4uqEEB4q9x4wUw4/kGRToELsMn9EtrF4NFpTMUBLrSP1O
	yOUSiiYQZlU6U05h5spCqvnjngcpGMkNq5oZlvv6+I2v20DQrHu4LY6DWk/3ORmPWBfUjuybFFd
	4+FwPf3De/lhKFpjWvArg/5jht6JD24sj/MYpowg4Stb0j05i0GAuMe1MavC10Qof/6SQU84NZG
	h5nl/bI9SOtxfC55mlTBym1lNUQXydkHsV/6frk0Lit6cTHZbZg8wRsoF7HURNjzSQwGMUHi02M
	RnuUOifXQFqJbztiSztzO/ghxXNhbBKwSivjreAmITGSluPgCsgSg+
X-Received: by 2002:a05:6820:6ae3:b0:67e:42ca:bf0 with SMTP id 006d021491bc7-6998d248364mr2225039eaf.39.1778005652432;
        Tue, 05 May 2026 11:27:32 -0700 (PDT)
Received: from [192.168.1.14] ([38.15.57.99])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-696896e7677sm8799789eaf.11.2026.05.05.11.27.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 May 2026 11:27:32 -0700 (PDT)
Message-ID: <186589b6-192a-4904-bc8b-7fd79af0d76f@linuxfoundation.org>
Date: Tue, 5 May 2026 12:27:31 -0600
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] docs: admin-guide: clarify perf bench all behavior
To: Cheng-Han Wu <hank20010209@gmail.com>, Jonathan Corbet <corbet@lwn.net>
Cc: Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>
References: <20260503101429.254394-1-hank20010209@gmail.com>
 <20260503101429.254394-4-hank20010209@gmail.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20260503101429.254394-4-hank20010209@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 297B54D2BA5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-85978-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,lwn.net];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[skhan@linuxfoundation.org,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-doc];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linuxfoundation.org:email,linuxfoundation.org:dkim,linuxfoundation.org:mid]

On 5/3/26 04:14, Cheng-Han Wu wrote:
> The workload tracing guide lists a fixed set of benchmarks for
> "perf bench all". This list is stale and can become outdated when
> perf adds, removes, or renames benchmark collections or individual
> benchmarks.
> 
> Describe "perf bench all" as running all available benchmarks in the perf
> bench framework instead. Also document how to list the collections and
> benchmarks available on a given system.
> 
> Signed-off-by: Cheng-Han Wu <hank20010209@gmail.com>
> ---
>   .../admin-guide/workload-tracing.rst          | 20 +++++++++++++------
>   1 file changed, 14 insertions(+), 6 deletions(-)
> 
> diff --git a/Documentation/admin-guide/workload-tracing.rst b/Documentation/admin-guide/workload-tracing.rst
> index 43a3c8098654..c49c2a00a8b8 100644
> --- a/Documentation/admin-guide/workload-tracing.rst
> +++ b/Documentation/admin-guide/workload-tracing.rst
> @@ -243,13 +243,21 @@ which can help mitigate performance regressions. It also acts as a common
>   benchmarking framework, enabling developers to easily create test cases,
>   integrate transparently, and use performance-rich tooling.
>   
> -"perf bench all" command runs the following benchmarks:
> +"perf bench all" runs all available benchmarks in the perf bench
> +framework. The exact set of benchmarks depends on the perf version and on
> +the features enabled when perf was built.
>   
> - * sched/messaging
> - * sched/pipe
> - * syscall/basic
> - * mem/memcpy
> - * mem/memset
> +To list the benchmark collections available on the current system, run::
> +
> +  perf bench
> +
> +To list benchmarks in a collection, run::
> +
> +  perf bench <collection>
> +
> +For example, to list the benchmarks in the mem collection, run::
> +
> +  perf bench mem
>   
>   What is stress-ng and how do we use it?
>   =======================================

Looks to good to me.

Reviewed-by: Shuah Khan <skhan@linuxfoundation.org>

thanks,
-- Shuah

