Return-Path: <linux-doc+bounces-27315-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C1A899B31C
	for <lists+linux-doc@lfdr.de>; Sat, 12 Oct 2024 12:42:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9F1611C2234A
	for <lists+linux-doc@lfdr.de>; Sat, 12 Oct 2024 10:42:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A80F1547EB;
	Sat, 12 Oct 2024 10:42:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.b="CJ1ch+Xs"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C330F15252D
	for <linux-doc@vger.kernel.org>; Sat, 12 Oct 2024 10:42:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728729760; cv=none; b=FlwydWEKmTy1UwOu95edNnYK2v5MxG5Ef5lkCqrok6KmyO237/EqMKO56zgPr8nLMDoQsaORHcN44DDhpYBWkP6TLpDlK7IVCMLUDpWvMyHf1lpJmkcg3EuxAKQ8PpbPw/FlTZEvGNO87tE7gZo9OxSddYhX9F32ggHwhLIhwkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728729760; c=relaxed/simple;
	bh=F2Sp1fzcw8Uf/QMINhGhDYWS9F5dWa9nb4/qh8r/ALY=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=HqVOzHup3PNZRtSAm2CA9qUeVQcx6ynKXPOi8i6y+PNQpL+Dgs0t9sJdIgOKphjRDsBlwt6p8Q+XVcQe64mFwzijWYFAbtu9wLsJXjDNWuYNswQZ/Z5CA4dNh/qlYL4ehmWg+rOBFmX8Jn0ynIhHOhlzgNdTKfIRsO8Bs8cVaVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=daynix.com; spf=none smtp.mailfrom=daynix.com; dkim=pass (2048-bit key) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.b=CJ1ch+Xs; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=daynix.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=daynix.com
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-20c70abba48so19098725ad.0
        for <linux-doc@vger.kernel.org>; Sat, 12 Oct 2024 03:42:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1728729757; x=1729334557; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rnVDkA3/NaAKhKgMUHvmItPchk02Cn37cnkYPg5p2Qw=;
        b=CJ1ch+XsP3k9Bdzgi04+URwvUed22kf7IKlTv1B37FV6auETP4UlJefSeJXGYF9vSb
         BndSPWHOFR5xJEBQbpFAxbda8AOE0AO2cUs5dvj0yNA6O+i1JXchGPZMtEEcUBJ1jDpA
         9ae5pOZ4/yMrP9TjbkbPbVtkeUGQhjollE3J4wiGs9fK52X2x1+HrGucK/JOEL2JW79P
         6cInfHli9hUziadd/Wsbh4zll4iZ37mOZPwoSCDOt8srfmrJtBy+AFMV/iBVQfaWP60W
         LDAvyZwIkTLvul7Ko140liyADahfYrbPfITSn4SlImw3918FdMwtiQzT5teJi6CGysLl
         wU9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728729757; x=1729334557;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rnVDkA3/NaAKhKgMUHvmItPchk02Cn37cnkYPg5p2Qw=;
        b=O1WF8N20UmLe6HanrpaND1HQ0Oa2bb+FZog8lAR9Pc55CjskFWlXc3HdABjUikPAgt
         ZWtlQZxWyMldubShgYNCH2GqaFC7Y++N+3bOswQFzI0vD/HYz7U6VMZWYjSRXnh7xg8b
         f+uVzbvikjX5mofkzBdE+GL86OmhiXaUpjFp+dbKsT/TyyUuhuM5J8L73ADgVD2d0vuC
         TzgHK+llkWNMq5sKAaox7xjjXv0zOyhvm5SesxQJPu5o0EWLtTdXzTD2PPHOMtrbqKIJ
         snULllO7+P3mzLqskIf7cmrg1WOpqEVD+1s8CJnMuIinWstX0jiL3SENY0/t5bQdxJ7b
         lt+Q==
X-Forwarded-Encrypted: i=1; AJvYcCX6KfPennlZOghDEz7+BSp6OySZiaIH008SccTty3qxB1XyJYLrviU85An1STsq9QgkbMVCuZ4AiHg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyPneB7yfd7kPPEBvvCdyP1rC4CRPKRj7bR7MUC7g1VSZwjMD5H
	f7o/0Bfe4dzJUOvWgZ7TIaS1vGigUqbKcVFvZV1rdV71/ZXRMwBZTKq6zb/dU/I=
X-Google-Smtp-Source: AGHT+IHAAJSka16NZVOG9ERRGT0s8XZNSpBXGOA3FY01waa9+ItcfG5gf6PTH3meZ9nN0csYqZ692Q==
X-Received: by 2002:a17:902:e5d2:b0:20c:ce9c:bbb0 with SMTP id d9443c01a7336-20cce9cbddfmr6671465ad.0.1728729757238;
        Sat, 12 Oct 2024 03:42:37 -0700 (PDT)
Received: from [157.82.207.107] ([157.82.207.107])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c8c33ffadsm35367635ad.266.2024.10.12.03.42.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 12 Oct 2024 03:42:36 -0700 (PDT)
Message-ID: <30bbebd8-1692-4b62-9a1f-070f6152061c@daynix.com>
Date: Sat, 12 Oct 2024 19:42:31 +0900
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v5 01/10] virtio_net: Add functions for hashing
To: Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 Jonathan Corbet <corbet@lwn.net>, Jason Wang <jasowang@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Xuan Zhuo
 <xuanzhuo@linux.alibaba.com>, Shuah Khan <shuah@kernel.org>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, kvm@vger.kernel.org,
 virtualization@lists.linux-foundation.org, linux-kselftest@vger.kernel.org,
 Yuri Benditovich <yuri.benditovich@daynix.com>,
 Andrew Melnychenko <andrew@daynix.com>,
 Stephen Hemminger <stephen@networkplumber.org>, gur.stavi@huawei.com
References: <20241008-rss-v5-0-f3cf68df005d@daynix.com>
 <20241008-rss-v5-1-f3cf68df005d@daynix.com>
 <67068a7261d8c_1cca3129414@willemb.c.googlers.com.notmuch>
Content-Language: en-US
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <67068a7261d8c_1cca3129414@willemb.c.googlers.com.notmuch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2024/10/09 22:51, Willem de Bruijn wrote:
> Akihiko Odaki wrote:
>> They are useful to implement VIRTIO_NET_F_RSS and
>> VIRTIO_NET_F_HASH_REPORT.
>>
>> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
>> ---
>>   include/linux/virtio_net.h | 188 +++++++++++++++++++++++++++++++++++++++++++++
> 
> No need for these to be in header files

I naively followed prior examples in this file. Do you have an 
alternative idea?

