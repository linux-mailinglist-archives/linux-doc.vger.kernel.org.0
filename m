Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 633DC74275C
	for <lists+linux-doc@lfdr.de>; Thu, 29 Jun 2023 15:27:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231953AbjF2N1m (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 29 Jun 2023 09:27:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231908AbjF2N1l (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 29 Jun 2023 09:27:41 -0400
Received: from mail-ed1-x549.google.com (mail-ed1-x549.google.com [IPv6:2a00:1450:4864:20::549])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C81F02695
        for <linux-doc@vger.kernel.org>; Thu, 29 Jun 2023 06:27:39 -0700 (PDT)
Received: by mail-ed1-x549.google.com with SMTP id 4fb4d7f45d1cf-51d95a84480so449998a12.2
        for <linux-doc@vger.kernel.org>; Thu, 29 Jun 2023 06:27:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1688045258; x=1690637258;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=RBX/ZfKOmZybnCy+TJCC1Khkdf0JaxSO6nOHYL3602s=;
        b=74Ac2Po/8YOM/O803qScwIOjP8gYg8G4wgHxyw5rZCTNWIAlHSyGb9SzNo9Xnf5sQE
         qzan4SM0hGh4dAHfg8JrtmpEF/sZ2DHeotQDS3yXSGNuwTKxqCLJUy2FBE/GS6RJ0JBj
         lMH/r5u8eQ5j8+xaJAqcCaNWpwxYsUaf0VJkMFMj0Xztjh9h3z0me4Pm2E75CiDzgW1O
         gopD6LcMIvae2qAnyV0jf4iFCXfxK2l2GJApT0fhEWXmyerE3Ghhmezd6x5eVhW/VGEJ
         /xStz4RtSKlO3l1WpCXgOc910qGmb1vb7ex4f23C/e4mVgmMeZfJ67s5z/MxghQ6zRUA
         gsgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688045258; x=1690637258;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RBX/ZfKOmZybnCy+TJCC1Khkdf0JaxSO6nOHYL3602s=;
        b=Ha7bkvBuStjSFtfXy5mjNARVoDsKVFPB2YAGoVo54XN6M8oNTSg7VB2vRxk7c8sxUy
         dztXkx8qti9mSOCaFQuUHI0VZui9gGavc/7flI3ji6ep5t7VJocQ5LX7QjoaIQK3Gz4C
         xSMV9Z+QiWwk9JLjedRgaAGn0OmM2XDGOvOYgilYsrtFA0gZTNywxKw+ZAEthxksU8gG
         c/KYZtiN4AIzyPq3zITgOETXK0d32cqKwPkR0IXYqEc7Pz3GmUJ7G+7u/Kb8EjGYseGc
         PlZK/YgoIMVNFo9n0v+fJ8pPHW2UDg1t65iWdB1z6nMZvPaxgIdIu2WYv1B3d3Iv4J9M
         HwEQ==
X-Gm-Message-State: AC+VfDykE3ywOnDKdQVYGGTo2zmnHEIINr8zpNYcxjeEoHWctaJ7gwKC
        SNcmyMNU1hnwedmRVNR2Uwvl5aiU2C8zx+Jhuq4eLeoNwguD4afJdG2SgCiXH1p7WH/uEc/p/oa
        /BFc+KZ58EMJkBQXRde0yCQQ7FiHpsp0I400oWtGqcfIrQynqYLeOxUAZpskjazh7vV+85FWHvR
        frKa4=
X-Google-Smtp-Source: ACHHUZ68x22hc/u7loDafI2EMqho0Kd4jMofvcMTzF5nV3k/Nt4gqftj8nkSDifh1eoZn4ve45CvYUjPmmUUfNKVFw==
X-Received: from mr-cloudtop2.c.googlers.com ([fda3:e722:ac3:cc00:31:98fb:c0a8:fb5])
 (user=matteorizzo job=sendgmr) by 2002:a50:cdc8:0:b0:51d:7d61:a833 with SMTP
 id h8-20020a50cdc8000000b0051d7d61a833mr1674482edj.0.1688045258087; Thu, 29
 Jun 2023 06:27:38 -0700 (PDT)
Date:   Thu, 29 Jun 2023 13:27:10 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.41.0.162.gfafddb0af9-goog
Message-ID: <20230629132711.1712536-1-matteorizzo@google.com>
Subject: [PATCH v2 0/1] Add a sysctl to disable io_uring system-wide
From:   Matteo Rizzo <matteorizzo@google.com>
To:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        io-uring@vger.kernel.org
Cc:     matteorizzo@google.com, jordyzomer@google.com, evn@google.com,
        poprdi@google.com, corbet@lwn.net, axboe@kernel.dk,
        asml.silence@gmail.com, akpm@linux-foundation.org,
        keescook@chromium.org, rostedt@goodmis.org,
        dave.hansen@linux.intel.com, ribalda@chromium.org,
        chenhuacai@kernel.org, steve@sk2.org, gpiccoli@igalia.com,
        ldufour@linux.ibm.com, bhe@redhat.com, oleksandr@natalenko.name
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

Over the last few years we've seen many critical vulnerabilities in
io_uring[1] which could be exploited by an unprivileged process to gain
control over the kernel. This patch introduces a new sysctl which disables
the creation of new io_uring instances system-wide.

The goal of this patch is to give distros, system admins, and cloud
providers a way to reduce the risk of privilege escalation through io_uring
where disabling it with seccomp or at compile time is not practical. For
example a distro or cloud provider might want to disable io_uring by
default and have users enable it again if they need to run a program that
requires it. The new sysctl is designed to let a user with root on the
machine enable and disable io_uring systemwide at runtime without requiring
a kernel recompilation or a reboot.

[1] Link: https://goo.gle/limit-iouring

---
v2:
	* Documentation style fixes
	* Add a third level that only disables io_uring for unprivileged
	  processes


Matteo Rizzo (1):
  Add a new sysctl to disable io_uring system-wide

 Documentation/admin-guide/sysctl/kernel.rst | 19 +++++++++++++
 io_uring/io_uring.c                         | 30 +++++++++++++++++++++
 2 files changed, 49 insertions(+)

-- 
2.41.0.162.gfafddb0af9-goog

