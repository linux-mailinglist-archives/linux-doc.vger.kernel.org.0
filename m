Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A5A652AF5AE
	for <lists+linux-doc@lfdr.de>; Wed, 11 Nov 2020 17:03:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725912AbgKKQDc (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 11 Nov 2020 11:03:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727126AbgKKQDY (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 11 Nov 2020 11:03:24 -0500
Received: from mail-il1-x142.google.com (mail-il1-x142.google.com [IPv6:2607:f8b0:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1854C0617A7
        for <linux-doc@vger.kernel.org>; Wed, 11 Nov 2020 08:03:23 -0800 (PST)
Received: by mail-il1-x142.google.com with SMTP id x20so2412813ilj.8
        for <linux-doc@vger.kernel.org>; Wed, 11 Nov 2020 08:03:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=t1jRZwSuuEQg/bscnGGcsBqPGqmw90tTjNeAiADGZWQ=;
        b=J0hJSJOtZ8cKp8g+AeRYn4zxI0z474RogLJ5yTPblSThyhiNsosQswbzULN0LbKveR
         X0HAP1BB/hEjAalzEOtQYXHKBPj76Ny52sSHtoN3iZ+Hs8inttTe9EdPQNaO01FSCro6
         PYFW08h9SJjByeNV57EQfbTW7Znk7xIl6IRI0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=t1jRZwSuuEQg/bscnGGcsBqPGqmw90tTjNeAiADGZWQ=;
        b=o9ykJZYT8CVf2kVK8obtBJP5/Z+3zb6KpvOXRjTbQn3OZnXU3LQHsaHDaACC5Uljbn
         HPyagr66EKBgwcR/Pob7rb3Kgk43NJhfIEC1Zt8sPDWnKSnEkF8oRgNuk5kLQcfZYNmy
         YB9GOMSGvDPmMvqKSS1l7VL+kgs7KV8vMJI2C+FIUWOa+6H/ajihTmylmE0HfsbyMq3j
         dG5QtYjs8VwCF+C85Wdm3d7elfFf/vd0LL7Xrcz24z/+JftdElhms50ORY6SC4N3nKr5
         XqZlOpUnxMQH2s6gewh1fMt0unzgnEjhiRxhXr8ZS+53mp1IeeCZVcjNiwdaynFF9sPF
         6y2w==
X-Gm-Message-State: AOAM533hZGIvh/sF4AVawFpd7jyub59OskB3BgAZe+0ijWg/3Xfna/LK
        gV+qYL0J9tvLvTFucOvKkYqdgQ==
X-Google-Smtp-Source: ABdhPJzfuPKbLPy0S959f+cmN74uBmhaZrB/aTXCrRPM53UdGcZ4oGHwyut2AWmWt1ZgJZjUJccyXg==
X-Received: by 2002:a92:6c11:: with SMTP id h17mr12292757ilc.270.1605110603170;
        Wed, 11 Nov 2020 08:03:23 -0800 (PST)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net. [24.9.64.241])
        by smtp.gmail.com with ESMTPSA id x14sm1533054ior.7.2020.11.11.08.03.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Nov 2020 08:03:22 -0800 (PST)
Subject: Re: [PATCH 00/13] Introduce seqnum_ops
To:     Matthew Wilcox <willy@infradead.org>
Cc:     corbet@lwn.net, keescook@chromium.org, gregkh@linuxfoundation.org,
        peterz@infradead.org, rafael@kernel.org, lenb@kernel.org,
        james.morse@arm.com, tony.luck@intel.com, bp@alien8.de,
        minyard@acm.org, arnd@arndb.de, mchehab@kernel.org,
        rric@kernel.org, valentina.manea.m@gmail.com, shuah@kernel.org,
        zohar@linux.ibm.com, dmitry.kasatkin@gmail.com, jmorris@namei.org,
        serge@hallyn.com, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
        linux-acpi@vger.kernel.org,
        openipmi-developer@lists.sourceforge.net,
        linux-edac@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-integrity@vger.kernel.org,
        linux-security-module@vger.kernel.org, skhan@linuxfoundation.org
References: <cover.1605027593.git.skhan@linuxfoundation.org>
 <20201111043304.GS17076@casper.infradead.org>
From:   Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <e84de5d0-f2b2-5481-eb8e-47370d632c4d@linuxfoundation.org>
Date:   Wed, 11 Nov 2020 09:03:20 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.2
MIME-Version: 1.0
In-Reply-To: <20201111043304.GS17076@casper.infradead.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 11/10/20 9:33 PM, Matthew Wilcox wrote:
> On Tue, Nov 10, 2020 at 12:53:26PM -0700, Shuah Khan wrote:
>> There are a number of atomic_t usages in the kernel where atomic_t api
>> is used strictly for counting sequence numbers and other statistical
>> counters and not for managing object lifetime.
> 
> We already have something in Linux called a sequence counter, and it's
> different from this.  ID counter?  instance number?  monotonic_t?  stat_t?
> 

No results for monotonic_t or stat_t. Can you give me a pointer to what
your referring to.

thanks,
-- Shuah
