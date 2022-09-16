Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ED7F15BA602
	for <lists+linux-doc@lfdr.de>; Fri, 16 Sep 2022 06:51:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229671AbiIPEv4 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 16 Sep 2022 00:51:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229562AbiIPEvz (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 16 Sep 2022 00:51:55 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8BAD4A0274
        for <linux-doc@vger.kernel.org>; Thu, 15 Sep 2022 21:51:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1663303913;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=ZrlYoSR0t0sSR123GOVAJxEfCWOvnKpItP6M0/Vrog0=;
        b=Nd1nrKQCQz94DTs3utuYLpWuCWSgj+BWoJF3CfDp0f1awsRvqfF7gk3ThMjotcp/L9PEsP
        eVxxjWGGA2hOQDoCtlR2Ra43seQfdC/biU+2XYVG/1kkEBE15BlJH1OlTaiSSp1l059dFh
        F0dHiZ9iCuzvktMETR0NtCMCRkPjgEA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-495-HQsuENMbNjO1T32TYAyMaA-1; Fri, 16 Sep 2022 00:51:48 -0400
X-MC-Unique: HQsuENMbNjO1T32TYAyMaA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BFB52862FDF;
        Fri, 16 Sep 2022 04:51:47 +0000 (UTC)
Received: from gshan.redhat.com (vpn2-54-126.bne.redhat.com [10.64.54.126])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 2795D140EBF3;
        Fri, 16 Sep 2022 04:51:40 +0000 (UTC)
From:   Gavin Shan <gshan@redhat.com>
To:     kvmarm@lists.cs.columbia.edu
Cc:     kvm@vger.kernel.org, linux-doc@vger.kernel.org,
        catalin.marinas@arm.com, linux-kselftest@vger.kernel.org,
        bgardon@google.com, shuah@kernel.org, corbet@lwn.net,
        maz@kernel.org, drjones@redhat.com, will@kernel.org,
        zhenyzha@redhat.com, dmatlack@google.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        pbonzini@redhat.com, peterx@redhat.com, oliver.upton@linux.dev,
        shan.gavin@gmail.com
Subject: [PATCH v2 0/5] KVM: arm64: Enable ring-based dirty memory tracking
Date:   Fri, 16 Sep 2022 12:51:30 +0800
Message-Id: <20220916045135.154505-1-gshan@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This series enables the ring-based dirty memory tracking for ARM64.
The feature has been available and enabled on x86 for a while. It
is beneficial when the number of dirty pages is small in a checkpointing
system or live migration scenario. More details can be found from
fb04a1eddb1a ("KVM: X86: Implement ring-based dirty memory tracking").

The generic part has been comprehensive, meaning there isn't too much
work, needed to extend it to ARM64.

- PATCH[1]   introduces KVM_REQ_RING_SOFT_FULL for x86
- PATCH[2]   enables the feature on ARM64
- PATCH[3-5] improves kvm/selftests/dirty_log_test

v1: https://lore.kernel.org/lkml/20220819005601.198436-1-gshan@redhat.com

Testing
=======

(1) kvm/selftests/dirty_log_test
(2) Live migration by QEMU

Changelog
=========
v2:
  * Introduce KVM_REQ_RING_SOFT_FULL                         (Marc)
  * Changelog improvement                                    (Marc)
  * Fix dirty_log_test without knowing host page size        (Drew)

Gavin Shan (5):
  KVM: x86: Introduce KVM_REQ_RING_SOFT_FULL
  KVM: arm64: Enable ring-based dirty memory tracking
  KVM: selftests: Use host page size to map ring buffer in
    dirty_log_test
  KVM: selftests: Clear dirty ring states between two modes in
    dirty_log_test
  KVM: selftests: Automate choosing dirty ring size in dirty_log_test

 Documentation/virt/kvm/api.rst               |  2 +-
 arch/arm64/include/uapi/asm/kvm.h            |  1 +
 arch/arm64/kvm/Kconfig                       |  1 +
 arch/arm64/kvm/arm.c                         |  8 +++
 arch/x86/kvm/x86.c                           |  5 +-
 include/linux/kvm_host.h                     |  1 +
 tools/testing/selftests/kvm/dirty_log_test.c | 53 ++++++++++++++------
 tools/testing/selftests/kvm/lib/kvm_util.c   |  2 +-
 virt/kvm/dirty_ring.c                        |  4 ++
 9 files changed, 59 insertions(+), 18 deletions(-)

-- 
2.23.0

