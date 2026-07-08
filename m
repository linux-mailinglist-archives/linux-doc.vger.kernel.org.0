Return-Path: <linux-doc+bounces-95545-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id b56UI3+nTWoP8gEAu9opvQ
	(envelope-from <linux-doc+bounces-95545-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 08 Jul 2026 03:27:27 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 022CE720D94
	for <lists+linux-doc@lfdr.de>; Wed, 08 Jul 2026 03:27:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=I5CT7JI6;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-95545-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-doc+bounces-95545-lists+linux-doc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DB8F7301FD50
	for <lists+linux-doc@lfdr.de>; Wed,  8 Jul 2026 01:27:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3E573AA187;
	Wed,  8 Jul 2026 01:27:22 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97CAC1E9B3D
	for <linux-doc@vger.kernel.org>; Wed,  8 Jul 2026 01:27:21 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783474042; cv=none; b=S3wJhuh8V0a/ldkcWHa4LiCa2IrM51OSTboy0YkSiUp4ZsLytTSerexKpl+Z0bakAijUO+4cXGFaQZ883ajp7z/fImH+A3FcClN3L3iW42cXLPgFTSDSy/S+Ob6y39K3bcwasHmudVaNTkQQcJ5DtA/si+QBxKj2mTBgIxvyW0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783474042; c=relaxed/simple;
	bh=9mSNdUxBazwvXmEIBL8Iq+nNlNsCuj+5aOTePVYxGr4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=l/tSLxNZmjVcpCbKMWVJ9UwDF6wbSKUHWM3JJUNPObrv6vGA5e7sQuDEM6hbWdPooH7C1CNKrTplapu2HpHJxEtzBuPoZgsFN1aYw8qAPQUqTIVLsppPxK60oL+CnXWM62IADl0XNKH/FO351Ooz8GP9UAhBxYGThXgUHAlTWoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I5CT7JI6; arc=none smtp.client-ip=209.85.214.177
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2cabc0a1ab6so2357185ad.0
        for <linux-doc@vger.kernel.org>; Tue, 07 Jul 2026 18:27:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783474041; x=1784078841; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8EE2JfMIYuNSonddm0h000oaU0bMez+CAbWmzg2W0K0=;
        b=I5CT7JI6e5H/xI0He1KNdUoEKf0BvDsgc1umvYNi9N5T8rDaGunT9GUfgNM+V2AACj
         4sKI1HtQf/vIz3S4ugjdJWyVzEUl0kBM4XsrrBpIvFPIciI20OQRkX92AB5V1F9FVW7H
         zSnFMmG+m6/HLiP+4j5cWwfKTIQYjFJ6j54h4ppFmoDDc/2LXBoyH7pEuprGyvI9Q4nS
         fL/0X+i9LbVJmZQi6uQ1oZYdBCvM9Hvsk11oNunkXy+J0yCYwyAO47eAZSvMjiMVyocu
         STkb1AlRwNPNwIQZ0/dAREPFUoIfBAwHDgSi9rBHlICPVk+tDNcGmT4gqsuK7QHrTHS8
         kr2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783474041; x=1784078841;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8EE2JfMIYuNSonddm0h000oaU0bMez+CAbWmzg2W0K0=;
        b=BPkS6HaBjZBBzNF7FLRpPDI7x7v/G7N8k2vrlnqzbK55hw6QKfs2MR4BajjMVRbQbT
         6fM9Efa1MG6rvivpBpMqQOxbkONQJsxrB327wowCDxyL0AAIoKhkDOBU/AWOm4HliUC4
         9eq3EBCHR0LexhbBIkb2+Kaj6BNV0IBaGgR94I4fkaS8PfW7Ninj3BPpxzsBUZaa4/AD
         deJDD0PffsDBnYIEe/xfYvgsoMeKRlCEeM94n9ymoRfAe1WUtqvHpTr8zjxct+DMO0/u
         8vKHDydrN/GypAa1sir0qCuZI/bsudGwBkhg75bmzW8ioXytyLlHiytPmvSPDQCp0WnZ
         QkOQ==
X-Forwarded-Encrypted: i=1; AHgh+RpD8GTzqe4PizJXJOUJkXWpOdddhLo2S10utCUSdXu6SIUt7cTlhKlS9G7r6y8v7JlD2PP0s9q+25o=@vger.kernel.org
X-Gm-Message-State: AOJu0YxVEd8i11gW1OC5LchWRvQ3cMJrTm0EEJt+bfGY3C7gzpwxo0hK
	Gnn7v+temT0UIXKbIKpjFbWcxgMcgaVc9/qujmAncBqauTKXhJZpdmC55Mcyu3/ShPU=
X-Gm-Gg: AfdE7cmGguJnpbSmuCnt5ULbB+q4RbhNin0uolEW0LwaBHb+IUHWycdN95ChUo2Dpgx
	kbPSu/TNDK5P7pwVHuBiUDuXWZ0j5T4OLmty84KcXCh6aqUNx014FTjA6W+GFfP/rgI1SY+erw2
	Y793GNgHfjVWcz7auP4xWQsls/+RTCYSkojE9njRsJbtMq9Rz+m6LLc0IbJtDl0Di6/z+uhiG4O
	+zpoPIcEASCKZXlKxTFIaHThzh/esdwb0g8fZfR5R6lBqWdryace3FaC5Ct+DSmlRnpXDuq4FSF
	wdH0CByKseCNipC9whEPjpfED4ciC+XnbrRPKVjA91f64sKCazpuvdH1BzAZCp4/2me6gkEEIwy
	hAOQg2YMmabO6ky3KwGiEg+/Dx79ml2dSlRQ12vucVjeo4AQCu2viEz1Noajg35ZrqWj4RSK6Eb
	HqQxqGbeBBXPOgrn4R53ZN9v2LWjtLHRmbPMYchqKFgADEsctFvNE+Kg==
X-Received: by 2002:a17:903:184b:b0:2ca:c79f:75a5 with SMTP id d9443c01a7336-2ccea385334mr5037255ad.16.1783474040810;
        Tue, 07 Jul 2026 18:27:20 -0700 (PDT)
Received: from ?IPV6:240e:38b:e68:3a01:5516:6588:891a:b868? ([240e:38b:e68:3a01:5516:6588:891a:b868])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9bf7858sm19862815ad.23.2026.07.07.18.27.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jul 2026 18:27:20 -0700 (PDT)
Message-ID: <2624eebd-513f-41a8-ac44-a61e1a2a5cea@gmail.com>
Date: Wed, 8 Jul 2026 09:27:15 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] docs/zh_CN: update admin-guide/index.rst translation
To: Weijie Yuan <wy@wyuan.org>, Yan Zhu <zhuyan2015@qq.com>
Cc: dzm91@hust.edu.cn, alexs@kernel.org, corbet@lwn.net, frederic@kernel.org,
 gpiccoli@igalia.com, jani.nikula@intel.com, kees@kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, longman@redhat.com,
 mchehab+huawei@kernel.org, si.yanteng@linux.dev, skhan@linuxfoundation.org,
 tony.luck@intel.com
