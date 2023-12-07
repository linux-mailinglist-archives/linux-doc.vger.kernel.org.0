Return-Path: <linux-doc+bounces-4376-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9924A808B9D
	for <lists+linux-doc@lfdr.de>; Thu,  7 Dec 2023 16:20:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CA71C1C2099C
	for <lists+linux-doc@lfdr.de>; Thu,  7 Dec 2023 15:20:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D1A644C78;
	Thu,  7 Dec 2023 15:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="F18O/3DR"
X-Original-To: linux-doc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7ED2B137
	for <linux-doc@vger.kernel.org>; Thu,  7 Dec 2023 07:20:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701962418;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aBGTHGwalkoi/mJWuDTNACB5Q2kodLYGhoMiNDutoGI=;
	b=F18O/3DRl0vukjnBJEKVTkGiRQfsDfYAIgo+wewrUbDGXoMWHP1ixICxc3GI4MDViTs/Up
	3e5yuj57loXyEC0xe9ZIBdrtJJUDEgchydv8/M8SnTpDmjXk4vFZYoSf3Ps5xS+D0QgxTp
	3d/CIp4TheqrcBiOr/Lu6gBIMOy5GP4=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-92-hU-aDaxtMOyux2n2q4u78g-1; Thu, 07 Dec 2023 10:20:16 -0500
X-MC-Unique: hU-aDaxtMOyux2n2q4u78g-1
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-42595dc46e3so2756441cf.0
        for <linux-doc@vger.kernel.org>; Thu, 07 Dec 2023 07:20:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701962416; x=1702567216;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aBGTHGwalkoi/mJWuDTNACB5Q2kodLYGhoMiNDutoGI=;
        b=MJ3PoN7VxQ+nSv0LUp21awtZvDo1uDShdpQMwlRZCDdk5sck0vZ5GsmDtne1nRzZUG
         MyUFb+XJXG0mSmYQ+ELQWN5Gn+lxibcPA9la3SIzo6xUXEOMt5VrjGpwoxl2YP0ArrZk
         fOXg1/TcDYcoEgpZRS52dnv3Ad31K1LcG6egpWqP3uv+29C04NWcsICHcDSJah3jPhLv
         JV3s4ti83xwSFI0bWaYN2ezfA9Yktm44DP4DRrtCU8QfqJ8h/lSLjPaFoW6sbhmhYFp8
         5KZ8oTo/F/NcXuFRzB9VozDvm48Q2mvaOURLrpFBah8CCOpSZw5s/9wSJPlxmfM0ieDX
         6jpQ==
X-Gm-Message-State: AOJu0YyKub1LRKEfD93p4c9NTIKDAUsXG/aSMFM9+0e6EL6rqXH+4pBT
	Vkybno8uqEJAvSSZaC9+2vjO2B3dDcBOWb/hSk2EQGSxZh/M2sMF975qDen/+iRGj0PPB4NJe0/
	1JlmzVdT4R8P4JlIu1ZNz
X-Received: by 2002:ac8:5cc5:0:b0:423:7766:a6f4 with SMTP id s5-20020ac85cc5000000b004237766a6f4mr2772208qta.15.1701962416051;
        Thu, 07 Dec 2023 07:20:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEQW6FZgS48niLt79yNrj+zSCpythqw85QeE+yCUszBntFb7RV7q5lP63f7i9ydCptw5RyYRw==
X-Received: by 2002:ac8:5cc5:0:b0:423:7766:a6f4 with SMTP id s5-20020ac85cc5000000b004237766a6f4mr2772195qta.15.1701962415800;
        Thu, 07 Dec 2023 07:20:15 -0800 (PST)
Received: from [192.168.1.9] (pool-68-160-135-240.bstnma.fios.verizon.net. [68.160.135.240])
        by smtp.gmail.com with ESMTPSA id f21-20020ac84995000000b00423890096afsm3610qtq.2.2023.12.07.07.20.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Dec 2023 07:20:15 -0800 (PST)
