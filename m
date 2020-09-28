Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5049527B175
	for <lists+linux-doc@lfdr.de>; Mon, 28 Sep 2020 18:11:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726500AbgI1QK6 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 28 Sep 2020 12:10:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726393AbgI1QK6 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 28 Sep 2020 12:10:58 -0400
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com [IPv6:2a00:1450:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18B9FC061755
        for <linux-doc@vger.kernel.org>; Mon, 28 Sep 2020 09:10:58 -0700 (PDT)
Received: by mail-ed1-x543.google.com with SMTP id c8so1979803edv.5
        for <linux-doc@vger.kernel.org>; Mon, 28 Sep 2020 09:10:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=sSbjOkpOXa/SRNzUYaJC32SvSqb9G8e3qi87JReDiYc=;
        b=i+be8AIJwl8mLk0ZeQtg25l5e4K8bjRLO7Y4bvHYxsM9jdWRhhYd13bbuqqd1qDtml
         4W3i+ijZaC6+QmQodqW6d+u59gvdOcXbfmJ9Upfk+e513jAIkpNNjZNbtFcptfEvjnDw
         LA4rBujnIZKjFNT8Jb/WGEwcv7iZ6yMdAw4outujy6PxTJWYcTpTcl+j0ZdvOsKVSuxy
         UPHsQmTPtiHzvRq11ffEgYMwlA38C0+8iuTJgTILdeslE8Hp3GEfsm8u8lvZnw91s1qv
         uW7rN17+dob3i9cuZsXm8i1ZfoSh9AmSQIBgD3w5yaUG0UuO9doJ5UnWLBaa9hGvGyHt
         uPGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sSbjOkpOXa/SRNzUYaJC32SvSqb9G8e3qi87JReDiYc=;
        b=IPyY2pb9tNCxD9hzzz55eXB/4hzWFX+tHWfkP1EFJgwDw+8zaYgaxN0OjZMpe9qpKo
         nbytnNDcDKFjdPcFaMyWgYXiL7k+SQBnsixzW3mbH5PobLIgwf3MWzrgO0vRzW2mHqXK
         JtbP9O7qJXv0bgBlwvv9E5FlrV1c7WOsFEqoy7nJ6xaORUFbWP9D8bdB3u3rcGlZ9OsD
         G0B3EQE4/UHq3Y40BD8Rue3AKDDMupHGqoJO3JXy2I8szWX528NFTsKZrkePHLlxl6QO
         vhbn0GWYAdZOwLssVbD8ffzj0GL7qQCyQ0xE5xeCdloKW2ikoBnm56iwUSydZ7kauKm+
         mgaw==
X-Gm-Message-State: AOAM533tLMy4ygQnbhvgXhEdtGQFWb7oshychNHWYeDeWDhO5iW/KgcH
        pI0VoGsf3rRGUdMSvoXVtnesN7Qf7q6W+XuMgptXZg==
X-Google-Smtp-Source: ABdhPJwYItVzot76ygzrdbjuR8fOpjHu0HmDjOzOQdO0BgKrxV0xWHbZ927LIgqGhMMC16072uc89SppgiT8bNfs5K8=
X-Received: by 2002:a50:e78f:: with SMTP id b15mr2661553edn.104.1601309456646;
 Mon, 28 Sep 2020 09:10:56 -0700 (PDT)
MIME-Version: 1.0
References: <20200925143422.21718-1-graf@amazon.com> <20200925143422.21718-9-graf@amazon.com>
In-Reply-To: <20200925143422.21718-9-graf@amazon.com>
From:   Aaron Lewis <aaronlewis@google.com>
Date:   Mon, 28 Sep 2020 09:10:45 -0700
Message-ID: <CAAAPnDFwABBaviHFCspa7222=thJStAPK6tL8jd_2CnMsH--2A@mail.gmail.com>
Subject: Re: [PATCH v8 8/8] KVM: selftests: Add test for user space MSR handling
To:     Alexander Graf <graf@amazon.com>
Cc:     kvm list <kvm@vger.kernel.org>,
        Sean Christopherson <sean.j.christopherson@intel.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Vitaly Kuznetsov <vkuznets@redhat.com>,
        Wanpeng Li <wanpengli@tencent.com>,
        Jim Mattson <jmattson@google.com>,
        Joerg Roedel <joro@8bytes.org>,
        KarimAllah Raslan <karahmed@amazon.de>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Maxim Levitsky <mlevitsk@redhat.com>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Sep 25, 2020 at 7:36 AM Alexander Graf <graf@amazon.com> wrote:
>
> Now that we have the ability to handle MSRs from user space and also to
> select which ones we do want to prevent in-kernel KVM code from handling,
> let's add a selftest to show case and verify the API.
>
> Signed-off-by: Alexander Graf <graf@amazon.com>

Reviewed-by: Aaron Lewis <aaronlewis@google.com>

>
> ---
>
> v2 -> v3:
>
>   - s/KVM_CAP_ADD_MSR_ALLOWLIST/KVM_CAP_X86_MSR_ALLOWLIST/g
>   - Add test to clear whitelist
>   - Adjust to reply-less API
>   - Fix asserts
>   - Actually trap on MSR_IA32_POWER_CTL writes
>
> v5 -> v6:
>
>   - Adapt to new ioctl API
>   - Check for passthrough MSRs
>   - Check for filter exit reason
>   - Add .gitignore
>
