Return-Path: <linux-doc+bounces-7043-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BCCD8831DE0
	for <lists+linux-doc@lfdr.de>; Thu, 18 Jan 2024 17:52:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E19F21C251CD
	for <lists+linux-doc@lfdr.de>; Thu, 18 Jan 2024 16:52:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0516C2D02F;
	Thu, 18 Jan 2024 16:52:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="YE+59htC"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 012F12D021
	for <linux-doc@vger.kernel.org>; Thu, 18 Jan 2024 16:52:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705596754; cv=none; b=dGddWY127Bk/n/ocpVC1slZHmEWRxtHuhS0zrzdUxV7b3mIJZAHA5Lu6dcMtfeD01AXRIjeP1956ZtSuj65teYOUqXyZSpuf125Or6V4mmqIlN1dYK+C+mMZU31cYQWyavU91YEoL+wEV559ZyMtODjeqjEZhT87/quKDyTtIRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705596754; c=relaxed/simple;
	bh=Tib9qmRhyTIuOuk9z3JFvHx/L/hQYWeGELswdZbwgaM=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Google-Smtp-Source:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:Content-Language:
	 To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding; b=A7vJgQLxDK2sGSlSZ4f0ob6bvElRyL13xJyXo9bTC+z+RlRc8WlHunrcV3Y2qF4GApQSph9lsE0X2KMbv0tnBXL1KBoSidp8FSIxWSUn7G2UeCfvhC9U9iRA6ClMvptQr59nmi12GLz90oL8aahrBg75mZVGqidFMR0tNt8wYMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=YE+59htC; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-337b8da1f49so2735433f8f.0
        for <linux-doc@vger.kernel.org>; Thu, 18 Jan 2024 08:52:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1705596751; x=1706201551; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pBTbJBhUXoCD9RPj5M/LGF6UDaJgZ8Ej94kU5beb7Pc=;
        b=YE+59htCkZ0+IMj/qqg4rfWmSYOH9kSUyy0VQmPbfskbybfmqs2Rk14Ry93IjJvyuJ
         MxcHsa8k2NdzYecVXlTHCrsBWO4+T0ICiV3GitgkIqvaYtalEujGrG/0tkNmlfvMS21q
         A2Vg2kvxovrllhBTNaWCrBwjOTJjYBe5PcoGq7O8T2Inbi8I12UP3y15F1jHLbJxNxWN
         48OzQmcWVc5dKEgrjtl9IIAKLnrQR4vZ7zaP0jbDr4aZfAgwilcDt7AgLWi1f4IC2u2C
         l7q6dHzObdiVVShfA4FOujNPjeQc4GH8843HhSZNVaihIJZHZz34q26oePJsAoa6sX/U
         EEZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705596751; x=1706201551;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pBTbJBhUXoCD9RPj5M/LGF6UDaJgZ8Ej94kU5beb7Pc=;
        b=jQs+DhOAVc6ryrMjw3ZLhcbhK5VoLE4jedo8o8T1LlsczM/oTw7619zGOwTWzT8fde
         ypG52X9EjgH0FAhFx+rMDeSYlWn6joWDIsVXxJYcl3VoTUqdyfK+3Se6eiL3r07qZfis
         SpoDfMzx4qxvZT7RxnY62KHjKJbkZG1+aJYL6WcF9wa3oar7n/l3WBERmtpYqJL5vmGp
         56Bkqc+LtH2P5+x/+oKPCGPmcMGsm4dgoykgJdPsY3axM7ItXo/RC0z1qIgeALDqjfFk
         y+wdiQaWBQ4iJvJleMnPQVKADhFeRMPJROjnjs/J2Ajo4C477aF6tf0J0EHFMv3QreJy
         M7jQ==
X-Gm-Message-State: AOJu0Yw6/sXT/0wgkO9gpgZmUuj/8XHLdSHmy6tVfkEcTlvhmIS4KEgz
	FNeJn4LLj06XxXN6mFHfL8w6geTxwoNd6MHfSeWsOaGqiEsLMfLUssRE6wHdYm4=
X-Google-Smtp-Source: AGHT+IGh5ZvDe3gCVOWGIfyMG1xq3HdpeekqSJAyaIEgwsHWK1sTT8bEBej/MEPqeVRYsSh1YjMfJg==
X-Received: by 2002:a05:600c:32a7:b0:40e:48aa:c444 with SMTP id t39-20020a05600c32a700b0040e48aac444mr421547wmp.213.1705596751156;
        Thu, 18 Jan 2024 08:52:31 -0800 (PST)
Received: from ?IPV6:2a10:bac0:b000:7588:7285:c2ff:fedd:7e3a? ([2a10:bac0:b000:7588:7285:c2ff:fedd:7e3a])
        by smtp.gmail.com with ESMTPSA id cn25-20020a0564020cb900b00559c8520f6bsm2905588edb.75.2024.01.18.08.52.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jan 2024 08:52:30 -0800 (PST)
Message-ID: <52fab554-b23e-49b7-b0d7-2340784b8732@suse.com>
Date: Thu, 18 Jan 2024 18:52:29 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: Remove reference to syscall trampoline in PTI
Content-Language: en-US
To: Borislav Petkov <bp@alien8.de>, Jonathan Corbet <corbet@lwn.net>
Cc: tglx@linutronix.de, x86@kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20231102130204.41043-1-nik.borisov@suse.com>
 <dd0e864d-295a-4edc-bfd7-ad5de88d7a0c@suse.com> <87edee1v0i.fsf@meer.lwn.net>
 <20240118164108.GIZalUpEnj2HT-9ix6@fat_crate.local>
From: Nikolay Borisov <nik.borisov@suse.com>
In-Reply-To: <20240118164108.GIZalUpEnj2HT-9ix6@fat_crate.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 18.01.24 г. 18:41 ч., Borislav Petkov wrote:
> On Thu, Jan 18, 2024 at 09:11:41AM -0700, Jonathan Corbet wrote:
>>> Ping
>>
>> Hmm...this has indeed languished for a while.  I was waiting for an ack
>> from x86land, but I guess I'll just apply it unless somebody screams.
> 
> https://lore.kernel.org/all/170238995160.398.1051285467012003027.tip-bot2@tip-bot2
> 
> Jon wasn't CCed but Nik was.
> 
> Nik, you missed that tip-bot2 mail or you don't have it?
> 


Ah, I must have missed it. Sorry for the noise...

