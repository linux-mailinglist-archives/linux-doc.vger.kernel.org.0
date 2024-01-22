Return-Path: <linux-doc+bounces-7203-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ABE7836F68
	for <lists+linux-doc@lfdr.de>; Mon, 22 Jan 2024 19:14:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2AFA31F2E40C
	for <lists+linux-doc@lfdr.de>; Mon, 22 Jan 2024 18:14:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75FE9679EE;
	Mon, 22 Jan 2024 17:38:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ZBoQERao"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AAAB679FD
	for <linux-doc@vger.kernel.org>; Mon, 22 Jan 2024 17:38:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705945136; cv=none; b=sBX/6bWltMHNkPreXVlGcPa5IztvgpjIQixjL3L9I5D1mFUNhp2cJ/ldoIw2MkUylnLDbD/57ZnV2FZnF9ARkh1nbutT2RtPUYzsG+FI+WwFu3L6rNTbMmC55g+TaakkRUME+25wdNgx+4ijA8rsZYukyTv2A0lln4TNVpmFZBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705945136; c=relaxed/simple;
	bh=1agfQj91jKPuM03IvQvPn7FRroTkYhBE3Eyvb0JlhPs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ng13ur6tDg9/BuHVgK5bhU0Oh+QIo7DxwcWCI/utJIqKkLZ9NnHx9CQpadm5UFQzMut5nm9jBwgZh89EwlXpDgWUMUCm12ViAAhqjBW3apcsWpIqhlKIHEVJeQK7xWjvX9UvsfvOByyuMUtUlwbK72eR2rAvYL7/Y8/Ia/yCGpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=ZBoQERao; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-5cdf90e5cdeso510054a12.1
        for <linux-doc@vger.kernel.org>; Mon, 22 Jan 2024 09:38:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1705945133; x=1706549933; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XtjcrQsxe6bJ8QdGg7J5xA0F4dr3vWlDQohelUrXlB4=;
        b=ZBoQERaoSnk/Z9mTyIkwFGcoQwwGQQF1Fq7Yu4Ojofn9iy0XPuMROQqBdAfCGayqwV
         x85KBP5HVzHzFN85Feevls5DNb2lnpiWCPPP6ixSNfXozvgXUXfRwxjDNLPBpxvMfxH4
         EJI24VFRApsGmcb5zZrx0FtgJMQTMJFEN/R0E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705945133; x=1706549933;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XtjcrQsxe6bJ8QdGg7J5xA0F4dr3vWlDQohelUrXlB4=;
        b=r5zlee5GOMRycy+VYwpB+V+PabVqrJyIbNi+sd07gQk/AjGMrazXMEWySD+vf66ADo
         yRCoW8VBiZU81whREyJqNR6oFAo+SoZv4g+k6oktjiCQ1+8rhVL+cIp2F6f14IVdDg5b
         QyKKC/mLFVqJ4s5qz0yl9xe8tn2xWe/8sxRo7gPgk3H7v1wmeDvdjpavdPZ0l+9jVL66
         IL4NTMLSvks4f2SY0TUH7bDykYtGIq6hz5NnfNizGg7B3q9hUa9+IbWqvzU2w6sKKcXp
         QbyMaQQdQskT1sP3FaGCgqmaMNcdiXBCFFbotM4VWWUV+rm8QDOGjxZexVH+11LqkTbo
         qEzw==
X-Gm-Message-State: AOJu0YxjWwtVSB8JeshqfBy1ujTIuW+Bn3WQfx0mRwU3hw5yRTCn6/Wx
	KqR2e+fq2jrpCQhK1i6E3gemCG2AU/K0Z5nxOH09zu687Kjw4uOawpkxRsxUCPE=
X-Google-Smtp-Source: AGHT+IGKsyRXEY3tO1H9OuYiUwsfj+vq0ROdCS8ekfKfxcvrR4RqapGfHOijT8aFHG7x9DfCyz47wA==
X-Received: by 2002:a05:6a20:439f:b0:19a:efad:f1c3 with SMTP id i31-20020a056a20439f00b0019aefadf1c3mr12427542pzl.4.1705945132828;
        Mon, 22 Jan 2024 09:38:52 -0800 (PST)
