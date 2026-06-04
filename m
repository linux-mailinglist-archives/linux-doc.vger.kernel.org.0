Return-Path: <linux-doc+bounces-90939-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 5m4lNlxuIWpAGQEAu9opvQ
	(envelope-from <linux-doc+bounces-90939-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 04 Jun 2026 14:23:56 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 322C363FD22
	for <lists+linux-doc@lfdr.de>; Thu, 04 Jun 2026 14:23:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=nI3NJviy;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-90939-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-doc+bounces-90939-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linaro.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9EAE0303D1FA
	for <lists+linux-doc@lfdr.de>; Thu,  4 Jun 2026 12:19:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1014343C05B;
	Thu,  4 Jun 2026 12:19:00 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B03933A9014
	for <linux-doc@vger.kernel.org>; Thu,  4 Jun 2026 12:18:58 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780575540; cv=none; b=p8DVqQYwfvxVX1PIeSnR6jRlaA1UYCfapnAUO+bWYW56RLcSHVxS0u6A7abDr2+EcKiiBu47JHu/jiThzHe64/SdNcuaKHlzGVcH3SMdBm6Yqq+P1fp2nXvq8xK+r0JzHV1OzLXjNxtpunKbAokUCQyerHvGNfKnYX7Xlrlgo1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780575540; c=relaxed/simple;
	bh=LlzDXkVW2KDnZvT5WLR716/Dj/N1QHBH52PN2KfgwlM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WIX3djFLgnOhj+pNKQK1737JGQFmj1jVDRKNv6XwGM2LFG9b4hCx7GdM7QdAJqVdoY/dTr/FpxACBvhsLY5fLxojjcT1n/lG3sh0cF6yl6ihC0X/k3bjN5vns55iCrhD7+NfEXQAfbpxEkYOU4H+zqI/BsxwoAQKaGLIY2GeU2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nI3NJviy; arc=none smtp.client-ip=209.85.128.47
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-490b4e1ade7so7316855e9.0
        for <linux-doc@vger.kernel.org>; Thu, 04 Jun 2026 05:18:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780575537; x=1781180337; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=d2bp5jaoGscH7ESVGw52bNDl430Md7PtGyJ0j9xVCNs=;
        b=nI3NJviyP9o/TqlCEPY69iUG9GC9/2FZxx6YcmB9x7/L51fn6wtudBqfdWjXjKkDZP
         N0AVj0lIsrK+sgh46TWSKCdpClv0XlQydLrkYAR8bQnled0tJesY7LjF0vocPPDDMJeV
         wAwMD3t3vxk0A9llvJgwYA5q+0rRa2yYzKYbUr5OtqiB39E49XjJIWdQHQs3VnGv4u4O
         ySXHjBBeL9eaF+jnr2P/3k8baXfUkLtVl705J+RazEYZk+/577sJgqjZ3YISqO5wInnj
         92W9KVAc3FPNESBCRO51eAaoanxdGW5s0WCh7juy52NxQhTA7GXyydRDtY6SHw6MOU5Q
         rUTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780575537; x=1781180337;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d2bp5jaoGscH7ESVGw52bNDl430Md7PtGyJ0j9xVCNs=;
        b=RzVsFlJw+ADjHm+um43eGzxRrzreHuZ3bLxvjO8oEfdg90INpBvJMH8D6WiqFsmoe/
         VMLqDVqC5oWfl1DLI5LFtEsGaS/8SOqMVy34qMerbbu23R3yKDlDG//qJ4ah0aF+bchS
         bq1O/fpL1GQjnVbtraFbrT3+sv+GYfeegw5X7iz+Pu4qDoTikp1lflbn8RF+kV3RgCeZ
         ICSw0BlYJFFyDs2DkFPaB2LE+NAKoPi20vkfNlepNv2OL6ccWKumXAPNYBfeowRRlj7w
         0EuvinlV23pQOCvF30sCDx3cTXv3JbhkTzoTRnvP5yrFoZTjtYS8C4ykCFlh3V46xtRQ
         mv3A==
X-Forwarded-Encrypted: i=1; AFNElJ/OLj/XD6veYwNehWLkQAMKM9t4MUukJ34wqtx6E/EYxtFns+804T4Ha7g5pXC/L9mkg+W8ZiHIssE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyx47yaS1Rgx3kaOiiNmbVKNNzRKxARAispT5bZu+13bJrgtuN1
	Q/0oUZoP6eDMrCw1ZdepkFyleIcoAlgfu88uVfcqABzrzJEOqbnSWdmoe4L38/BpldU=
X-Gm-Gg: Acq92OGKHdZKKJmrUMuv3hQkQaupCuXBbGNdnyub/YUTBwgqZIgZ5gvrdPbb3VCZ1uE
	n9A0gA9ZHCXJZaV3Ffl0UUaihRXJbBq81YPbGH0KsX33wS6YDKRxW0Zy03PgIsV0yQtAio28pfD
	PF6lgtaDHtd73NutaflcGkEx9186X0bgoD99OPlXk/DuDw0FYIcTU1dvGRoJMZj9NiDaqOmjh/b
	bT4addHzsuatVdKjYm/kSf6iZXkKTLfC3+dtesq4v2DXrQj8TT0a/6mlusFsuPnBZGPqyYYwFDs
	Dg+ODr7F1kbvtmGuKRWlImXmpX0dRRd8SPnpF6iexL4JtUtxj0xPlYKX2GMV7+i5w9gbvyOS/jV
	5jFQXwpIP1dR+/FVw1HmIhKZJ8shl6MIN5uHCheJY2Mfk3Fj14uGfcLC2mu5vNYWM4srayFYkcR
	a7zqYUVJ9GuPZKjJnS0Ob+3DP+K94Sg5zBueFWzeY=
X-Received: by 2002:a05:600c:1d86:b0:48a:6fd4:d3d3 with SMTP id 5b1f17b1804b1-490b5fe9688mr128262045e9.20.1780575537237;
        Thu, 04 Jun 2026 05:18:57 -0700 (PDT)
Received: from [192.168.1.3] ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b79d64e8sm165761745e9.0.2026.06.04.05.18.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Jun 2026 05:18:56 -0700 (PDT)
Message-ID: <011bf252-855e-4941-a6ef-8cc53f0bc48c@linaro.org>
Date: Thu, 4 Jun 2026 13:18:55 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 15/18] perf test cs-etm: Make disassembly test use
 kcore
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
 <20260602-james-cs-context-tracking-fix-v2-15-85b5ce6f55c6@linaro.org>
 <20260603173203.GF101133@e132581.arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20260603173203.GF101133@e132581.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-90939-lists,linux-doc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:mid,linaro.org:from_mime,linaro.org:dkim,vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 322C363FD22



