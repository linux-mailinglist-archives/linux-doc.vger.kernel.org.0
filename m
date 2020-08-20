Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DBD0824AD12
	for <lists+linux-doc@lfdr.de>; Thu, 20 Aug 2020 04:47:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726741AbgHTCri (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 19 Aug 2020 22:47:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726735AbgHTCrg (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 19 Aug 2020 22:47:36 -0400
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com [IPv6:2607:f8b0:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86FEBC061383
        for <linux-doc@vger.kernel.org>; Wed, 19 Aug 2020 19:47:36 -0700 (PDT)
Received: by mail-oi1-x244.google.com with SMTP id u24so797360oic.7
        for <linux-doc@vger.kernel.org>; Wed, 19 Aug 2020 19:47:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xfDH+S997URl4jyz8F0i4sHZ1MqQgFzjhRKMHTCjfHo=;
        b=gVPWYW+3j/AcWKLc3KV4NYbhQITuq5Q/GEeFgOh5PfQTlqj7vQvilcmgmIllA8t4eX
         Sdk3sdnbs60wBu1xObrnZoPB7l4CzCJ9mLg26fpDRUE8tY6w/epVGJ58psd2w/W+fMJt
         vAInXmH2HvOVw6c14vKndSF6OeLggz+nTgLjYCd8Z57kGr4hKZGSY9hwfTt9hS7QSobF
         dsWsM+vJmB9IYHksv/yd3Oo6Nzfr2Y+MUvYjyK0ubeJEaVueMZs5I1ww05HDqGaQTCLT
         ro4dG/4d/vEf4u+rd3siB8GN8oJp0QvBFeNI0xz+MT3l2aDpjkyamQ38OWv/Y49NTvyd
         rs1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xfDH+S997URl4jyz8F0i4sHZ1MqQgFzjhRKMHTCjfHo=;
        b=pv479a9ZfaFYajYyWZWI1rwhKvkQykZarjTAgdAsmE0A8xj1Qb+ndAcv+RJ+Js5At/
         JoepKY69aXZigulWvQCE34LTMaBqtK/xIiO9VNvr02EU1Snnkj2nrC152coKQ36AEhDh
         AlTMCfJuhFbE7VoXKsIxX++MehvrojyjfWPPMdbqthMzLQtqZA8t1J7g0Fv31equnMCh
         JyWaRsji4lYkFj3Jh8p5RSo9j/imNL7syurzHtmBHCVB5xkHQUPk8IcANpcZM6jJSbN2
         F9tw9b8BJgyHanHNp90kiVuPXvXuHfG5K/zU47IDFfBmJMkUPa1Gn+L1bB0nq/mqbYn9
         31QQ==
X-Gm-Message-State: AOAM533nMvi/gn4SAFW5wzbofaNMFSg6l1P3JFlbA96khJUXp5blBSBx
        xT0cgjAKhO3BGf/nVYtK4Q9t9LioVtmeoPw0kVuNHA==
X-Google-Smtp-Source: ABdhPJyh0hXm+lKNMNH5D6Pu1Tq7QjFjPmmIR6tcSPaTylPqNuKgpQjK0/iYSEFIqpyvSDC/lfaIvQwqqjAA+YaewVs=
X-Received: by 2002:aca:670b:: with SMTP id z11mr671653oix.6.1597891652183;
 Wed, 19 Aug 2020 19:47:32 -0700 (PDT)
MIME-Version: 1.0
References: <20200803211423.29398-1-graf@amazon.com> <CALMp9eRHmhmKP21jmBr13n3DvttPg9OQEn5Zn0LxyiKiq2uTkA@mail.gmail.com>
 <B0FD5408-E2C1-444C-AFCE-7C622EA75F66@amazon.de> <CALMp9eS5+mV2SC-v4gusocrWtXpm-QzGoOTDGhFS9NEmuVNTDw@mail.gmail.com>
In-Reply-To: <CALMp9eS5+mV2SC-v4gusocrWtXpm-QzGoOTDGhFS9NEmuVNTDw@mail.gmail.com>
From:   Jim Mattson <jmattson@google.com>
Date:   Wed, 19 Aug 2020 19:47:21 -0700
Message-ID: <CALMp9eTDJx9PNDwi+O-_b9O6tBAWEvW-0RAoHYV7inEhw+b42Q@mail.gmail.com>
Subject: Re: [PATCH v4 0/3] Allow user space to restrict and augment MSR emulation
To:     "Graf (AWS), Alexander" <graf@amazon.de>
Cc:     Paolo Bonzini <pbonzini@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Sean Christopherson <sean.j.christopherson@intel.com>,
        Vitaly Kuznetsov <vkuznets@redhat.com>,
        Wanpeng Li <wanpengli@tencent.com>,
        Joerg Roedel <joro@8bytes.org>,
        "Raslan, KarimAllah" <karahmed@amazon.de>,
        Aaron Lewis <aaronlewis@google.com>,
        kvm list <kvm@vger.kernel.org>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Aug 19, 2020 at 3:09 PM Jim Mattson <jmattson@google.com> wrote:
>
> On Wed, Aug 19, 2020 at 2:46 PM Graf (AWS), Alexander <graf@amazon.de> wrote:
>
> > Special MSRs like EFER also irritate me a bit. We can't really trap on them - most code paths just know they're handled in kernel. Maybe I'll add some sanity checks as well...
>
> Why can't we intercept EFER?

Some MSRs (IA32_GSBASE comes to mind) can't be completely handled by
userspace, even if we do intercept RDMSR and WRMSR. The EFER.LMA bit
also falls into that category, though the rest of the register isn't a
problem (and EFER.LMA is always derivable). Is that what you meant?
