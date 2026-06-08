Return-Path: <linux-doc+bounces-91273-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 13MKMoAcJmq2SQIAu9opvQ
	(envelope-from <linux-doc+bounces-91273-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 08 Jun 2026 03:36:00 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 24C2D6521C0
	for <lists+linux-doc@lfdr.de>; Mon, 08 Jun 2026 03:36:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=Krcd3CzZ;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-91273-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-91273-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 53EAC3006788
	for <lists+linux-doc@lfdr.de>; Mon,  8 Jun 2026 01:34:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 937E62FA0DF;
	Mon,  8 Jun 2026 01:34:51 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1028306743
	for <linux-doc@vger.kernel.org>; Mon,  8 Jun 2026 01:34:49 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780882491; cv=none; b=QQBYhPMFHmLEpYD5gBBABk+CNvIP5PbCJ6fFqNTx3481xfb+BhGPehnLnX2N4PfhyGt2CnjKQkiXXLG1141qxLLMe+ZjE9INVLJXEoe14Sm9OUsZaBWHTqBI52LSce4mLhjodft9Uq9WDtSeAivLTaj99dPWxTa6Xh67y/ScdxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780882491; c=relaxed/simple;
	bh=ZvuO212015WD8aCDKmSyf9xZmOUPenEzeiCCjuwDv/o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RRA0/fOFclX1yQy+m4TecS5QVOyL0jLbeaIiSgQ9ZkK9H/lVNTIhISuSbngVyaVc8g2ZOxFXHGHgXOZ04pEB8e5i972y7tHdBTO/7h6zeU7fFx91XZXQY1Exg7E3dajXr86MuiCleEnXgVqpSDNc5mP5QnwYLmVP9nHYxm2Dgaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Krcd3CzZ; arc=none smtp.client-ip=209.85.214.172
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2c0c1e0d00bso37141815ad.0
        for <linux-doc@vger.kernel.org>; Sun, 07 Jun 2026 18:34:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780882489; x=1781487289; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yxG4JG/0z+fS3lkkDdXZFEn20Z7OBYihsfUhNHj3M3U=;
        b=Krcd3CzZTT3eCEmwuBG/YxVJvtcyQXBbbvaYL6VhnpMNSNUwnY2Eb7jJfp9fT21WVm
         3UZnCGArLpGjMvaXoj/C4kQ3+XCvlcDjWXXAibK92itYhPZDw3LLem/O03b+tDFeuVDu
         dIpxyZb/s2D9tEeg79C3pe5Au1H4ULpT/cz5Ho3YcFNxcgOTqbb3N7QWjjJ9yjwMXpZi
         j/3pKRobzjrW7RBB6HyBwf6jMbueFdiDqGUApdyIGIm2HUi6H0oz4R2i8hi0hRho8NuZ
         EYn57/0kQeXIaafYA41lp1KsZ/A0yrLeeMYM4rST+tkrfM5XTygNZsC60cBw3Nr58mNb
         6YCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780882489; x=1781487289;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yxG4JG/0z+fS3lkkDdXZFEn20Z7OBYihsfUhNHj3M3U=;
        b=TllD30njbUgNdQQavmdQutLmzLPPipSsKe740s702vcDVdzqHxVmECtKH/Bg547L98
         tX101ozakIswpzku6HU/cZYKh1yaxDSVOj46eE2b7EppYzk4uP3dysACYZZaIJtA5aT9
         xCPbcq2p6MZcpeApAode3/E6XgBy56z73aEXHjVw7YU8TteyrIJ6KXnXzWFaLbCGIGMe
         ZNbM/GkXPnPhhLdLK+DF87f9a37ifNhQmP6ibqNmcodSGJA0jrxD4LhxK5gSp2Yg1PWN
         GCzVsoY+r7PwFrIvwUQygh9P7uXEocHz4nPW5bdHfBufUpTvvw0qBuw6uhzH4mRNxGKS
         u7OQ==
X-Forwarded-Encrypted: i=1; AFNElJ8GEz5aPNeVUnKTNd5X0caPTvQSQYYi0NeASbIbXSx9q7MSS5RaoQrGtdHIBHuaDK86/fQnzRlhAJY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyt9Nxt2Vvf5KcRlwG7nf1Oo9NBN4xVOds0xzsW626D5jKRHVIs
	du8wTom4CR/oRWQw0Yy+fAmP0wpImAOyqqwUNAtbr1z5OZFZGovfzxw7
X-Gm-Gg: Acq92OHRTvhq17pLTmf9NS2elBw/vjC30BH1LvvVol2Wp5AbmqgVbYD2lKB6IbCCx/p
	4y4mhnGHriE68LGtjiSO/lzE2msowLbuI72IooT7fVG/Q4UL5U72Q1t34FK9A3d05EjkITliFA1
	R5rUxzYrAocmwR0azRp0655KD6Zh+3hfY8GFloBilemTzDHMfbAlF33IDkPWQYkgKgBbTWacKCW
	aqOBDzj4rQgOmxWbrdvtbKPMY8sxcX0edLxmRlEeChPwIRLzn4QoEZJF7c1h4b+1ZmcZIm7liAv
	Yg1F4QU/r8CusX1WwAcJqoMdKSM6n6RpWo+1rWMXnmAUIGnn3TT5D6yxebLMJk8PFnHDDnlYDis
	rbXYEhuR/6tUp+Fs+dW3sRGfSJ4BGOvctnZwN2vdezxuzVv8qjPC6DaHa3TmZNCoSYURbr44QZE
	SZfqel6HOcUUovPO5w+N53YZMI3+CP/wxR2Qq/IkqSgoSytKI39MBdI61e+N78VdMxEMzvEklz
X-Received: by 2002:a17:902:f546:b0:2c2:27be:39aa with SMTP id d9443c01a7336-2c227be3b3cmr87642165ad.17.1780882489254;
        Sun, 07 Jun 2026 18:34:49 -0700 (PDT)
Received: from ?IPV6:240e:38b:e68:2f00:bae2:daf9:9217:a5c? ([240e:38b:e68:2f00:bae2:daf9:9217:a5c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c166391d53sm206889515ad.65.2026.06.07.18.34.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 07 Jun 2026 18:34:48 -0700 (PDT)
Message-ID: <e20bbaee-9e9c-4687-83d0-c15bdd4b04f2@gmail.com>
Date: Mon, 8 Jun 2026 09:34:44 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?B?UmU6IFtQQVRDSF0gZG9jcy96aF9UVzogcmVwbGFjZSDmjqXlj6Mgd2l0?=
 =?UTF-8?B?aCDku4vpnaIgaW4gc3RhYmxlLWFwaS1ub25zZW5zZS5yc3Q=?=
To: Dongliang Mu <dzm91@hust.edu.cn>, panzhipop <kipp455187@gmail.com>,
 Hu Haowen <2023002089@link.tyut.edu.cn>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>
References: <20260603193408.140445-1-kipp455187@gmail.com>
 <7b6913d0-921f-4f46-8d97-adf18eddb5d1@hust.edu.cn>
From: Alex Shi <seakeel@gmail.com>
Content-Language: en-US
In-Reply-To: <7b6913d0-921f-4f46-8d97-adf18eddb5d1@hust.edu.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91273-lists,linux-doc=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:dzm91@hust.edu.cn,m:kipp455187@gmail.com,m:2023002089@link.tyut.edu.cn,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:alexs@kernel.org,m:si.yanteng@linux.dev,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[seakeel@gmail.com,linux-doc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[hust.edu.cn,gmail.com,link.tyut.edu.cn];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[seakeel@gmail.com,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,naer.edu.tw:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 24C2D6521C0



On 2026/6/5 21:02, Dongliang Mu wrote:
> 
> On 6/4/26 3:34 AM, panzhipop wrote:
>> In Taiwan's standard terminology, as defined by the National Academy
>> for Educational Research (NAER) term bank (https://terms.naer.edu.tw/),
>> the correct Traditional Chinese translation for "interface" is "介面",
>> not "接口" (which is used in Simplified Chinese/Mainland China).
>>
>> Update the zh_TW translation of stable-api-nonsense.rst to use
>> the proper Taiwanese terminology.
> Reviewed-by: Dongliang Mu <dzm91@hust.edu.cn>
>>
>> Signed-off-by: panzhipop <kipp455187@gmail.com>
>> --- 

Applied to git remote set-url linuxdoc 
git@gitolite.kernel.org:pub/scm/linux/kernel/git/alexs/linux.git.

Thanks!