References: <4534170c-700d-43b5-ad32-6b91455b3f14@hust.edu.cn>
 <b7606f72-eb55-41a7-b685-00164050e159@gmail.com>
 <tencent_94CB9DE57F16CF5DCED1C6983002CD3BB106@qq.com>
 <ak00NR3kdjrpqjIP@wyuan.org>
From: Alex Shi <seakeel@gmail.com>
Content-Language: en-US
In-Reply-To: <ak00NR3kdjrpqjIP@wyuan.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-95545-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:wy@wyuan.org,m:zhuyan2015@qq.com,m:dzm91@hust.edu.cn,m:alexs@kernel.org,m:corbet@lwn.net,m:frederic@kernel.org,m:gpiccoli@igalia.com,m:jani.nikula@intel.com,m:kees@kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:longman@redhat.com,m:mchehab+huawei@kernel.org,m:si.yanteng@linux.dev,m:skhan@linuxfoundation.org,m:tony.luck@intel.com,m:mchehab@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[seakeel@gmail.com,linux-doc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[wyuan.org,qq.com];
	RCPT_COUNT_TWELVE(0.00)[16];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc,huawei];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 022CE720D94



On 2026/7/8 01:15, Weijie Yuan wrote:
> On Sat, Jun 13, 2026 at 12:11:36AM +0800, Yan Zhu wrote:
>> Hi Alex:
>>
>> On 6/8/2026 9:40 AM, Alex Shi wrote:
>>> Applied, Thanks!
>> Can you confirm whether this patch has been merged? I couldn´t find it in
>> the repo:
>> https://git.kernel.org/pub/scm/linux/kernel/git/alexs/linux.git/? 
>> h=docs-next
> It seems that Alex missed this patch. I can't find it, too.

Thanks for reminder! Pushed.

