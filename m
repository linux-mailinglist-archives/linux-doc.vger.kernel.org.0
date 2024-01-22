Return-Path: <linux-doc+bounces-7198-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EC72C836EB1
	for <lists+linux-doc@lfdr.de>; Mon, 22 Jan 2024 19:00:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 292641C28D0C
	for <lists+linux-doc@lfdr.de>; Mon, 22 Jan 2024 18:00:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FDA152F85;
	Mon, 22 Jan 2024 17:22:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="NCIqAD7c"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A84A612C2
	for <linux-doc@vger.kernel.org>; Mon, 22 Jan 2024 17:22:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705944179; cv=none; b=I3r7EjBn1ZsNhj1avHDm0eyBNwDTw8DQqkZTusOtnCLhzdsoCy3MhxuPRqd39I1ZEBA08TFe+ul+Xc2pmjOHmZdOkgFXo1rmVNbKX3z1XkYW7/PTgwcA3OROqV38yBsVJDql1Ol2MlvHGTTuJPYQth54e2cdU2NZbnM2RXdvQAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705944179; c=relaxed/simple;
	bh=bEHwRRHZEZ5muODAZZTChjTXAGcN8GLNJSdSobXIA0I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bb2LZIzEGJI6pFlqCL9ShIumPS6I0vLwkLOUedUy3A+wVB4ZptkkxDLRErXvclsimGGsECtG90NxMQKjIqG1KrmQu9UH0R6fD1NO7cAaHgLxM0yRYdgrsvqxGUYxESsFrjVvrujQCljB35EuUgBKBlEGtkI2hzmKemjzfjb9++c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=NCIqAD7c; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-6d9b760610bso794326b3a.1
        for <linux-doc@vger.kernel.org>; Mon, 22 Jan 2024 09:22:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1705944177; x=1706548977; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3cKBLusi5odBbefyu3q7+UJ6/M6hhfLrmEnRO/AYdSg=;
        b=NCIqAD7cPTDcHzPOjo+YrAdQhZRnfiXAizEgkmFr/YbQQIzPn5dYBRVoS31a+ULPw8
         /R5CcIGj6Mm8eLJg3DZK7ZCJPQpjgbfXu8Q11j91CGCoGCU8BY1JBVY6JepkTDzF5D1c
         axZaTBWHcjXBZ4ya9oqXJyJ/HDv68Y293Vi/M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705944177; x=1706548977;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3cKBLusi5odBbefyu3q7+UJ6/M6hhfLrmEnRO/AYdSg=;
        b=FAd15ac6FzI/VQOqyjCkaUmMSnskNCxpMhC+nex+Z+ak+6/158tCIiTj2uOHT6l5Zx
         17eoEiRc7wtVY9LrYpv5tJhdQhSHlO95HHaSDCqUYavj19ohaL0eIvygOCi79xIFXoGn
         zVmKE/O0gzO81giPEvLj9bfOSvq/0nxw+ZVBdzzWHP3M5qJpXdpzLrTMRzpgmoGyO5NY
         5vXDAdAc3TNCI+N3HbhM5AiCessLvAoXJgMkK1f7GvszYvNrbaE7hDAijYMPALJLPQ3l
         6nL8tCGYcET5VX8skCmJcoR21ormdZvY9WBj//zBXY0RBuaAz07qFaX0hqJZDB0hZQuO
         0XDw==
X-Gm-Message-State: AOJu0YxK05sDKk8ip/CydXflLviiHBJ3lvgr2Qlod71RSM46Bk6AIIpW
	wt2TNs8tQyCgKHVowK1vFeEN4kuhvPMR/ziXcDK44wQ0kroK8ZI8VJ+YNxLjvhQ=
X-Google-Smtp-Source: AGHT+IGjgFJLDdAfyqDNErB5PR6R2A+VDqHcrvgpf1rrqIFIthJVkNUJsACPjPjML0hqNb41Xog8zQ==
X-Received: by 2002:a62:6204:0:b0:6d9:383b:d91a with SMTP id w4-20020a626204000000b006d9383bd91amr8897256pfb.1.1705944176719;
        Mon, 22 Jan 2024 09:22:56 -0800 (PST)
Received: from [128.240.1.152] ([206.170.126.10])
        by smtp.gmail.com with ESMTPSA id y74-20020a62ce4d000000b006d9a48882f7sm10245573pfg.118.2024.01.22.09.22.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jan 2024 09:22:56 -0800 (PST)
Message-ID: <f3ba4181-ab38-4779-987f-9bda47f003be@linuxfoundation.org>
Date: Mon, 22 Jan 2024 10:22:54 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/3] livepatch: Move tests from lib/livepatch to
 selftests/livepatch
Content-Language: en-US
To: Marcos Paulo de Souza <mpdesouza@suse.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>
Cc: Shuah Khan <shuah@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>, Josh Poimboeuf <jpoimboe@kernel.org>,
 Jiri Kosina <jikos@kernel.org>, Miroslav Benes <mbenes@suse.cz>,
 Petr Mladek <pmladek@suse.com>, Joe Lawrence <joe.lawrence@redhat.com>,
 linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-s390@vger.kernel.org,
 live-patching@vger.kernel.org, skhan@linuxfoundation.org
References: <20240112-send-lp-kselftests-v6-0-79f3e9a46717@suse.com>
 <20240112-send-lp-kselftests-v6-2-79f3e9a46717@suse.com>
 <Zap04ddls7ZvbL/U@li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com>
 <Zap26MINbbxREt4c@li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com>
 <53cf93b2efadc0f42712eb92436bd575b5622664.camel@suse.com>
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <53cf93b2efadc0f42712eb92436bd575b5622664.camel@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/22/24 05:55, Marcos Paulo de Souza wrote:
> On Fri, 2024-01-19 at 14:19 +0100, Alexander Gordeev wrote:
>> On Fri, Jan 19, 2024 at 02:11:01PM +0100, Alexander Gordeev wrote:
>>> FWIW, for s390 part:
>>>
>>> Alexander Gordeev <agordeev@linux.ibm.com>
>>
>> Acked-by: Alexander Gordeev <agordeev@linux.ibm.com>
> 
> Thanks Alexandre and Joe for testing and supporting the change.
> 
> Shuah, now that the issue found by that Joe was fixed, do you think the
> change is ready to be merged? The patches were reviewed by three
> different people already, and I don't know what else can be missing at
> this point.
> 

I would have liked doc patch and lib.mk separate. However, I am pulling this
now to get testing done. In the future please keep them separate.

thanks,
-- Shuah


