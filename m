Return-Path: <linux-doc+bounces-90788-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 664/Bc5ZIGob1wAAu9opvQ
	(envelope-from <linux-doc+bounces-90788-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 03 Jun 2026 18:43:58 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 65420639E00
	for <lists+linux-doc@lfdr.de>; Wed, 03 Jun 2026 18:43:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=HnwoYy5F;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-90788-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-90788-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linaro.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B88D03290E4C
	for <lists+linux-doc@lfdr.de>; Wed,  3 Jun 2026 16:12:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 118C73E7BC5;
	Wed,  3 Jun 2026 16:11:35 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25FA33E63B8
	for <linux-doc@vger.kernel.org>; Wed,  3 Jun 2026 16:11:32 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780503095; cv=none; b=WCJszV7D1SWsAGJ1/lJ2mMhhudy2nDJNtN1d454WY/6ix9hY6xcQQK7zjwxMHux00M+Uwtq5CJ4nh+KWNbaeEp34cxEZKQZgMS/GFLsxfSSygXP4RuFJ2F6WyptaS+YOqGHy1BT+S4SPJDM6VDfpLUl/Yho1Ni+9he8Prf11otg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780503095; c=relaxed/simple;
	bh=QrEgHVX4ffhJFB1JpGLYul4XC04Y8ZkjwVyIj8YGu7c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EUTEu5T1LSQAOS626BC1OyLzm8u9IIRzj4YEJAl/9oye7nynj/LcAlpLcAzkGjELxeDxHAdyYXkTAl6HTtEgxtVRbPzcxfkpm9bbJT9HfGO9U6RW5fVj55N2mICL3FeMrmMbEgfXnyK/Vq2tz/RHxnqmzvpTggETmkos7377RGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HnwoYy5F; arc=none smtp.client-ip=209.85.128.49
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-490b2b037d2so18519065e9.3
        for <linux-doc@vger.kernel.org>; Wed, 03 Jun 2026 09:11:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780503091; x=1781107891; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QqzEpLZhbsJNsiLYofbVYCw/MWIHevffPJ5dCvGAQKM=;
        b=HnwoYy5Fg9t2UDJoe2h2ZC745TCjvslE/umYeI2vMJ3Gi8KInFQDaoqLNQUs74Qrey
         S1KOG6Vi3//1duL95lMu67C2BvuLRl/cl0CQr/ZkjZ3XRutSEgGRnsOpeBSDK8xZNVuO
         RA9go2/HB+OdMR1NAzIzfRUEw0DLuh4d2aV02dUFti5V3aasOn/zHA5ol2/17e7b3iqF
         3Pyigr0GUr/Kk0lqWOhVRh5Vdew1o/XaJ/lCG8lhqe3Gy75B0pnhsOy41eRx/j+WxGJc
         LUHmcuQK8CrA1xXuqzvrw8Ka97GIukRdiE7zXueG5W24Ef4pwa4SABv6XWKJpUnmeU0j
         jpnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780503091; x=1781107891;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QqzEpLZhbsJNsiLYofbVYCw/MWIHevffPJ5dCvGAQKM=;
        b=D3GKNFgYwm4jtlENHPrXocpu3hjxqq+SjGPeP7KVBX+Fz81QdyVkzogVZ3kSgOo1cJ
         tHokK4sENn4BfHmP00BR3i8STFI13v8Nu99Uls+AKT0oX0V8xw8QyBC6p73/X7yMmdta
         CfKQAXZjN78/2yRyWLLyiTlByAoZplhJsr/CzRoL/tOVeY7jje6e8uGlu+zRuc15u5e5
         LZOAnyw66e1N2o1k20Ib44/uiZah351j2DtYPNQmwKvDL0o0F7R/FikhsuHWFrFL6/Lj
         NlZyfMcYDzB8UTM442/3+mgEyy466ZRn522JKS+fHJHx6CeoNNfwvdg22Ny5tk6emerH
         L9tA==
X-Forwarded-Encrypted: i=1; AFNElJ8IJE4Yd1qRWw9M8SKND3FhTnEBIOnJfeQX3vMx3XhWkMwZ+A4aFOx0CNLr6GS8M7S5eRqMm96Xv8Q=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5jtt1FW4SddQkCT5jqQ5rlnd4FDPRYKr4/z0wb6SCDcrfv9Hs
	VmOomvkOlLPG02M5oZO7E638sGDqDRvkBfl5pnLTSr00JNP4wADH2PbqvFj75w9bLQg=
X-Gm-Gg: Acq92OFZpIEmxbi/dsMc+Rv+zcO/eA6vBoPJXeHQyyuJtP1In/8uB6kC4QmEigGe55O
	fjGaDMjqaJJYbf/KsAR3rij2zx06ei4fMZhdCm4sjlD8XNRXjOXKkZnKAwY6aicT3Qnn7GXkTVm
	j72v6atf30X1YpKnkuyQW810MW+x9Q/PWB5E9u/ZZqbB26xR/Ov+hejdxLi9OWIIqmPrnseqM20
	m656N/HlNWO/X5cRtFdXPc0gwbuPmvG+VhK6CgSf3sJ3FFW6vCUUFZGKLtlUQCqyQs0095FBh6s
	+IfxEtJGm31MPU5xvwTNyso6JRfJ4xijqENXVqB5jcx87UBWQwTjEB3tJ8KPhz6ZvotX7oEG8iV
	RWJSqhfcrbkkk77Hz2yvj3l6uawXg+1L8PO4/t3LeB4RkXtDi5CGZVDVtgDEe3Ojq81DswITAnL
	8IDPbDAGUGxDxC0t6HbsWY6OfxgehX6lTiH6jxeE1iUOmFOAtXIA==
X-Received: by 2002:a05:600c:3e0a:b0:490:b4cb:3845 with SMTP id 5b1f17b1804b1-490b5d48800mr79915015e9.0.1780503091650;
        Wed, 03 Jun 2026 09:11:31 -0700 (PDT)
Received: from [192.168.1.3] ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2dc412sm9011742f8f.4.2026.06.03.09.11.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Jun 2026 09:11:31 -0700 (PDT)
Message-ID: <882922c0-042a-4108-bc2f-cec443d0db9f@linaro.org>
Date: Wed, 3 Jun 2026 17:11:30 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/18] perf test cs-etm: Replace memcpy test with raw
 dump stress test
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
 <20260602-james-cs-context-tracking-fix-v2-8-85b5ce6f55c6@linaro.org>
 <20260603143622.GX101133@e132581.arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20260603143622.GX101133@e132581.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-90788-lists,linux-doc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,linaro.org:mid,linaro.org:from_mime,linaro.org:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 65420639E00



