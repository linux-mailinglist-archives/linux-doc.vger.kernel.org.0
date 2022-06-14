Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6813354ADAF
	for <lists+linux-doc@lfdr.de>; Tue, 14 Jun 2022 11:51:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242839AbiFNJuQ (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 14 Jun 2022 05:50:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353079AbiFNJuJ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 14 Jun 2022 05:50:09 -0400
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89DE445AD2;
        Tue, 14 Jun 2022 02:50:05 -0700 (PDT)
Received: by mail-pf1-x434.google.com with SMTP id u2so8135996pfc.2;
        Tue, 14 Jun 2022 02:50:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=zVywUqSZV74Ep0YJsdOP8z6QAbTqUYyGb4i+24v4gN0=;
        b=h27KBJ81dBOKKEz8zTwikMqUMcLiw+SK1//yy9mgb7tSdvovMY1nW/4efhUDm+dDd0
         PFN9KwaF8pgqW1vEvVcujtYcV+oL79CeYXM5UW8vNsOqB7jNKaecoRxK9ZB5Y48BlVbH
         EGrdKT5JfxRPd46k2tBGdwwxMF6VVkaz7vQ8E2P/GI/9dtRJ/hOydELhfJ1q4a0IRTzy
         KWjeIKmagmFp4kDxouTNy2PSoPe9b1G33mW89ol5o5IEjoBK1hh0nP6hYBnRytIi1Lov
         Qrz1sluu4gl4qGDcoBfSVShzOjkweR+rYC1CRVTxj2eVGrrk1yb/rln4Ytr31S8VmTvC
         yWKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=zVywUqSZV74Ep0YJsdOP8z6QAbTqUYyGb4i+24v4gN0=;
        b=1qQdLuGoMG1XGszjjNpHYvYOqVrD/z68jhDLdyDnfFrEA2DeVmJH4vCdJxgE+j7AcW
         nMjKCqc/EIzgOv0dyfqvz7h8jejiGvoNoo/F8++JaCWR78AHMo8ctlqY4xeYlXV3BW9O
         /CWiiLdcteddFFoW5+b3JcgzpPT9Z86XLMb/u3/385rUfOoST+UulPMhBCks+8fIv/pK
         EJNSpMJwwr/T94pSatjfv5xpbWaPc1ZF9q5w82bXMriCwv1KUpYMYfkkKzkL3wFZoW+E
         WgV6eRrNBhrQsZgkHjN785b/xXY4uaKapOAiI5nTJ5Dt++Kw/cHHrHbtY4sLCYpsL4ps
         T4iA==
X-Gm-Message-State: AOAM531c07XGKjzfNg0k6xl17a36hS4U1+7EStJFsjLXIQcsDRHwiF4+
        eAN0fOnA9x3xEuIVfpl7hHqb0iO0+lo=
X-Google-Smtp-Source: ABdhPJxo/FABV6UoGV/bOZ9BZxnYosErm3uwomXUZ6yI9BlNDv2H3fkEkd6tOac5fIFRJ4u9lqOIBQ==
X-Received: by 2002:a63:121a:0:b0:405:3313:d77b with SMTP id h26-20020a63121a000000b004053313d77bmr3766495pgl.532.1655200205007;
        Tue, 14 Jun 2022 02:50:05 -0700 (PDT)
Received: from [192.168.11.5] (KD106167171201.ppp-bb.dion.ne.jp. [106.167.171.201])
        by smtp.gmail.com with ESMTPSA id z22-20020aa79496000000b0051bf9159d2dsm7049777pfk.208.2022.06.14.02.50.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jun 2022 02:50:04 -0700 (PDT)
Message-ID: <edc679f6-559a-ccbf-36f0-b64e61dde39a@gmail.com>
Date:   Tue, 14 Jun 2022 18:50:00 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: [PATCH v1 2/2] docs/memory-barriers.txt: Fixup long lines
Content-Language: en-US
To:     "Paul E. McKenney" <paulmck@linux.ibm.com>,
        Alan Stern <stern@rowland.harvard.edu>,
        Will Deacon <will@kernel.org>,
        "Michael S. Tsirkin" <mst@redhat.com>
Cc:     Peter Zijlstra <peterz@infradead.org>,
        Boqun Feng <boqun.feng@gmail.com>,
        Andrea Parri <parri.andrea@gmail.com>,
        Nicholas Piggin <npiggin@gmail.com>,
        David Howells <dhowells@redhat.com>,
        Daniel Lustig <dlustig@nvidia.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
References: <2fcb021f-2683-53f3-3088-683276aa580c@gmail.com>
From:   Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <2fcb021f-2683-53f3-3088-683276aa580c@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Substitution of "data dependency barrier" with "address-dependency
barrier" left quite a lot of lines exceeding 80 columns.

Reflow those lines as well as a few short ones not related to
the substitution.

No changes in documentation text.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
Cc: "Paul E. McKenney" <paulmck@linux.ibm.com>
Cc: Alan Stern <stern@rowland.harvard.edu>
Cc: Will Deacon <will@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Boqun Feng <boqun.feng@gmail.com>
Cc: Andrea Parri <parri.andrea@gmail.com>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: David Howells <dhowells@redhat.com>
Cc: Daniel Lustig <dlustig@nvidia.com>
Cc: Joel Fernandes <joel@joelfernandes.org>
Cc: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Jonathan Corbet <corbet@lwn.net>
---
 Documentation/memory-barriers.txt | 93 ++++++++++++++++---------------
 1 file changed, 47 insertions(+), 46 deletions(-)

diff --git a/Documentation/memory-barriers.txt b/Documentation/memory-barriers.txt
index bdbea3cc66a3..334b37689127 100644
--- a/Documentation/memory-barriers.txt
+++ b/Documentation/memory-barriers.txt
@@ -187,9 +187,9 @@ As a further example, consider this sequence of events:
 	B = 4;		Q = P;
 	P = &B;		D = *Q;
 
-There is an obvious address dependency here, as the value loaded into D depends on
-the address retrieved from P by CPU 2.  At the end of the sequence, any of the
-following results are possible:
+There is an obvious address dependency here, as the value loaded into D depends
+on the address retrieved from P by CPU 2.  At the end of the sequence, any of
+the following results are possible:
 
 	(Q == &A) and (D == 1)
 	(Q == &B) and (D == 2)
@@ -397,25 +397,25 @@ Memory barriers come in four basic varieties:
 
  (2) Address-dependency barriers (historical).
 
-     An address-dependency barrier is a weaker form of read barrier.  In the case
-     where two loads are performed such that the second depends on the result
-     of the first (eg: the first load retrieves the address to which the second
-     load will be directed), an address-dependency barrier would be required to
-     make sure that the target of the second load is updated after the address
-     obtained by the first load is accessed.
+     An address-dependency barrier is a weaker form of read barrier.  In the
+     case where two loads are performed such that the second depends on the
+     result of the first (eg: the first load retrieves the address to which
+     the second load will be directed), an address-dependency barrier would
+     be required to make sure that the target of the second load is updated
+     after the address obtained by the first load is accessed.
 
-     An address-dependency barrier is a partial ordering on interdependent loads
-     only; it is not required to have any effect on stores, independent loads
-     or overlapping loads.
+     An address-dependency barrier is a partial ordering on interdependent
+     loads only; it is not required to have any effect on stores, independent
+     loads or overlapping loads.
 
      As mentioned in (1), the other CPUs in the system can be viewed as
      committing sequences of stores to the memory system that the CPU being
-     considered can then perceive.  An address-dependency barrier issued by the CPU
-     under consideration guarantees that for any load preceding it, if that
-     load touches one of a sequence of stores from another CPU, then by the
-     time the barrier completes, the effects of all the stores prior to that
-     touched by the load will be perceptible to any loads issued after the address-
-     dependency barrier.
+     considered can then perceive.  An address-dependency barrier issued by
+     the CPU under consideration guarantees that for any load preceding it,
+     if that load touches one of a sequence of stores from another CPU, then
+     by the time the barrier completes, the effects of all the stores prior to
+     that touched by the load will be perceptible to any loads issued after
+     the address-dependency barrier.
 
      See the "Examples of memory barrier sequences" subsection for diagrams
      showing the ordering constraints.
@@ -437,16 +437,16 @@ Memory barriers come in four basic varieties:
 
  (3) Read (or load) memory barriers.
 
-     A read barrier is an address-dependency barrier plus a guarantee that all the
-     LOAD operations specified before the barrier will appear to happen before
-     all the LOAD operations specified after the barrier with respect to the
-     other components of the system.
+     A read barrier is an address-dependency barrier plus a guarantee that all
+     the LOAD operations specified before the barrier will appear to happen
+     before all the LOAD operations specified after the barrier with respect to
+     the other components of the system.
 
      A read barrier is a partial ordering on loads only; it is not required to
      have any effect on stores.
 
-     Read memory barriers imply address-dependency barriers, and so can substitute
-     for them.
+     Read memory barriers imply address-dependency barriers, and so can
+     substitute for them.
 
      [!] Note that read barriers should normally be paired with write barriers;
      see the "SMP barrier pairing" subsection.
@@ -584,8 +584,8 @@ following sequence of events:
 [!] READ_ONCE_OLD() corresponds to READ_ONCE() of pre-4.15 kernel, which
 doesn't imply an address-dependency barrier.
 
-There's a clear address dependency here, and it would seem that by the end of the
-sequence, Q must be either &A or &B, and that:
+There's a clear address dependency here, and it would seem that by the end of
+the sequence, Q must be either &A or &B, and that:
 
 	(Q == &A) implies (D == 1)
 	(Q == &B) implies (D == 4)
@@ -599,8 +599,8 @@ While this may seem like a failure of coherency or causality maintenance, it
 isn't, and this behaviour can be observed on certain real CPUs (such as the DEC
 Alpha).
 
