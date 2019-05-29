Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B40612D347
	for <lists+linux-doc@lfdr.de>; Wed, 29 May 2019 03:26:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725935AbfE2B0j (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 28 May 2019 21:26:39 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:32887 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725816AbfE2B0j (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 28 May 2019 21:26:39 -0400
Received: by mail-wr1-f67.google.com with SMTP id d9so476269wrx.0
        for <linux-doc@vger.kernel.org>; Tue, 28 May 2019 18:26:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=rmRCqN5V69njNKzXqsufXyHQFr1ecAJaoY5I9r8Jg/A=;
        b=uSzkMaXRZOYFzayBx0nG+bDtheN/xm5sjqgN8aZo14nedMyjaSzxk4cJ/YYQwTY1UY
         beoy6DJbC18AdxcYEBnNJ7zBBkqzoItLGh58Odjk17IzaelzypcxBT5bt5Evmii4icGQ
         pMIubbKcJbXE3FMIX7t6axiil3gp2e5oy7100RmQu5HtNfa0ICDx5LmkDM7wbZVtv8Nj
         Yh77odvrC0p/nR1LcwDGW5P9YX0UUTpt/AR2P68EgrO70Ah9miMxrHykKzB/hnpOAEAP
         2kdo7tHGjAtAHtr/3ywgLd6x/7+bhqq5GKEHvl8//Iwj+StGF2q44pIHgHYETffDCor+
         AfxQ==
X-Gm-Message-State: APjAAAURDScsNMNO4W5+61o7GvY+fqr4q0zIfN2rrEgkwEXr6Z6e4v/8
        04B0xYyTW5fweiClGX9zY+0nKXyHC9E=
X-Google-Smtp-Source: APXvYqwX1usmVw6q1CDoi4OTK+z6UWAWXKZZFyXo6pMfhnLF9gUifvkPOsRu9b8SygmMeO8p8Yt+mQ==
X-Received: by 2002:adf:ba47:: with SMTP id t7mr18702012wrg.175.1559093197515;
        Tue, 28 May 2019 18:26:37 -0700 (PDT)
Received: from [192.168.10.150] ([93.56.166.5])
        by smtp.gmail.com with ESMTPSA id d26sm3816595wmb.4.2019.05.28.18.26.36
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 28 May 2019 18:26:36 -0700 (PDT)
Subject: Re: [PATCH v2 1/3] KVM: x86: add support for user wait instructions
To:     Tao Xu <tao3.xu@intel.com>, Wanpeng Li <kernellwp@gmail.com>
Cc:     Peter Zijlstra <peterz@infradead.org>,
        Radim Krcmar <rkrcmar@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Sean Christopherson <sean.j.christopherson@intel.com>,
        the arch/x86 maintainers <x86@kernel.org>,
        kvm <kvm@vger.kernel.org>, linux-doc@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>, jingqi.liu@intel.com
References: <20190524075637.29496-1-tao3.xu@intel.com>
 <20190524075637.29496-2-tao3.xu@intel.com>
 <20190527103003.GX2623@hirez.programming.kicks-ass.net>
 <43e2a62a-e992-2138-f038-1e4b2fb79ad1@intel.com>
 <CANRm+CwnJoj0EwWoFC44SXVUTLdE+iFGovaMr4Yf=OzbaW36sA@mail.gmail.com>
 <072dd34e-0361-5a06-4d0b-d04e8150a3bb@intel.com>
From:   Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <f1d739ba-8499-1f41-5515-c53c6dd7f3d2@redhat.com>
Date:   Wed, 29 May 2019 03:26:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <072dd34e-0361-5a06-4d0b-d04e8150a3bb@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 28/05/19 09:19, Tao Xu wrote:
> 
> Thank you! This information really helped me. After I read the code in
> KVM/QEMU, I was wondering that with qemu command-line "-cpu
> host,+kvm-hint-dedicated", then in KVM,
> "kvm_hint_has_feature(KVM_HINTS_DEDICATED)" will be true, am I right?

Yes, but it doesn't matter for this patch series.

Paolo
