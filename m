Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 72DB55BE5A0
	for <lists+linux-doc@lfdr.de>; Tue, 20 Sep 2022 14:23:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230474AbiITMXT (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 20 Sep 2022 08:23:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230469AbiITMXS (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 20 Sep 2022 08:23:18 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 561DF74CE9
        for <linux-doc@vger.kernel.org>; Tue, 20 Sep 2022 05:23:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1663676596;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=Elnu7bpANXPrM1PE7lHq91CUKuXWmTGmVUjcxfcQtwA=;
        b=OBveevzxjxixgRn21cJSilTOtBa89PXfZWy3vv5rkETQXOA2Gjck0m/pk2of/3Bhm9PftR
        qwI8mdsM8OGJGs6W68o1x8A+gzsG30I9NXHdvzKk2hWl8zafzVb0DugYiyj2cChm+ZF/3Q
        EXCD7GGYmT3dXrP/D17axlJr/Imgbf0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-632-w7ie62AuMA2p2FaXb2QrxA-1; Tue, 20 Sep 2022 08:23:09 -0400
X-MC-Unique: w7ie62AuMA2p2FaXb2QrxA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C4924862FE0;
        Tue, 20 Sep 2022 12:23:08 +0000 (UTC)
Received: from t480s.redhat.com (unknown [10.39.195.16])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 016C9C15BBC;
        Tue, 20 Sep 2022 12:23:03 +0000 (UTC)
From:   David Hildenbrand <david@redhat.com>
To:     linux-kernel@vger.kernel.org
Cc:     linux-mm@kvack.org, linux-doc@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org,
        David Hildenbrand <david@redhat.com>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Ingo Molnar <mingo@kernel.org>,
        David Laight <David.Laight@ACULAB.COM>,
        Jonathan Corbet <corbet@lwn.net>,
        Andy Whitcroft <apw@canonical.com>,
        Joe Perches <joe@perches.com>,
        Dwaipayan Ray <dwaipayanray1@gmail.com>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        Baoquan He <bhe@redhat.com>, Vivek Goyal <vgoyal@redhat.com>,
        Dave Young <dyoung@redhat.com>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v1 0/3] coding-style.rst: document BUG() and WARN() rules
Date:   Tue, 20 Sep 2022 14:22:59 +0200
Message-Id: <20220920122302.99195-1-david@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

As it seems to be rather unclear if/when to use BUG(), BUG_ON(),
VM_BUG_ON(), WARN_ON_ONCE(), ... let's try to document the result of a
recent discussion.

Details can be found in patch #1.

RFC -> v1:
* "coding-style.rst: document BUG() and WARN() rules ("do not crash the
   kernel")"
 -> Rephrase/extend according to John
 -> Add some details regarding the use of panic()
* powerpc/prom_init: drop PROM_BUG()
 -> Added
* "checkpatch: warn on usage of VM_BUG_ON() and other BUG variants"
 -> Warn on more variants


Cc: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Ingo Molnar <mingo@kernel.org>
Cc: David Laight <David.Laight@ACULAB.COM>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: Andy Whitcroft <apw@canonical.com>
Cc: Joe Perches <joe@perches.com>
Cc: Dwaipayan Ray <dwaipayanray1@gmail.com>
Cc: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: Baoquan He <bhe@redhat.com>
Cc: Vivek Goyal <vgoyal@redhat.com>
Cc: Dave Young <dyoung@redhat.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>

David Hildenbrand (3):
  coding-style.rst: document BUG() and WARN() rules ("do not crash the
    kernel")
  powerpc/prom_init: drop PROM_BUG()
  checkpatch: warn on usage of VM_BUG_ON() and other BUG variants

 Documentation/process/coding-style.rst | 61 ++++++++++++++++++++++++++
 arch/powerpc/kernel/prom_init.c        |  6 ---
 scripts/checkpatch.pl                  |  6 +--
 3 files changed, 64 insertions(+), 9 deletions(-)

-- 
2.37.3

