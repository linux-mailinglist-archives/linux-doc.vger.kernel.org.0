Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 400EF59748B
	for <lists+linux-doc@lfdr.de>; Wed, 17 Aug 2022 18:52:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240809AbiHQQtN (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 17 Aug 2022 12:49:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240851AbiHQQtI (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 17 Aug 2022 12:49:08 -0400
Received: from mail-pj1-x104a.google.com (mail-pj1-x104a.google.com [IPv6:2607:f8b0:4864:20::104a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4615E2ED7C
        for <linux-doc@vger.kernel.org>; Wed, 17 Aug 2022 09:49:04 -0700 (PDT)
Received: by mail-pj1-x104a.google.com with SMTP id o18-20020a17090aac1200b001f3252af009so1431538pjq.7
        for <linux-doc@vger.kernel.org>; Wed, 17 Aug 2022 09:49:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:from:to:cc;
        bh=V3NBUo76d+nSkiXzGrnX3CxBe6y+rnd620DH//raoE8=;
        b=hvogyBn0sSM54fuD8N0P/mxmPgFGNdUD6dNtW+ddHvFycjAhLdzROp4c1SZIpbo00z
         Kz6clBm2pqns1I1DKHD+KMSjjsDxKCTd/E7a9Pp9VTs40VWfCBroMPJWfiY5R4nx+ZNR
         JBFWQeHXTVZDKgX2gTYjMG3D8HevTocU0/AY7hun/hd3JNdXm/RAsTtOJK3PvvGparZ8
         mWBhyd+S11HN3qwTyjJNWS8kfhBfifgjx7KOVyZeT7gW1lMgH6lq9p2SLkl6WjVJEu+j
         SniOzJ60Oj9hXd16HZffDezHHroI1UR7TA8rGTDpQaUmmzK1PoUb4Mr2yky0NwPzIs6f
         GnTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:x-gm-message-state:from:to:cc;
        bh=V3NBUo76d+nSkiXzGrnX3CxBe6y+rnd620DH//raoE8=;
        b=JJJj8BRkUGIgvRabUA8N0eg3Fk9DqVusrcEmFmP+TzDdMG562MRZuACd08j18mZ3pP
         gn4vdpxLzowuv34w1hFfcxZYesz7N36HLtW/KmATl2ylIlX0+MnvIRruapyBZiOlo7Y8
         uED41hdGPIlRE/SYCqYkymc58OIOHwmiCpVIkGD4fpJeMJD3V+ezpLKeKPc72PYsJPEJ
         MYSHhFG71UKXS3ormeEUSKb04FFo6ryjzvS4fU4tVzvdSoXEc0aaHe90qrtzj9lpTsfv
         vNLfPkc3QF70NEI8+k7Zv+A77cdHDBXUaS/8+IHNI/PPyesyWioaXbRPb5jBbaHMGtiG
         ZYcA==
X-Gm-Message-State: ACgBeo3XMZle4Y9OmGQG+Xo/g9Kq7/3PEwjR2WGOT4A2WWbVILEcmfD8
        sk20ydLK48Ea/VjoZQARG+FoVMJ+3G+kaMg=
X-Google-Smtp-Source: AA6agR5Bxevt9UGS9B1lT/22JmsWAqFZG0tVJOO5Kx0X0PD4ZUtiOiYSH2h2a/pzbdQu5l4BVzdSh+aGx1IMECdm
X-Received: from joefradley-custom-96.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:831])
 (user=joefradley job=sendgmr) by 2002:aa7:9f02:0:b0:52d:6ae1:d631 with SMTP
 id g2-20020aa79f02000000b0052d6ae1d631mr26893608pfr.41.1660754943688; Wed, 17
 Aug 2022 09:49:03 -0700 (PDT)
Date:   Wed, 17 Aug 2022 09:48:50 -0700
In-Reply-To: <20220817164851.3574140-1-joefradley@google.com>
Message-Id: <20220817164851.3574140-3-joefradley@google.com>
Mime-Version: 1.0
References: <20220817164851.3574140-1-joefradley@google.com>
X-Mailer: git-send-email 2.37.1.595.g718a3a8f04-goog
Subject: [PATCH 2/2] kunit: no longer call module_info(test, "Y") for kunit modules
From:   Joe Fradley <joefradley@google.com>
To:     Jonathan Corbet <corbet@lwn.net>,
        Brendan Higgins <brendan.higgins@linux.dev>,
        David Gow <davidgow@google.com>
Cc:     Joe Fradley <joefradley@google.com>, kernel-team@android.com,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-9.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Because KUnit test execution is not a guarantee with the kunit.enable
parameter we want to be careful to only taint the kernel only if an
actual test runs. Calling module_info(test, "Y") for every KUnit module
automatically causes the kernel to be tainted upon module load. Therefore,
we're removing this call and relying on the KUnit framework to taint the
kernel or not.

Signed-off-by: Joe Fradley <joefradley@google.com>
---
 include/kunit/test.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/include/kunit/test.h b/include/kunit/test.h
index c958855681cc..f23d3954aa17 100644
--- a/include/kunit/test.h
+++ b/include/kunit/test.h
@@ -251,7 +251,6 @@ static inline int kunit_run_all_tests(void)
 #endif /* IS_BUILTIN(CONFIG_KUNIT) */
 
 #define __kunit_test_suites(unique_array, ...)				       \
-	MODULE_INFO(test, "Y");						       \
 	static struct kunit_suite *unique_array[]			       \
 	__aligned(sizeof(struct kunit_suite *))				       \
 	__used __section(".kunit_test_suites") = { __VA_ARGS__ }
-- 
2.37.1.595.g718a3a8f04-goog

