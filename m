Return-Path: <linux-doc+bounces-4744-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6678480DD94
	for <lists+linux-doc@lfdr.de>; Mon, 11 Dec 2023 22:53:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 122411F21BD5
	for <lists+linux-doc@lfdr.de>; Mon, 11 Dec 2023 21:53:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FD5D54FB2;
	Mon, 11 Dec 2023 21:53:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="AuR9K+Om"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com [IPv6:2607:f8b0:4864:20::d31])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0B48BD
	for <linux-doc@vger.kernel.org>; Mon, 11 Dec 2023 13:53:14 -0800 (PST)
Received: by mail-io1-xd31.google.com with SMTP id ca18e2360f4ac-7b714a7835cso25812639f.0
        for <linux-doc@vger.kernel.org>; Mon, 11 Dec 2023 13:53:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1702331594; x=1702936394; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=J8wlwZcZfMgu62MtPSRryzCZiPJUNxKIn0JHd17fo+8=;
        b=AuR9K+OmK3pUMtfDOPyYrKwqdhWPMvvVZeQAUv+8aos5dhTET8drE5mNAq5oafmI7Q
         tUIUnfRcgVgIDf7Z34vuQoExUCHnaHiOPQN3BvJBzehmSMbyaAQzoGn1PQtozu/n1knW
         0p9uWSTG79ePkskxijzFyMgR06Kd5uHbYURaY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702331594; x=1702936394;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=J8wlwZcZfMgu62MtPSRryzCZiPJUNxKIn0JHd17fo+8=;
        b=pfVlItPIsxoh6Wh+3GADGiRXz1epGu6tTiSNFCqIbp8omDS1f+mFA83tZAv7zKb6Ln
         ljTUQgaz+o0d2iKfBOm8Wol7BE6HD8hfZRBQnzaRnlNznFojL5reb2p2bcD83J0tJ2m/
         4EpAXXK66qNLjDwT3qXiXp7s5Lrc5Ool/IZ7FSWqr2bEeTExBh7tpa9At8s6oflBFkq3
         DdhCOwXM8E2v/6xOxhE2ATicY2n//HeXTnQ+FG5kywqoIa3PZbAi00OAGHgD3dJ/f7EQ
         dpjRUfR8pGLKZIO2km9/xoPJpKxdRjJGL2sF7XE+VyRwGiR5UNrGnwIX+1QzqOopD7Zq
         0byA==
X-Gm-Message-State: AOJu0Yy6mnnbhUTCvd+0Ibb5YHRiqYyRRUDzlrXFWjmRTeN8na3zb8ug
	g06EI4GvuSvDjyD7wPbpkgCPcg==
X-Google-Smtp-Source: AGHT+IHNXh53GeHIlmc9hQAoat+3wIYtfi4KMP437MU2mSbCYlghZVBb1fXt14Cen9PPHEHBoFg9Vg==
X-Received: by 2002:a6b:c994:0:b0:7b7:365:924b with SMTP id z142-20020a6bc994000000b007b70365924bmr8423593iof.2.1702331594020;
        Mon, 11 Dec 2023 13:53:14 -0800 (PST)
Received: from [192.168.1.128] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id m35-20020a056638272300b0046926891d83sm2087680jav.103.2023.12.11.13.53.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Dec 2023 13:53:13 -0800 (PST)
Message-ID: <2498bf91-8057-43e8-98f2-4ed93c53ce9f@linuxfoundation.org>
Date: Mon, 11 Dec 2023 14:53:12 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] selftests: livepatch: Test livepatching a heavily
 called syscall
Content-Language: en-US
To: Miroslav Benes <mbenes@suse.cz>
Cc: mpdesouza@suse.com, Marcos Paulo de Souza <mpdesouza@suse.de>,
 Shuah Khan <shuah@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>, Josh Poimboeuf <jpoimboe@kernel.org>,
 Jiri Kosina <jikos@kernel.org>, Petr Mladek <pmladek@suse.com>,
 Joe Lawrence <joe.lawrence@redhat.com>, linux-kselftest@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-s390@vger.kernel.org, live-patching@vger.kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20231031-send-lp-kselftests-v3-0-2b1655c2605f@suse.com>
 <20231031-send-lp-kselftests-v3-3-2b1655c2605f@suse.com>
 <f9d82fa6-08d7-4ab6-badc-691987b37a82@linuxfoundation.org>
 <unpg4z7eig6qbudgulnr6sog65fq7s2dy4u2vp2dgkdrq5csdw@dltnxuw6kw5b>
 <8b95b96c-6aeb-4bf0-8ee9-2ba62330c672@linuxfoundation.org>
 <12a9ec1bc84dc6d4b461e5c780ba7d3c3aa91740.camel@suse.com>
 <76c4b967-1cb6-4f77-9402-f835b15adb10@linuxfoundation.org>
 <alpine.LSU.2.21.2312061530470.13051@pobox.suse.cz>
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <alpine.LSU.2.21.2312061530470.13051@pobox.suse.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/6/23 07:39, Miroslav Benes wrote:
> Hi,
> 
> On Tue, 5 Dec 2023, Shuah Khan wrote:
> 
>> On 12/5/23 05:52, mpdesouza@suse.com wrote:
>>> On Fri, 2023-12-01 at 16:38 +0000, Shuah Khan wrote:
>>
>>> 0003-selftests-livepatch-Test-livepatching-a-heavily-call.patch has
>>> style problems, please review.
>>>
>>> NOTE: If any of the errors are false positives, please report
>>>         them to the maintainer, see CHECKPATCH in MAINTAINERS.
>>>
>>> I couldn't find any mention about "missing module name". Is your script
>>> showing more warnings than these ones? Can you please share your
>>> output?
>>>
>>> I'll fix MAINTAINERS file but I'll wait until I understand what's
>>> missing in your checkpatch script to resend the patchset.
>>>
>>
>> Looks like it is coming a script - still my question stands on
>> whether or not you would need a module name for this module?
> 
> I admit I am also clueless here. The module name is given in Makefile. In
> this case in test_modules/Makefile. I do not know of anything else. There
> is no MODULE_NAME macro. Could you elaborate, please?
> 

I see that now.

thanks,
-- Shuah







