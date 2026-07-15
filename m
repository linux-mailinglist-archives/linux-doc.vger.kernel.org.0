Return-Path: <linux-doc+bounces-96878-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id /FcDOObnVmr9CgEAu9opvQ
	(envelope-from <linux-doc+bounces-96878-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 15 Jul 2026 03:52:38 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E1B00759F73
	for <lists+linux-doc@lfdr.de>; Wed, 15 Jul 2026 03:52:37 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=LbjyIerz;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-96878-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-96878-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 22720300A252
	for <lists+linux-doc@lfdr.de>; Wed, 15 Jul 2026 01:52:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 806AB38B7D6;
	Wed, 15 Jul 2026 01:52:32 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00682381EB7
	for <linux-doc@vger.kernel.org>; Wed, 15 Jul 2026 01:52:29 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784080352; cv=none; b=BLGZlpStOwYd1I7vonVnRdhNG7ydpmUO8ZoEp2p+KglC9mqlo1DQqycYSI2yAgFl9t85hNYkAq2efeRjxNg+c3oE2uRcTUv+e5U1ubUnCarzIKnwRvoTrMhBvL64hZy7SxzrbLrNCxkQpYFOjFmEQ84+hSZoYBRoMPsp+4n7XGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784080352; c=relaxed/simple;
	bh=UmbEMwUYMfG/QtP+31j6Vm44zHdlCYaYVf3/YMRPSzc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=b8KIpOkTw7MsMWS6ticOSqVkSS4UVmaPYNPOgiZ26RMjQ1QUfZPrV3H/Rh8luqsKIsuOsh2ALnRuwNMU86n5G6tNtSCcNWJt6hBLy+eFl0jLBOBO8xET0jmkkKdo7etVxPJDeReKav7ZExJKd/3Yoeb3VHlhxh9w3gIgWhxj85A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LbjyIerz; arc=none smtp.client-ip=209.85.216.45
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-38de840f2f0so1746054a91.0
        for <linux-doc@vger.kernel.org>; Tue, 14 Jul 2026 18:52:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784080349; x=1784685149; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=N84xkI2rzlxvOLvKTq0tj8gRT2TVz3wv6111NdlBqVg=;
        b=LbjyIerztiyl1i61nIgbQAwU/IWuPoIVnNUQB/NVrF7QzgBnzAgRA4wYPTkEVFhHJt
         YSIERBnMbe47frdgHqCCz2bjT4zhPXf2yTGzFz11h1eQnxtks4YrowGzAK3Lyo9mToyO
         gE8geGfC4fId90ChPFVkgFY/4HaljQ9nTXmStJCp1eQnEmVDGMAANNRGMvK621vsBiJN
         RuKDDKlO2gE6npYugNigVhK+fXk6cE3jjWuVEe7wnF1Hk2mMBrZyZPrH+XLg8aev9mJM
         QopJSx71zwMBdE4FTOruWkc7v/SY7xGpLGBeqLzSQhwKVCKbLChPysnP42nJrWLGqked
         99Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784080349; x=1784685149;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N84xkI2rzlxvOLvKTq0tj8gRT2TVz3wv6111NdlBqVg=;
        b=ofAKTdjzRYpFSw6Q+oEUf92Xjvv5Sn73zrJyebZdFfCRy/XmfWIXbgNgVrVQoDPXJV
         KeGNTNpiH23yhPQfX+r9bjYN6sNGIbyHReHM52D44XeVQhCbWuhnT+7Xw5jegft1yx2G
         9SCHIsz6vvoE8GvupHwHB8AhLtG8sT249DtWr0Q0v3HlWyXD4PBQQg6c9td+xab8sfbW
         nCzdzE2FPXx4DxjiKgeO1ZNYtVHBMe0R9WPqdtUvqgferGazOIILPhCC3Mnda0LO6NVX
         uFoFzz6kA6uJCpOLEJ8XW4mT/41OH4fUG66z64BTM/twKQ9pYPEQU08919gQKu3LwHKX
         5DCA==
X-Gm-Message-State: AOJu0YxRlroUfYTEUXjqBFDt7vSiifVrQJPZOxKSoI4Eutb9R4nTi+6g
	Zd8Mgnf45VQo/EAcVMbGFLmkPjJ8OvqhAOVzYZfeLJNOuvRYMCx0g9y9
X-Gm-Gg: AfdE7cmX2nQ3NYbXksgz6j74Nb+p030sRWKpqiewFOStCaVzSvmmedqSiSobgNah4im
	zoxcVCiUNtJpEb4vw9wNGHzxqmpYUqsIwdg+KGO36KetSUucORxM9T/9Ff/5Wh/Dwfm5SUYTlxZ
	gaSjvO4CPVqF/2zGUxcAwbqwXP1ItWGnSF6OvulVec8sT9GIxmJDdAoAChfb6Xx5vEtDkhZ2jxY
	zXSwGevOop+SWyh1PY/LUiFYh+nieNi631ErRN05Me6c9pohuJD4pSkL9mbxpMOvjbvGyPQgD7t
	JCaCz+mVwmBZqGJJFTQMDpu2u3ea+g2RHqQduu5n35ok12iNrMj9p3svOY/eXPkIJQ41I5DzdVt
	r7qzmFhLbIGKw8pl1pbmO3dO5RGYaG6jCiJKoN/dIDF/ZJbsKYWsHf3l0WeBHAFjAqq0fB2nCPT
	nNu7r0G8sWa2wW
X-Received: by 2002:a05:6a20:9150:b0:3aa:c93b:6266 with SMTP id adf61e73a8af0-3c11060a51bmr17809190637.19.1784080348768;
        Tue, 14 Jul 2026 18:52:28 -0700 (PDT)
Received: from [192.168.2.226] ([116.6.102.190])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ca5b3b251eesm10348119a12.31.2026.07.14.18.52.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jul 2026 18:52:28 -0700 (PDT)
Message-ID: <143bc26b-5496-4770-a0a2-5ea1d1fed9da@gmail.com>
Date: Wed, 15 Jul 2026 09:52:20 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: What's cooking in zh_CN (Jul 2026, #02)
To: Doehyun Baek <doehyunbaek@gmail.com>, Weijie Yuan <wy@wyuan.org>
Cc: linux-doc@vger.kernel.org, Alex Shi <alexs@kernel.org>,
 Yanteng Si <si.yanteng@linux.dev>, Dongliang Mu <dzm91@hust.edu.cn>,
 Ben Guo <ben.guo@openatom.club>, Gary Guo <gary@garyguo.net>,
 Yan Zhu <zhuyan2015@qq.com>, Jiandong Qiu <qiujiandong1998@gmail.com>,
 chengyaqiang <chengyaqiang@tsinghua.edu.cn>,
 Haoyang Liu <tttturtleruss@gmail.com>
References: <alZK0i0HvxOvSKwj@wyuan.org> <alZP_6nAXNy_HfZi@wyuan.org>
 <CAN-j9UoUHQ2i4H+9G-XK_mOfKKyE9K9-mwUgPc+4yOVfiizgmA@mail.gmail.com>
From: Alex Shi <seakeel@gmail.com>
Content-Language: en-US
In-Reply-To: <CAN-j9UoUHQ2i4H+9G-XK_mOfKKyE9K9-mwUgPc+4yOVfiizgmA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:doehyunbaek@gmail.com,m:wy@wyuan.org,m:linux-doc@vger.kernel.org,m:alexs@kernel.org,m:si.yanteng@linux.dev,m:dzm91@hust.edu.cn,m:ben.guo@openatom.club,m:gary@garyguo.net,m:zhuyan2015@qq.com,m:qiujiandong1998@gmail.com,m:chengyaqiang@tsinghua.edu.cn,m:tttturtleruss@gmail.com,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-96878-lists,linux-doc=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,wyuan.org];
	FORGED_SENDER(0.00)[seakeel@gmail.com,linux-doc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,linux.dev,hust.edu.cn,openatom.club,garyguo.net,qq.com,gmail.com,tsinghua.edu.cn];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[seakeel@gmail.com,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,vger.kernel.org:from_smtp,doehyunbaek.github.io:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E1B00759F73



On 2026/7/15 01:05, Doehyun Baek wrote:
> Hi Weijie,
> 
> Thanks for putting together the “What’s cooking” reports!
> I "cooked" up a small website this evening that attempts to automate them:
> 
> https://doehyunbaek.github.io/cook-linux-zhcn/
> <https://doehyunbaek.github.io/cook-linux-zhcn/>

Nice work!
Maybe add a build testing result for each of patches, like 'make 
htmldocs -s', although build should pass before send out patches, but it 
often be omitted.

> Every hour, a GitHub Actions workflow scans recent `docs/zh_CN` patches 
> on the linux-doc mailing list, groups rerolls, and compares their 
> subjects with Alex’s `docs-next` tree to determine whether they have 
> been applied. Pending series with no update for more than 30 days are 
> classified as “Cold.”
> 
> This is still an experimental prototype, and its heuristics may have 
> bugs, particularly when threads or patch subjects change. The source is 
> available here:
> 
> https://github.com/doehyunbaek/cook-linux-zhcn
> <https://github.com/doehyunbaek/cook-linux-zhcn>
> Issues, suggestions, and pull requests are welcome!
> 
> Thanks,
> Doehyun