On 03/06/2026 3:36 pm, Leo Yan wrote:
> On Tue, Jun 02, 2026 at 03:26:50PM +0100, James Clark wrote:
> 
> [...]
> 
>> +# Use exit snapshot to record 2M of trace to make about 80MB of raw dump data.
>> +echo "Recording..."
>> +perf record -e cs_etm/timestamp=0/u -m,2M -Se -o "$tmpdir/data" -- \
>> +	perf test -w brstack 20000 > /dev/null 2>&1
> 
> ...
> 
>> +size=$(stat -c%s "$tmpdir/rawdump")
>> +if [ $size -gt $((50 * 1024 * 1024)) ]; then
>> +	echo "PASS: Raw dump file is larger than 50MB"
>> +	cleanup
>> +	exit 0
>> +fi
> 
> I am not sure how we can map 2MiB trace data to 50MiB+ raw dump.  This

Why not? Decoding it is roughly equal to decompressing it, and with that 
amount of trace the small differences in compressibility average out and 
you do get the same amount every time. I think if we got less than half 
the amount expected then it would be worth investigating.

> is not to verify perf stuffs but just expect how verbose output from
> decoder.
> 
> Can we simply verify the trace data is ~2MiB with the command:
> 
>    perf report -D | grep ". ... CoreSight .* Trace data: size .* bytes"
> 
> We might relax the check as the trace size >= 90% * 2MiB
> 
> Thanks,
> Leo

That would work, but that wouldn't be as thorough. The first thing it 
prints is " CoreSight .* Trace data: size .* bytes". If it stops working 
half way through or prints nothing then the test will still pass.

The reason I wanted to add a stress test is because all of the other 
tests have been reduced to just a few kb of trace so we have nothing 
that opens a file with a more reasonable amount of data.

I suppose with your suggestion we'd still check the exit code, but 
that's about it.


