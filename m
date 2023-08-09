Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 83025775ECD
	for <lists+linux-doc@lfdr.de>; Wed,  9 Aug 2023 14:22:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232229AbjHIMV7 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 9 Aug 2023 08:21:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232231AbjHIMV4 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 9 Aug 2023 08:21:56 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B48D1BF7
        for <linux-doc@vger.kernel.org>; Wed,  9 Aug 2023 05:21:55 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-5230df1ce4fso8991092a12.1
        for <linux-doc@vger.kernel.org>; Wed, 09 Aug 2023 05:21:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20221208.gappssmtp.com; s=20221208; t=1691583714; x=1692188514;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gse4lQ89R/swNYJYWFRKmfEvRYWCgDAQeQk+i+FC3Qc=;
        b=z4Z49MED7B2iO1P22Sflcd12HqFoBF5yfCPEmSnPuw92T8YnUDH2KmdmqK/zmm3Hsv
         Y1A4Myz/vjPMCMyAiAMJtrC215szsuavogK4ztLxqkGSQO7aPAZzUkD1Ozkyv7H3dSaL
         qsE22vwvMjFkqhjUQQdHhf2t+Y2yF2VZL5Bid1o6X2mZ0zwKa1F0dMm02EOtwX7YI8oZ
         kQr4IP0wXNHwqQREssTv7kAUZWMAwp8PYn9E03Y7mqOyy+xa2JAZIQ2g56zk0jeEXZhW
         kRD0s2bF7FjY+mFqcKXFd8fyuF9dqKo3ka5wJ+o55aO6bmVU6NblI+YE2iiYmI3rXl30
         +XNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691583714; x=1692188514;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gse4lQ89R/swNYJYWFRKmfEvRYWCgDAQeQk+i+FC3Qc=;
        b=WEzoT2xoKLr7l6BsumwWkpGx8UXupLBNrpMBwe9K1hK+UYmqLCGsky9f8HeH32v6C5
         7qr1PiEXYmIEOYk8svgmWKhL86KNZHTwUorp73QLpbcRddALZ0unwTpNjo+KJxxFURLb
         B3NX27aTb7AtvmpxDTuIpj3Xmdm2yhodPP9vkka/FvMc5o7hROSK49KFCfHFL82ebOtb
         Sp1jNt/ouvqlX3exIErzXSF+c6gepf+MH5wTOCZogOO17zHYBycwdoKO3cqeS4KU3/5X
         vcRzqQ5EBhmI5NUS0LpSzZVhfRvwU7oI+wE3B7v/HzMrPTz18i3Tsh8CC5hqj2IBIzUv
         KVLw==
X-Gm-Message-State: AOJu0YwOGzSSOIY/a3I5RyvlCOo8K1ny1V3q748qgdhje/8kr1xkqAYI
        UJ6pwKHuzrj7Stkg2icbrcUrxv4oZbRs1/qKMRsQrQ==
X-Google-Smtp-Source: AGHT+IEllS//Vo5DIeilEm06so+oXBAZVZjqk1bluFXrO7jOq/QKmFdOTXQUqzX5tkMzooCga5rA10uXjLIWp+wEMZQ=
X-Received: by 2002:aa7:d912:0:b0:522:1e2f:99db with SMTP id
 a18-20020aa7d912000000b005221e2f99dbmr2557441edr.5.1691583713714; Wed, 09 Aug
 2023 05:21:53 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1690273969.git.haibo1.xu@intel.com> <CAAhSdy0yug=J0nxnnPoLYL=0MiT0w6qgPYOcv0QwMRe+fsQn8Q@mail.gmail.com>
 <87y1ilpz3m.wl-maz@kernel.org>
