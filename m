Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 39F0369B70A
	for <lists+linux-doc@lfdr.de>; Sat, 18 Feb 2023 01:44:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229924AbjBRAow (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 17 Feb 2023 19:44:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230204AbjBRAov (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 17 Feb 2023 19:44:51 -0500
Received: from mail-pl1-x649.google.com (mail-pl1-x649.google.com [IPv6:2607:f8b0:4864:20::649])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C32F22A19
        for <linux-doc@vger.kernel.org>; Fri, 17 Feb 2023 16:44:17 -0800 (PST)
Received: by mail-pl1-x649.google.com with SMTP id c14-20020a170902d48e00b0019a94475927so1174721plg.3
        for <linux-doc@vger.kernel.org>; Fri, 17 Feb 2023 16:44:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IBSmhJ9ipoo0Oy2qay0G1ptCUfzuQODOJj/hstMVcmk=;
        b=imEYDxwwEn/4CYQJK/xJbuIKiY4mo1+nmV8jIzdJV4eI/764dz2m+meDh01JJx5t6S
         UIDNGlzyUfdjUTeiAJzDkPKXM9ee8xLByXrj//WGSQK41Cv/mEvHlEm6RlwI6jwkSLed
         hos8h3ENVYDv87MnLgF7CM4L7vKUHazOqBLi/CiV+d+RzuXI890doOjYQvUc62aO48q7
         dm6NLSSGIcCfcUC2cr4b2EIp8NOescyaa3gXQ5KN84+KXumeahL4bqGEJcSFMld18wEW
         NhulrdZvIphBlSYDfp+H6ogHt67d94O36qMzB3gwpX83PL5ljNrIzL+GKkQGwlnPgWtv
         rrWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IBSmhJ9ipoo0Oy2qay0G1ptCUfzuQODOJj/hstMVcmk=;
        b=lnJjWwDz3EZNCelfw4m8DKzfeV1f5wrja0DdtOoXfuDKo5sHikHtCkUijSKQK9U7sO
         f2vKUmCAPMJa7tCpkcw3gUwLa4qdTFpbqpwB5jzf2Iafq5LyhgnlZ8a4Luk1PDPOnRzb
         m0quuauPj9RgCxBXbzkhgovMi9U+BbWLsm1z4i0DF93z5+5Bm2mnOVQBJ6/okpjKHaJZ
         G+6keQGCu+H8ebhYWpNKAoDXibVhNH/0xsJ21OaXDfLsnR/iS5U797WmyX8L3uetOg6x
         f1syqEJOw/ccyUsu+7/DzrnwWxie7jmKxON0OI4g8gyOqe2Hmc8jW59o/zb27ay5wrSY
         WIaw==
X-Gm-Message-State: AO0yUKX5Ok1YRJ2mAtedSsyRyebqIyX1dSY1P0X8bXcl6JY677yCnHZB
        RtXUFB/r2TAizLJZglZ+tshj3xbOOZ72uFpdiw==
X-Google-Smtp-Source: AK7set8P2InLokX7h6SGTjLxGcvTxlMTNEl08mJjOuceq+afgJzVx8eL5P++cDQs2DMPcv+E/m77nUCKI6PeSSOwnQ==
X-Received: from ackerleytng-cloudtop.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:1f5f])
 (user=ackerleytng job=sendgmr) by 2002:a17:902:f782:b0:19a:b627:b260 with
 SMTP id q2-20020a170902f78200b0019ab627b260mr419572pln.12.1676680988770; Fri,
 17 Feb 2023 16:43:08 -0800 (PST)
Date:   Sat, 18 Feb 2023 00:43:00 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.39.2.637.g21b0678d19-goog
Message-ID: <cover.1676680548.git.ackerleytng@google.com>
Subject: [RFC PATCH 0/2] Add flag as THP allocation hint for
 memfd_restricted() syscall