Message-ID: <273a86d6-d220-fdcf-3c2f-70516c519ff9@redhat.com>
Date: Thu, 7 Dec 2023 10:20:13 -0500
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Content-Language: en-US
To: Miroslav Benes <mbenes@suse.cz>
Cc: Marcos Paulo de Souza <mpdesouza@suse.com>, Shuah Khan
 <shuah@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>, Josh Poimboeuf <jpoimboe@kernel.org>,
 Jiri Kosina <jikos@kernel.org>, Petr Mladek <pmladek@suse.com>,
 linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-s390@vger.kernel.org,
 live-patching@vger.kernel.org
References: <20231031-send-lp-kselftests-v3-0-2b1655c2605f@suse.com>
 <20231031-send-lp-kselftests-v3-2-2b1655c2605f@suse.com>
 <ZWn7dEzVWoKxycmy@redhat.com>
 <alpine.LSU.2.21.2312061543280.13051@pobox.suse.cz>
From: Joe Lawrence <joe.lawrence@redhat.com>
Subject: Re: [PATCH v3 2/3] livepatch: Move tests from lib/livepatch to
 selftests/livepatch
In-Reply-To: <alpine.LSU.2.21.2312061543280.13051@pobox.suse.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/6/23 10:05, Miroslav Benes wrote:
> On Fri, 1 Dec 2023, Joe Lawrence wrote:
> 
>> On Tue, Oct 31, 2023 at 06:10:52PM -0300, Marcos Paulo de Souza wrote:
>>> The modules are being moved from lib/livepatch to
>>> tools/testing/selftests/livepatch/test_modules.
>>>
>>> This code moving will allow writing more complex tests, like for example an
>>> userspace C code that will call a livepatched kernel function.
>>>
>>> The modules are now built as out-of-tree
>>> modules, but being part of the kernel source means they will be maintained.
>>>
>>> Another advantage of the code moving is to be able to easily change,
>>> debug and rebuild the tests by running make on the selftests/livepatch directory,
>>> which is not currently possible since the modules on lib/livepatch are
>>> build and installed using the "modules" target.
>>>
>>> The current approach also keeps the ability to execute the tests manually by
>>> executing the scripts inside selftests/livepatch directory, as it's currently
>>> supported. If the modules are modified, they needed to be rebuilt before running
>>> the scripts though.
>>>
>>> The modules are built before running the selftests when using the
>>> kselftest invocations:
>>>
>>> 	make kselftest TARGETS=livepatch
>>> or
>>> 	make -C tools/testing/selftests/livepatch run_tests
>>>
>>
>> Quick question:
>>
>> - We have been building with CONFIG_LIVEPATCH_TEST=m to generate the
>>   test modules at kernel build time
>>
>> - Our packaging filters out the selftest scripts and supporting modules
>>   from the general kernel RPM package into their subpackages
>>
>> - Tests are run as part of CKI or other manual tests by installing the
>>   pre-built packages from the previous step
>>
>>
>> After this patch, we would need to add something like the following to
>> our kernel build, before packaging:
>>
>>   $ make KDIR=$(pwd) -C tools/testing/selftests/livepatch/
>>          ^^^^
>>
>> If this is the correct way to build the test modules for *this* tree and
>> /lib/modules/$(shell uname -r)/build... it might be useful to document
>> in the commit message as an alternative use case.
> 
> So if I understand it correctly, you would like to stick to pre-building 
> the modules (not in-tree but now after the kernel is build using the 
> proposed way), package them and then install everything on a system 
> running the respective kernel. A valid use case in my opinion.
> 

That would accurate.  If this use case can be supported, it wouldn't
require changes to our CKI / testing scripts, only the post-build
packaging bits.

> My idea is to abandon this way completely, take the selftests and build 
> and run them on the system right away.
> 
> Both should be doable, hopefully, if we wire it all correctly... and 
> document it.
> 
I can't think of why it shouldn't continue to work, even in a future
where newer livepatching selftests support older kernels.  (We would
just have newer selftests sources backported to test older kernel sources.)

Are there any test cases which truly need to be build on-the-fly?  Aside
from testing different toolchain pieces?

-- 
Joe


