Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E16867B229C
	for <lists+linux-doc@lfdr.de>; Thu, 28 Sep 2023 18:40:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229639AbjI1Qk6 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 28 Sep 2023 12:40:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230345AbjI1Qk5 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 28 Sep 2023 12:40:57 -0400
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com [IPv6:2607:f8b0:4864:20::114a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37A45195
        for <linux-doc@vger.kernel.org>; Thu, 28 Sep 2023 09:40:56 -0700 (PDT)
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-5a213b4d0efso43464607b3.2
        for <linux-doc@vger.kernel.org>; Thu, 28 Sep 2023 09:40:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1695919255; x=1696524055; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=tBEUkwjwq5UFdHteB4WhQa6CsXOHrHL1+0Fdr1kCwk0=;
        b=pBkOeIe7Kut1qylEZkkVRSdi0EImRlCbUUAQB4VLo/LmOTcziyljp4u4EngDqx0FEb
         QRcP5t2i9uLfaEbGJ4l26syfxT8EfaqSzkDmOPC1D0ZcQPPpme1z2M3GtHoosQ/U9d6l
         9GP8XdcdYn0p47KQ+A5h+T+VdEk9H/wnAKTWauf7X/V0nL8Rw0bCIT//4JeEpqfZ/u1u
         EVHHHTVplNKlEH07l8oVl/xFxrXBpwoqNCaZKAhEIzJOAFSFx+SCVoUq91+vGXWyWTZl
         4DLaGFzEgqmCYiqJo//jTxRoCo9v9PzNX/p8xyt5WtX5UYWvjerNRcpOTLPU+SLsqQq7
         m8+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695919255; x=1696524055;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tBEUkwjwq5UFdHteB4WhQa6CsXOHrHL1+0Fdr1kCwk0=;
        b=lpC+CSCvkcLUREeSL6SKnfzTC0ZweKTeG6M1qFajuTWM/nBnH7FpaG5uVaMepi/50V
         JVDUhwbVc8EfrSq5Kquydjh/iabIZHITQfPEkDZ04ux+IhzaVwH1MVEhGsJlvJuqhrff
         HKhKPA1zfzbyfM5LgMEyPoxvpw+gzvliVxMsUw7yMkGQXjUH0d0cgkZc3H7n0FvdkZS8
         +geePUOlbHkl9uW6GgviZ42R4jBVc8RcqI2d6sU52SRLF5y9RI++CBO5HdrxokYg0JpU
         l/eeWn+e4+T5t7dMYF47k/8iWWhsxQiR45HP5IT1NJmnGJhjuS6+PsAlutjdLhCGbDsG
         sOAA==
X-Gm-Message-State: AOJu0YyiEGkkAokOi1FlJtJ8l5dHJLvha/EzxWUbGT+D71V/qbArmHzo
        LanM14Sw3toxntIziJYcTt9K/0PCcGY=
X-Google-Smtp-Source: AGHT+IGZteXePgwMhKyXEmU3Q56AhYSM4+Wnvm0Pv81t8fwUduxBTTPNR1CXa6hPrVuHMMskqSKmhj36Ink=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a81:b606:0:b0:58c:7cb1:10f with SMTP id
 u6-20020a81b606000000b0058c7cb1010fmr28657ywh.9.1695919255412; Thu, 28 Sep
 2023 09:40:55 -0700 (PDT)
Date:   Thu, 28 Sep 2023 09:40:38 -0700
In-Reply-To: <20230912184553.1887764-1-mizhang@google.com>
Mime-Version: 1.0
References: <20230912184553.1887764-1-mizhang@google.com>
X-Mailer: git-send-email 2.42.0.582.g8ccd20d70d-goog
Message-ID: <169591408039.965713.14488315088627563031.b4-ty@google.com>
Subject: Re: [PATCH v4 0/6] Update document description for kvm_mmu_page and kvm_mmu_page_role
From:   Sean Christopherson <seanjc@google.com>
To:     Sean Christopherson <seanjc@google.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Mingwei Zhang <mizhang@google.com>
Cc:     kvm@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Kai Huang <kai.huang@intel.com>,
        Jim Mattson <jmattson@google.com>,
        David Matlack <dmatlack@google.com>,
        Ben Gardon <bgardon@google.com>, Xu Yilun <yilun.xu@intel.com>,
        Zhi Wang <zhi.wang.linux@gmail.com>,
        Randy Dunlap <rdunlap@infradead.org>
Content-Type: text/plain; charset="utf-8"
X-Spam-Status: No, score=-9.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, 12 Sep 2023 18:45:47 +0000, Mingwei Zhang wrote:
> This is 4th version of the series, minor fixes as follows:
>  - correct the descripotion of tdp_mmu_root_count [seanjc]
>  - update the descripotion of mmu_valid_gen [seanjc]
> 
> v3: https://lore.kernel.org/all/20230801002127.534020-1-mizhang@google.com/
> 
> Mingwei Zhang (6):
>   KVM: Documentation: Add the missing description for guest_mode in
>     kvm_mmu_page_role
>   KVM: Documentation: Update the field name gfns and its description in
>     kvm_mmu_page
>   KVM: Documentation: Add the missing description for ptep in
>     kvm_mmu_page
>   KVM: Documentation: Add the missing description for tdp_mmu_root_count
>     into kvm_mmu_page
>   KVM: Documentation: Add the missing description for mmu_valid_gen into
>     kvm_mmu_page
>   KVM: Documentation: Add the missing description for tdp_mmu_page into
>     kvm_mmu_page
> 
> [...]

Applied to kvm-x86 docs, thanks!

[1/6] KVM: Documentation: Add the missing description for guest_mode in kvm_mmu_page_role
      https://github.com/kvm-x86/linux/commit/b207cfbc8c1d
[2/6] KVM: Documentation: Update the field name gfns and its description in kvm_mmu_page
      https://github.com/kvm-x86/linux/commit/fdaca560b6c4
[3/6] KVM: Documentation: Add the missing description for ptep in kvm_mmu_page
      https://github.com/kvm-x86/linux/commit/b40a2455e9eb
[4/6] KVM: Documentation: Add the missing description for tdp_mmu_root_count into kvm_mmu_page
      https://github.com/kvm-x86/linux/commit/6a713928ae1c
[5/6] KVM: Documentation: Add the missing description for mmu_valid_gen into kvm_mmu_page
      https://github.com/kvm-x86/linux/commit/c3204c406b6d
[6/6] KVM: Documentation: Add the missing description for tdp_mmu_page into kvm_mmu_page
      https://github.com/kvm-x86/linux/commit/78b5605d44e6

--
https://github.com/kvm-x86/linux/tree/next