Received: from [128.240.1.152] ([206.170.126.10])
        by smtp.gmail.com with ESMTPSA id kq9-20020a056a004b0900b006db85b12036sm9837515pfb.137.2024.01.22.09.38.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jan 2024 09:38:52 -0800 (PST)
Message-ID: <c03a1cdb-43fb-4f5f-8498-c45b7501e1bf@linuxfoundation.org>
Date: Mon, 22 Jan 2024 10:38:49 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/3] kselftests: lib.mk: Add TEST_GEN_MODS_DIR variable
Content-Language: en-US
To: Marcos Paulo de Souza <mpdesouza@suse.com>, Shuah Khan
 <shuah@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>, Josh Poimboeuf <jpoimboe@kernel.org>,
 Jiri Kosina <jikos@kernel.org>, Miroslav Benes <mbenes@suse.cz>,
 Petr Mladek <pmladek@suse.com>, Joe Lawrence <joe.lawrence@redhat.com>,
 Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-s390@vger.kernel.org,
 live-patching@vger.kernel.org
References: <20240112-send-lp-kselftests-v6-0-79f3e9a46717@suse.com>
 <20240112-send-lp-kselftests-v6-1-79f3e9a46717@suse.com>
 <5aceb855-2862-4d53-b27b-50e2956e099b@linuxfoundation.org>
 <dfcf46def7a4b27e30bed0e832fbf24fd7b36310.camel@suse.com>
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <dfcf46def7a4b27e30bed0e832fbf24fd7b36310.camel@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 1/22/24 10:37, Marcos Paulo de Souza wrote:
> On Mon, 2024-01-22 at 10:15 -0700, Shuah Khan wrote:
>> On 1/12/24 10:43, Marcos Paulo de Souza wrote:
>>> Add TEST_GEN_MODS_DIR variable for kselftests. It can point to
>>> a directory containing kernel modules that will be used by
>>> selftest scripts.
>>>
>>> The modules are built as external modules for the running kernel.
>>> As a result they are always binary compatible and the same tests
>>> can be used for older or newer kernels.
>>>
>>> The build requires "kernel-devel" package to be installed.
>>> For example, in the upstream sources, the rpm devel package
>>> is produced by "make rpm-pkg"
>>>
>>> The modules can be built independently by
>>>
>>>     make -C tools/testing/selftests/livepatch/
>>>
>>> or they will be automatically built before running the tests via
>>>
>>>     make -C tools/testing/selftests/livepatch/ run_tests
>>>
>>> Note that they are _not_ built when running the standalone
>>> tests by calling, for example, ./test-state.sh.
>>>
>>> Along with TEST_GEN_MODS_DIR, it was necessary to create a new
>>> install
>>> rule. INSTALL_MODS_RULE is needed because INSTALL_SINGLE_RULE would
>>> copy the entire TEST_GEN_MODS_DIR directory to the destination,
>>> even
>>> the files created by Kbuild to compile the modules. The new install
>>> rule copies only the .ko files, as we would expect the gen_tar to
>>> work.
>>>
>>> Reviewed-by: Joe Lawrence <joe.lawrence@redhat.com>
>>> Reviewed-by: Petr Mladek <pmladek@suse.com>
>>> Signed-off-by: Marcos Paulo de Souza <mpdesouza@suse.com>
>>> ---
>>>    Documentation/dev-tools/kselftest.rst |  4 ++++
>>>    tools/testing/selftests/lib.mk        | 26 +++++++++++++++++++++-
>>> ----
>>
>>
>> Hi Marcos,
>>
>> I would like the doc patch and lib.mk patch separate. If lib.mk needs
>> changes
>> we don't have to touch the doc patch.
> 
> Hi Shuah,
> on patch 2/3 you also said that you would like to have the
> documentation changes split in the future, and that you picked the
> changes into a testing branch. Does it also applies to this patch?
> 

No need to do anything now. I just applied the series to linux-kselftest next

thanks,
-- Shuah


