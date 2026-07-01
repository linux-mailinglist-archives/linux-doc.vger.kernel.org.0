Return-Path: <linux-doc+bounces-94337-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id u/QIIbr+RGrx4goAu9opvQ
	(envelope-from <linux-doc+bounces-94337-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 01 Jul 2026 13:49:14 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 57DC86ECF92
	for <lists+linux-doc@lfdr.de>; Wed, 01 Jul 2026 13:49:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=hFmz9lZP;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-94337-lists+linux-doc=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-doc+bounces-94337-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D429430297BC
	for <lists+linux-doc@lfdr.de>; Wed,  1 Jul 2026 11:45:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9216C48096D;
	Wed,  1 Jul 2026 11:45:17 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5430A478E3D
	for <linux-doc@vger.kernel.org>; Wed,  1 Jul 2026 11:45:16 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782906317; cv=none; b=YlEMbu4/0L28kjzUHL/12VJQ8qcetM+SWq7CMbUvatqZm2gDvC4Q8dKqVZxr45J3jLgkxkW7RZiN3RtlBadRQZDFi//XyXrF+W9YH8w8XFlCCNWPKRcpCReCgansB4dh2S0PyT1UhO3zZB7rJNR6rRm5NTV0bcHCtUABofNxf8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782906317; c=relaxed/simple;
	bh=8bDt6WmHd38RjI3I07PX4H7z+6SwekPIKJxwxBqTYLA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QKZiDzQSSWpEPhKKEAv/7fA8Ktuvs3+7X7aT7FKRO+AFk8wVClEm/zZGBz6g6E+UhExzc+YXaQaZ8eWI2VYSmwoDJ+wCbMMGmnauOxnPRNC32tsCTIRNZuiVVdx05wzqDd33WtXMmuHN4aMcqD9S/vtHMj4uVzCdvu0yWE/9c0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hFmz9lZP; arc=none smtp.client-ip=209.85.216.50
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-37de961d1bfso358402a91.0
        for <linux-doc@vger.kernel.org>; Wed, 01 Jul 2026 04:45:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782906315; x=1783511115; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/ee7YMVRzqI+ZD40aoZQ9RtQKlP28mAE9ycV55I3/ig=;
        b=hFmz9lZPofobwn/4XRZP9xPGmW8OajGNHW1Qluj0fBDepLqvCsfV9ap6u3UxDZZr1z
         ZqewUoqGpRLJI/R5YSUElyMDqlDoQXSU1hd32pwFP4X/ah5lv5AODrRugGLoaA+yV8a0
         UfMtTl0e9ZsGJruwgtl9TH5OsdQ+yHXh80jKycQTFF4LK0bvxYbxxkkFkRcaBhegJ436
         HGfekBdG7MpndTUiAGj3uh1KgCGWm8xoPmAU/mVApupvZtYwt8YYtbIaIkvA8CNIdxc6
         MnYYiRGJr8C0bZMtZEgHeyXeLJFCBEVNHrjpiB8ItCf8s7xMH9b1Z04F9Wk80keWrCMV
         A5Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782906315; x=1783511115;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/ee7YMVRzqI+ZD40aoZQ9RtQKlP28mAE9ycV55I3/ig=;
        b=eh+pB5tKDgE9RiTS/SEZ/YfinmEZlDarMIRYqNb/BgWbb1nZK25SlF/jQn4lest2+p
         A/I61cXQzlcMs+dAJdthniGGpBDVA+oYmJYSbImr5IEenjyZ+wEZ0zG2ldaBKapTjfu2
         zXm6cQtDlldKRGC1XjEsewIvwxt3IuGd2oCjGPxgEeETGWH16cQ/K3korN5lzs+ooSA5
         vOQnpeGMX1f0icbx3asY7VNX2mFZoieBCAH0u3kvOFlowy+Xqmxq/sgs0LEKQVjZGpKj
         +Od49G8zAEkSePMQOvFbvMsgzatFAA2bEALylDUA/dPMFpQZnG6r8klmx/iPw0N2Y/ni
         QEsQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro2NQ3dHyblXoF0oUNjz1Kt2QZrOf2vXFJCdV5BvhZzYAhf/dufj8NLRZK85bzkIZVyb6TxkEyCq2g=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6wvbOhmVEAh+B0Od+xwSDbPeQcxaoeijDxt9uXCpqUvhZbAon
	3fFmgBH4j75biF7iKh2kVPEbzeD1RZ/XvIyLMkzwGjVyKuKXhIbS8pAT
X-Gm-Gg: AfdE7cm5KuZ+/x8USMD7M6rKgV9XHHT+zOZwefecrshZr6+Wu86MYB85UKhihoY96N5
	SNQ4L3mER50SyWhY3eqddA6eGmTH7Sm0OyRlNKT4xga3ftZTaWfGkgCTgnWNqtQw3CAWF3wBKrC
	yQVJrVAsQR/dnAnpLMQ6l0G4OkQYXX1cPbE0X88PbyCuuDgXQLgOpN3ZDFd6v9g715pdilulTO0
	ciS0FNDgNw8p7XCSqjO2Y58cGwAXrSLoEVptjSpgDu7E+ECNeXw8Sw+3UNNoWc8srbWDXVbxrKK
	U7ypm6DpKMw1mL34MC8psy0ZUYcaVNSUAOkHamEfTS4oK2g078P8qt02KDhmHgEcMXBrqg+6Ap1
	TuEIbVG/kHpTAh4S7IVuN4dHOn5PSffpM2Jd6jwspiNrF7SRYS2Z/emx4EOXQquBBjJapw93DRO
	J3CHfzdbrKDbu2Z8mbuVP7g3OetnWkYLgJukZ21YfWo4I=
X-Received: by 2002:a17:90b:548b:b0:37f:9ce1:cdab with SMTP id 98e67ed59e1d1-380baa971aemr453297a91.33.1782906315613;
        Wed, 01 Jul 2026 04:45:15 -0700 (PDT)
Received: from [10.125.192.77] ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38095d4c263sm1750153a91.3.2026.07.01.04.45.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jul 2026 04:45:14 -0700 (PDT)
Message-ID: <4ec2bd64-af40-8ebf-b8a8-2dd7421a1100@gmail.com>
Date: Wed, 1 Jul 2026 19:45:06 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.0
Subject: Re: [PATCH v5 4/6] mm/zswap: Implement proactive writeback
To: Yosry Ahmed <yosry@kernel.org>
Cc: akpm@linux-foundation.org, tj@kernel.org, hannes@cmpxchg.org,
 shakeel.butt@linux.dev, mhocko@kernel.org, mkoutny@suse.com,
 nphamcs@gmail.com, chengming.zhou@linux.dev, muchun.song@linux.dev,
 roman.gushchin@linux.dev, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, Hao Jia <jiahao1@lixiang.com>
References: <20260629112032.20423-1-jiahao.kernel@gmail.com>
 <20260629112032.20423-5-jiahao.kernel@gmail.com>
 <akMJ8UfeZXrVe5LN@google.com>
 <cbbdf506-b67d-193c-2c94-bacf828d559f@gmail.com>
 <CAO9r8zNCEis2QHROEsM5QZsb_H4ofNjA_sE-pM7SVxtgHg_rqg@mail.gmail.com>
From: Hao Jia <jiahao.kernel@gmail.com>
In-Reply-To: <CAO9r8zNCEis2QHROEsM5QZsb_H4ofNjA_sE-pM7SVxtgHg_rqg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-94337-lists,linux-doc=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[jiahaokernel@gmail.com,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:yosry@kernel.org,m:akpm@linux-foundation.org,m:tj@kernel.org,m:hannes@cmpxchg.org,m:shakeel.butt@linux.dev,m:mhocko@kernel.org,m:mkoutny@suse.com,m:nphamcs@gmail.com,m:chengming.zhou@linux.dev,m:muchun.song@linux.dev,m:roman.gushchin@linux.dev,m:linux-mm@kvack.org,m:linux-kernel@vger.kernel.org,m:linux-doc@vger.kernel.org,m:jiahao1@lixiang.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[linux-foundation.org,kernel.org,cmpxchg.org,linux.dev,suse.com,gmail.com,kvack.org,vger.kernel.org,lixiang.com];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jiahaokernel@gmail.com,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 57DC86ECF92



On 2026/7/1 00:10, Yosry Ahmed wrote:
>>> Before going through more versions we need to figure out if this will
>>> pivot to be a proactive demotion interfcae for swap tiering.
>>>
>>
>> Yes. Should I drop patches 4-6 in the next version and wait for swap
>> tiering to be finalized?
>> We can try to get the non-memcg parts (patches 1-3) merged upstream
>> first. This would also give them plenty of time to bake and catch any
>> potential regressions. Thoughts?
> 
> Patches 1-2 can be sent and merged separately, yes. For patch 2,
> please include some numbers for the writeback performance before and
> after batching.

I'd love to collect some performance data. Do you have any recommended 
benchmarks for this?

Thanks,
Hao
> 
> Patch 3 does refactoring in preparation for patch 4, so I don't think
> it makes sense on its own.
> 


