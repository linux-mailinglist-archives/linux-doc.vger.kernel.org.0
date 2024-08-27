Return-Path: <linux-doc+bounces-23932-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 65010960A8E
	for <lists+linux-doc@lfdr.de>; Tue, 27 Aug 2024 14:35:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 192D31F210A0
	for <lists+linux-doc@lfdr.de>; Tue, 27 Aug 2024 12:35:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6DBE1BC080;
	Tue, 27 Aug 2024 12:34:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="PjJlJ55r"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A00E1BB694
	for <linux-doc@vger.kernel.org>; Tue, 27 Aug 2024 12:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724762082; cv=none; b=d87W/zQ5XcWuVMBnbWtfbuZvP46TQ69MxACe6/01GpwKPlUjWK2NQm8kEcAyhLKS1a2Q7NNReAZneLUdowQ7BB37MjP3k8CngxQaQotbT7AUqBIh8ZpdGOMOXtTeWrflFGVHK3BgWkso6FYm83AAZ1prZPqcFwOo51PnqJUbzHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724762082; c=relaxed/simple;
	bh=rIfujnRm2V1RobBJwbb3mPgwma8W9Db1vHV/ES1fRgs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Nn4UpubCDQQ+KK7aiJ67dCQZCHQb2tlG48nToIvDsbEN9IFjIRMwsM8GhYRep+7oQoBlRrn5Cqw4gSyHQLCU2Afm2bH1/HiMUYlApcf3bZtDFPsIMOEIbPFj0YV/zr4cstAFE8p3yWLx0/Fibo4k3EDpXq2TdAFJ/Mh0/gniFcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=PjJlJ55r; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-7cd9e4f550dso1678720a12.0
        for <linux-doc@vger.kernel.org>; Tue, 27 Aug 2024 05:34:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1724762079; x=1725366879; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KyXAJapJSnZ2dDDvQaQcnKrD5eisnLa1o6mBBkyryV8=;
        b=PjJlJ55rpNKFW9G00mcIygkEVVUP2NnDBU80iyfWCb4lJaIvko5k7/l60puYbVP/vs
         lCWdUihky4dmbz3BNUkvfH4+E5GkRBC4AhTcONb5eRLNNQYL9yTJ6cWvWnqM8+dzgogU
         4hMyVm3tv8GprHhLVpJ5YQh76Oejtv7cR9Bn0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724762079; x=1725366879;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KyXAJapJSnZ2dDDvQaQcnKrD5eisnLa1o6mBBkyryV8=;
        b=tH/ZMGdIRs1hCfULNWB46Buq883cIKajVZwOMbRvxKzY85WH/uJWC/h7zzTu6uH0oS
         FbKku3lAxFyham4qzmOVpzB9gm8sNjJW7qhwtTKvWyWoXGASm9GRwC6DNNHEA/MQ9ejs
         /MCwrIsA3rEXzp5MOURwd86A8wlnFsiJXO4NtORp1pQIR4VbcjEQ85mqH7X0Gj/aeOhr
         vzq1iEQNSh+v7EYVY9vKmqQEUyNj2+6Aj18gyfWxFRjg3sAgCZYbXA1nq+MeJK8DI3q1
         M6ZOET/dr67W0dBcfg23BNk/zG96ygkQ638wCBTX0bfbUFJDVp4l6Comcfb5lZLHULFe
         kkrQ==
X-Forwarded-Encrypted: i=1; AJvYcCVABVpdWWHQfJsQZllc76GXECERwPykvU+SXA1EDfymFx3dm/L1IEw2XINr6hIacpmZE+f3AtxFS7g=@vger.kernel.org
X-Gm-Message-State: AOJu0YyD1+g4ryQA13sPr8VHutjMwqCUwLt+XlLvV3gaeIj2BWTuRN87
	Eox+DbOkHYG5O20WeCN3XM1nrhov7C+TkxHG2XV4mGXnTjcSbRE5z8RVziWYISeRjcsAHoyULgE
	pMJs=
X-Google-Smtp-Source: AGHT+IGjiYKK2pg00dNbHQgAvQ/REQmd5g9wxQNuwUyB/YkBILqbu4Jg6AxTKtpIKWtECuFZJ2DiWw==
X-Received: by 2002:a17:902:e541:b0:202:2b7:9c7f with SMTP id d9443c01a7336-2039e534e0emr143411945ad.65.1724762079307;
        Tue, 27 Aug 2024 05:34:39 -0700 (PDT)
Received: from [192.168.121.153] ([218.49.71.194])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20385fcf525sm82694515ad.300.2024.08.27.05.34.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Aug 2024 05:34:37 -0700 (PDT)
Message-ID: <b274a725-03f6-4a65-a998-75f10026f2e3@linuxfoundation.org>
Date: Tue, 27 Aug 2024 06:34:31 -0600
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] Documentation: KUnit: Update filename best practices
To: Kees Cook <kees@kernel.org>, David Gow <davidgow@google.com>
Cc: John Hubbard <jhubbard@nvidia.com>,
 Brendan Higgins <brendan.higgins@linux.dev>, Rae Moar <rmoar@google.com>,
 Jonathan Corbet <corbet@lwn.net>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>
References: <20240724201354.make.730-kees@kernel.org>
 <CABVgOSmXqv_+20OKjVAPJoqrP1EvBk+1WUqF4wBsefegxYNiWA@mail.gmail.com>
 <202408221717.1138DB3D1C@keescook>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <202408221717.1138DB3D1C@keescook>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/22/24 18:18, Kees Cook wrote:
> On Fri, Jul 26, 2024 at 03:14:36PM +0800, David Gow wrote:
>> On Thu, 25 Jul 2024 at 04:14, Kees Cook <kees@kernel.org> wrote:
>>>
>>> Based on feedback from Linus[1] and follow-up discussions, change the
>>> suggested file naming for KUnit tests.
>>>
>>> Link: https://lore.kernel.org/lkml/CAHk-=wgim6pNiGTBMhP8Kd3tsB7_JTAuvNJ=XYd3wPvvk=OHog@mail.gmail.com/ [1]
>>> Reviewed-by: John Hubbard <jhubbard@nvidia.com>
>>> Signed-off-by: Kees Cook <kees@kernel.org>
>>> ---
>>
>> Looks good to me. (And it seems like sphinx is okay with it, too,
>> which is always nice.)
>>
>> We normally take these changes in via the kunit tree, but if you want
>> to try to push it through along with the naming changes, that's fine
>> by me.
>>
>> Reviewed-by: David Gow <davidgow@google.com>
> 
> Hi! Just a quick check: I haven't seen this land in -next yet. Are you
> still planning to take this?
> 

I applied it yesterday to kunit next.

thanks,
-- Shuah