-To deal with this, READ_ONCE() provides an implicit address-dependency
-barrier since kernel release v4.15:
+To deal with this, READ_ONCE() provides an implicit address-dependency barrier
+since kernel release v4.15:
 
 	CPU 1		      CPU 2
 	===============	      ===============
@@ -627,12 +627,12 @@ but the old value of the variable B (2).
 
 
 An address-dependency barrier is not required to order dependent writes
-because the CPUs that the Linux kernel supports don't do writes
-until they are certain (1) that the write will actually happen, (2)
-of the location of the write, and (3) of the value to be written.
+because the CPUs that the Linux kernel supports don't do writes until they
+are certain (1) that the write will actually happen, (2) of the location of
+the write, and (3) of the value to be written.
 But please carefully read the "CONTROL DEPENDENCIES" section and the
-Documentation/RCU/rcu_dereference.rst file:  The compiler can and does
-break dependencies in a great many highly creative ways.
+Documentation/RCU/rcu_dereference.rst file:  The compiler can and does break
+dependencies in a great many highly creative ways.
 
 	CPU 1		      CPU 2
 	===============	      ===============
@@ -678,8 +678,8 @@ not understand them.  The purpose of this section is to help you prevent
 the compiler's ignorance from breaking your code.
 
 A load-load control dependency requires a full read memory barrier, not
