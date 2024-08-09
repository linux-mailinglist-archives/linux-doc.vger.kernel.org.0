Return-Path: <linux-doc+bounces-22527-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C522794CF08
	for <lists+linux-doc@lfdr.de>; Fri,  9 Aug 2024 12:57:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 81C282818BB
	for <lists+linux-doc@lfdr.de>; Fri,  9 Aug 2024 10:57:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84C071922F2;
	Fri,  9 Aug 2024 10:57:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="ZJBY2S0I"
X-Original-To: linux-doc@vger.kernel.org
Received: from out-175.mta0.migadu.com (out-175.mta0.migadu.com [91.218.175.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A5B5191F9F
	for <linux-doc@vger.kernel.org>; Fri,  9 Aug 2024 10:57:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723201049; cv=none; b=PEVGclpi9Ffs/n/g55cNTZK1E9t2ZlfJ+NYbzsxUr/8jeq7W4rR3cVosE4h5OMcBfqeWCOl1naZGN93qiPqyxhde1kcjPlE00mh9GsG7aXIa/plfpuao/5NV40l53/WUYfUkXdu2S9E339VEOEqqQ4YQ1w+/uxL4YhuXZAAEmU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723201049; c=relaxed/simple;
	bh=rRARvcG+2Al0eIMIoJkC8CozOn2+Z5Rz8JRqyOI7mlw=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=du+rg6GLdlhxkSU7rBccLA0RybtK3b8MN8Vl0ZX/4rv0mOY9XgyX2ZGBFdJfAmXA77QKm/0f5b9rdS0+3HTAD3X2J5H+7atMYMt8BaxLZKAoZtaY49ZJ36dzvqkb4oFFlpCc+6jh2qvzXLZSeoxdoQqj+zwSDRYOfMVayUVrHKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=ZJBY2S0I; arc=none smtp.client-ip=91.218.175.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Message-ID: <2e27c607-713f-48f2-9a2e-41f7c61f7e73@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1723201041;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vH3hZWIQ9XnTGjjmOOu/3hwi/2Bg1Nf5U7LfZS0ooSc=;
	b=ZJBY2S0I4ixsq7RqAI8lsJq0ZUW3akgNnAIoxv9dkBHDmFx8XuTBgopyNgdgxsy0PSwzhI
	7XGtEyflwpqpBwrEz0phkmVIU1KiO1CcqsKze+gqHLaEE2UCdL9/n2dz7/ufIVV6asCuxi
	LGEo5L0a8WDqKRMElQxMSmFdAhEaOS0=
Date: Fri, 9 Aug 2024 18:57:11 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v5] docs/zh_CN: Add dev-tools/kcsan Chinese translation
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: YanTeng Si <si.yanteng@linux.dev>
To: Haoyang Liu <tttturtleruss@hust.edu.cn>, Jonathan Corbet
 <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
 Yanteng Si <siyanteng@loongson.cn>, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling
 <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: hust-os-kernel-patches@googlegroups.com, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev
References: <20240807162720.46588-1-tttturtleruss@hust.edu.cn>
 <d6eec1da-0e79-432f-a5cf-7dc8c59f28c1@hust.edu.cn>
 <87r0b0th7l.fsf@trenco.lwn.net>
 <c4ffaae1-59a0-4837-a965-441af4851d2a@hust.edu.cn>
 <25b4c3e0-784d-41ea-8ff3-8cb175983676@linux.dev>
Content-Language: en-US
In-Reply-To: <25b4c3e0-784d-41ea-8ff3-8cb175983676@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT


在 2024/8/9 18:44, YanTeng Si 写道:
> Hi Haoyang,
>
> 在 2024/8/8 0:48, Haoyang Liu 写道:
>>
>> 在 2024/8/8 0:45, Jonathan Corbet 写道:
>>> Haoyang Liu <tttturtleruss@hust.edu.cn> writes:
>>>
>>>> This is a mistake but I missed it before sending this patch.
>>>>
>>>> What should I do to revert or correct this patch?
>>>>
>>>> Thanks for your help and patience.
>>> Send a v6 with the correction made - but wait a while for other reviews
>>> first.
>>
>> OK.
>>
> The doc is good enough for me, so you can send a v6 after fix the typo.
>
>
> Reviewed-by: Yanteng Si <siyanteng@loongson.cn>

I am Sorry! It seems that I've permanently lost access to 
siyanteng@loongson.cn account,

So you need use  --suppress-cc=sob when you send-email and pick my 
Reviewed-by tag.


Thanks,

Yanteng

>
>
> Thanks,
>
> Yanteng
>
>>
>> Thank you,
>>
>> Haoyang
>>
>>>
>>> Thanks,
>>>
>>> jon
>>
>>
>

