Return-Path: <linux-doc+bounces-90786-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 7kxgHhlaIGop1wAAu9opvQ
	(envelope-from <linux-doc+bounces-90786-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 03 Jun 2026 18:45:13 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E3CE6639E20
	for <lists+linux-doc@lfdr.de>; Wed, 03 Jun 2026 18:45:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=onoEwvma;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-90786-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-doc+bounces-90786-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linaro.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D84C83140293
	for <lists+linux-doc@lfdr.de>; Wed,  3 Jun 2026 16:01:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8B9B3DDDD9;
	Wed,  3 Jun 2026 16:01:07 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5607D3DA7CD
	for <linux-doc@vger.kernel.org>; Wed,  3 Jun 2026 16:01:06 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780502467; cv=none; b=Q+QBLzdYqp1CTcKHe4cDCh5oLL7X5K4QrRmu3con9AxTt7r2GGmPbfS88aBF2O90rma9Wo+8H6WK78nqds/fvrNzAY3ckxevjIxKjRhNhctjlHfZxUgbdMWaZ3RIuQA28xDUZDWrVifwP0fYItNNGyXcnTf+r+WkHttAIyHAgUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780502467; c=relaxed/simple;
	bh=pQQwDZC2/IQqd6kh9fxl4SaPTFvh6wkfm8PxFI9p/bM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gqAxhTPCYUybs8WOU9W7a6I050Os37P1LY/gOYCPvGF//77ebQnSj2ucQZ5JD2BNgocfT/C2WQa8RG8XtZ/NXPPpP1hhoU3IKeTvnwPKU1xszpF5IeMu56G6ZxgevXl4fa0WHsWZDzM1+VJCKD4oa7PFtShWvJE1nygphuQpf1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=onoEwvma; arc=none smtp.client-ip=209.85.218.41
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-bec43ee8ff0so143525466b.1
        for <linux-doc@vger.kernel.org>; Wed, 03 Jun 2026 09:01:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780502465; x=1781107265; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zYMOxXQEP3+1sbvX2qlt0z2iruVG6MdGHtsqLO+rEWo=;
        b=onoEwvmafC3fqMZFsGZrjri79fAUmjyHrE7fjSxm3x5onnEGQJCuYnkK5qkmP3tppJ
         3fsQtvpF/QkO6S8NO44jKtYwysawNZByeW+JC/WS9Bbymu4EXAgyVQnk2E301sLWWbxz
         SW4qVdTPID498eIkAbbZYvLTHSBTtB3NS7nD358irmTPaX8AbFDKfwzv6tWIafp5I1zE
         rU3IO7ksxhxNpc/J6hDjmzvN5yia1k4VRIgu6JbuKYkPN05QdsqGW6th5XnmAsBWTo7B
         azZWk6oiw7VkuBPwMyMnP7qITrzj27oFV7XozJ3ZmaVcEWbLCwhWN2H5THlhHefIK0zh
         eXKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780502465; x=1781107265;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zYMOxXQEP3+1sbvX2qlt0z2iruVG6MdGHtsqLO+rEWo=;
        b=r+FGnGzG9Gv8B9aX2GhKw0z3pZMTEHKeoKI6VnzalBtr9U9Ex4YqdAOswkxEHcPrGQ
         FTCKYo2qfUho3UxwLHwXFvuRZ9XsH8it1KvIcWixPVer7tayEG5OBug3fOvXdKyZZFem
         AuuuoqKWpXU6Ph3vOUnrxAZAqyfBgJoKYjtqG9Gut0PWgGsaXAAZv2s+3HL24y3cUL+8
         oKO+OVB+tnARkqD1I4hXryZDbYngz8AYgap75uO1UyyWBSCzJR/yCMrDVfYzH8iK48VQ
         iHHHN3hoJl1luGdEyG9PJshXA2O9if5KZOBP3OSHh8ppcRhwEMVublkTeRf0ggIRWyQS
         iruQ==
X-Forwarded-Encrypted: i=1; AFNElJ+UhmG6tk/Gen/J6gZd4OQrlFBF8iVusKb8IS8E2wdwijYq5aukuOzo7Pz42PvBi04N8+EK7esdl1k=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6FAil+BycC5tZs+QqVParxeCNfLforxvJvvFHyy/MjJy0f0hI
	gP7Ggd8e3B+VSaLAk8qu81Am9OxBN/QIiJ87ztVWEtFTHKaDKaHFPwfAtNykZEskLxA=
X-Gm-Gg: Acq92OF5aA4KeBzn3vTlMONpNTJ09s98AFJJOYsyk5hYsLE43CXXrCFnfQMb81uXz9Z
	p6MaNctic3bNC3/gsNhPBzSsFEVSGnTVSgx7yBQo+ChTHmDaFpa2wFgeRGpqgiBR0fzda8yqab6
	yFPHbOSeiZ+pSeTVmyuVu+gz5kP9geUrQnG+xKZdqvU6D9BCM07nRixwQWiJErvw6qwGljdUjbq
	aAGCs/thtkeIZ3JhIyDWuFRqFEIMvQ8PBUB9iJrVncZerorqb9vOUE5JNCzTriAUe2fIUGpzcu+
	Ndy7puPQT2DGAIeW2h9/87VOE1++xxAZ3KcsOyiXkMPP5l4c4r2WPa1lupbbXU0uLi76Rgvm/yr
	RD7GCLrVvq9bAJgbBiURKk2dT2//XbbRYRZ96T7QqgBXY6p2uN9c+W6C/nSYH870yOSwvps3zvr
	kPIQGBf2AxDwnXkLAsSMSJagRtZC9+AEISphmE6qw=
X-Received: by 2002:a17:907:180d:b0:bd5:1605:e1c3 with SMTP id a640c23a62f3a-bf1d159be66mr2503066b.1.1780502464474;
        Wed, 03 Jun 2026 09:01:04 -0700 (PDT)
Received: from [192.168.1.3] ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf05228a16csm180101066b.28.2026.06.03.09.01.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Jun 2026 09:01:03 -0700 (PDT)
Message-ID: <2f1db2b3-93e8-4c32-b207-304e3a43ce77@linaro.org>
Date: Wed, 3 Jun 2026 17:01:02 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 06/18] perf test cs-etm: Replace unroll loop thread
 with deterministic decode test
