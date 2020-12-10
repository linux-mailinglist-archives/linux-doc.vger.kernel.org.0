Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A57DF2D62F0
	for <lists+linux-doc@lfdr.de>; Thu, 10 Dec 2020 18:04:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390912AbgLJREP (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 10 Dec 2020 12:04:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388205AbgLJREF (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 10 Dec 2020 12:04:05 -0500
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com [IPv6:2607:f8b0:4864:20::742])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7B06C0617A6
        for <linux-doc@vger.kernel.org>; Thu, 10 Dec 2020 09:03:25 -0800 (PST)
Received: by mail-qk1-x742.google.com with SMTP id 1so5453262qka.0
        for <linux-doc@vger.kernel.org>; Thu, 10 Dec 2020 09:03:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=sUTklf9jBEwzs6UhWeShzolt35srKpXJ+Aec/2jQSUU=;
        b=h/WaKNT1y3XBZzgswgsh3Ixjw2N5x/28mj80swAvklzGIkVrj6MJ8wuNisjEyktydT
         zCseyjCchbMSPmxaGGplDZeJZGmP5oyuuVuXTxCHsGpXk0qls2m66qjTPGaKUsL8ZRao
         pG1Gub5CnI64JSe7Y7ezFsY7qfQdgeOGSHy9txvrSC33WOO2k81hdMm/P+2raMibY7v9
         fJHm6P4C0LRQcU3U5FIZ0KPx7ZPzEHxNce551WR814F2jYgp0wq9R/aJ9NcE8kgU8u2e
         QyaXhCI11vcVH6ukyAI3qKqvg5kI9bv6rPVXMAlpIk9CUlSY5f7ETZmBRFKsxQ/oRgfO
         7ZoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=sUTklf9jBEwzs6UhWeShzolt35srKpXJ+Aec/2jQSUU=;
        b=GyHP2BOUVhn5AxJo/yLCZzJFkYljjm6uSHijfalPS7BR/lpaNybQ+Fjlqe4cnXaMZu
         0QIDSX4I+wyRUuT/bIVH08vieUVHTynPrxKxXiHOLNlD66ZvjI/jmgtC3y0FGLQThbX+
         IDsGsV1M60vA+dr5VVGrFbdY/EFkDo4VWVVrGE1el1oii5VM8yh1BphSm0zuh7hVyRve
         Vztm6Isgy6KJGAZFhqUI5gpIYpe1BW2HpcPEpDilk/jnuMksHPQiaPoAb/f3+TDkS6g1
         NLOjT4qMV5Z6s9OywMcuVQOoHnY7LDKE1F35UjDRntPr1q7qiGBrMYnS+ArgIN6mNP7y
         AitA==
X-Gm-Message-State: AOAM531cfp4Y3qI7bRJEMiRupUmyXswOgAEe20IjKehq19QAmgLmxxlT
        nG0vhfmFEi19lSUsJOk7jSAsTw==
X-Google-Smtp-Source: ABdhPJymXAQH/aw0VSr4+J5MsG5kd52DH5BGq1ZaXwLD+lvifpGCtkGDCg1EXTpttoD9CP3doaPF0g==
X-Received: by 2002:a37:bac7:: with SMTP id k190mr10524292qkf.464.1607619804657;
        Thu, 10 Dec 2020 09:03:24 -0800 (PST)
Received: from [192.168.1.45] (cpe-174-109-172-136.nc.res.rr.com. [174.109.172.136])
        by smtp.gmail.com with ESMTPSA id y22sm3789944qkj.129.2020.12.10.09.03.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Dec 2020 09:03:23 -0800 (PST)
Subject: Re: [dm-devel] [PATCH v1 0/5] dm: dm-user: New target that proxies
 BIOs to userspace
To:     Bart Van Assche <bvanassche@acm.org>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Christoph Hellwig <hch@infradead.org>
Cc:     snitzer@redhat.com, corbet@lwn.net, kernel-team@android.com,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-raid@vger.kernel.org, song@kernel.org, dm-devel@redhat.com,
        linux-kselftest@vger.kernel.org, shuah@kernel.org, agk@redhat.com,
        Mike Christie <michael.christie@oracle.com>
References: <mhng-97fc5874-29d0-4d9e-8c92-d3704a482f28@palmerdabbelt-glaptop1>
 <6fb5be2d-c6ca-c21b-dddf-9b314973dcfe@acm.org>
From:   Josef Bacik <josef@toxicpanda.com>
Message-ID: <30d39293-80a4-9ef5-92bb-6b6dec464be3@toxicpanda.com>
Date:   Thu, 10 Dec 2020 12:03:21 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <6fb5be2d-c6ca-c21b-dddf-9b314973dcfe@acm.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 12/9/20 10:38 PM, Bart Van Assche wrote:
> On 12/7/20 10:55 AM, Palmer Dabbelt wrote:
>> All in all, I've found it a bit hard to figure out what sort of interest
>> people
>> have in dm-user: when I bring this up I seem to run into people who've done
>> similar things before and are vaguely interested, but certainly nobody is
>> chomping at the bit.  I'm sending it out in this early state to try and
>> figure
>> out if it's interesting enough to keep going.
> 
> Cc-ing Josef and Mike since their nbd contributions make me wonder
> whether this new driver could be useful to their use cases?
> 

Sorry gmail+imap sucks and I can't get my email client to get at the original 
thread.  However here is my take.

1) The advantages of using dm-user of NBD that you listed aren't actually 
problems for NBD.  We have NBD working in production where you can hand off the 
sockets for the server without ending in timeouts, it was actually the main 
reason we wrote our own server so we could use the FD transfer stuff to restart 
the server without impacting any clients that had the device in use.

2) The extra copy is a big deal, in fact we already have too many copies in our 
existing NBD setup and are actively looking for ways to avoid those.

Don't take this as I don't think dm-user is a good idea, but I think at the very 
least it should start with the very best we have to offer, starting with as few 
copies as possible.

If you are using it currently in production then cool, there's clearly a usecase 
for it.  Personally as I get older and grouchier I want less things in the 
kernel, so if this enables us to eventually do everything NBD related in 
userspace with no performance drop then I'd be down.  I don't think you need to 
make that your primary goal, but at least polishing this up so it could 
potentially be abused in the future would make it more compelling for merging. 
Thanks,

Josef
