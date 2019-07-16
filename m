Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7E5C26A586
	for <lists+linux-doc@lfdr.de>; Tue, 16 Jul 2019 11:44:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387469AbfGPJoA (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 16 Jul 2019 05:44:00 -0400
Received: from mail-pg1-f202.google.com ([209.85.215.202]:34516 "EHLO
        mail-pg1-f202.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387454AbfGPJn7 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 16 Jul 2019 05:43:59 -0400
Received: by mail-pg1-f202.google.com with SMTP id x19so12323686pgx.1
        for <linux-doc@vger.kernel.org>; Tue, 16 Jul 2019 02:43:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=z+RsQ5cMJRNJEspG7oJoFcFROmHPEJhG9JB06H11s3Q=;
        b=CUY4X28sB+ODqLkExBF1TPtKPBrP8z61MsztlmFA3r3gT07JFbpBdEO5woSX6qXc5N
         7BJpPco1WgRlDYy/qo0/eQlbH81eSVuboFms9Vfai0ZrWDbY3TxcYEjJ862ij9z1VGEB
         1XEk67DEtl2x2z0HdpX/hfuCpUB44Qgi9Z5nNVY0IvyFXpJdsd7uca/G6oZFZDgCNkBl
         9KwMhzPT+UvSiWeRn/CMWIFt4CB2a/Hi+EdyU8gaY+ftONCJpCEIb11YwL2UTJXycDAy
         5pyhBy52Rf1DEP5nqhHWDX5FpEAPRVHHNegfFxUpAFP0dG/QMJ9n8t8pRQ9jJ7cscePK
         Kt1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=z+RsQ5cMJRNJEspG7oJoFcFROmHPEJhG9JB06H11s3Q=;
        b=oiig+LGW8LZtk5xaPec++SC7dxrcKjW4n5OQ0Z8cZNb4cxBZ+bsJu3ToPWpSy/rAke
         xLELFkrpF2sQam4hvhD4LyAzvQBOUhnKIG1afj7dBJ1zm5IoUoI2oaYHgEirurzVsJWX
         sjz2+EGvMddIpmxsHrB4Sz3edXTtJ55YpTaZYJ+pdu3ixKinMgK8X3el4y9LY6t/Bwh1
         jD8I6t/sJYME2CI3ELwFhje/FfLzAEYWZ7tSvVR2nl7bXZWFHx2B8zwfBh22ITMJ+QQg
         6qgvXExuPCqtlZ/+QceTEl3DHNezwp6+30KB24eQYt9oSgeiEygU1h2HjMRsiUCK5H8f
         WOYg==
X-Gm-Message-State: APjAAAVBD/6Ncf7ZBlkB2TeRlmANRctT8mk7Z5Mv3mslKz4VWX5FmFWE
        Y/ZkEN0IX/tFrN3zzi05UdfgsLlDSZmbJuGqgaViYA==
X-Google-Smtp-Source: APXvYqx6tsQcpzZYDcAwRrqh43EK99hhlzkdZq0K9nskPImImgYN/CiLbSuAKeIKHVdKNAnHBHuOTFF9uImlQQjUAKlIJg==
X-Received: by 2002:a63:f401:: with SMTP id g1mr33239239pgi.314.1563270238515;
 Tue, 16 Jul 2019 02:43:58 -0700 (PDT)
Date:   Tue, 16 Jul 2019 02:43:02 -0700
In-Reply-To: <20190716094302.180360-1-brendanhiggins@google.com>
Message-Id: <20190716094302.180360-19-brendanhiggins@google.com>
Mime-Version: 1.0
References: <20190716094302.180360-1-brendanhiggins@google.com>
X-Mailer: git-send-email 2.22.0.510.g264f2c817a-goog
Subject: [PATCH v10 18/18] MAINTAINERS: add proc sysctl KUnit test to PROC
 SYSCTL section
From:   Brendan Higgins <brendanhiggins@google.com>
To:     frowand.list@gmail.com, gregkh@linuxfoundation.org,
        jpoimboe@redhat.com, keescook@google.com,
        kieran.bingham@ideasonboard.com, mcgrof@kernel.org,
        peterz@infradead.org, robh@kernel.org, sboyd@kernel.org,
        shuah@kernel.org, tytso@mit.edu, yamada.masahiro@socionext.com
Cc:     devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        kunit-dev@googlegroups.com, linux-doc@vger.kernel.org,
        linux-fsdevel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
        linux-nvdimm@lists.01.org, linux-um@lists.infradead.org,
        Alexander.Levin@microsoft.com, Tim.Bird@sony.com,
        amir73il@gmail.com, dan.carpenter@oracle.com, daniel@ffwll.ch,
        jdike@addtoit.com, joel@jms.id.au, julia.lawall@lip6.fr,
        khilman@baylibre.com, knut.omang@oracle.com, logang@deltatee.com,
        mpe@ellerman.id.au, pmladek@suse.com, rdunlap@infradead.org,
        richard@nod.at, rientjes@google.com, rostedt@goodmis.org,
        wfg@linux.intel.com, Brendan Higgins <brendanhiggins@google.com>,
        Iurii Zaikin <yzaikin@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add entry for the new proc sysctl KUnit test to the PROC SYSCTL section,
and add Iurii as a maintainer.

Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
Cc: Iurii Zaikin <yzaikin@google.com>
Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Reviewed-by: Logan Gunthorpe <logang@deltatee.com>
Acked-by: Luis Chamberlain <mcgrof@kernel.org>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 48d04d180a988..f8204c75114da 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12721,12 +12721,14 @@ F:	Documentation/filesystems/proc.txt
 PROC SYSCTL
 M:	Luis Chamberlain <mcgrof@kernel.org>
 M:	Kees Cook <keescook@chromium.org>
+M:	Iurii Zaikin <yzaikin@google.com>
 L:	linux-kernel@vger.kernel.org
 L:	linux-fsdevel@vger.kernel.org
 S:	Maintained
 F:	fs/proc/proc_sysctl.c
 F:	include/linux/sysctl.h
 F:	kernel/sysctl.c
+F:	kernel/sysctl-test.c
 F:	tools/testing/selftests/sysctl/
 
 PS3 NETWORK SUPPORT
-- 
2.22.0.510.g264f2c817a-goog