To: Leo Yan <leo.yan@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach
 <mike.leach@arm.com>, Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>,
 Ian Rogers <irogers@google.com>, Amir Ayupov <aaupov@meta.com>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Paschalis Mpeis <Paschalis.Mpeis@arm.com>, coresight@lists.linaro.org,
 linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
 Arnaldo Carvalho de Melo <acme@redhat.com>, linux-doc@vger.kernel.org
References: <20260602-james-cs-context-tracking-fix-v2-0-85b5ce6f55c6@linaro.org>
 <20260602-james-cs-context-tracking-fix-v2-6-85b5ce6f55c6@linaro.org>
 <20260603140803.GV101133@e132581.arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20260603140803.GV101133@e132581.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-90786-lists,linux-doc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:leo.yan@arm.com,m:suzuki.poulose@arm.com,m:mike.leach@arm.com,m:acme@kernel.org,m:namhyung@kernel.org,m:jolsa@kernel.org,m:irogers@google.com,m:aaupov@meta.com,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:Paschalis.Mpeis@arm.com,m:coresight@lists.linaro.org,m:linux-perf-users@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:acme@redhat.com,m:linux-doc@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[james.clark@linaro.org,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[james.clark@linaro.org,linux-doc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,linaro.org:mid,linaro.org:from_mime,linaro.org:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E3CE6639E20



On 03/06/2026 3:08 pm, Leo Yan wrote:
> On Tue, Jun 02, 2026 at 03:26:48PM +0100, James Clark wrote:
> 
> [...]
> 
>> +# Remove open brace lines as they may not be hit depending on the compiler
>> +sed -i \
>> +  -e '/deterministic.c:8$/d' \
>> +  -e '/deterministic.c:15$/d' \
>> +  -e '/deterministic.c:23$/d' \
>> +  "$tmpdir/script"
> 
> Is this related to the function definition?
> 
> I can see the brace lines with change below. It might be more reliable
> if adding unused function argument, which can give chance for hit
> function entry.
> 
>    static int function1(void)
>    {
>        ...
> 
>        return 0;
>    }
> 
> Thanks,
> Leo

Originally I included the brace lines in the test and it was working 
even without function arguments, but Sashiko mentioned that they may not 
always be hit.

I think its point was that there is no hard rule about debug symbols for 
open braces and the behavior might change from one version of the 
compiler to the next, or whether there is a function prologue or 
inlining or not etc.

I don't think it's important to the test at all though? So to err on the 
side of caution it makes sense to not test for them. Unless there's a 
reason you think testing for open braces is important? Surely just 
testing for actual lines of code appearing in a certain order is enough.


