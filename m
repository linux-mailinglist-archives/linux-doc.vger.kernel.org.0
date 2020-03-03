Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 47B42176981
	for <lists+linux-doc@lfdr.de>; Tue,  3 Mar 2020 01:51:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727095AbgCCAvA (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 2 Mar 2020 19:51:00 -0500
Received: from mail-pf1-f193.google.com ([209.85.210.193]:45823 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727080AbgCCAur (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 2 Mar 2020 19:50:47 -0500
Received: by mail-pf1-f193.google.com with SMTP id 2so544396pfg.12
        for <linux-doc@vger.kernel.org>; Mon, 02 Mar 2020 16:50:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cs.washington.edu; s=goo201206;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=R4y1bjuDihHx2oTrIgnH3W8hlU6GthTh0USQXogLFnA=;
        b=AfeBTOyASViNVGc5rgKB3KnjpIqe4pFbwu36CkULNwUFVGDxk25zJLdGqoSVKjup47
         xFFy7KPqY3Rwxcce91SnNlR1s3r6GMM7ZGnF6WznrL3S81OKVoagMKdH5aZThFWFJJfK
         T+GJynvNZMURfh0SKIljpRFGUyOCq6AG0dfAI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=R4y1bjuDihHx2oTrIgnH3W8hlU6GthTh0USQXogLFnA=;
        b=TgyEbBLiQMJCIfGYnwXW18tKXQ4WwHD35NFDxfWgBfcbhOEjQ7DfX7GMpgVnsZqLsj
         iWHALHCbMnQQTCAKCadlh+0KEItRdNpe/cP5rE+akhjS8OSvBVMpD9vuX340ICPUddN+
         ir6D/XpssPC3g4b20zcdMpxXLrfcWmbqQlfmGj4dcu9rQPT1s8wQriFCE/CzRsdV0TgP
         TAgrKsAA2U5buwKBeChQPFmwzOu8vGIgCSVkuNhm4rWvV4oGS6/Th8L5IyIWSDvWUT0V
         kqt6FstvMhCC7YIG3B+YwBdmrXhYBBvcwkLXIVuSckkgbMhdi+vTDwACy5UUwDcC5VjT
         kc7w==
X-Gm-Message-State: ANhLgQ2nugNdD0dytCjsKX9uKZJaaEHtDFY4YdHryy72Xwwjbma7/son
        mSaLNxbrMY/OF7p5972qRh+H7Q==
X-Google-Smtp-Source: ADFU+vu4FJlF/yF0bGWMe5RPpUT1cUQoz8tMHkOM/dUGIBHYENG8NRhF2KH4gIKtOabdnMpPHDUJSw==
X-Received: by 2002:a62:6c6:: with SMTP id 189mr1637105pfg.224.1583196646317;
        Mon, 02 Mar 2020 16:50:46 -0800 (PST)
Received: from ryzen.cs.washington.edu ([2607:4000:200:11:b5cd:49c6:f4f6:8295])
        by smtp.gmail.com with ESMTPSA id c15sm357529pja.30.2020.03.02.16.50.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2020 16:50:45 -0800 (PST)
From:   Luke Nelson <lukenels@cs.washington.edu>
X-Google-Original-From: Luke Nelson <luke.r.nels@gmail.com>
To:     bpf@vger.kernel.org
Cc:     Luke Nelson <luke.r.nels@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Alexei Starovoitov <ast@kernel.org>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Martin KaFai Lau <kafai@fb.com>,
        Song Liu <songliubraving@fb.com>, Yonghong Song <yhs@fb.com>,
        Andrii Nakryiko <andriin@fb.com>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn.topel@gmail.com>,
        Xi Wang <xi.wang@gmail.com>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Stephen Hemminger <stephen@networkplumber.org>,
        Rob Herring <robh@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: [PATCH bpf-next v4 3/4] bpf, doc: add BPF JIT for RV32G to BPF documentation
Date:   Mon,  2 Mar 2020 16:50:34 -0800
Message-Id: <20200303005035.13814-4-luke.r.nels@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200303005035.13814-1-luke.r.nels@gmail.com>
References: <20200303005035.13814-1-luke.r.nels@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Update filter.txt and admin-guide to mention the BPF JIT for RV32G.

Co-developed-by: Xi Wang <xi.wang@gmail.com>
Signed-off-by: Xi Wang <xi.wang@gmail.com>
Signed-off-by: Luke Nelson <luke.r.nels@gmail.com>
---
 Documentation/admin-guide/sysctl/net.rst | 3 ++-
 Documentation/networking/filter.txt      | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/Documentation/admin-guide/sysctl/net.rst b/Documentation/admin-guide/sysctl/net.rst
index 287b98708a40..e043c9213388 100644
--- a/Documentation/admin-guide/sysctl/net.rst
+++ b/Documentation/admin-guide/sysctl/net.rst
@@ -67,7 +67,8 @@ two flavors of JITs, the newer eBPF JIT currently supported on:
   - sparc64
   - mips64
   - s390x
-  - riscv
+  - riscv64
+  - riscv32
 
 And the older cBPF JIT supported on the following archs:
 
diff --git a/Documentation/networking/filter.txt b/Documentation/networking/filter.txt
index c4a328f2d57a..2f0f8b17dade 100644
--- a/Documentation/networking/filter.txt
+++ b/Documentation/networking/filter.txt
@@ -606,7 +606,7 @@ before a conversion to the new layout is being done behind the scenes!
 
 Currently, the classic BPF format is being used for JITing on most
 32-bit architectures, whereas x86-64, aarch64, s390x, powerpc64,
-sparc64, arm32, riscv (RV64G) perform JIT compilation from eBPF
+sparc64, arm32, riscv64, riscv32 perform JIT compilation from eBPF
 instruction set.
 
 Some core changes of the new internal format:
-- 
2.20.1

