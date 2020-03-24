Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A9965190E02
	for <lists+linux-doc@lfdr.de>; Tue, 24 Mar 2020 13:48:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727431AbgCXMsM (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 24 Mar 2020 08:48:12 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:38262 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727592AbgCXMsM (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 24 Mar 2020 08:48:12 -0400
Received: from mail-qt1-f198.google.com ([209.85.160.198])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <gpiccoli@canonical.com>)
        id 1jGiwE-0002FZ-VO
        for linux-doc@vger.kernel.org; Tue, 24 Mar 2020 12:46:03 +0000
Received: by mail-qt1-f198.google.com with SMTP id d26so2128389qtr.23
        for <linux-doc@vger.kernel.org>; Tue, 24 Mar 2020 05:45:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=1gaGCSvbUvFxUDYFtFdzOfLzBRbgwsoBtcQn8FrobJE=;
        b=WmieybuzzWQkezwyogjV2WzOXKocKfDSpvsKMI1b7LpRZJNMfGl/ULaOa8G4eIG2z2
         tOwMq8XghQsZT3CGopiinJn+L8iHiNQDfFbDDNVzwiz/4tNrDKaKtWNNCOc1+JyHMCN/
         +tSCFQUqO44sCCnrb2Uj2nbgzKBc4RG2Pkowbok+nZPCC3lYg2FG7AQT2d65NPBV4T8X
         vqjPKGRrHMoq7k8JP495OFw8Uppr7ld9Zp+s0mHvj4uMOlI1MqmH6jM7eFNc54KtNDre
         Y/8mbThI/WYV+gdTnRVwfVkpcEED4QrYmNN//y8TwEjgTM336/ocQaTbiU9+cCxRfruY
         Cx8A==
X-Gm-Message-State: ANhLgQ26C6nKzV7xtgQLegJLyL1J5to4T5epO049FGD7vPDG/6WLlz5N
        J3rmUiOXC6pIQ5c54E3HRy6i6p9HonLqkD0XtxUVI0qZEttBaSY153rxbHg2rglKv/6UX6+7qAf
        niXX0JN9aYVJJd8SPLIYcSvDvoYXztPq+qIHbYQ==
X-Received: by 2002:ac8:7a72:: with SMTP id w18mr13890589qtt.260.1585053946093;
        Tue, 24 Mar 2020 05:45:46 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vsJTKeG/ltjtIrAmk7rWlgqC0MDN+DIYegBWmCgJY1czFa1TCerbdXmWy488e+x3QMi/tk5bw==
X-Received: by 2002:ac8:7a72:: with SMTP id w18mr13890575qtt.260.1585053945833;
        Tue, 24 Mar 2020 05:45:45 -0700 (PDT)
Received: from [192.168.1.75] (189-47-87-73.dsl.telesp.net.br. [189.47.87.73])
        by smtp.gmail.com with ESMTPSA id t71sm13463643qke.55.2020.03.24.05.45.41
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 24 Mar 2020 05:45:45 -0700 (PDT)
Subject: Re: [PATCH V2] kernel/hung_task.c: Introduce sysctl to print all
 traces when a hung task is detected
To:     Vlastimil Babka <vbabka@suse.cz>, linux-kernel@vger.kernel.org,
        linux-fsdevel@vger.kernel.org
Cc:     linux-doc@vger.kernel.org, mcgrof@kernel.org,
        keescook@chromium.org, yzaikin@google.com, tglx@linutronix.de,
        penguin-kernel@I-love.SAKURA.ne.jp, akpm@linux-foundation.org,
        cocci@systeme.lip6.fr, linux-api@vger.kernel.org,
        kernel@gpiccoli.net, randy Dunlap <rdunlap@infradead.org>
References: <20200323214618.28429-1-gpiccoli@canonical.com>
 <b73a6519-0529-e36f-fac5-e4b638ceb3cf@suse.cz>
From:   "Guilherme G. Piccoli" <gpiccoli@canonical.com>
Openpgp: preference=signencrypt
Autocrypt: addr=gpiccoli@canonical.com; prefer-encrypt=mutual; keydata=
 mQENBFpVBxcBCADPNKmu2iNKLepiv8+Ssx7+fVR8lrL7cvakMNFPXsXk+f0Bgq9NazNKWJIn
 Qxpa1iEWTZcLS8ikjatHMECJJqWlt2YcjU5MGbH1mZh+bT3RxrJRhxONz5e5YILyNp7jX+Vh
 30rhj3J0vdrlIhPS8/bAt5tvTb3ceWEic9mWZMsosPavsKVcLIO6iZFlzXVu2WJ9cov8eQM/
 irIgzvmFEcRyiQ4K+XUhuA0ccGwgvoJv4/GWVPJFHfMX9+dat0Ev8HQEbN/mko/bUS4Wprdv
 7HR5tP9efSLucnsVzay0O6niZ61e5c97oUa9bdqHyApkCnGgKCpg7OZqLMM9Y3EcdMIJABEB
 AAG0LUd1aWxoZXJtZSBHLiBQaWNjb2xpIDxncGljY29saUBjYW5vbmljYWwuY29tPokBNwQT
 AQgAIQUCWmClvQIbAwULCQgHAgYVCAkKCwIEFgIDAQIeAQIXgAAKCRDOR5EF9K/7Gza3B/9d
 5yczvEwvlh6ksYq+juyuElLvNwMFuyMPsvMfP38UslU8S3lf+ETukN1S8XVdeq9yscwtsRW/
 4YoUwHinJGRovqy8gFlm3SAtjfdqysgJqUJwBmOtcsHkmvFXJmPPGVoH9rMCUr9s6VDPox8f
 q2W5M7XE9YpsfchS/0fMn+DenhQpV3W6pbLtuDvH/81GKrhxO8whSEkByZbbc+mqRhUSTdN3
 iMpRL0sULKPVYbVMbQEAnfJJ1LDkPqlTikAgt3peP7AaSpGs1e3pFzSEEW1VD2jIUmmDku0D
 LmTHRl4t9KpbU/H2/OPZkrm7809QovJGRAxjLLPcYOAP7DUeltveuQENBFpVBxcBCADbxD6J
 aNw/KgiSsbx5Sv8nNqO1ObTjhDR1wJw+02Bar9DGuFvx5/qs3ArSZkl8qX0X9Vhptk8rYnkn
 pfcrtPBYLoux8zmrGPA5vRgK2ItvSc0WN31YR/6nqnMfeC4CumFa/yLl26uzHJa5RYYQ47jg
 kZPehpc7IqEQ5IKy6cCKjgAkuvM1rDP1kWQ9noVhTUFr2SYVTT/WBHqUWorjhu57/OREo+Tl
 nxI1KrnmW0DbF52tYoHLt85dK10HQrV35OEFXuz0QPSNrYJT0CZHpUprkUxrupDgkM+2F5LI
 bIcaIQ4uDMWRyHpDbczQtmTke0x41AeIND3GUc+PQ4hWGp9XABEBAAGJAR8EGAEIAAkFAlpV
 BxcCGwwACgkQzkeRBfSv+xv1wwgAj39/45O3eHN5pK0XMyiRF4ihH9p1+8JVfBoSQw7AJ6oU
 1Hoa+sZnlag/l2GTjC8dfEGNoZd3aRxqfkTrpu2TcfT6jIAsxGjnu+fUCoRNZzmjvRziw3T8
 egSPz+GbNXrTXB8g/nc9mqHPPprOiVHDSK8aGoBqkQAPZDjUtRwVx112wtaQwArT2+bDbb/Y
 Yh6gTrYoRYHo6FuQl5YsHop/fmTahpTx11IMjuh6IJQ+lvdpdfYJ6hmAZ9kiVszDF6pGFVkY
 kHWtnE2Aa5qkxnA2HoFpqFifNWn5TyvJFpyqwVhVI8XYtXyVHub/WbXLWQwSJA4OHmqU8gDl
 X18zwLgdiQ==
Message-ID: <eee335a2-e673-39bf-ae64-e49c66f74255@canonical.com>
Date:   Tue, 24 Mar 2020 09:45:40 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <b73a6519-0529-e36f-fac5-e4b638ceb3cf@suse.cz>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 24/03/2020 05:27, Vlastimil Babka wrote:
> [...]
> Before adding a new thing as both kernel parameter and sysctl, could we perhaps
> not add the kernel parameter, in favor of the generic sysctl parameter solution?
> [1] There were no objections and some support from Kees, so I will try to send a
> new version ASAP that will work properly with all "static" sysctls - we don't
> need to be blocked by a full solution for dynamically registered sysctls yet, I
> guess?
> 
> Thanks,
> Vlastimil
> 
> [1] https://lore.kernel.org/linux-api/20200317132105.24555-1-vbabka@suse.cz/
> 

Thanks Randy and Vlastimil for the comments. I really liked your
approach Vlastimil, I agree that we have no reason to not have a generic
sysctl setting via cmdline mechanism - I'll rework this patch removing
the kernel parameter (same for other patch I just submitted).

If you can CC me on the new iterations of the generic sysctl patches
Vlastimil, I appreciate - I can maybe test that, I'd like to see it in
kernel.

Thanks,


Guilherme