-simply an (implicit) address-dependency barrier to make it work correctly.  Consider the
-following bit of code:
+simply an (implicit) address-dependency barrier to make it work correctly.
+Consider the following bit of code:
 
 	q = READ_ONCE(a);
 	<implicit address-dependency barrier>
@@ -691,8 +691,8 @@ following bit of code:
 This will not have the desired effect because there is no actual address
 dependency, but rather a control dependency that the CPU may short-circuit
 by attempting to predict the outcome in advance, so that other CPUs see
-the load from b as having happened before the load from a.  In such a
-case what's actually required is:
+the load from b as having happened before the load from a.  In such a case
+what's actually required is:
 
 	q = READ_ONCE(a);
 	if (q) {
@@ -980,8 +980,8 @@ Basically, the read barrier always has to be there, even though it can be of
 the "weaker" type.
 
 [!] Note that the stores before the write barrier would normally be expected to
-match the loads after the read barrier or the address-dependency barrier, and vice
-versa:
+match the loads after the read barrier or the address-dependency barrier, and
+vice versa:
 
 	CPU 1                               CPU 2
 	===================                 ===================
@@ -1033,8 +1033,8 @@ STORE B, STORE C } all occurring before the unordered set of { STORE D, STORE E
 	                   V
 
 
-Secondly, address-dependency barriers act as partial orderings on address-dependent
-loads.  Consider the following sequence of events:
+Secondly, address-dependency barriers act as partial orderings on address-
+dependent loads.  Consider the following sequence of events:
 
 	CPU 1			CPU 2
 	=======================	=======================
@@ -1079,8 +1079,8 @@ effectively random order, despite the write barrier issued by CPU 1:
 In the above example, CPU 2 perceives that B is 7, despite the load of *C
 (which would be B) coming after the LOAD of C.
 
-If, however, an address-dependency barrier were to be placed between the load of C
-and the load of *C (ie: B) on CPU 2:
+If, however, an address-dependency barrier were to be placed between the load
+of C and the load of *C (ie: B) on CPU 2:
 
 	CPU 1			CPU 2
 	=======================	=======================
@@ -2760,7 +2760,8 @@ is discarded from the CPU's cache and reloaded.  To deal with this, the
 appropriate part of the kernel must invalidate the overlapping bits of the
 cache on each CPU.
 
-See Documentation/core-api/cachetlb.rst for more information on cache management.
+See Documentation/core-api/cachetlb.rst for more information on cache
+management.
 
 
 CACHE COHERENCY VS MMIO
@@ -2900,8 +2901,8 @@ AND THEN THERE'S THE ALPHA
 The DEC Alpha CPU is one of the most relaxed CPUs there is.  Not only that,
 some versions of the Alpha CPU have a split data cache, permitting them to have
 two semantically-related cache lines updated at separate times.  This is where
-the address-dependency barrier really becomes necessary as this synchronises both
-caches with the memory coherence system, thus making it seem like pointer
+the address-dependency barrier really becomes necessary as this synchronises
+both caches with the memory coherence system, thus making it seem like pointer
 changes vs new data occur in the right order.
 
 The Alpha defines the Linux kernel's memory model, although as of v4.15
-- 
2.25.1


