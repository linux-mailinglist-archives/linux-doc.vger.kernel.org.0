Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 319CD1D5950
	for <lists+linux-doc@lfdr.de>; Fri, 15 May 2020 20:45:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726769AbgEOSop (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 15 May 2020 14:44:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726715AbgEOSon (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 15 May 2020 14:44:43 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F002C061A0C
        for <linux-doc@vger.kernel.org>; Fri, 15 May 2020 11:44:43 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id a4so1404531pgc.0
        for <linux-doc@vger.kernel.org>; Fri, 15 May 2020 11:44:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aqpEyjmRGymmAkpEVNLXc9rm3KhELEO9r/R/WZVikzc=;
        b=FepFYDduMkE+0Vc6udG9athvibh6QBvTsQoYsBFI7fTVizPHCZoDeTiA1Qh1GhyRsu
         KE65oHTsa+hmwdwO4VpPHRts+bXH6NsISs8EGjuR/EukerazV9u0Qpsi4MhsN4Odq6Wa
         +FNAlLl++yjbjgUKqAnw0ypxXMATy9BiLo+Uw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aqpEyjmRGymmAkpEVNLXc9rm3KhELEO9r/R/WZVikzc=;
        b=FTXgJxyG+iJQHx3vVSu8vpoiJFE5rnlraQTaOsf9Ute5s4VmZ/Il6OYBZdMJW5uULb
         cLwVvd+DeOa+adlYwmzuQ2uqi1q0jtTfD+IUTluK/JzaTsxz4RD1M7qzqPejyFfQXl5V
         2vmichNED/0yaA91TGsCRnquL43WYkyYUCMBkHoVP+s5i1Gv/rPLJhysCnT/3Z0rCZ6y
         0/Uqfa986sjjF9xBrR38NgJ7iKeuPrmpw+307VSRsLkK29VJGbizdevBDnTz0plK2yi7
         uCkCZaThFUd1mDg5VyilhxHpo9R7hBmKHEF+mms1HGcj11VrpZszuLk45pavUyBDeVXi
         Dmqw==
X-Gm-Message-State: AOAM532mqRr18MQ4ryJvpaCUTs1KNNkkYgNQv9MMcfofnURva8XnwVrD
        E7iXlWVeKfbmkPeM0lfxemlT3Moz/oo=
X-Google-Smtp-Source: ABdhPJxDRJnJDZmBecNcZ4uRgeiGUpxX7zgXYIqmKtnUH4FhAIJ11bjo7gZpRkIMVbYw1HRdWk2dWg==
X-Received: by 2002:a63:2b03:: with SMTP id r3mr4280548pgr.201.1589568282926;
        Fri, 15 May 2020 11:44:42 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id j26sm2518425pfr.215.2020.05.15.11.44.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2020 11:44:38 -0700 (PDT)
From:   Kees Cook <keescook@chromium.org>
To:     Pavel Tatashin <pasha.tatashin@soleen.com>
Cc:     Kees Cook <keescook@chromium.org>, Petr Mladek <pmladek@suse.com>,
        Anton Vorontsov <anton@enomsg.org>,
        Colin Cross <ccross@android.com>,
        Tony Luck <tony.luck@intel.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Benson Leung <bleung@chromium.org>,
        Rob Herring <robh+dt@kernel.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v4 0/6] allow ramoops to collect all kmesg_dump events
Date:   Fri, 15 May 2020 11:44:28 -0700
Message-Id: <20200515184434.8470-1-keescook@chromium.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hello!

I wanted to get the pstore tree nailed down, so here's the v4 of
Pavel's series, tweaked for the feedback during v3 review.

-Kees

v4:
- rebase on pstore tree
- collapse shutdown types into a single dump reason
  https://lore.kernel.org/lkml/CA+CK2bAPv5u1ih5y9t5FUnTyximtFCtDYXJCpuyjOyHNOkRdqw@mail.gmail.com/
- fix dump_oops vs max_reason module params
  https://lore.kernel.org/lkml/20200512233504.GA118720@sequoia/
- typos
  https://lore.kernel.org/lkml/4cdeaa2af2fe0d6cc2ca8ce3a37608340799df8a.camel@perches.com/
- rename DT parsing routines ..._size -> ..._u32
  https://lore.kernel.org/lkml/CA+CK2bCu8eFomiU+NeBjVn-o2dbuECxwRfssNjB3ys3caCbXeA@mail.gmail.com/
v3: https://lore.kernel.org/lkml/20200506211523.15077-1-keescook@chromium.org/
v2: https://lore.kernel.org/lkml/20200505154510.93506-1-pasha.tatashin@soleen.com
v1: https://lore.kernel.org/lkml/20200502143555.543636-1-pasha.tatashin@soleen.com

Kees Cook (3):
  printk: Collapse shutdown types into a single dump reason
  printk: Introduce kmsg_dump_reason_str()
  pstore/ram: Introduce max_reason and convert dump_oops

Pavel Tatashin (3):
  printk: honor the max_reason field in kmsg_dumper
  pstore/platform: Pass max_reason to kmesg dump
  ramoops: Add max_reason optional field to ramoops DT node

 Documentation/admin-guide/ramoops.rst         | 14 +++--
 .../bindings/reserved-memory/ramoops.txt      | 13 ++++-
 arch/powerpc/kernel/nvram_64.c                |  4 +-
 drivers/platform/chrome/chromeos_pstore.c     |  2 +-
 fs/pstore/platform.c                          | 26 ++-------
 fs/pstore/ram.c                               | 58 +++++++++++++------
 include/linux/kmsg_dump.h                     | 12 +++-
 include/linux/pstore.h                        |  7 +++
 include/linux/pstore_ram.h                    |  2 +-
 kernel/printk/printk.c                        | 32 ++++++++--
 kernel/reboot.c                               |  6 +-
 11 files changed, 114 insertions(+), 62 deletions(-)

-- 
2.20.1