From:   Ackerley Tng <ackerleytng@google.com>
To:     kvm@vger.kernel.org, linux-api@vger.kernel.org,
        linux-arch@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, qemu-devel@nongnu.org
Cc:     aarcange@redhat.com, ak@linux.intel.com, akpm@linux-foundation.org,
        arnd@arndb.de, bfields@fieldses.org, bp@alien8.de,
        chao.p.peng@linux.intel.com, corbet@lwn.net, dave.hansen@intel.com,
        david@redhat.com, ddutile@redhat.com, dhildenb@redhat.com,
        hpa@zytor.com, hughd@google.com, jlayton@kernel.org,
        jmattson@google.com, joro@8bytes.org, jun.nakajima@intel.com,
        kirill.shutemov@linux.intel.com, linmiaohe@huawei.com,
        luto@kernel.org, mail@maciej.szmigiero.name, mhocko@suse.com,
        michael.roth@amd.com, mingo@redhat.com, naoya.horiguchi@nec.com,
        pbonzini@redhat.com, qperret@google.com, rppt@kernel.org,
        seanjc@google.com, shuah@kernel.org, steven.price@arm.com,
        tabba@google.com, tglx@linutronix.de, vannapurve@google.com,
        vbabka@suse.cz, vkuznets@redhat.com, wanpengli@tencent.com,
        wei.w.wang@intel.com, x86@kernel.org, yu.c.zhang@linux.intel.com,
        Ackerley Tng <ackerleytng@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-9.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hello,

This patchset builds upon the memfd_restricted() system call that has
been discussed in the =E2=80=98KVM: mm: fd-based approach for supporting KV=
M=E2=80=99
patch series, at
https://lore.kernel.org/lkml/20221202061347.1070246-1-chao.p.peng@linux.int=
el.com/T/#m7e944d7892afdd1d62a03a287bd488c56e377b0c

The tree can be found at:
https://github.com/googleprodkernel/linux-cc/tree/restrictedmem-rmfd-hugepa=
ge

Following the RFC to provide mount for memfd_restricted() syscall at
https://lore.kernel.org/lkml/cover.1676507663.git.ackerleytng@google.com/T/=
#u,
this patchset adds the RMFD_HUGEPAGE flag to the memfd_restricted()
syscall, which will hint the kernel to use Transparent HugePages to
back restrictedmem pages.

This supplements the interface proposed earlier, which requires the
creation of a tmpfs mount to be passed to memfd_restricted(), with a
more direct per-file hint.

Dependencies:

+ Sean=E2=80=99s iteration of the =E2=80=98KVM: mm: fd-based approach for s=
upporting
  KVM=E2=80=99 patch series at
  https://github.com/sean-jc/linux/tree/x86/upm_base_support
+ Proposed fix for restrictedmem_getattr() as mentioned on the mailing
  list at
  https://lore.kernel.org/lkml/diqzzga0fv96.fsf@ackerleytng-cloudtop-sg.c.g=
ooglers.com/
+ Hugh=E2=80=99s patch:
  https://lore.kernel.org/lkml/c140f56a-1aa3-f7ae-b7d1-93da7d5a3572@google.=
com/,
  which provides functionality in shmem that reads the VM_HUGEPAGE
  flag in key functions shmem_is_huge() and shmem_get_inode()

Future work/TODOs:
+ man page for the memfd_restricted() syscall
+ Support for per file NUMA binding hints

Ackerley Tng (2):
  mm: restrictedmem: Add flag as THP allocation hint for
    memfd_restricted() syscall
  selftests: restrictedmem: Add selftest for RMFD_HUGEPAGE

 include/uapi/linux/restrictedmem.h            |  1 +
 mm/restrictedmem.c                            | 27 ++++++++++++-------
 .../restrictedmem_hugepage_test.c             | 25 +++++++++++++++++
 3 files changed, 43 insertions(+), 10 deletions(-)

--
2.39.2.637.g21b0678d19-goog
