Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DAAC0262741
	for <lists+linux-doc@lfdr.de>; Wed,  9 Sep 2020 08:37:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725932AbgIIGh4 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 9 Sep 2020 02:37:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725840AbgIIGh4 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 9 Sep 2020 02:37:56 -0400
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52BD0C061573
        for <linux-doc@vger.kernel.org>; Tue,  8 Sep 2020 23:37:55 -0700 (PDT)
Received: by mail-pf1-x42a.google.com with SMTP id l126so1284894pfd.5
        for <linux-doc@vger.kernel.org>; Tue, 08 Sep 2020 23:37:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zecV6RuB4y2mB3liQOpyZpbo7kgRDtaYDwp3K0dNDoc=;
        b=Dexb87pGwDw4pV9xV4pfHE89/qFy4yJ0Zk8peQjmLkglfG9xkJ57jQm1GJNmEz1MCo
         Ykxk5lFLvx6ckJb7sZu0muGYTORoL4Fa7c7lvIlZSk1PoRbeRSSxUBlKa1fz2YaFKjTS
         dBp9vz1p14QbXV5lTdhdnLEozsONmNDPgYZlk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zecV6RuB4y2mB3liQOpyZpbo7kgRDtaYDwp3K0dNDoc=;
        b=Jyl321TQoxNJZlDo4Yv318Kbib/ocSYxWECqX9V6E/dLQuQNfV5CG9cFPCqj6JuyvH
         GoqPgjt2duMT9nIo0o3pQj3PTk+PEyNZw3MOwBBoHMaxfj3s3Kv6k7OTCFBDcrHKRqvs
         LZXcBLp48Ul2xH8n/Wd1w22tegozkg2J34urgvpZv0qC3uHF3mfciW3MuCF8ZDzcwaE8
         tuf9TGxzvTx33Yv3d2+DqNeuu28DUsEEpYSFvmSrIbwpfNHMMp/vDWSlj1IrYORC/w1u
         Q4ZAvA9tIHrZoDhGrBabGhFEhrAegAeKT5mF4vPZJL9xXO+GpinZMdSY7yX+la7R9hc9
         rW1Q==
X-Gm-Message-State: AOAM530q7oFrK7PAVFKcwwSTM+IsHDyCgKJsHFNlS4Xy4/IpqQXEDdvq
        g7IHdXophC9YMOElwrtEmFhKjSU1MFQ/2g==
X-Google-Smtp-Source: ABdhPJzVFpj31Mp6r4rw+U259cnsxp1tUF+KbnPij8BOKuYTU5G32u3HLnEPowDoLMO/s7kOfLCVlQ==
X-Received: by 2002:a63:30c:: with SMTP id 12mr1942293pgd.66.1599633473538;
        Tue, 08 Sep 2020 23:37:53 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:1:3e52:82ff:fe6c:83ab])
        by smtp.gmail.com with ESMTPSA id z26sm1405769pfa.55.2020.09.08.23.37.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2020 23:37:52 -0700 (PDT)
From:   Stephen Boyd <swboyd@chromium.org>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: [PATCH] docs: stable-ABI: Document /sys/kernel/notes
Date:   Tue,  8 Sep 2020 23:37:52 -0700
Message-Id: <20200909063752.931283-1-swboyd@chromium.org>
X-Mailer: git-send-email 2.28.0.526.ge36021eeef-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Document the notes file in sysfs as the running vmlinux's .note section
in binary format. Hopefully this helps someone like me realize the
kernel exposes the note section in sysfs in the future. Take the date
from when the file was introduced. It's been a while so presumably this
is stable and not testing material.

Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 Documentation/ABI/stable/sysfs-kernel-notes | 5 +++++
 1 file changed, 5 insertions(+)
 create mode 100644 Documentation/ABI/stable/sysfs-kernel-notes

diff --git a/Documentation/ABI/stable/sysfs-kernel-notes b/Documentation/ABI/stable/sysfs-kernel-notes
new file mode 100644
index 000000000000..2c76ee9e67f7
--- /dev/null
+++ b/Documentation/ABI/stable/sysfs-kernel-notes
@@ -0,0 +1,5 @@
+What:		/sys/kernel/notes
+Date:		July 2009
+Contact:	<linux-kernel@vger.kernel.org>
+Description:	The /sys/kernel/notes file contains the binary representation
+		of the running vmlinux's .notes section.
-- 
Sent by a computer, using git, on the internet