On 03/06/2026 6:32 pm, Leo Yan wrote:
> On Tue, Jun 02, 2026 at 03:26:57PM +0100, James Clark wrote:
>> Hits in modules return empty disassembly with vmlinux as an input to
>> objdump. Make the disassembly test more reliable by always using kcore.
>> And update the comments to say that this is supported by the script.
> 
> Even without kcore, .ko files should have been saved into buildid
> folder. Before switch to kcore, can we firstly fix the issue that why
> .ko does not work?
> 
> Thanks,
> Leo

I think this description of the problem was wrong, the reason for 
failures was the alternatives patching mechanism. And the only way to 
fix that is by using kcore. I'm not sure what you were thinking of as a fix?

Sashiko commented on V3 that hits in modules would still open the .ko 
file and skip kcore anyway. I tried to investigate but I wasn't able to 
generate any trace or samples with hits in modules. It might be a 
regression but it might have always been like that. I do remember 
switching to static when I was tracing Coresight modules before, but 
that was to make using address filtering easier, and I inadvertently 
avoided this issue.

Seems like fixing this is outside of the scope of this test though. I 
didn't see a single failure on N1SDP and the only failures on Orion O6 
are because of the wrapping/snapshot bug, and we already knew that you 
have to use kcore to get accurate decode. So I'm not sure of a reason to 
not do it?