In-Reply-To: <87y1ilpz3m.wl-maz@kernel.org>
From:   Anup Patel <anup@brainfault.org>
Date:   Wed, 9 Aug 2023 17:51:41 +0530
Message-ID: <CAAhSdy3f9cyh_b9Z9ah9QOdqWUMzhMV39hxUqVCStOc2FWRYDQ@mail.gmail.com>
Subject: Re: [PATCH v6 00/13] RISCV: Add KVM_GET_REG_LIST API
To:     Marc Zyngier <maz@kernel.org>
Cc:     oliver.upton@linux.dev, xiaobo55x@gmail.com,
        ajones@ventanamicro.com, seanjc@google.com,
        Paolo Bonzini <pbonzini@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Atish Patra <atishp@atishpatra.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Shuah Khan <shuah@kernel.org>,
        James Morse <james.morse@arm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Zenghui Yu <yuzenghui@huawei.com>,
        Ricardo Koller <ricarkol@google.com>,
        Vishal Annapurve <vannapurve@google.com>,
        Like Xu <likexu@tencent.com>,
        Vipin Sharma <vipinsh@google.com>,
        David Matlack <dmatlack@google.com>,
        Colton Lewis <coltonlewis@google.com>, kvm@vger.kernel.org,
        Haibo Xu <haibo1.xu@intel.com>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, kvm-riscv@lists.infradead.org,
        linux-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Marc,

On Tue, Aug 8, 2023 at 4:42=E2=80=AFPM Marc Zyngier <maz@kernel.org> wrote:
>
> On Mon, 07 Aug 2023 04:48:33 +0100,
> Anup Patel <anup@brainfault.org> wrote:
> >
> > Hi Marc, Hi Oliver,
> >
> > On Tue, Jul 25, 2023 at 2:05=E2=80=AFPM Haibo Xu <haibo1.xu@intel.com> =
wrote:
> > >
> > > KVM_GET_REG_LIST will dump all register IDs that are available to
> > > KVM_GET/SET_ONE_REG and It's very useful to identify some platform
> > > regression issue during VM migration.
> > >
> > > Patch 1-7 re-structured the get-reg-list test in aarch64 to make some
> > > of the code as common test framework that can be shared by riscv.
> > >
> > > Patch 8 move reject_set check logic to a function so as to check for
> > > different errno for different registers.
> > > Patch 9 move finalize_vcpu back to run_test so that riscv can impleme=
nt
> > > its specific operation.
> > > Patch 10 change to do the get/set operation only on present-blessed l=
ist.
> > > Patch 11 add the skip_set facilities so that riscv can skip set opera=
tion
> > > on some registers.
> > > Patch 12 enabled the KVM_GET_REG_LIST API in riscv.
> > > patch 13 added the corresponding kselftest for checking possible
> > > register regressions.
> > >
> > > The get-reg-list kvm selftest was ported from aarch64 and tested with
> > > Linux v6.5-rc3 on a Qemu riscv64 virt machine.
> > >
> > > ---
> > > Changed since v5:
> > >   * Rebase to v6.5-rc3
> > >   * Minor fix for Andrew's comments
> > >
> > > Andrew Jones (7):
> > >   KVM: arm64: selftests: Replace str_with_index with strdup_printf
> > >   KVM: arm64: selftests: Drop SVE cap check in print_reg
> > >   KVM: arm64: selftests: Remove print_reg's dependency on vcpu_config
> > >   KVM: arm64: selftests: Rename vcpu_config and add to kvm_util.h
> > >   KVM: arm64: selftests: Delete core_reg_fixup
> > >   KVM: arm64: selftests: Split get-reg-list test code
> > >   KVM: arm64: selftests: Finish generalizing get-reg-list
> > >
> > > Haibo Xu (6):
> > >   KVM: arm64: selftests: Move reject_set check logic to a function
> > >   KVM: arm64: selftests: Move finalize_vcpu back to run_test
> > >   KVM: selftests: Only do get/set tests on present blessed list
> > >   KVM: selftests: Add skip_set facility to get_reg_list test
> > >   KVM: riscv: Add KVM_GET_REG_LIST API support
> > >   KVM: riscv: selftests: Add get-reg-list test
> >
> > Are you okay for this series to go through the KVM RISC-V tree ?
>
> Sure, seems fine from my point of view. But please put it on an
> immutable topic branch so that we can also merge it in the arm64 tree,
> should we need to resolve any conflicts.

I have created topic branch riscv_kvm_get_reg_list in the KVM RISC-V
repo https://github.com/kvm-riscv/linux.git.

This branch is based upon Linux-6.5-rc5 and also merged into the
riscv_kvm_next branch for the upcoming merge window.

Regards,
Anup
