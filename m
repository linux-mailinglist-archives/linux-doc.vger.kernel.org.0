Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D772B1C7C2B
	for <lists+linux-doc@lfdr.de>; Wed,  6 May 2020 23:16:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729870AbgEFVPz (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 6 May 2020 17:15:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729819AbgEFVPd (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 6 May 2020 17:15:33 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65F76C0610D5
        for <linux-doc@vger.kernel.org>; Wed,  6 May 2020 14:15:33 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id b8so1421285pgi.11
        for <linux-doc@vger.kernel.org>; Wed, 06 May 2020 14:15:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=u/XCL1fsewz1wv+0YN1B6q5DwndvHtJ46IG2XGKxKkc=;
        b=LJ17gtKZ5RCiSk4FFPSrLts9kY+6gVoaJHhHAK4elrJ5HYs7Re8PekuMrTMDTbowO/
         SSluTHjRjYjytzyAq6hHqEC1n5fB2I22oH2gq4YFrhQCpZnhRo1qDJK3q5787DBLZiUz
         R62JQc4JS07Vmp2QpY7YmwMyVoRd5SXQcqqIU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=u/XCL1fsewz1wv+0YN1B6q5DwndvHtJ46IG2XGKxKkc=;
        b=nrq6P/0SS0/g28loXSaLhgsQACL8Yzu5b4nWEkFXjzZujqleC8hxRtb+jUHPmONGkp
         E3E9hFULRK+f+kg/kS35JFWR5+w0RIifQpG2U8No5ey0oHgSnzaVQm3ZHrD56gXDdSPi
         vQbERln58rMvWGKf5opjMqQWOEQUgXV7Nr0QRGG7R6XnddOR5ecxFH5NpZYXInMYIbTR
         4Ck6EUoJVUlI6CH0+I2WsjW2SKbg35JAdbvRIZz0vbHxmWevxF+KMBu9bO2tczdRqQmi
         lsibGGqu/BPppYwSQ39q5KJ+1PjJiCVhNOxqRB96It7TD8eCFfHndwrN6pGdf0l36Oj2
         Wwqg==
X-Gm-Message-State: AGi0PubhnWPzF/f8bOAN024MTLKPOMIQhYxuR/CrrHi5kcoZyXigPAVJ
        diVIbv2Dpmepo7lkQBHXuHtAwQ==
X-Google-Smtp-Source: APiQypI/pTh6kOO0ohxDbY5vssPPtVaFSIZETH0t6dPMEwVl4GH4h+EMDj98Y0NsEBc9c6g4zYaF4w==
X-Received: by 2002:a62:a11c:: with SMTP id b28mr2765864pff.180.1588799732927;
        Wed, 06 May 2020 14:15:32 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id d2sm2752547pfc.7.2020.05.06.14.15.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2020 14:15:29 -0700 (PDT)
From:   Kees Cook <keescook@chromium.org>
To:     Pavel Tatashin <pasha.tatashin@soleen.com>
Cc:     Kees Cook <keescook@chromium.org>,
        Anton Vorontsov <anton@enomsg.org>,
        Colin Cross <ccross@android.com>,
        Tony Luck <tony.luck@intel.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Rob Herring <robh+dt@kernel.org>,
        Benson Leung <bleung@chromium.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Petr Mladek <pmladek@suse.com>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Steven Rostedt <rostedt@goodmis.org>, jmorris@namei.org,
        sashal@kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v3 0/6] allow ramoops to collect all kmesg_dump events
Date:   Wed,  6 May 2020 14:15:17 -0700
Message-Id: <20200506211523.15077-1-keescook@chromium.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi!

This is my stab at rearranging a few things based on Pavel's series. Most
things remain the same; I just tweaked how defaults are arranged and
detected and expanded the wording in a few places. Pavel, how does this
v3 look to you?

Pavel's original cover letter:

pstore /mnt/console-ramoops-0 outputs only messages below the console
loglevel, and our console loglevel is set to 3 due to slowness of
serial console. Which means only errors and worse types of messages
are recorded. There is no way to have different log levels for
different consoles.

This patch series adds a new option to ramoops: max_reason that enables
it to collect kmdesg dumps for other reasons beside oops and panics.

How to quickly test:

virtme-run --mods=auto --kdir --mods=auto --kdir . \
	-a memmap=1G$8G -a ramoops.mem_address=0x200000000 \
	-a ramoops.mem_size=0x100000 -a ramoops.record_size=32768 \
	-a ramoops.max_reason=5 -a quiet --qemu-opts -m 8G
..
# reboot -f

After VM is back:

# mount -t pstore pstore /mnt
# head /mnt/dmesg-ramoops-0
Restart#1 Part1
...


Changelog:

v3:
 - expanded several comments and commit logs
 - move max_reason member earlier in the structure
 - refactored DT parsing to allow setting defaults
 - changed how deprecated dump_oops fields are detected and parsed
 - cleaned up some module param permissions
v2: https://lore.kernel.org/lkml/20200505154510.93506-1-pasha.tatashin@soleen.com
v1: https://lore.kernel.org/lkml/20200502143555.543636-1-pasha.tatashin@soleen.com


Thanks!

-Kees


Kees Cook (2):
  pstore/ram: Refactor DT size parsing
  pstore/ram: Adjust module param permissions to reflect reality

Pavel Tatashin (4):
  printk: honor the max_reason field in kmsg_dumper
  pstore/platform: Pass max_reason to kmesg dump
  pstore/ram: Introduce max_reason and convert dump_oops
  ramoops: Add max_reason optional field to ramoops DT node

 Documentation/admin-guide/ramoops.rst         | 14 +++-
 .../bindings/reserved-memory/ramoops.txt      | 13 ++-
 drivers/platform/chrome/chromeos_pstore.c     |  2 +-
 fs/pstore/platform.c                          |  4 +-
 fs/pstore/ram.c                               | 83 ++++++++++++-------
 include/linux/kmsg_dump.h                     |  1 +
 include/linux/pstore.h                        |  7 ++
 include/linux/pstore_ram.h                    |  2 +-
 kernel/printk/printk.c                        | 15 +++-
 9 files changed, 97 insertions(+), 44 deletions(-)

-- 
2.20.1

