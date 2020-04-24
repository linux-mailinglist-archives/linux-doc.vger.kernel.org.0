Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE3A01B7FA8
	for <lists+linux-doc@lfdr.de>; Fri, 24 Apr 2020 22:02:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729198AbgDXUBi (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 24 Apr 2020 16:01:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727021AbgDXUBi (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 24 Apr 2020 16:01:38 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A884C09B049
        for <linux-doc@vger.kernel.org>; Fri, 24 Apr 2020 13:01:37 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id hi11so4300929pjb.3
        for <linux-doc@vger.kernel.org>; Fri, 24 Apr 2020 13:01:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=d4lr59kGFtiMrlzsTXv7Cap04Be+amSXDo3Nxu+OOcI=;
        b=vvhLTHmAX7oCwPA3JTybbFNPIyIJXpmAdyxRXLqIO00QVc/Qidha5keDn8/QfKpkcM
         b8PACjozzS0KNo9x+oWJGBBfsJR/OB+yMax+49l+waXRh9XwI1XaOh4aryRA5trrALrP
         a498acMlafLtVyY5g9SmRj4GB/o8m8SWZ86kfyCEmm1PrGTLkWnnEiYCKN8Q6gvj6dqc
         KzKPkefMxBfrKL4CHY+vpQfKHFylosj+ee7xzjrAuodLyhllwry6De1bUu4EkNTGZL9A
         /eBmJ9GsfRv+ELnvdOoSETh1D2fhxq+fUF2QGI+Z4RQ4aL+YdlZ5IwwLKdoCQDvRj7hk
         6j6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=d4lr59kGFtiMrlzsTXv7Cap04Be+amSXDo3Nxu+OOcI=;
        b=C6qGSizWYn5Z0+EXhf6nQXxBxd7wFlCFrah8EgfLQ+DT6XguF4pfXBTDnCByNFymLP
         DgH3MFGhZyO9Ah4x+YCXcPVfuhmjTSYZt0NhR/zb03/NE3XJCcv6BFocdsJsjlJWuTs4
         cW5w/S3fY7o8eYNd/a/HclF9uQ/8rxb8QxpxNdxorP5+CLiK566KItklgK9CqVd/ZQtM
         JwRbvegpGnOUEruRatfHGLyJ2KyK9oAdy+7RSqITseAJCX0XirT+MeHp70z+nC3BQa0a
         qtubRlY8RWGkGnf158h8r8S/mEJIHDTJ76ZnbYGsNrsdOWBpY+fXBN2WheYKXQn6wCNY
         aS7Q==
X-Gm-Message-State: AGi0PuZEDrAfvMH/ju1xgONu5B9XqmXNRGSzswXWQpA5TsaiNNrR+Bej
        5oOPoHvMKXzt6+fwEo8OVuAZ3A==
X-Google-Smtp-Source: APiQypLwfZqqDta1hYtLt6ZT63PXufcrJRu1m2XkJppFA9QL12dnMjYFhz1qn0uOnOKAWSYetg9fUw==
X-Received: by 2002:a17:902:7082:: with SMTP id z2mr11055219plk.43.1587758497295;
        Fri, 24 Apr 2020 13:01:37 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id o11sm5532224pgd.58.2020.04.24.13.01.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2020 13:01:36 -0700 (PDT)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     bjorn.andersson@linaro.org, ohad@wizery.com
Cc:     loic.pallardy@st.com, arnaud.pouliquen@st.com, s-anna@ti.com,
        linux-remoteproc@vger.kernel.org, corbet@lwn.net,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 00/14] remoteproc: Add support for synchronisaton with rproc
Date:   Fri, 24 Apr 2020 14:01:21 -0600
Message-Id: <20200424200135.28825-1-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This is the third revision of this series that tries to address the
problem of synchronising with a remote processor with as much
flexibility as possible.

Two things to pay attention to:

1) Function rproc_actuate() has been abandoned to avoid creating another
   way to start a remote processor from a kernel driver.  Arnaud expressed
   the opinion that it is semantically questionnable to synchronise with a
   remote processor when calling rproc_boot().  We could rename
   rproc_boot() to rproc_actuate() but I'll wait to see what other people
   think before doing so.

2) The allocation of the synchronisation states has been split from the
   remote processor allocation.  A new function rproc_set_state_machine()
   does all the work now.  Proceeding this way has made the patchset a
   lot more simple.

Other than the above I have tried to address all the comments made on the
second revision.  If a comment was not addressed it simply fell through
the cracks rather than ignored.  In such a case please reiterate your point
of view and I'll be sure to address it.    

Applies cleanly on rproc-next (305ac5a766b1).

Best regards,
Mathieu

Mathieu Poirier (14):
  remoteproc: Make core operations optional
  remoteproc: Introduce function rproc_alloc_internals()
  remoteproc: Add new operation and flags for synchronistation
  remoteproc: Refactor function rproc_boot()
  remoteproc: Refactor function rproc_fw_boot()
  remoteproc: Refactor function rproc_trigger_auto_boot()
  remoteproc: Introducting new start and stop functions
  remoteproc: Call core functions based on synchronisation flag
  remoteproc: Deal with synchronisation when crashing
  remoteproc: Deal with synchronisation when shutting down
  remoteproc: Deal with synchronisation when changing FW image
  remoteproc: Introducing function rproc_set_state_machine()
  remoteproc: Document function rproc_set_state_machine()
  remoteproc: Expose synchronisation flags via debugfs

 Documentation/remoteproc.txt             |  17 ++
 drivers/remoteproc/remoteproc_core.c     | 197 +++++++++++++++++++----
 drivers/remoteproc/remoteproc_debugfs.c  |  21 +++
 drivers/remoteproc/remoteproc_internal.h | 123 +++++++++++++-
 drivers/remoteproc/remoteproc_sysfs.c    |  24 ++-
 include/linux/remoteproc.h               |  27 ++++
 6 files changed, 372 insertions(+), 37 deletions(-)

-- 
2.20.1

