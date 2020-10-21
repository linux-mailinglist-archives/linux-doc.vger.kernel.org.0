Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 560C5294FB3
	for <lists+linux-doc@lfdr.de>; Wed, 21 Oct 2020 17:15:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2502061AbgJUPPX (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 21 Oct 2020 11:15:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2501934AbgJUPPX (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 21 Oct 2020 11:15:23 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68F86C0613D2
        for <linux-doc@vger.kernel.org>; Wed, 21 Oct 2020 08:15:22 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id hk7so1291814pjb.2
        for <linux-doc@vger.kernel.org>; Wed, 21 Oct 2020 08:15:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=android.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=zttj1zOgAeqHtbpowWFcTKsPI3yWy0/E6Ffy28P8rgY=;
        b=cqRcwWSDCV94TH7wsbd/I3JRZP5thpF4OqYwCQbYH4w8hHYpGk2mtbyf+csTKB8PcF
         C3KuSDSSBnfjBKQS205o3FYaelrym19tcJLpre4+ntQ2hHO+/eRZvQ8IqwkNhq0fd2wE
         ILY0NuYIH985IlIDBEW11aPNVnFLj/W+REhui78sgPe0X9psm4kiUjaD595h5pzE53pq
         SKHhRmXj+xpuB5yXYVEYsFUrP13gnusj6fiH+Wnf/0pMIWfpJLf1Z1NUzkV9oDkCzCdK
         jngwPokG5VijdCl187JxGtwXlnywZoyk3CWPq7EUS3Ff85tRR1j99RPzbA8IwQOnndMC
         dWmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=zttj1zOgAeqHtbpowWFcTKsPI3yWy0/E6Ffy28P8rgY=;
        b=AcgH9gBp0dmDlRPY1pCtMrRKPKpLGUu1ZxVo/NwvJDUzFEPSrs69+310aa4oijoNKA
         0Pd2JP/RzNrSt9P5cuXNnTsZ/HgbL6HAeuav60uQpTSYhs3MrIZMTvckuovLSD7hWR2u
         zlNSvyfl3ExchvYjnQ0CqE48MUm05NtyqfhbncfP8voCesfZSwiRrskRK0r3jEmdBqj9
         l0Nq5auduTuHhHX/CDAngrcRD0N2dvvDtCwcWYz1muyte9r4tuhngl6wH975GRqULoB1
         WkXiQub4FNy534haj1l8+FIT0TDukRHpmJ1Qc1bY2ykCeO2fWYgMLKwR075V8t5vRoPC
         FNsg==
X-Gm-Message-State: AOAM531s8s0AmxcgMOJKQAW3iJbFamHeR0IUz/fAJQZYia8+4IZ6PCl5
        HfyMFYP31lSfsxEPIwtMtkOc3g==
X-Google-Smtp-Source: ABdhPJwmR/mHGuXuR8nUMxAsudxKjKgx1xONcweM/atqFJKzEp/H+FaQjRw2jwBq+oKd2WL2y34/Tg==
X-Received: by 2002:a17:902:9347:b029:d3:7c08:86c6 with SMTP id g7-20020a1709029347b02900d37c0886c6mr4034273plp.84.1603293321958;
        Wed, 21 Oct 2020 08:15:21 -0700 (PDT)
Received: from nebulus.mtv.corp.google.com ([2620:15c:211:200:4a0f:cfff:fe35:d61b])
        by smtp.googlemail.com with ESMTPSA id f15sm2714562pfk.21.2020.10.21.08.15.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2020 08:15:21 -0700 (PDT)
Subject: Re: [PATCH v18 0/4] overlayfs override_creds=off & nested get xattr
 fix
To:     "Eric W. Biederman" <ebiederm@xmission.com>
Cc:     linux-kernel@vger.kernel.org, kernel-team@android.com,
        Miklos Szeredi <miklos@szeredi.hu>,
        Jonathan Corbet <corbet@lwn.net>,
        Vivek Goyal <vgoyal@redhat.com>,
        Amir Goldstein <amir73il@gmail.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Stephen Smalley <sds@tycho.nsa.gov>,
        John Stultz <john.stultz@linaro.org>,
        linux-doc@vger.kernel.org, linux-security-module@vger.kernel.org,
        selinux@vger.kernel.org
References: <20201021143533.115895-1-salyzyn@android.com>
 <87wnzj6305.fsf@x220.int.ebiederm.org>
From:   Mark Salyzyn <salyzyn@android.com>
Message-ID: <c6ca6eea-2fb2-2278-bc4a-39c43e984657@android.com>
Date:   Wed, 21 Oct 2020 08:15:19 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <87wnzj6305.fsf@x220.int.ebiederm.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 10/21/20 7:57 AM, Eric W. Biederman wrote:
> Is there any reason why the cc list from the body of the email does not
> match the people who have been cc'd on the email.  Skipping the
> linux-unionfs list (which seems to be the mail list for overlayfs)
> seems like a pretty big oversight.
>
>> Signed-off-by: Mark Salyzyn <salyzyn@android.com>
>> Cc: Miklos Szeredi <miklos@szeredi.hu>
>> Cc: Jonathan Corbet <corbet@lwn.net>
>> Cc: Vivek Goyal <vgoyal@redhat.com>
>> Cc: Eric W. Biederman <ebiederm@xmission.com>
>> Cc: Amir Goldstein <amir73il@gmail.com>
>> Cc: Randy Dunlap <rdunlap@infradead.org>
>> Cc: Stephen Smalley <sds@tycho.nsa.gov>
>> Cc: John Stultz <john.stultz@linaro.org>
>> Cc: linux-doc@vger.kernel.org
>> Cc: linux-kernel@vger.kernel.org
>> To: linux-fsdevel@vger.kernel.org
>> To: linux-unionfs@vger.kernel.org
>> Cc: linux-security-module@vger.kernel.org
>> Cc: kernel-team@android.com
>> Cc: selinux@vger.kernel.org
> Eric
>
I used git send-email to do the heavy lifting of sending the submission, 
minus the obligatory maintainers script because it adds 100s of 
recipients and breaks entry into several of the lists. AFAICT send-email 
appears to not add To: entries found in the body, only Cc: entries :-(.

I will resend with everything as Cc: entries shortly.

Sincerely -- Mark Salyzyn

